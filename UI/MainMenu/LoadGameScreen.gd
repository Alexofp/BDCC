extends Control

onready var savesContainer = $VBoxContainer/ScrollContainer/VBoxContainer
var saveGameElemenetScene = preload("res://UI/MainMenu/SaveGameElement.tscn")
signal onClosePressed

func _ready():
	updateSaves()

func updateSaves():
	Util.delete_children(savesContainer)
	
	var savesPaths = SAVE.getAllSavePaths()
	
	for savePath in savesPaths:
		var saveGameElementObject = saveGameElemenetScene.instance()
		savesContainer.add_child(saveGameElementObject)
		saveGameElementObject.setSaveFile(savePath)
		saveGameElementObject.connect("onLoadButtonPressed", self, "onSaveLoadButtonClicked")
		
func onSaveLoadButtonClicked(savePath):
	SAVE.switchToGameAndLoad(savePath)

func _on_CloseButton_pressed():
	emit_signal("onClosePressed")


func _on_LoadGameScreen_visibility_changed():
	updateSaves()
