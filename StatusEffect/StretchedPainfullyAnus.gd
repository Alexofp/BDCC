extends "res://StatusEffect/StretchedPainfullyPussy.gd"

func _init():
	id = StatusEffect.StretchedPainfullyAnus

func getEffectName():
	return "Anus painfully stretched x"+str(stacks)

func getEffectDesc():
	if(stacks <= 1):
		return "Your anus looks bruised and kinda hurts.. A day of rest might help"
	if(stacks <= 2):
		return "Your anus got so bruised that it won't heal on its own.. You should find a doctor"
	
	return "Your anus sustained a lot of damage and won't heal on its own.. You should find a doctor"

func getEffectImage():
	return "res://Images/StatusEffects/donut.png"

func getBuffs():
	if(stacks <= 1):
		return [
			buff(Buff.AmbientPainBuff, [5]),
			buff(Buff.NoRecoverAnusBuff),
			buff(Buff.SensitivityRestoreBuff, [BodypartSlot.Anus, -100.0]),
			buff(Buff.SensitivityGainBuff, [BodypartSlot.Anus, -20.0 - (stacks-1)*30.0]),
			buff(Buff.OverstimulationThresholdBuff, [BodypartSlot.Anus, -10.0 - (stacks-1)*20.0]),
		]
	
	return [
		buff(Buff.AmbientPainBuff, [4+stacks*2]),
		buff(Buff.NoRecoverAnusBuff),
		buff(Buff.SensitivityRestoreBuff, [BodypartSlot.Anus, -100.0]),
		buff(Buff.SensitivityGainBuff, [BodypartSlot.Anus, -100.0]),
		buff(Buff.OverstimulationThresholdBuff, [BodypartSlot.Anus, -50.0]),
	]
