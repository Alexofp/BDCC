extends StatusEffectBase

func _init():
	id = StatusEffect.TimedEffectsTurns
	isBattleOnly = true
	
	alwaysCheckedForNPCs = true
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 100
	
func shouldApplyTo(_npc):
	if(_npc.timedBuffsTurns.size() > 0):
		return true
	return false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Timed effects"

func getEffectDesc():
	var time = character.timedBuffsDurationTurns

	return "For the next "+str(time)+" turns:"

func getEffectImage():
	return "res://Images/StatusEffects/medicines.png"

func getIconColor():
	return IconColorBlue

func combine(_args = []):
	pass

func getBuffs():
	return character.timedBuffsTurns
