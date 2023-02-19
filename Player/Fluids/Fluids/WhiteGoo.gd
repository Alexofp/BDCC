extends FluidBase

func _init():
	id = "WhiteGoo"

func getVisibleName():
	return "White Goo"

func getCost(_amount) -> int:
	return int(_amount / 100.0) * 3
