extends Control

onready var versionLabel = $HBoxContainer/MainVBox/ScrollContainer/VBoxContainer/VersionLabel
onready var MainVBox = $HBoxContainer/MainVBox
onready var LoadGameTab = $HBoxContainer/LoadGameScreen
onready var resumeButton = $HBoxContainer/MainVBox/GridContainer/ResumeButton

# Called when the node enters the scene tree for the first time.
func _ready():
	versionLabel.text = "Version: "+GlobalRegistry.getGameVersionString()

	checkCanResume()


func _on_NewGameButton_pressed():
	var _ok = get_tree().change_scene("res://Game/MainScene.tscn")


func _on_LoadGameButton_pressed():
	MainVBox.visible = false
	LoadGameTab.visible = true
	


func _on_LoadGameScreen_onClosePressed():
	MainVBox.visible = true
	LoadGameTab.visible = false
	
	checkCanResume()

func checkCanResume():
	if(SAVE.canResumeGame()):
		resumeButton.disabled = false
	else:
		resumeButton.disabled = true

func _on_ResumeButton_pressed():
	SAVE.switchToGameAndResumeLatestSave()
