extends "res://Inventory/Items/GuardHelmet.gd"

func _init():
	id = "GuardHelmetRiot"

func getDescription():
	return "An armored helmet. This is a riot variant that offers a lot of protection against physical damage."

func getBuffs():
	return [
		buff(Buff.PhysicalArmorBuff, [20]),
		buff(Buff.StatusEffectImmunityBuff, [StatusEffect.Weakness, 100]),
		buff(Buff.StatusEffectImmunityBuff, [StatusEffect.Blindness, 100]),
		]

func getTags():
	return [
		ItemTag.Illegal,
		]
