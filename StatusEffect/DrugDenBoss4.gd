extends "res://StatusEffect/DrugDenBoss1.gd"

func _init():
	id = "DrugDenBoss4"

func getBuffs():
	return [
		buff(Buff.LustDamageBuff, [50.0]),
		buff(Buff.ReceivedLustDamageBuff, [20.0]),
	]
