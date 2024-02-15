extends RestraintData
class_name RestraintHypnovisor

func _init():
	npcDodgeDifficultyMod = 0.8
	restraintType = RestraintType.HypnoVisor

func canUnlockWithKey():
	return false

func canBeCut():
	return true
	
func alwaysSavedWhenStruggledOutOf():
	return true

func getLevelDamage():
	return .getLevelDamage() * 0.5

func shouldDoStruggleMinigame(_pc):
	if(HypnokinkUtil.isInTrance(_pc) && !_pc.hasPerk(Perk.HypnosisGoodAtVisors)):
		return false #cannot succeed
	if(HypnokinkUtil.isHypnotized(_pc)):
		return true
	if(_pc.hasBoundArms() || _pc.hasBlockedHands()):
		return true
		
	return false
	
func defaultStruggle(_pc, _minigame, response):
	var _handsFree = !_pc.hasBlockedHands()
	var _armsFree = !_pc.hasBoundArms()
	var _legsFree = !_pc.hasBoundLegs()
	var _canSee = !_pc.isBlindfolded()
	var _canBite = !_pc.isBitingBlocked()
	
	var inTrance = HypnokinkUtil.isInTrance(_pc)
	var hypnotized = HypnokinkUtil.isHypnotized(_pc)
	
	if(inTrance and not _pc.hasPerk(Perk.HypnosisGoodAtVisors)):
		response.text = "{user.name} tries to... to... \n\nDo what? Must have not been important."
		response.damage = 0.0
		response.skipRest()
		return response
	
	var damageMult = 1
	if(not hypnotized):
		damageMult = 5
	
	if(_handsFree and _armsFree):
		response.text = "{user.name} reaches up, trying to focus on removing {user.his} " + getItem().getVisibleName() + "."
		response.damage = calcDamage(_pc, damageMult)
		response.stamina = 2
	elif(_handsFree):
		response.text = "{user.name}'s hands are free but they are bound together so {user.name} has to awkwardly bend to reach {user.his} " + getItem().getVisibleName() + "."
		response.damage = calcDamage(_pc, damageMult * 0.3)
		response.stamina = 5
	else:
		response.text = "{user.name} shakes {user.his} head, trying to dislodge {user.his} " + getItem().getVisibleName() + "."
		response.damage = calcDamage(_pc, damageMult * 0.1)
		response.stamina = 10
	response.skipRest()
	return response

func getResistAnimation():
	return "struggle_gag"

func processStruggleTurn(_pc, _isActivelyStruggling):
	var text = "ERROR! For some reason did not pick hypnovisor restraint text"
	if(getItem().id == "HypnovisorMk0"):
		text = RNG.pick([
			"Pretty spiral..",
			"Need to be useful..",
			"{user.name} should keep {user.his} visor on, for {user.his} own safety..",
			"{user.name} wants to be a good {user.boy}..",
			"Must.. Obey?",
			"{user.name} struggles to look away from the flashing images.",
			"{user.name} struggles to look away from the spinning spiral.",
		])
	else:
		text = RNG.pick([
			"The lights are so colorful..",
			"Toy.. pet.. Toy.. pet..",
			"{user.name} wants to be a good pet..",
			"{user.name} wants to be a good toy..",
			"Colorful lights are so hypnotizing..",
			"Must.. Obey?",
			"{user.name} struggles to look away from the colorful lights.",
		])
		
	if(failChance(_pc, 30) || _isActivelyStruggling):
		return {"text": text, "lust": scaleDamage(5 + int(_isActivelyStruggling)*5)}
