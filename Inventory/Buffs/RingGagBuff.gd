extends BuffBase

func _init():
	id = Buff.RingGagBuff

func getVisibleDescription():
	return "Forces wearer's mouth open and gags"

func apply(_buffHolder):
	_buffHolder.gagged = true

func getBuffColor():
	return Color.purple
