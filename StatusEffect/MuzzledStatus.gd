extends StatusEffectBase

func _init():
	id = StatusEffect.Muzzled
	isBattleOnly = false
	
	alwaysCheckedForNPCs = true
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 99
	
func shouldApplyTo(_npc):
	if(_npc.isMuzzled()):
		return true
	return false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Muzzled"

func getEffectDesc():
	return "You have a dog muzzle on your face!"

func getEffectImage():
	return "res://Images/StatusEffects/muzzle.png"

func getIconColor():
	return IconColorPurple

func combine(_args = []):
	pass

