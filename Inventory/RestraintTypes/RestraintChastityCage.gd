extends RestraintData
class_name RestraintChastityCage

func _init():
	restraintType = RestraintType.ChastityCage

func defaultStruggle(_pc, _minigame, response):
	if(!_pc.hasBlockedHands() && !_pc.hasBoundArms()):
		response.text += "{user.name} tugs on {user.his} chastity cage, trying to take it off."
		response.damage += calcDamage(_pc)
		response.stamina += 10
	else:
		response.text += "{user.name} desperately tries to wiggle {user.his} chastity cage off but makes almost no progress."
		response.damage += calcDamage(_pc, 0.1)
		response.stamina += 5
	
	if(!_pc.hasBlockedHands() && !_pc.hasBoundArms() && failChance(_pc, 20)):
		response.text += " Touching {user.his} caged cock made {user.him} quite aroused."
		response.lust += scaleDamage(5)
	elif(failChance(_pc, 20)):
		response.text += " {user.He} accidentally pinched {user.his} balls. Ow."
		response.pain += scaleDamage(5)
	response.skipRest()
	return response

