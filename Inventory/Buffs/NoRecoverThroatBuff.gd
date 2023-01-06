extends BuffBase

func _init():
	id = Buff.NoRecoverThroatBuff

func getVisibleDescription():
	return "Keeps throat stretched"

func apply(_buffHolder):
	_buffHolder.orificesPreventedFromRecovering[OrificeType.Throat] = true

func getBuffColor():
	return Color.red
