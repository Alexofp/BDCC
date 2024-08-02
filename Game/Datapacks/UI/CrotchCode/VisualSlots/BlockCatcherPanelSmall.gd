extends Control

signal onBlockDraggedOnto(data, index)

var dropIndex = -1

func can_drop_data(_position, _data):
	#setIsHighlighted(true)
	return true

func drop_data(_position, _data):
	emit_signal("onBlockDraggedOnto", _data, dropIndex)

func _ready():
	#var _ok = GlobalSignals.connect("onDragEnded", self, "onDragEnded")
	#var _ok2 = GlobalSignals.connect("onDragStarted", self, "onDragStarted")
	pass
