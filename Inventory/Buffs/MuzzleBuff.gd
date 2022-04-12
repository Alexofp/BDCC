extends BuffBase

func _init():
	id = Buff.MuzzleBuff

func getVisibleDescription():
	return "Prevents biting and the usage of mouth"

func apply(_buffHolder):
	#_buffHolder.gagged = true
	pass

func getBuffColor():
	return Color.purple
