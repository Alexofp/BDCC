extends StatusEffectBase

#ACEPREGEXPAC

func _init():
	id = "OverdueStatusAPE"
	isBattleOnly = false

	alwaysCheckedForNPCs = false # Disabled
	alwaysCheckedForPlayer = false # Disabled
	priorityDuringChecking = 85

#var _days = floor(2/(3600.0*24.0))

#func processTime(_secondsPassed: int):
#	return 60*60*24*7

#was tryna do a delay on when the status activates, ready to birth + X days.
#none of these worked because im very smart, im just gonna do it without a delay and hope nobody notices

func shouldApplyTo(_npc):
	if(_npc.menstrualCycle != null && _npc.menstrualCycle.isReadyToGiveBirth()):
		return true
	return false

func getEffectName():
	return "Ready to pop"

func getEffectDesc():
	return "Its getting hard to walk and there is signifigant strain in and around your belly. You should probably go give birth in the nursery."

func getEffectImage():
	return "res://Images/StatusEffects/mother.png"

func getIconColor():
	return IconColorRed

func getBuffs():
	return [
		buff(Buff.MaxStaminaBuff, [-25]),
		buff(Buff.AmbientPainBuff, [50]),
		buff(Buff.BreastsMilkProductionBuff, [100]),
		buff(Buff.MaxPainBuff, [-10]),
		buff(Buff.LustArmorBuff, [-20]),
		buff(Buff.DodgeChanceBuff,[-25]),
		]
