extends Control

onready var versionLabel = $HBoxContainer/MainVBox/ScrollContainer/VBoxContainer/VersionLabel
onready var MainVBox = $HBoxContainer/MainVBox
onready var LoadGameTab = $HBoxContainer/LoadGameScreen
onready var optionsGameTab = $HBoxContainer/OptionsScreen
onready var creditsGameTab = $HBoxContainer/CreditsScreen
onready var resumeButton = $HBoxContainer/MainVBox/GridContainer/ResumeButton

# Called when the node enters the scene tree for the first time.
func _ready():
	versionLabel.text = "Version: "+GlobalRegistry.getGameVersionString()

	checkCanResume()


func _on_NewGameButton_pressed():
	var _ok = get_tree().change_scene("res://Game/MainScene.tscn")

func hideAllMenus():
	MainVBox.visible = false
	LoadGameTab.visible = false
	optionsGameTab.visible = false
	creditsGameTab.visible = false

func switchToMainMenu():
	hideAllMenus()
	MainVBox.visible = true
	
	checkCanResume()

func _on_LoadGameButton_pressed():
	hideAllMenus()
	LoadGameTab.visible = true
	

func checkCanResume():
	if(SAVE.canResumeGame()):
		resumeButton.disabled = false
	else:
		resumeButton.disabled = true

func _on_ResumeButton_pressed():
	SAVE.switchToGameAndResumeLatestSave()


func _on_OptionsButton_pressed():
	hideAllMenus()
	optionsGameTab.visible = true


func _on_CreditsButton_pressed():
	hideAllMenus()
	creditsGameTab.visible = true


func _on_GithubButton_pressed():
	var _ok = OS.shell_open("https://github.com/Alexofp/LewdGame")
