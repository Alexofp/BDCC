extends RestraintData
class_name RestraintBallGag

func _init():
	restraintType = RestraintType.Gag

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
		text = "{user.name} tugs on the straps of {user.his} head harness, trying to take it off."
		damage = calcDamage(_pc)
		stamina = 10
	else:
		text = "{user.name} tries to bite down on the ball in {user.his} mouth but the rubber makes it very tough."
		damage = calcDamage(_pc, 0.1)
		stamina = 5
	
	if(failChance(_pc, 20)):
		text += " The ball in {user.his} mouth makes {user.him} drool a lot."
		lust = scaleDamage(5)
	
	#damage = calcDamage()
	
	return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}

func getResistAnimation():
	return "struggle_gag"
