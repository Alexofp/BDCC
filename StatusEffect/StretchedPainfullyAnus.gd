extends "res://StatusEffect/StretchedPainfullyPussy.gd"

func _init():
	id = StatusEffect.StretchedPainfullyAnus

func getEffectName():
	return "Anus painfully stretched x"+str(stacks)

func getEffectDesc():
	if(stacks <= 1):
		return "Your anus looks bruised and kinda hurts.."
	if(stacks <= 2):
		return "Your anus looks bruised and won't heal on its own.."
	
	return "Your anus sustained a lot of damage and won't heal on its own.."

func getEffectImage():
	return "res://Images/StatusEffects/donut.png"

func getBuffs():
	if(stacks <= 1):
		return [
			buff(Buff.AmbientPainBuff, [5]),
			buff(Buff.MinLoosenessAnusBuff, [0.5]),
		]
	
	return [
		buff(Buff.AmbientPainBuff, [4+stacks*2]),
		buff(Buff.MinLoosenessAnusBuff, [0.5 + stacks*0.4])
	]
