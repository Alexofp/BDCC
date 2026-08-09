extends Reference
class_name CombatAnimPlayer

var queue:Array = []

var chars:Dictionary = {}

func _init():
	addChar(0)
	addChar(1)

func addChar(_id:int):
	var theChar := CombatAnimPlayerChar.new()
	theChar.id = _id
	chars[_id] = theChar
