extends "res://Game/World/GameRoom.gd"

signal onEnter(room)
signal onReact(room, key)

func _onEnter():
	say(getDescription())
	
	emit_signal("onEnter", self)

func _onButton(key):
	GM.ui.clearText()
	GM.ui.clearButtons()
	emit_signal("onReact", self, key)
	return true
