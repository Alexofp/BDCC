extends FluidProduction
class_name CumProduction

func getCapacity() -> float:
	return round(100.0)

func getFluidType():
	return BodilyFluids.FluidType.Cum

func getProductionSpeedPerHour() -> float:
	if(!shouldProduce()):
		return 0.0
	return getCapacity() / 5.0
