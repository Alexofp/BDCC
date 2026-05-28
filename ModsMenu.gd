extends Control

onready var modsLabel = $VBoxContainer/ScrollContainer/VBoxContainer/ModsLabel
signal onClosePressed
signal in_focus
var showedModDialog = false

func _ready():
	if(OS.get_name() in ["Android", "iOS", "HTML5"]):
		$VBoxContainer/GridContainer/ModsFolderButton.setIsDisabled(true)
	else:
		$VBoxContainer/GridContainer/RemoveModsButton.setIsDisabled(true)

	if(OS.get_name() == "Android"):
		$VBoxContainer/GridContainer/ModsFolderButton.setIsDisabled(true)
		# Keep this enabled so Android users can delete their imported mods!
		$VBoxContainer/GridContainer/RemoveModsButton.setIsDisabled(false)
		ensure_external_mods_folder_exists()

	if OS.get_name() == "HTML5" and OS.has_feature("JavaScript"):
		_define_js()

	# UPDATED: Changed the text instruction to match your new custom Download folder system!
	var text = "[b][url=https://github.com/Alexofp/BDCC/wiki/How-to-install-BDCC-mods]How to install mods (click me)[/url][/b]\n\nTo install a mod, drag it into your phone's public folder: [color=yellow]Download/BDCCMods/[/color] and press the Import Mod button. Mods downloaded from the in-game browser are saved here automatically.\n"
	if(!GlobalRegistry.hasModSupport()):
		text += "! Mods aren't supported when running the game from the editor, this is godot issue. Export the game and run it standalone to get mod support !\n\n"
		# read more here: https://github.com/godotengine/godot/issues/19815
	else:
		var mods = GlobalRegistry.getLoadedMods()
		text += "Loaded mods ("+str(mods.size())+"):\n"
		if(mods.size() == 0):
			text += "None loaded\n"
		else:
			var i = 1
			for mod in mods:
				text += str(i) + ") " + mod +"\n"
				i += 1
		
		text += "\n"
		
	text += "Currently loaded modules:\n"
	var allModules = GlobalRegistry.getModules()
	for moduleID in allModules:
		var module: Module = allModules[moduleID]
		
		text += module.id + " by " + module.author+"\n"
		
		
	modsLabel.bbcode_text = text
	
func ensure_external_mods_folder_exists():
	if OS.get_name() == "Android":
		var download_path = OS.get_system_dir(OS.SYSTEM_DIR_DOWNLOADS) + "/"
		var target_folder = download_path + "BDCCMods/"
		
		var dir = Directory.new()
		if not dir.dir_exists(target_folder):
			dir.make_dir_recursive(target_folder)
	
func _on_CloseButton_pressed():
	emit_signal("onClosePressed")


func _on_ModsFolderButton_pressed():
	var _ok = Util.fixed_shell_open(ProjectSettings.globalize_path("user://mods"))


func _on_ImportModDialog_file_selected(path:String):
	print(path)
	var d = Directory.new()
	d.copy(path, "user://mods/"+path.get_file())
	if(!showedModDialog):
		showedModDialog = true
		$ModAcceptDialog.visible = true

# Copied from https://github.com/Orama-Interactive/Pixelorama/blob/master/src/Autoload/HTML5FileExchange.gd
# Thanks to Pixelorama devs
func _define_js():
	# Define JS script
	JavaScript.eval(
		"""
	var fileData;
	var fileType;
	var fileName;
	var canceled;
	function upload_mod() {
		canceled = true;
		var input = document.createElement('INPUT');
		input.setAttribute("type", "file");
		input.setAttribute("accept", ".zip,.pck");
		input.click();
		input.addEventListener('change', event => {
			if (event.target.files.length > 0){
				canceled = false;}
			var file = event.target.files[0];
			var reader = new FileReader();
			fileType = file.type;
			fileName = file.name;
			reader.readAsArrayBuffer(file);
			reader.onloadend = function (evt) {
				if (evt.target.readyState == FileReader.DONE) {
					fileData = evt.target.result;
				}
			}
		});
	}
	""",
		true
	)
	
func _notification(notification: int) -> void:
	if notification == MainLoop.NOTIFICATION_WM_FOCUS_IN:
		emit_signal("in_focus")
	
