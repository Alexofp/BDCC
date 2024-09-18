extends RestraintData
class_name RestraintMuzzle

func _init():
	restraintType = RestraintType.Muzzle

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
	
	if(failChanceLowScore(_pc, 20, _minigame)):
		text = "{user.name} strains against the basket muzzle, trying to shake it off. Instead, {user.his} movements cause it to [b]press harder[/b] against {user.his} face, the straps squeezing {user.his} cheeks and jaw even more firmly."
		damage = -0.5
	elif(_handsFree && _armsFree):
		text = "{user.name} tugs on the straps of {user.his} head harness, trying to take it off."
		damage = calcDamage(_pc, _minigame)
		stamina = 10
	else:
		text = "{user.name} desperately tries to wiggle the harness off {user.his} head."
		damage = calcDamage(_pc, _minigame, 0.1)
		stamina = 5
	
		if(failChance(_pc, 40)):
			text += " Shaking {user.his} head so much makes {user.him} disoriented."
			pain = scaleDamage(5)
	
	return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}

func getResistAnimation():
	return "struggle_gag"

func getTightLockRequiredItemID() -> String:
	return "Shiv"

func getTightLockUnlockMessage() -> String:
	return "The lock is impossible to remove so you just cut through the leather straps that hold the muzzle on your face with a shiv, being careful as to not hurt yourself in the process."
