extends Control

var id = ""
signal onValueChange(id, newValue)

func setData(_dataLine:Dictionary):
	pass

func triggerChange(_newValue):
	emit_signal("onValueChange", id, _newValue)
