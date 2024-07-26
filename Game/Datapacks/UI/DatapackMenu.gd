extends Control
onready var datapack_item_list = $DatapackViewer/VBoxContainer/HBoxContainer/DatapackItemList
onready var datapack_desc_label = $DatapackViewer/VBoxContainer/HBoxContainer/VBoxContainer/DatapackDescLabel
onready var new_pack_confirmation_dialog = $DatapackViewer/NewPackConfirmationDialog
onready var export_datapack_button = $DatapackViewer/VBoxContainer/HBoxContainer/VBoxContainer/ExportDatapackButton
onready var import_pack_button = $DatapackViewer/VBoxContainer/GridContainer/ImportPackButton

signal onClosePressed

var datapacksList = []

func _ready():
	#updateDatapackList()
	reloadAndUpdatePacks()
	
	if(OS.get_name() != "HTML5"):
		export_datapack_button.visible = false
		import_pack_button.visible = false

func _on_CloseButton_pressed():
	emit_signal("onClosePressed")

func updateDatapackList():
	datapack_item_list.clear()
	datapacksList.clear()
	
	var allDatapacks = GlobalRegistry.getDatapacks()
	for packID in allDatapacks:
		var datapack:Datapack = allDatapacks[packID]
		
		datapacksList.append(datapack)
		datapack_item_list.add_item(datapack.name+" (By "+datapack.author+")")

func updateDatapackDesc(theDatapack:Datapack):
	var finalText = ""
	finalText += "id="+theDatapack.id
	finalText += "\n"+theDatapack.name
	finalText += "\nAuthor: "+theDatapack.author
	if(!theDatapack.requiredMods.empty() || !theDatapack.requiredDatapacks.empty()):
		finalText += "\n"+theDatapack.getRequiredModsString()
	finalText += "\n\n"+theDatapack.description
	finalText += "\n\n"+theDatapack.getContainsString()
	
	datapack_desc_label.bbcode_text = finalText

func isDatapackMenu():
	return true

func _on_NewPackConfirmationDialog_confirmed():
	var newPackID:String = $DatapackViewer/NewPackConfirmationDialog/VBoxContainer/NewPackIDLineEdit.text
	
	newPackID = Util.stripBadCharactersFromID(newPackID)
	#print(newPackID)
	if(newPackID == ""):
		showAlert("Empty ID is not allowed")
		return
	#showAlert(newPackID)
	
	if(GlobalRegistry.datapacks.has(newPackID)):
		showAlert("Datapack with this ID already exists")
		return
	
	var newDatapack:Datapack = Datapack.new()
	newDatapack.id = newPackID
	var _ok = newDatapack.saveToDisk()
	if(!_ok):
		showAlert("Couldn't save the datapack, sorry")
		return
	GlobalRegistry.datapacks[newDatapack.id] = newDatapack
	startEditingDatapack(newDatapack)

func startEditingDatapack(datapack:Datapack):
	var datapackEditorScreen = preload("res://Game/Datapacks/UI/DatapackEditor.tscn").instance()
	pushMenu(datapackEditorScreen)
	
	datapackEditorScreen.setDatapack(datapack)
	datapackEditorScreen.connect("onSaveButtonPressed", self, "onSaveDatapackPressed")
	datapackEditorScreen.connect("onCancelButtonPressed", self, "onCancelDatapackPressed")

func onSaveDatapackPressed(_menu, datapack:Datapack):
	
	
	var _ok = datapack.saveToDisk()
	if(!_ok):
		showAlert("Error while saving a datapack. Sorry")
	popMenu()
	#reloadAndUpdatePacks()

func onCancelDatapackPressed(_menu, _datapack:Datapack):
	popMenu()
	#reloadAndUpdatePacks()


func _on_NewDatapackButton_pressed():
	new_pack_confirmation_dialog.visible = true
	$DatapackViewer/NewPackConfirmationDialog/VBoxContainer/NewPackIDLineEdit.text = ""

func showAlert(theText:String):
	if($AlertDialog.visible):
		$AlertDialog/AlertLabel.text += "\n"+theText
	else:
		$AlertDialog/AlertLabel.text = theText
	$AlertDialog.visible = true


func reloadAndUpdatePacks():
	GlobalRegistry.reloadPacks()
	updateDatapackList()
	datapack_desc_label.bbcode_text = ""

