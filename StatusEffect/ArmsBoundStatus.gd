extends StatusEffectBase

func _init():
	id = StatusEffect.ArmsBound
	isBattleOnly = false
	
	alwaysCheckedForNPCs = true
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 99
	
func shouldApplyTo(_npc):
	if(_npc.hasBoundArms()):
		return true
	return false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Bound arms"

func getEffectDesc():
	return "Your arms are bound together. You can't use them for combat but you can still do most tasks that require them"

func getEffectImage():
	return "res://Images/StatusEffects/handcuffed.png"

func getIconColor():
	return IconColorPurple

func combine(_args = []):
	pass

