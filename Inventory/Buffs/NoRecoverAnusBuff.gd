extends BuffBase

func _init():
	id = Buff.NoRecoverAnusBuff

func getVisibleDescription():
	return "Keeps anus stretched"

func apply(_buffHolder):
	_buffHolder.orificesPreventedFromRecovering[OrificeType.Anus] = true

func getBuffColor():
	return Color.red
