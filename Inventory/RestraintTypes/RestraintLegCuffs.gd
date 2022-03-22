extends RestraintData
class_name RestraintLegCuffs


func doStruggle(_pc):
	var _handsFree = !_pc.hasBoundArms()
	var _legsFree = !_pc.hasBoundLegs()
	var _canSee = !_pc.isBlindfolded()
	var _canBite = !_pc.isGagged()
	
	var text = "error?"
	var lust = 0
	var pain = 0
	var damage = 0
	var stamina = 0
	
	if(_handsFree):
		text = "You use your hands to try and take off the leg cuffs."
		damage = calcDamage()
		stamina = 10
	else:
		text = "You roll around and try to helplessly wiggle your leg cuffs off."
		damage = calcDamage(0.5)
		stamina = 10
		
		if(RNG.chance(10)):
			text += " Ow! You accidently smashed them against "+RNG.pick(["the wall", "the ground", "something"])
			pain = RNG.randi_range(5, 10)
	
	#damage = calcDamage()
	
	return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}
