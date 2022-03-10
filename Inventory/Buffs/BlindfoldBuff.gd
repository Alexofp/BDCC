extends BuffBase

func _init():
	id = Buff.BlindfoldBuff

func getVisibleDescription():
	return "Blinds the wearer"

func getBuffColor():
	return Color.purple
