extends RestraintData
class_name RestraintHypnovisor

func _init():
	npcDodgeDifficultyMod = 0.8
	restraintType = RestraintType.HypnoVisor

func canUnlockWithKey():
	return false
	
func alwaysSavedWhenStruggledOutOf():
	return true

func getLevelDamage():
	return .getLevelDamage() * 0.5

#func shouldDoStruggleMinigame(_pc):
#	var _armsFree = !_pc.hasBoundArms()
#	if(_armsFree):
#		return false
#	return .shouldDoStruggleMinigame(_pc)
	
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
		text = "{user.name} uses {user.his} hands to try to take off the hypnovisor but it's sitting tight!"
		damage = calcDamage(_pc)
		stamina = 5
	elif(_handsFree):
		text = "{user.name}'s hands are free but they are bound together so {user.name} has to awkwardly bend to reach the hypnovisor."
		damage = calcDamage(_pc, 0.3)
		stamina = 5
	else:
		text = "{user.name} shakes {user.his} head, trying to make the hypnivisor slip off."
		damage = calcDamage(_pc, 0.1)
		stamina = 10
	
	#damage = calcDamage()
	
	return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}

func getResistAnimation():
	return "struggle_gag"

func processStruggleTurn(_pc, _isActivelyStruggling):
	if(failChance(_pc, 30) || _isActivelyStruggling):
		var text = RNG.pick([
		"The lights are so colorful..",
		"Toy.. pet.. Toy.. pet..",
		"{user.name} wants to be a good pet..",
		"{user.name} wants to be a good toy..",
		"Colorful lights are so hypnotizing..",
		"Must.. Obey?",
		"{user.name} struggles to look away from the colorful lights.",
	])
		
		return {"text": text, "lust": scaleDamage(5 + int(_isActivelyStruggling)*5)}
