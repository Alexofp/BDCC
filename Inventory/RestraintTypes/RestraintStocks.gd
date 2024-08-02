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

func doStruggle(_pc, _minigame:MinigameResult):
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
	
	if(failChanceLowScore(_pc, 10, _minigame)):
		text = "{user.name} tries to wiggle {user.his} whole body but one wrong move makes you [b]lose a lot of progress[/b]!"
		damage = -0.3
		stamina = 70
	elif(_legsFree):
		text = "{user.name} wiggles {user.his} whole body to try to escape."
		damage = calcDamage(_pc, _minigame)
		stamina = 70
	else:
		text = "{user.name} helplessly wiggles {user.his} body, having {user.his} legs restrained makes this pretty much uselss."
		damage = calcDamage(_pc, _minigame, 0.5)
		stamina = RNG.randi_range(70, 90)
		
	if(luckChance(_pc, 1) && damage > 0.0):
		text += " {user.name} managed to free one of {user.his} hands!"
		damage = max(0.5, damage)
	elif(failChance(_pc, 10)):
		text += " {user.name} desperately tries to break the stocks locks but just ends up more tired."
		stamina += 20
	
	return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}
