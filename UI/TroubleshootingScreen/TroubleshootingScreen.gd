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
	
	debugText = "IF YOUR GAME IS CRASHING, SAVE THIS TEXT AND SEND IT TO RAHI. ATTACH A SAVE IF CAN\n"
	debugText += "Game version: "+GlobalRegistry.getGameVersionString()+"\n"
	debugText += "Platform: "+OS.get_name()+"\n"
	if(GlobalRegistry.isInitialized):
		debugText += "Mods: "+str(GlobalRegistry.loadedMods)+"\n"
	else:
		debugText += "Mod order: "+str(loadFromTempList(GlobalRegistry.tempCurrentModOrder))+"\n"
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
	var externalDir:String = Util.getAndroidSaveFolder()#OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS)
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
	var externalDir:String = Util.getAndroidSaveFolder()#OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS)
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

func loadFromTempList(_ar:Array) -> Array:
	var result:Array = []
	
	for entry in _ar:
		if(entry.has("disabled") && entry["disabled"]):
			continue
		if(!entry.has("name")):
			continue
		result.append(entry["name"])
	
	return result

const ModConflictChecker = preload("res://Util/ModConflictChecker.gd")
var modConflictsPanel:PanelContainer
var modConflictsLabel:RichTextLabel

func _on_ModConflictsButton_pressed():
	if(modConflictsPanel == null):
		createModConflictsPanel()
	modConflictsLabel.bbcode_text = "Checking mods.."
	modConflictsPanel.visible = true
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	modConflictsLabel.bbcode_text = ModConflictChecker.makeStaticReport(getModOrderForConflictCheck())
	modConflictsLabel.scroll_to_line(0)

# Launcher: the order that is being edited right now. Main menu: the saved order
func getModOrderForConflictCheck() -> Array:
	if(!GlobalRegistry.tempCurrentModOrder.empty()):
		return GlobalRegistry.tempCurrentModOrder
	var result:Array = []
	var jsonResult = JSON.parse(Util.readFile("user://modOrder.json"))
	if(jsonResult.error != OK || !(jsonResult.result is Array)):
		return result
	for modEntry in jsonResult.result:
		if(!(modEntry is Dictionary) || !modEntry.has("path")):
			continue
		result.append({
			path = modEntry["path"],
			name = str(modEntry["path"]).get_file(),
			disabled = modEntry["disabled"] if modEntry.has("disabled") else false,
		})
	return result

func createModConflictsPanel():
	modConflictsPanel = PanelContainer.new()
	modConflictsPanel.set_anchors_and_margins_preset(Control.PRESET_WIDE)
	add_child(modConflictsPanel)
	
	var theVBox := VBoxContainer.new()
	modConflictsPanel.add_child(theVBox)
	
	modConflictsLabel = RichTextLabel.new()
	modConflictsLabel.bbcode_enabled = true
	modConflictsLabel.selection_enabled = true
	modConflictsLabel.size_flags_vertical = SIZE_EXPAND_FILL
	theVBox.add_child(modConflictsLabel)
	
	var openReportButton := Button.new()
	openReportButton.text = "Open last game start report"
	openReportButton.rect_min_size = Vector2(0, 50)
	var _ok = openReportButton.connect("pressed", self, "_on_ModConflictsOpenReport_pressed")
	theVBox.add_child(openReportButton)
	var closeButton := Button.new()
	closeButton.text = "Close"
	closeButton.rect_min_size = Vector2(0, 50)
	_ok = closeButton.connect("pressed", self, "_on_ModConflictsClose_pressed")
	theVBox.add_child(closeButton)

func _on_ModConflictsOpenReport_pressed():
	if(File.new().file_exists(ModConflictChecker.RUNTIME_REPORT_PATH)):
		var _ok = Util.fixed_shell_open(ProjectSettings.globalize_path(ModConflictChecker.RUNTIME_REPORT_PATH))

func _on_ModConflictsClose_pressed():
	modConflictsPanel.visible = false