func readModHTML5():
	if OS.get_name() != "HTML5" or !OS.has_feature("JavaScript"):
		return

	# Execute JS function
	JavaScript.eval("upload_mod();", true)  # Opens prompt for choosing file

	yield(self, "in_focus")  # Wait until JS prompt is closed

	yield(get_tree().create_timer(0.5), "timeout")  # Give some time for async JS data load

	if JavaScript.eval("canceled;", true):  # If File Dialog closed w/o file
		return

	# Use data from png data
	var file_data
	while true:
		file_data = JavaScript.eval("fileData;", true)
		if file_data != null:
			break
		yield(get_tree().create_timer(1.0), "timeout")  # Need more time to load data

#	var file_type = JavaScript.eval("fileType;", true)
	var file_name = JavaScript.eval("fileName;", true)
	
	return [file_name, file_data]


func _on_AddModButton_pressed():
	if OS.get_name() == "HTML5":
		var modDataAndFileName = yield(readModHTML5(), "completed")
		if(modDataAndFileName == null || modDataAndFileName.size() != 2):
			return
			
		var modFile = File.new()
		modFile.open("user://mods/"+modDataAndFileName[0].get_file(), File.WRITE)
		modFile.store_buffer(modDataAndFileName[1])
		modFile.close()
			
		if(!showedModDialog):
			showedModDialog = true
			$ModAcceptDialog.visible = true
	elif OS.get_name() == "Android":
		var external_folder = OS.get_system_dir(OS.SYSTEM_DIR_DOWNLOADS) + "/BDCCMods/"
		var internal_mod_path = "user://mods/"
		
		var dir = Directory.new()
		
		# Make sure internal sandbox mod folder exists
		if not dir.dir_exists(internal_mod_path):
			dir.make_dir_recursive(internal_mod_path)
			
		if dir.open(external_folder) == OK:
			dir.list_dir_begin(true)
			var file_name = dir.get_next()
			
			var success_count = 0
			
			while file_name != "":
				if not dir.current_is_dir() and (file_name.ends_with(".zip") or file_name.ends_with(".pck")):
					var source = external_folder + file_name
					var destination = internal_mod_path + file_name
					
					if dir.copy(source, destination) == OK:
						success_count += 1
						
				file_name = dir.get_next()
			dir.list_dir_end()
			
			if success_count > 0:
				$AndroidPathAlert.dialog_text = "Successfully imported " + str(success_count) + " mod files!\nRestart the game to apply them."
				$AndroidPathAlert.window_title = "Import Complete"
				$AndroidPathAlert.popup_centered()
			else:
				$AndroidPathAlert.dialog_text = "No files ending in .zip or .pck were found in Download/BDCCMods/"
				$AndroidPathAlert.window_title = "Import Empty"
				$AndroidPathAlert.popup_centered()
		else:
			print("Error: Could not scan external mods directory.")
	else:
		$ImportModDialog.popup_centered()


func _on_RemoveModsButton_pressed():
	$ConfirmationDialog.visible = true


func _on_ConfirmationDialog_confirmed():
	var modsFolder = "user://mods"
	
	var dir = Directory.new()
	if dir.open(modsFolder) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
			else:
				if(file_name.get_extension() in ["pck", "zip"]):
					var full_path = modsFolder.plus_file(file_name)
					dir.remove(full_path)
			file_name = dir.get_next()
		OPTIONS.saveToFile()
	else:
		Log.printerr("An error occurred when trying to access the path "+modsFolder)


func _on_WikiButton_pressed():
	var _ok = Util.fixed_shell_open("https://github.com/Alexofp/BDCC/wiki")


func _on_ModsLabel_meta_clicked(meta):
	var _ok = Util.fixed_shell_open(meta)


func _on_SkinsFolderButton_pressed():
	if(OS.get_name() == "Android"):
		$AndroidPathAlert.dialog_text = "Custom skins on android are loaded from \"Download/BDCCMods/custom_skins\"\nCreate that folder if it doesn't exist."
		$AndroidPathAlert.popup_centered()
	else:
		var _ok = Util.fixed_shell_open(ProjectSettings.globalize_path("user://custom_skins"))