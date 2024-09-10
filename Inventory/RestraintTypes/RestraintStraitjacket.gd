extends RestraintData
class_name RestraintStraitjacket

func _init():
	npcDodgeDifficultyMod = 1.5
	restraintType = RestraintType.Straitjacket
	
func resetOnNewDay():
	pass

func getLevelDamage():
	return 0.04 + 0.1 / level

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
		text = "{user.name} twists and turns desperately, trying to free {user.his} arms from the straitjacket. However, {user.his} struggles only [b]make it tighter[/b], the straps digging into {user.his} skin and immobilizing {user.his} arms even more securely."
		damage = -0.3
		stamina = RNG.randi_range(50, 60)
		pain = scaleDamage(10)
	else:
		text = "{user.name} helplessly tries to wiggle the straitjacket off."
		damage = calcDamage(_pc, _minigame)
		stamina = RNG.randi_range(50, 60)
	
	return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}
