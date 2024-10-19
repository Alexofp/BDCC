extends RestraintData
class_name RestraintLegCuffs

var tightlockShiv:bool = false

func _init():
	npcDodgeDifficultyMod = 1.1
	restraintType = RestraintType.AnkleCuffs

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
		text = "{user.name} kicks and twists {user.his} legs, attempting to free {user.his} ankles from the cuffs. The more {user.he} struggles, the [b]tighter the cuffs clamp down[/b]."
		damage = -0.5
	elif(_handsFree && _armsFree):
		text = "{user.name} uses {user.his} hands to try and take off the leg cuffs."
		damage = calcDamage(_pc, _minigame)
		stamina = 10
	else:
		text = "{user.name} rolls around and tries to helplessly wiggle {user.his} leg cuffs off."
		damage = calcDamage(_pc, _minigame, 0.5)
		stamina = 10
		
		if(failChance(_pc, 10)):
			text += " Ow! {user.name} accidently smashed them against "+RNG.pick(["the wall", "the ground", "something"])
			pain = scaleDamage(RNG.randi_range(5, 10))
	
	#damage = calcDamage()
	
	return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}

func getResistAnimation():
	return "struggle_legs"

func getTightLockRequiredItemID() -> String:
	if(tightlockShiv):
		return "Shiv"
	return .getTightLockRequiredItemID()

func getTightLockUnlockMessage() -> String:
	if(tightlockShiv):
		return "The lock is impossible to remove so you just use a shiv to cut through the restraint, slowly freeing your ankles."
	return .getTightLockUnlockMessage()
