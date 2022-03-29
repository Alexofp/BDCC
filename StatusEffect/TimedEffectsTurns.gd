extends StatusEffectBase

func _init():
	id = StatusEffect.TimedEffectsTurns
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
	
	var time = character.timedBuffsDurationTurns

	return "For the next "+str(time)+" turns:"

func getEffectImage():
	return "res://UI/StatusEffectsPanel/images/mess.png"

func getIconColor():
	return IconColorBlue

func combine(_args = []):
	pass

func getBuffs():
	return character.timedBuffsTurns
