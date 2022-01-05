extends BaseCharacter
class_name Character

var id = "errorerror"

func _ready():
	pass # Replace with function body.

func _init():
	pass
	
func _getName():
	return "Error"
	
func getName():
	return _getName()

func afterFightEnded():
	.afterFightEnded()
	pain = 0
