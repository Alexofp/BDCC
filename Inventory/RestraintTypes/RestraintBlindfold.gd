extends RestraintData
class_name RestraintBlindfold

func canInspectWhileBlindfolded():
	return true

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
	
	if(_handsFree && _armsFree):
		text = "Because your hands are free you manage to just untie your blindfold."
		damage = 1.0
	elif(_armsFree):
		text = "Your hands are free but they are bound together so you have to awkwardly bend to reach the blindfold."
		damage = 1.0
		stamina = 5
	else:
		text = "You shake your head, trying to make the blindfold slip off."
		damage = calcDamage()
		stamina = 10
	
	#damage = calcDamage()
	
	return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}
