extends StatusEffectBase

func _init():
	id = StatusEffect.ImplantedPosthypnoticTrigger
	isBattleOnly = false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Posthypnotic trigger"

func getEffectDesc():
	return "You have a posthypnotic trigger implanted deep within your subconcious."

func getEffectImage():
	return "res://Modules/HypnokinkModule/Icons/StatusEffects/subconcious.png"

func getIconColor():
	return IconColorPurple

func combine(_args = []):
	pass
