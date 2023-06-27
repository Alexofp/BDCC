extends StatusEffectBase

func _init():
	id = StatusEffect.LegsBound
	isBattleOnly = false
	
	alwaysCheckedForNPCs = true
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 99
	
func shouldApplyTo(_npc):
	if(_npc.hasBoundLegs()):
		return true
	return false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Bound legs"

func getEffectDesc():
	return "Your legs are bound. You can still walk but it's harder to dodge attacks"

func getEffectImage():
	return "res://Images/StatusEffects/manacles.png"

func getIconColor():
	return IconColorPurple

func combine(_args = []):
	pass

func getBuffs():
	return [
		buff(Buff.DodgeChanceBuff, [-30])
	]
