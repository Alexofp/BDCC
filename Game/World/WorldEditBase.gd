extends Reference
class_name WorldEditBase

var id = "error"
var isRegular = false # true = apply() is called after every tick

func apply(_world: GameWorld):
	pass

func getFlag(flagID, defaultValue = null):
	return GM.main.getFlag(flagID, defaultValue)
