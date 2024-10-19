extends "res://Inventory/RestraintTypes/RestraintMuzzle.gd"
class_name RestraintRingGag

func _init():
	restraintType = RestraintType.Gag

func getResistAnimation():
	return "struggle_gag"

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
	
	if(failChanceLowScore(_pc, 15, _minigame)):
		text = "{user.name} struggles to push the ring-gag out of {user.his} mouth, but {user.his} frantic movements only make the metal ring [b]press harder against {user.his} teeth and lips[/b], keeping {user.his} mouthhole always open."
		damage = -0.5
	elif(_handsFree && _armsFree):
		text = "{user.name} tugs on the straps of {user.his} head harness, trying to take it off."
		damage = calcDamage(_pc, _minigame)
		stamina = 10
	else:
		text = "{user.name} tries to spit out the ring in {user.his} mouth but it proves to be very hard."
		damage = calcDamage(_pc, _minigame, 0.1)
		stamina = 5
	
	if(failChance(_pc, 20)):
		text += " The ring makes {user.him} drool a lot."
		lust = scaleDamage(5)
	
	#damage = calcDamage()
	
	return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}

func getTightLockRequiredItemID() -> String:
	return "Shiv"

func getTightLockUnlockMessage() -> String:
	return "The lock is impossible to remove so you just cut through the leather straps of the head harness with a shiv, being careful as to not hurt yourself in the process."
