extends FluidBase

func _init():
	id = "CumLube"

func getVisibleName():
	return "Cum Lube"

func getCumOverlayColor():
	return Color.lightgray

func canStoreInFluidTank() -> bool:
	return false
