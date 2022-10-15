extends RestraintData
class_name RestraintRopeHarness

func canUnlockWithKey():
	return false

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
	
	if(true):
		text = "{user.name} tries to blindly find the knot to tug on"
		damage = calcDamage()
		stamina = 10
		lust = scaleDamage(5)
	
	return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}

func processStruggleTurn():
	if(failChance(10)):
		return {"text": "Your rope harness rubs against one of your nips", "lust": scaleDamage(5)}
	elif(failChance(10)):
		return {"text": "Your rope harness digs into your crotch", "lust": scaleDamage(5)}
