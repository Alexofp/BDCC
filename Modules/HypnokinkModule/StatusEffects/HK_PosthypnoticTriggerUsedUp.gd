extends StatusEffectBase

func _init():
	id = StatusEffect.PosthypnoticTriggerUsedUp
	isBattleOnly = true
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Trigger used up"

func getEffectDesc():
	return "You are immune to further uses of your hypnotic trigger this combat."

func getEffectImage():
	return "res://Modules/HypnokinkModule/Icons/StatusEffects/empty_circle.png"

func getIconColor():
	return IconColorGreen

func combine(_args = []):
	pass
