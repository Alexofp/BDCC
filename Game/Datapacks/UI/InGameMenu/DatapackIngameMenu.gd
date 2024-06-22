extends Control

onready var entry_list = $VBoxContainer/ScrollContainer/EntryList

var entryScene = preload("res://Game/Datapacks/UI/InGameMenu/DatapackInGameEntry.tscn")

signal onClosePressed

func updateList():
	Util.delete_children(entry_list)
	
	for datapackID in GlobalRegistry.getDatapacks():
		var datapack:Datapack = GlobalRegistry.getDatapack(datapackID)
		
		var newEntry = entryScene.instance()
		entry_list.add_child(newEntry)
		
		newEntry.setNameLabel(datapack.getFancyName())
		newEntry.setContainsLabel(datapack.getContainsString())
		newEntry.id = datapackID
		
		newEntry.connect("onLoadPressed", self, "onDatapackLoadPressed")
		newEntry.connect("onUnloadPressed", self, "onDatapackUnloadPressed")
		
		if(!datapack.needsTogglingOn()):
			newEntry.setNothingToLoad()
		else:
			if(GM.main.isDatapackLoaded(datapackID)):
				newEntry.setIsLoaded(true)
			else:
				newEntry.setIsLoaded(false)

func onDatapackLoadPressed(datapackID):
	GM.main.loadDatapack(datapackID)
	updateList()

func onDatapackUnloadPressed(datapackID):
	GM.main.unloadDatapack(datapackID)
	updateList()

func _on_DatapackIngameMenu_visibility_changed():
	if(visible):
		updateList()

func _on_CloseButton_pressed():
	emit_signal("onClosePressed")
