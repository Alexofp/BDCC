extends FluidProduction
class_name CumProduction

func getCapacity() -> float:
	var penis = getBodypart()
	var lenCM = penis.getLength()
	
	return round(50.0 + pow(lenCM, 2.0))

func getProductionSpeedPerHour() -> float:
	if(!shouldProduce()):
		return 0.0
	return getCapacity() / 2.0

func getFluidSource():
	return FluidSource.Penis
