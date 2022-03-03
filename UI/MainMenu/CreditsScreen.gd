extends Control

signal onClosePressed

func _on_CloseButton_pressed():
	emit_signal("onClosePressed")

