extends RestraintData
class_name RestraintBlindfold

func _init():
	npcDodgeDifficultyMod = 0.8
	restraintType = RestraintType.Blindfold

func canInspectWhileBlindfolded():
	return true

func canUnlockWithKey():
	return false
	
func alwaysSavedWhenStruggledOutOf():
	return true

func shouldDoStruggleMinigame(_pc):
	var _armsFree = !_pc.hasBoundArms()
	if(_armsFree):
		return false
	return .shouldDoStruggleMinigame(_pc)
	
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
		text = "{user.name} struggles to shake the blindfold off but careless motions cause it to [b]get tigther[/b] around {user.his} head!"
		damage = -0.5
	elif(_handsFree && _armsFree):
		text = "Because {user.name}'s hands are free {user.he} manages to just untie {user.his} blindfold."
		damage = 1.0
	elif(_handsFree):
		text = "{user.name}'s hands are free but they are bound together so {user.name} has to awkwardly bend to reach the blindfold."
		damage = 1.0
		stamina = 5
	else:
		text = "{user.name} shakes {user.his} head, trying to make the blindfold slip off."
		damage = calcDamage(_pc, _minigame)
		stamina = 10
	
	#damage = calcDamage()
	
	return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}

func getResistAnimation():
	return "struggle_gag"

func getTightLockRequiredItemID() -> String:
	return "Shiv"

func getTightLockUnlockMessage() -> String:
	return "The lock is impossible to remove so you just cut through the thick cloth of the blindfold with a shiv until it falls apart."
