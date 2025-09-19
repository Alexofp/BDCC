extends Control

signal onClose

onready var main_h_box = $"%MainHBox"

func _on_CloseButton_pressed():
	emit_signal("onClose")

onready var debug_panel_container = $"%DebugPanelContainer"
onready var debug_text_edit = $"%DebugTextEdit"
onready var save_debug_to_file_button = $"%SaveDebugToFileButton"
onready var log_text_edit = $"%LogTextEdit"

func _ready():
	debug_panel_container.visible = false
	view_logs_container.visible = false
	manage_files_container.visible = false
	edit_file_container.visible = false

var debugText:String = ""
func _on_DebugInfoButton_pressed():
	debug_panel_container.visible = true
	
	debugText = "IF YOUR GAME IS CRASHING, SAVE THIS TEXT AND SEND IT TO RAHI\n"
	debugText += "User files:\n"
	var userFiles:Array =  Util.getFilesInFoldersRecursive("user://")
	for filePath in userFiles:
		debugText += str(filePath)+"\n"
	
	debugText += "\n===== LOG FILES =====\n"
	var logFiles:Array =  Util.getFilesInFoldersRecursive("user://logs")
	for logPath in logFiles:
		var logContents:String = Util.readFile(logPath)
		
		debugText += " ===== LOG FILE: "+str(logPath)+"\n"
		debugText += logContents
		debugText += "\n"
	
	debugText += "\n===== MISC FILES =====\n"
	for filePath in userFiles:
		if(filePath.get_extension() in ["txt", "json", "cfg", "debug"]):
			var fileContents:String = Util.readFile(filePath)
			debugText += " ===== MISC FILE: "+str(filePath)+"\n"
			debugText += fileContents
			debugText += "\n"
			
	
	debug_text_edit.text = debugText


func _on_CloseDebugButton_pressed():
	debug_panel_container.visible = false


func _on_SaveDebugToFileButton_pressed():
	var externalDir:String = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS)
	var finalDir = externalDir.plus_file("BDCCDebug.txt")
	Util.writeFile(finalDir, debugText)
	
	debug_text_edit.text = "FILE IS SAVED TO: "+str(finalDir)+"\nPlease send this file to Rahi"


onready var view_logs_container = $"%ViewLogsContainer"
onready var logs_item_list = $"%LogsItemList"

var logFilesList:Array = []
var selectedLogFile:String = ""

func _on_ViewLogsButton_pressed():
	view_logs_container.visible = true
	
	logs_item_list.clear()
	var _i:int = 0
	logFilesList = Util.getFilesInFoldersRecursive("user://logs")
	for thePath in logFilesList:
		logs_item_list.add_item(thePath.get_file())
		if(thePath == selectedLogFile):
			logs_item_list.select(_i)
		
		_i += 1
	
func _on_CloseLogsButton_pressed():
	view_logs_container.visible = false

func _on_LogsItemList_item_selected(index:int):
	if(index < 0 || index >= logFilesList.size()):
		return
	selectedLogFile = logFilesList[index]
	var theText:String = Util.readFile(selectedLogFile)
	log_text_edit.text = theText

onready var manage_files_container = $"%ManageFilesContainer"
onready var manage_file_list = $"%ManageFileList"
onready var file_info_label = $"%FileInfoLabel"

var selectedManageFile:String = ""

func _on_CloseFilesButton_pressed():
	manage_files_container.visible = false

var manageFiles:Array = []
var visibleManageFiles:Array = []

func _on_ManageFilesButton_pressed():
	manage_files_container.visible = true
	updateManageFileList()

onready var filter_file_line_edit = $"%FilterFileLineEdit"

func updateManageFileList():
	manageFiles = Util.getFilesInFoldersRecursive("user://")
	manage_file_list.clear()
	visibleManageFiles.clear()
	
	var filterText:String = filter_file_line_edit.text.to_lower()
	
	var _i :int = 0
	for filePath in manageFiles:
		if(filterText != "" && !(filterText in filePath.to_lower())):
			continue
		manage_file_list.add_item(filePath)
		visibleManageFiles.append(filePath)
		
		if(filePath == selectedManageFile):
			manage_file_list.select(_i)
		
		_i += 1

func _on_ManageFileList_item_selected(index:int):
	if(index < 0 || index >= visibleManageFiles.size()):
		return
	selectedManageFile = visibleManageFiles[index]
	
	file_info_label.text = selectedManageFile
	
	var file:File = File.new()
	if(file.open(selectedManageFile, File.READ) == OK):
		var theSize:int = file.get_len()
		file_info_label.text += "\nSize: "+ String.humanize_size(theSize)
		file.close()
	else:
		file_info_label.text += "\nUnable to read the file! Is it missing?"
	
func _on_DeleteFileButton_pressed():
	if(selectedManageFile == ""):
		return
	var d:Directory = Directory.new()
	if(!d.file_exists(selectedManageFile)):
		showMessage("Error: File doesn't exist")
		return
	d.remove(selectedManageFile)
	selectedManageFile = ""
	updateManageFileList()
	showMessage("File removed!")

func _on_ExportFileButton_pressed():
	if(selectedManageFile == ""):
		return
	var externalDir:String = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS)
	var finalDir:String = externalDir.plus_file(selectedManageFile.get_file())
	var d:Directory = Directory.new()
	if(!d.file_exists(selectedManageFile)):
		showMessage("Error: File doesn't exist")
		return
	d.copy(selectedManageFile, finalDir)
	showMessage("File copied to: "+str(finalDir))

func showMessage(mes:String):
	file_info_label.text = mes

func _on_EditFileContentsButton_pressed():
	if(selectedManageFile == ""):
		return
	var d:Directory = Directory.new()
	if(!d.file_exists(selectedManageFile)):
		showMessage("Error: File doesn't exist")
		return
	startEditingFile(selectedManageFile)

var editingFilePath:String = ""
onready var edit_file_container = $"%EditFileContainer"
onready var file_text_edit = $"%FileTextEdit"

func startEditingFile(_filepath:String):
	edit_file_container.visible = true
	editingFilePath = _filepath
	file_text_edit.text = Util.readFile(editingFilePath)

func _on_SaveFileEditButton_pressed():
	edit_file_container.visible = false
	Util.writeFile(editingFilePath, file_text_edit.text)
	file_text_edit.text = ""
	editingFilePath = ""

func _on_CancelFileEditButton_pressed():
	edit_file_container.visible = false
	file_text_edit.text = ""
	editingFilePath = ""

func _on_FilterFileLineEdit_text_changed(_new_text):
	updateManageFileList()

func showAlert(_text:String):
	if(alert_window_dialog.visible):
		alert_label.text += "\n"+_text
	else:
		alert_window_dialog.popup_centered()
		alert_label.text = _text

func _on_ResetRenderButton_pressed():
	OPTIONS.resetRenderSettings()
	showAlert("Restart the game for this to have an effect.")

onready var alert_window_dialog = $"%AlertWindowDialog"
onready var alert_label = $"%AlertLabel"

func _on_ConfirmAlertButton_pressed():
	alert_window_dialog.visible = false
	alert_label.text = ""
