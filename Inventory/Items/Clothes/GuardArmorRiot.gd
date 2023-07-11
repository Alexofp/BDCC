extends "res://Inventory/Items/Clothes/GuardArmor.gd"

func _init():
	id = "GuardArmorRiot"

func getDescription():
	return "A standard armor for guards. This is a riot variant that offers a lot of protection against physical damage."

func getBuffs():
	return [
		buff(Buff.PhysicalArmorBuff, [30]),
		buff(Buff.StatusEffectImmunityBuff, [StatusEffect.Collapsed, 50]),
		buff(Buff.StatusEffectImmunityBuff, [StatusEffect.Bleeding, 90]),
		]

func getTags():
	return [
		ItemTag.Illegal,
		]
