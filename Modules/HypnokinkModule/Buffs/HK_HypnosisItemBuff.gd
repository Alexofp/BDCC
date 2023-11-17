extends BuffBase

func _init():
	id = HK_Buff.HypnosisItemBuff

func getVisibleDescription():
	return "Being hypnotised"

func getBuffColor():
	return Color.purple
