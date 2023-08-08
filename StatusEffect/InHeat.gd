extends StatusEffectBase

func _init():
	id = StatusEffect.InHeat
	isBattleOnly = false

	alwaysCheckedForNPCs = true
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 91
	
func shouldApplyTo(_npc):
	if(_npc.menstrualCycle != null && _npc.menstrualCycle.isInHeat() && !_npc.hasPerk(Perk.StartNoHeat)):
		return true
	return false

func getEffectName():
	return "In Heat"

func getEffectDesc():
	return "You have a huge urge to mate with someone.."

func getEffectImage():
	return "res://Images/StatusEffects/heartburn.png"

func getIconColor():
	return IconColorDarkPurple

func getBuffs():
	return [
		buff(Buff.ReceivedLustDamageBuff, [30]),
		buff(Buff.AmbientLustBuff, [50]),
		buff(Buff.ExposureBuff, [50]),
	]
