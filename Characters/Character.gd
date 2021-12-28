extends Node
class_name Character

var id = "errorerror"
var pain = 0
var lust = 0

func _ready():
	pass # Replace with function body.

func _init():
	pass
	
func _getName():
	return "Error"
	
func _getAttacks():
	return ["baseattack"]
	
func getAttacks():
	return _getAttacks()
	
func getName():
	return _getName()

# This func should do all the armor checks, etc
func recievePain(addpain: int):	
	var oldpain = pain
	pain += addpain

	if(pain > painThreshold()):
		pain = painThreshold()
		
	var actualAddpain = pain - oldpain
	return actualAddpain

func painThreshold():
	return 100

func getPain() -> int:
	return pain

func afterFightEnded():
	pain = 0
