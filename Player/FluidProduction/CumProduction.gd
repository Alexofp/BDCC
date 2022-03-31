extends FluidProduction
class_name CumProduction

func getCapacity() -> float:
	return round(100.0)

func getFluidType():
	return BodilyFluids.FluidType.Cum
