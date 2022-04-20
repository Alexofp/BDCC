extends "res://Attacks/PlayerOnly/TeaseBodyPCAttack.gd"

func _init():
	id = "TeaseButtPCAttack"
	category = Category.Lust
	aiCategory = AICategory.Lust
	
func getVisibleName():
	return "Tease butt"
	
func getVisibleDesc():
	return "Teasing that's based on showing off your butt. Effect depends on how sexy the opponent finds you"
	
func getTeaseType():
	return TeaseType.Butt

func getTeaseText(_attacker, _receiver):
	var texts = [
		"{attacker.name} wiggles {attacker.his} rear and gives it a good spank",
		"{attacker.name} rubs {attacker.his} rear in front of {receiver.name} and sticks {attacker.his} tongue out",
		"{attacker.name} does a little sexy dance, shaking {attacker.his} ass",
	]
	var text = RNG.pick(texts)
	return text
