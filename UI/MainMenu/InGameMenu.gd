extends Control

onready var loadGameScreen = $LoadGameScreen
onready var mainMenuScreen = $MainMenu
onready var saveMenuScreen = $SaveGameScreen
signal onResumeButtonPressed
onready var datapack_ingame_menu = $DatapackIngameMenu

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func hideAllMenus():
	mainMenuScreen.visible = false
	loadGameScreen.visible = false
	saveMenuScreen.visible = false
	datapack_ingame_menu.visible = false

func _on_LoadGameButton_pressed():
	hideAllMenus()
	loadGameScreen.visible = true

func _on_LoadGameScreen_onClosePressed():
	hideAllMenus()
	mainMenuScreen.visible = true


func _on_MainMenuButton_pressed():
	var _ok = get_tree().change_scene("res://UI/MainMenu/MainMenu.tscn")


func _on_ResumeButton_pressed():
	emit_signal("onResumeButtonPressed")


func _on_SaveGameButton2_pressed():
	hideAllMenus()
	saveMenuScreen.visible = true


func _on_SaveGameScreen_onClosePressed():
	hideAllMenus()
	mainMenuScreen.visible = true


func _on_DatapacksButton_pressed():
	hideAllMenus()
	
	datapack_ingame_menu.visible = true

func _on_DatapackIngameMenu_onClosePressed():
	hideAllMenus()
	mainMenuScreen.visible = true
