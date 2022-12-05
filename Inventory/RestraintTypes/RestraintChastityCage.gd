extends RestraintData
class_name RestraintChastityCage

func _init():
	restraintType = RestraintType.ChastityCage

func doStruggle(_pc, _minigame):
	var _handsFree = !_pc.hasBlockedHands()
	var _armsFree = !_pc.hasBoundArms()
	var _legsFree = !_pc.hasBoundLegs()
	var _canSee = !_pc.isBlindfolded()
	var _canBite = !_pc.isBitingBlocked()
	
	var text = "error?"
	var lust = 0
	var pain = 0
	var damage = 0
	var stamina = 0
	
	if(_handsFree && _armsFree):
		text = "{user.name} tugs on {user.his} chastity cage, trying to take it off."
		damage = calcDamage(_pc)
		stamina = 10
	else:
		text = "{user.name} desperately tries to wiggle {user.his} chastity cage off but makes almost no progress."
		damage = calcDamage(_pc, 0.1)
		stamina = 5
	
	if(_handsFree && _armsFree && failChance(_pc, 20)):
		text += " Touching {user.his} caged cock made {user.him} quite aroused."
		lust = scaleDamage(5)
	elif(failChance(_pc, 20)):
		text += " {user.He} accidentally pinched {user.his} balls. Ow."
		pain = scaleDamage(5)
	
	#damage = calcDamage()
	
	return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}

