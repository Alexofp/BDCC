extends RestraintData
class_name RestraintHandCuffs


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
	
	if(_handsFree && _canBite):
		text = "You use your hands and mouth to try and take off the handcuffs without unlocking them."
		damage = calcDamage()
		stamina = 10
		
		if(failChance(20)):
			text += " You find yourself drooling a lot."
			lust = 5
	elif(_handsFree):
		text = "You can't use your mouth but you can just about reach the handcuffs with your hands. You're tugging on the restrant, trying to slip it off."
		damage = calcDamage(0.8)
		stamina = 10
	elif(_canBite):
		text = "You try to wiggle the handcuffs off. Not being able to use hands really sucks but using your mouth instead helps to keep them still."
		damage = calcDamage(0.7)
		stamina = 10
		
		if(failChance(40)):
			text += " You find yourself drooling a lot."
			lust = 5
	else:
		text = "You try to helplessly wiggle the handcuffs off."
		damage = calcDamage(0.5)
		stamina = RNG.randi_range(10, 20)
		
		if(failChance(20)):
			text += " Ow! You accidently smashed them against "+RNG.pick(["the wall", "the ground", "something"])
			pain = RNG.randi_range(5, 10)
	
	#damage = calcDamage()
	
	return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}
