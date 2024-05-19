extends FluidBase

func _init():
	id = "IvyNectar"

func getVisibleName():
	return "Ivy nectar"

func getCost(_amount) -> int:
	return int(_amount / 100.0) * 3

func getStatusEffectColor():
	return Color("#CDFFCD")

func getCumOverlayColor():
	return Color("#CDFFCD")
