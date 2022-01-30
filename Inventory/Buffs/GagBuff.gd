extends BuffBase

func _init():
	id = "gagBuff"

func getVisibleDescription():
	return "Gags the wearer"

func apply(_buffHolder):
	_buffHolder.gagged = true

func getBuffColor():
	return Color.purple
