extends Control

var saveGameElemenetScene = preload("res://UI/MainMenu/SaveGameElement.tscn")
onready var saves_container = $SavesContainer

signal onSavePicked(path)
signal onClosePressed

func _ready():
	updateSaves()

func updateSaves():
	Util.delete_children(saves_container)
	
	var savesPaths = SAVE.getSavesSortedByDate()
	
	for savePath in savesPaths:
		var saveGameElementObject = saveGameElemenetScene.instance()
		saves_container.add_child(saveGameElementObject)
		saveGameElementObject.setSaveFile(savePath)
		saveGameElementObject.connect("onLoadButtonPressed", self, "onSaveLoadButtonClicked")
		saveGameElementObject.setDeleteMode(false)
		saveGameElementObject.setPickMode()

func onSaveLoadButtonClicked(savePath):
	emit_signal("onSavePicked", savePath)

func _on_BackButton_pressed():
	emit_signal("onClosePressed")
