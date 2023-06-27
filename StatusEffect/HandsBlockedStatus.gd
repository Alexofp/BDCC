extends StatusEffectBase

func _init():
	id = StatusEffect.HandsBlocked
	isBattleOnly = false
	
	alwaysCheckedForNPCs = true
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 99
	
func shouldApplyTo(_npc):
	if(_npc.hasBlockedHands()):
		return true
	return false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Blocked hands"

func getEffectDesc():
	return "You can't use your hands. You can still punch but most tasks that require you to use your fingers are impossible"

func getEffectImage():
	return "res://Images/StatusEffects/mittens.png"

func getIconColor():
	return IconColorPurple

func combine(_args = []):
	pass

