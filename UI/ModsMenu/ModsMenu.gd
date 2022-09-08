extends Control

var showedModDialog = false

onready var modsLabel 		= $VBoxContainer/ScrollContainer/VBoxContainer/MarginContainer/ModsLabel
onready var warningLabel 	= $VBoxContainer/ScrollContainer/VBoxContainer/MarginContainer3/Warning

signal in_focus

func _ready():
	if OS.get_name() == "HTML5" and OS.has_feature("JavaScript"):
		_define_js()
		
	var war_text = "[center]To install a mod drag it into the mods folder and restart the game. Mods are loaded in alphabetical order."
	var text = ""
	if(!GlobalRegistry.hasModSupport()):
		war_text += "\n\n[b]Mods aren't supported when running the game from the editor, this is godot issue. Export the game and run it standalone to get mod support![/b]"
		# read more here: https://github.com/godotengine/godot/issues/19815
	else:
		var mods = GlobalRegistry.getLoadedMods()
		
		if(mods.size() == 0):
			text += "[b]None mods found.[/b]\n"
		else:
			var mod_number = 0
			
			text += "[b]Loaded mods ("+str(mods.size())+"):[/b]\n"
			
			for mod in mods:
				mod_number += 1
				text += str(mod_number) + " - " + mod + ".\n"
		
		text += "\n"
		
	text += "[b]Currently loaded modules:[/b]\n"
	
	var allModules = GlobalRegistry.getModules()
	
	for moduleID in allModules:
		var module: Module = allModules[moduleID]
		text += "- " + module.id + " by " + module.author+".\n"
	
	warningLabel.bbcode_text = war_text + "[/center]"
	modsLabel.bbcode_text = text

func _on_ImportModDialog_file_selected(path:String):
	print(path)
	var d = Directory.new()
	d.copy(path, "user://mods/"+path.get_file())
	if(!showedModDialog):
		showedModDialog = true
		$ModAcceptDialog.popup_centered()

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

func importMod():
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
	else:
		if(OS.get_name() == "Android"):
			var has_permissions: bool = false
						
			while not has_permissions:
				#var permissions = OS.get_granted_permissions()
				var permissions: Array = OS.get_granted_permissions() #for Godot 3 branch
				
				if not permissions.has("android.permission.READ_EXTERNAL_STORAGE") \
					or not permissions.has("android.permission.WRITE_EXTERNAL_STORAGE"):
					var _ok = OS.request_permissions()
					#await get_tree().create_timer(1).timeout
					yield(get_tree().create_timer(1), "timeout") #for Godot 3 branch
				else:
					has_permissions = true
					
			var d = Directory.new()
			var externalDir:String = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS, true)
			var finalDir = externalDir.plus_file("BDCCMods")
			d.make_dir_recursive(finalDir)
			#$ImportModDialog.current_dir = finalDir
			$AndroidPathAlert.dialog_text = "Mods on android are loaded from:\n"+finalDir+"\nPlace them there and restart the game."
			$AndroidPathAlert.popup_centered()
			return
		
		$ImportModDialog.popup_centered()

func showRMpopup():
	$ConfirmationDialog.popup_centered()

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
