extends RestraintData
class_name RestraintStraitjacket

func _init():
	npcDodgeDifficultyMod = 1.5
	restraintType = RestraintType.Straitjacket
	
func resetOnNewDay():
	pass

func canBeCut():
	return true

func calcCutDamage(_pc, mult = 1.0):
	return .calcCutDamage(_pc, mult) / 2.0

func getLevelDamage():
	return 0.04 + 0.1 / level

func defaultStruggle(_pc, _minigame, response):
	response.text += "{user.name} helplessly tries to wiggle the straitjacket off."
	response.stamina += calcStruggleStamina(_pc, 5)
	return response	

