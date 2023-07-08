extends "res://Inventory/Items/Clothes/GuardArmor.gd"

func _init():
	id = "GuardArmorRiot"

func getDescription():
	return "A standard armor for guards. This is a riot variant that offers a lot of protection against physical damage."

func getBuffs():
	return [
		buff(Buff.PhysicalArmorBuff, [30]),
		buff(Buff.StatusEffectImmunityBuff, [StatusEffect.Collapsed, 100]),
		buff(Buff.StatusEffectImmunityBuff, [StatusEffect.Bleeding, 100]),
		buff(Buff.StatusEffectImmunityBuff, [StatusEffect.Stunned, 100]),
		buff(Buff.StatusEffectImmunityBuff, [StatusEffect.Weakness, 100]),
		]

func getTags():
	return [
		ItemTag.Illegal,
		]
