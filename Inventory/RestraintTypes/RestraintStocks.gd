extends RestraintData
class_name RestraintStocks

func resetOnNewDay():
	pass

func getVisibleTightness():
	if(tightness > 0.9):
		return "very sturdy"
	if(tightness > 0.8):
		return "sturdy"
	if(tightness > 0.7):
		return "sturdy enough"
	if(tightness > 0.6):
		return "gives in a little bit"
	if(tightness > 0.5):
		return "gives some leeway"
	if(tightness > 0.4):
		return "quite a bit of leeway"
	if(tightness > 0.3):
		return "kinda close to escaping"
	if(tightness > 0.2):
		return "close to escaping"
	if(tightness > 0.1):
		return "very close to escaping"
	return "you're almost free"

func getRemoveMessage():
	return "Stocks miraculously give in and let you free your arms and head"

func alwaysBreaksWhenStruggledOutOf():
	return true

func getLevelDamage():
	return 0.05

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
		text = "You wiggle your whole body to try and escape."
		damage = calcDamage()
		stamina = 20
	else:
		text = "You helplessly wiggle your body, having your legs restrained makes this pretty much uselss."
		damage = calcDamage(0.5)
		stamina = RNG.randi_range(20, 30)
		
	if(luckChance(1)):
		text += " You managed to free one of your hands!"
		damage = max(0.5, damage)
	elif(failChance(10)):
		text += " You desperately try to break the stocks locks but just end up more tired."
		stamina += 20
	
	return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}
