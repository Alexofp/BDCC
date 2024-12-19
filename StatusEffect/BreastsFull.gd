extends StatusEffectBase

func _init():
	id = StatusEffect.BreastsFull
	isBattleOnly = false

	alwaysCheckedForNPCs = true
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 89
	
func shouldApplyTo(_npc):
	if(_npc.hasBreastsFullOfMilk()):
		return true
	return false

func getEffectName():
	return "Breasts full"

func getEffectDesc():
	return "Your breasts feel so heavy, they're full of milk! They are itching to be milked"

func getEffectImage():
	return "res://Images/StatusEffects/lactation.png"

func getIconColor():
	return IconColorRed

func getBuffs():
	return [
		buff(Buff.AmbientLustBuff, [10]),
		buff(Buff.SensitivityGainBuff, [BodypartSlot.Breasts, 20]),
	]
