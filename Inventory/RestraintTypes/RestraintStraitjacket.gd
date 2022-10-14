extends RestraintData
class_name RestraintStraitjacket

func resetOnNewDay():
	pass

func getLevelDamage():
	return 0.04 + 0.1 / level

func doStruggle(_pc, _minigame):
	var _handsFree = !_pc.hasBlockedHands()
	var _armsFree = !_pc.hasBoundArms()
	var _legsFree = !_pc.hasBoundLegs()
	var _canSee = !_pc.isBlindfolded()
	var _canBite = !_pc.isGagged()
	
	var text = "error?"
	var lust = 0
	var pain = 0
	var damage = 0
	var stamina = 0
	
	text = "{user.name} helplessly tries to wiggle the straitjacket off."
	damage = calcDamage()
	stamina = RNG.randi_range(50, 60)
	
	#damage = calcDamage()
	
	return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}
