extends "res://StatusEffect/DrugDenBoss1.gd"

func _init():
	id = "DrugDenBoss3"

func getBuffs():
	return [
		buff(Buff.PhysicalDamageBuff, [50.0]),
		buff(Buff.ReceivedPhysicalDamageBuff, [20.0]),
	]