func _on_UpdateButton_pressed():
	reloadAndUpdatePacks()


var menuStack = []

func pushMenu(newMenu:Control):
	$DatapackViewer.visible = false
	for menu in menuStack:
		menu.visible = false
	
	menuStack.append(newMenu)
	add_child(newMenu)

	
func popMenu():
	if(!menuStack.empty()):
		menuStack.back().queue_free()
		menuStack.pop_back()
		
		if(menuStack.empty()):
			$DatapackViewer.visible = true
			onMenuPopped()
		else:
			menuStack.back().visible = true
			if(menuStack.back().has_method("onMenuPopped")):
				menuStack.back().onMenuPopped()
	else:
		$DatapackViewer.visible = true


func _on_EditDatapackButton_pressed():
	var selectedIDs = $DatapackViewer/VBoxContainer/HBoxContainer/DatapackItemList.get_selected_items()
	if(selectedIDs.size() > 0):
		startEditingDatapack(datapacksList[selectedIDs[0]])

var datapackToDelete:Datapack
func _on_DeleteDatapackButton_pressed():
	var selectedIDs = $DatapackViewer/VBoxContainer/HBoxContainer/DatapackItemList.get_selected_items()
	if(selectedIDs.size() > 0):
		datapackToDelete = datapacksList[selectedIDs[0]]
	
		$ConfirmDeleteDatapack.visible = true
		$ConfirmDeleteDatapack/Label2.text = "Are you sure you want to delete the '"+str(datapackToDelete.name)+"' datapack? (id="+str(datapackToDelete.id)+")"


func _on_ConfirmDeleteDatapack_confirmed():
	if(datapackToDelete != null):
		if(GlobalRegistry.deleteDatapack(datapackToDelete.id)):
			reloadAndUpdatePacks()
		else:
			showAlert("Failed to delete the datapack. Sorry")
		datapackToDelete = null


func _on_DatapackItemList_item_selected(index):
	if(index >= 0 && index < datapacksList.size()):
		var datapack:Datapack = datapacksList[index]
		
		updateDatapackDesc(datapack)

func _on_DatapackFolderButton_pressed():
	if(OS.get_name() == "Android"):
		showAlert("Datapacks on android are loaded from \"Documents/BDCCMods/Datapacks\"\nCreate that folder if it doesn't exist.")
	else:
		var _ok = OS.shell_open(ProjectSettings.globalize_path("user://datapacks"))

var datapackBrowserScene = preload("res://Game/Datapacks/UI/DatapackBrowser.tscn")
func _on_DatapackBrowserButton_pressed():
	var newMenu = datapackBrowserScene.instance()
	newMenu.connect("closePressed", self, "popMenu")

	pushMenu(newMenu)

#func popAndUpdate():
#	popMenu()
#	GlobalRegistry.reloadPacks()
#	updateDatapackList()

func onMenuPopped():
	reloadAndUpdatePacks()

func _on_DatapackDescLabel_meta_clicked(meta):
	var _ok = OS.shell_open(meta)

func _on_DatapackWikiButton_pressed():
	var _ok = OS.shell_open("https://github.com/Alexofp/BDCC/wiki/Datapacks")


func _on_ExportDatapackButton_pressed():
	var selectedIDs = $DatapackViewer/VBoxContainer/HBoxContainer/DatapackItemList.get_selected_items()
	if(selectedIDs.size() <= 0):
		return
	
	var datapackToExport:Datapack = datapacksList[selectedIDs[0]]
	
	if(OS.get_name() == "HTML5"):
		var datapackPath = datapackToExport.getLoadedPath()
		var save_game = File.new()
		if not save_game.file_exists(datapackPath):
			return # Error! We don't have a save to load.
		
		save_game.open(datapackPath, File.READ)
		#var saveData = parse_json(save_game.get_as_text())
		
		JavaScript.download_buffer(save_game.get_buffer(save_game.get_len()), datapackPath.get_file())
		save_game.close()
		return


#func _on_ImportPackButton_pressed():
#	if OS.get_name() == "HTML5":
#		var saveDataAndFileName = yield(readSaveFileHTML5(), "completed")
#		if(saveDataAndFileName == null || saveDataAndFileName.size() != 2):
#			return
#		SAVE.saveGameFromText(saveDataAndFileName[0], saveDataAndFileName[1])
#		updateSaves()
