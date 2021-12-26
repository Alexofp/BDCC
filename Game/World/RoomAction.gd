extends Node
class_name RoomAction

export(String) var ActionName
export(String) var ActionTooltip
export(String) var ActionScene

func _canRun() -> bool:
	return true

func _shouldShow() -> bool:
	return true

# Called when the node enters the scene tree for the first time.
func _ready():
	if(!ActionName):
		ActionName = name
