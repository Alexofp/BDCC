extends Control

signal onClosePressed

func _on_CloseButton_pressed():
	emit_signal("onClosePressed")

func _on_SupportRahiButton_pressed():
	var _ok = OS.shell_open("https://subscribestar.adult/rahi")
