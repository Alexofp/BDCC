extends FluidProduction
class_name CumProduction

func getCapacity() -> float:
	var penis = getBodypart()
	var penisLength = penis.getLength()
	var ballsScale = penis.getBallsScale();
	
	return round((20.0 * (ballsScale * 10.0 * OPTIONS.getCapacityBallsRatio())^2 + 20.0 * (penisLength * OPTIONS.getCapacityPenisratio())^2) * OPTIONS.getCapacityModifier())

func getProductionSpeedPerHour() -> float:
	if(!shouldProduce()):
		return 0.0
	return round(getCapacity() * OPTIONS.getProductionModifier())

func getFluidSource():
	return FluidSource.Penis
