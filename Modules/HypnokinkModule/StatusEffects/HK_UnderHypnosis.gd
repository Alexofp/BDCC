extends StatusEffectBase

func _init():
	id = StatusEffect.UnderHypnosis
	isBattleOnly = false
	
	alwaysCheckedForNPCs = false
	alwaysCheckedForPlayer = false
	priorityDuringChecking = 0
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Under hypnosis"

func getEffectDesc():
	return "You are currently being hypnotized."

func getEffectImage():
	return "res://Modules/HypnokinkModule/Icons/StatusEffects/hypno_active.png"

func getIconColor():
	return IconColorPurple

func combine(_args = []):
	pass
