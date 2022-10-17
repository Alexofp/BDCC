extends RestraintData
class_name RestraintStraitjacket

func _init():
	npcDodgeDifficultyMod = 1.5
	restraintType = RestraintType.Straitjacket
	
func resetOnNewDay():
	pass

func getLevelDamage():
	return 0.04 + 0.1 / level

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
	
	text = "{user.name} helplessly tries to wiggle the straitjacket off."
	damage = calcDamage(_pc)
	stamina = RNG.randi_range(50, 60)
	
	return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}
