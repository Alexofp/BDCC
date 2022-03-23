extends RestraintData
class_name RestraintMittens


func doStruggle(_pc):
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
	
	if(_legsFree):
		text = "You step on the mittens and try to pull your arms out of them."
		damage = calcDamage()
		stamina = 10
	elif(_canBite):
		text = "You bite on one of the mittens and try to free your arm. Not very effective but better than nothing."
		damage = calcDamage(0.6)
		stamina = 10

		if(failChance(10)):
			text += " Ow, you accidentally step on your finger."
			pain = 5
	else:
		text = "You try to helplessly wiggle the mittens off."
		damage = calcDamage(0.4)
		stamina = RNG.randi_range(10, 20)
		
		if(failChance(20)):
			text += " Ow! You accidently smashed them against "+RNG.pick(["the wall", "the ground", "something"])
			pain = RNG.randi_range(5, 10)
	
	#damage = calcDamage()
	
	return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}
