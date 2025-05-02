extends BuffBase

func _init():
	id = Buff.BreastsForcedLactationBuff

func getVisibleDescription():
	return "Forced lactation"

func getBuffColor():
	return DamageType.getColor(DamageType.Lust)
