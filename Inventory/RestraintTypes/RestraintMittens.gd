extends RestraintData
class_name RestraintMittens

func _init():
	npcDodgeDifficultyMod = 1.2
	restraintType = RestraintType.Mittens

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
	
	if(_legsFree):
		text = "{user.name} steps on the mittens and tries to pull {user.his} arms out of them."
		damage = calcDamage(_pc)
		stamina = 10
		
		if(failChance(_pc, 10)):
			text += " Ow, {user.name} accidentally steps on {user.his} finger."
			pain = scaleDamage(5)
	elif(_canBite && _armsFree):
		text = "{user.name} bites on one of the mittens and tries to free {user.his} arm. Not very effective but better than nothing."
		damage = calcDamage(_pc, 0.6)
		stamina = 10

		if(failChance(_pc, 10)):
			text += " Ow, {user.name} accidentally bit {user.his} hand."
			pain = scaleDamage(5)
	else:
		text = "{user.name} tries to helplessly wiggle the mittens off."
		damage = calcDamage(_pc, 0.4)
		stamina = RNG.randi_range(10, 20)
		
		if(failChance(_pc, 20)):
			text += " Ow! {user.name} accidently smashed them against "+RNG.pick(["the wall", "the ground", "something"])
			pain = scaleDamage(RNG.randi_range(5, 10))
	
	return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}
