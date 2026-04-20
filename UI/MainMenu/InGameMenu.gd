extends Control

onready var loadGameScreen = $LoadGameScreen
onready var mainMenuScreen = $MainMenu
onready var saveMenuScreen = $SaveGameScreen
signal onResumeButtonPressed
onready var datapack_ingame_menu = $DatapackIngameMenu

onready var resume_button = $"%ResumeButton"
onready var save_game_button = $"%SaveGameButton"
onready var load_game_button = $"%LoadGameButton"
onready var datapacks_button = $"%DatapacksButton"
onready var main_menu_button = $"%MainMenuButton"
onready var sex_toy_manager_button = $"%SexToyManagerButton"

func resizeButtons():
	var theButtons:Array = [
		resume_button,
		save_game_button,
		load_game_button,
		datapacks_button,
		main_menu_button,
		sex_toy_manager_button,
	]
	if(OPTIONS.isTouchFriendlyUI()):
		for theButton in theButtons:
			theButton.rect_min_size = Vector2(200, 50)
	else:
		for theButton in theButtons:
			theButton.rect_min_size = Vector2(0, 0)

func _ready():
	resizeButtons()
	sex_toy_manager_button.visible = SexToyManager.isEnabled()

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


func _on_InGameMenu_visibility_changed():
	if(visible):
		if(GM.main != null):
			save_game_button.disabled = !GM.main.canSave()

func _on_SexToyManagerButton_pressed():
	hideAllMenus()
	#saveMenuScreen.visible = true
	var theUI = load("res://Util/SexToySupport/UI/SexToyManagerUI.tscn").instance()
	theUI.connect("onClosePressed", self, "onSexToyManagerUIClose", [theUI])
	add_child(theUI)

func onSexToyManagerUIClose(_ui:Control):
	_ui.queue_free()
	mainMenuScreen.visible = true
