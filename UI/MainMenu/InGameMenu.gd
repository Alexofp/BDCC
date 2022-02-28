extends Control

onready var loadGameScreen = $LoadGameScreen
onready var mainMenuScreen = $MainMenu
signal onResumeButtonPressed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LoadGameButton_pressed():
	loadGameScreen.visible = true
	mainMenuScreen.visible = false

func _on_LoadGameScreen_onClosePressed():
	loadGameScreen.visible = false
	mainMenuScreen.visible = true


func _on_MainMenuButton_pressed():
	var _ok = get_tree().change_scene("res://UI/MainMenu/MainMenu.tscn")


func _on_ResumeButton_pressed():
	emit_signal("onResumeButtonPressed")
