extends BuffBase

func _init():
	id = Buff.BlockedHandsBuff

func getVisibleDescription():
	return "Blocks the usage of hands"

func getBuffColor():
	return Color.purple
