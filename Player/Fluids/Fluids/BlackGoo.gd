extends FluidBase

func _init():
	id = "BlackGoo"

func getVisibleName():
	return "Black Goo"

func getCost(_amount) -> int:
	return int(_amount / 100.0) * 3
