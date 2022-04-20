extends "res://Attacks/PlayerOnly/TeaseBodyPCAttack.gd"

func _init():
	id = "TeaseCrotchPCAttack"
	category = Category.Lust
	aiCategory = AICategory.Lust
	
func getVisibleName():
	return "Tease crotch"
	
func getVisibleDesc():
	return "Teasing that's based on showing off your crotch. Effect depends on how sexy the opponent finds you"
	
func getTeaseType():
	return TeaseType.Crotch

func getTeaseText(_attacker, _receiver):
	var texts = [
		"{attacker.name} rubs {attacker.his} crotch in front of {receiver.name}",
	]
	var text = RNG.pick(texts)
	return text
