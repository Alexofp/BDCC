extends StatusEffectBase

func _init():
	id = StatusEffect.TimedEffects
	isBattleOnly = false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Timed effects"

func getEffectDesc():
	if(!character.isPlayer()):
		return "Huh bad"
	
	var time = character.timedBuffsDurationSeconds

	return "For the next "+Util.getTimeStringHumanReadable(time)+":"

func getEffectImage():
	return "res://UI/StatusEffectsPanel/images/mess.png"

func getIconColor():
	return IconColorBlue

func combine(_args = []):
	pass

func getBuffs():
	return character.timedBuffs
