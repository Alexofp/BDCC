extends Control

onready var versionLabel = $HBoxContainer/MainVBox/ScrollContainer/VBoxContainer/VersionLabel
onready var MainVBox = $HBoxContainer/MainVBox
onready var LoadGameTab = $HBoxContainer/LoadGameScreen

# Called when the node enters the scene tree for the first time.
func _ready():
	versionLabel.text = "Version: "+GlobalRegistry.getGameVersionString()

	print(SAVE.getAllSavePaths())


func _on_NewGameButton_pressed():
	var _ok = get_tree().change_scene("res://Game/MainScene.tscn")


func _on_LoadGameButton_pressed():
	MainVBox.visible = false
	LoadGameTab.visible = true
	


func _on_LoadGameScreen_onClosePressed():
	MainVBox.visible = true
	LoadGameTab.visible = false
