extends Control

onready var savesContainer = $VBoxContainer/ScrollContainer/ScrollVBox/SavesContainer
var saveGameElemenetScene = preload("res://UI/MainMenu/SaveGameElement.tscn")
signal onClosePressed
var inDeleteMode = false
var currentExportedPath = ""
signal in_focus

func _ready():
	updateSaves()
	
	if(OS.get_name() == "Android"):
		$VBoxContainer/GridContainer/SavesButton.disabled = true
	
	if(OS.get_name() == "HTML5"):
		$VBoxContainer/GridContainer/SavesButton.visible = false
	
	if OS.get_name() == "HTML5" and OS.has_feature("JavaScript"):
		_define_js()

func updateSaves():
	Util.delete_children(savesContainer)
	
	var savesPaths = SAVE.getSavesSortedByDate()
	
	for savePath in savesPaths:
		var saveGameElementObject = saveGameElemenetScene.instance()
		savesContainer.add_child(saveGameElementObject)
		saveGameElementObject.setSaveFile(savePath)
		saveGameElementObject.connect("onLoadButtonPressed", self, "onSaveLoadButtonClicked")
		saveGameElementObject.connect("onDeleteButtonPressed", self, "onDeleteButtonClicked")
		saveGameElementObject.connect("onExportButtonPressed", self, "onExportButtonClicked")
		saveGameElementObject.setDeleteMode(inDeleteMode)
		
func onSaveLoadButtonClicked(savePath):
	SAVE.switchToGameAndLoad(savePath)

func onDeleteButtonClicked(savePath):
	SAVE.deleteSave(savePath)
	updateSaves()

func _on_CloseButton_pressed():
	emit_signal("onClosePressed")


func _on_LoadGameScreen_visibility_changed():
	if(visible):
		updateSaves()


func _on_DeleteButton_pressed():
	inDeleteMode = !inDeleteMode
	updateSaves()

func onExportButtonClicked(savePath: String):
	print("EXPORT: "+savePath)
	if(OS.get_name() == "HTML5"):
		var save_game = File.new()
		if not save_game.file_exists(savePath):
			return # Error! We don't have a save to load.
		
		save_game.open(savePath, File.READ)
		#var saveData = parse_json(save_game.get_as_text())
		
		JavaScript.download_buffer(save_game.get_as_text().to_utf8(), savePath.get_file(), "text/plain")
		save_game.close()
		return
	
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
		var externalDir:String = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS)
		var finalDir = externalDir.plus_file("BDCCSaves")
		d.make_dir_recursive(finalDir)
		var finalPath = finalDir.plus_file(savePath.get_file())
		d.copy(savePath, finalPath)
		$SaveExportedAlert.dialog_text = "Your save was exported to:\n"+str(finalPath)
		$SaveExportedAlert.popup_centered()
		return
	
	currentExportedPath = savePath
	$ExportSaveDialog.current_file = savePath.get_file()
	#$ExportSaveDialog.current_dir = OS.get_user_data_dir()
	$ExportSaveDialog.popup_centered()
	
func _on_ExportSaveDialog_file_selected(path):
	if(currentExportedPath == null || currentExportedPath == ""):
		return
	var d = Directory.new()
	d.copy(currentExportedPath, path)

func _notification(notification: int) -> void:
	if notification == MainLoop.NOTIFICATION_WM_FOCUS_IN:
		emit_signal("in_focus")

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
	function upload_save() {
		canceled = true;
		var input = document.createElement('INPUT');
		input.setAttribute("type", "file");
		input.setAttribute("accept", ".save");
		input.click();
		input.addEventListener('change', event => {
			if (event.target.files.length > 0){
				canceled = false;}
			var file = event.target.files[0];
			var reader = new FileReader();
			fileType = file.type;
			fileName = file.name;
			reader.readAsText(file);
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
	
func readSaveFileHTML5():
	if OS.get_name() != "HTML5" or !OS.has_feature("JavaScript"):
		return

	# Execute JS function
	JavaScript.eval("upload_save();", true)  # Opens prompt for choosing file

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


func _on_ImportButton_pressed():
	if OS.get_name() == "HTML5":
		var saveDataAndFileName = yield(readSaveFileHTML5(), "completed")
		if(saveDataAndFileName == null || saveDataAndFileName.size() != 2):
			return
		SAVE.saveGameFromText(saveDataAndFileName[0], saveDataAndFileName[1])
		updateSaves()
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
			var externalDir:String = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS)
			var finalDir = externalDir.plus_file("BDCCSaves")
			d.make_dir_recursive(finalDir)
			$ImportSaveDialog.current_dir = finalDir
		$ImportSaveDialog.popup_centered()

func _on_ImportSaveDialog_file_selected(path: String):
	print(path.get_file().get_basename())
	var d = Directory.new()
	d.copy(path, "user://saves/"+path.get_file().get_basename()+".save")
	updateSaves()


func _on_SavesButton_pressed():
	var _ok = OS.shell_open(ProjectSettings.globalize_path("user://saves/"))
