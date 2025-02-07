extends "res://StatusEffect/DrugDenBoss1.gd"

func _init():
	id = "DrugDenBoss2"

func getBuffs():
	return [
		buff(Buff.DodgeChanceBuff, [30.0]),
	]
