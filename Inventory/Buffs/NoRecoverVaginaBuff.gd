extends BuffBase

func _init():
	id = Buff.NoRecoverVaginaBuff

func getVisibleDescription():
	return "Keeps pussy stretched"

func apply(_buffHolder):
	_buffHolder.orificesPreventedFromRecovering[OrificeType.Vagina] = true

func getBuffColor():
	return Color.red
