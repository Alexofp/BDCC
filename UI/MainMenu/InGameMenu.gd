extends TabContainer

signal onResumeButtonPressed

func _on_LoadGameButton_pressed():
	current_tab = 1

func _on_MainMenuButton_pressed():
	GM.main.runScene("MainMenu")
	GM.main.runCurrentScene()

func _on_ResumeButton_pressed():
	emit_signal("onResumeButtonPressed")

func _on_SaveGameButton2_pressed():
	current_tab = 2

func _on_SaveGameScreen_onClosePressed():
	current_tab = 0

func _on_LoadGameScreen_onClosePressed():
	current_tab = 0
