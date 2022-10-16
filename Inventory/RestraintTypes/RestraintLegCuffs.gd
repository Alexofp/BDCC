extends RestraintData
class_name RestraintLegCuffs

func _init():
	npcDodgeDifficultyMod = 1.1

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
	
	if(_handsFree):
		text = "{user.name} uses {user.his} hands to try and take off the leg cuffs."
		damage = calcDamage()
		stamina = 10
	else:
		text = "{user.name} rolls around and tries to helplessly wiggle {user.his} leg cuffs off."
		damage = calcDamage(0.5)
		stamina = 10
		
		if(RNG.chance(10)):
			text += " Ow! {user.name} accidently smashed them against "+RNG.pick(["the wall", "the ground", "something"])
			pain = scaleDamage(RNG.randi_range(5, 10))
	
	#damage = calcDamage()
	
	return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}
