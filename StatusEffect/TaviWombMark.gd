extends StatusEffectBase

func _init():
	id = StatusEffect.TaviWombMark
	isBattleOnly = false

	alwaysCheckedForNPCs = false
	alwaysCheckedForPlayer = false
	priorityDuringChecking = 90
	
func shouldApplyTo(_npc):
	#if(_npc.menstrualCycle != null && _npc.menstrualCycle.isVisiblyPregnant()):
	#	return true
	return false

func getEffectName():
	if(character.isPregnant()):
		return "Glowing Womb Mark"
	return "Womb Mark"

func getEffectDesc():
	if(character.isPregnant()):
		return "A symbol of "+character.getName()+"'s eternal lust. And it's glowing.."
	return "A symbol of "+character.getName()+"'s eternal lust."

func getEffectImage():
	if(character.isPregnant()):
		return "res://Images/StatusEffects/WombMarkGlowing.png"
	
	return "res://Images/StatusEffects/WombMark.png"

func getIconColor():
	return IconColorDarkPurple

func getBuffs():
	return [
		buff(Buff.FertilityBuff, [200]),
		buff(Buff.CrossSpeciesCompatibilityBuff, [100]),
		buff(Buff.PregnancySpeedBuff, [100]),
	]
