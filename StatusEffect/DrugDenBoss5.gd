extends "res://StatusEffect/DrugDenBoss1.gd"

func _init():
	id = "DrugDenBoss5"

func getBuffs():
	return [
		buff(Buff.MaxPainBuff, [50]),
		buff(Buff.MaxLustBuff, [50]),
		buff(Buff.MaxStaminaBuff, [100]),
		buff(Buff.StatusEffectImmunityBuff, [StatusEffect.Collapsed, 100.0]),
	]
