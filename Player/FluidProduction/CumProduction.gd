extends FluidProduction
class_name CumProduction

func getCapacity() -> float:
	var penis = getBodypart()
	var pc = getCharacter()
	
	var mult:float = 1.0
	if(pc != null):
		mult += pc.getCustomAttribute(BuffAttribute.PenisBallsVolume)
	
	if(penis && penis.has_method("getOverrideCumCapacity")):
		return penis.getOverrideCumCapacity(mult)
	
	var lenCM:float = penis.getLength()
	return max(round((50.0 + pow(lenCM, 2.0)) * mult), 0.0)

func getProductionSpeedPerHour() -> float:
	if(!shouldProduce()):
		return 0.0
		
	var mult:float = 1.0
	var multFinal:float = 1.0 # Can't go below zero
	var pc = getCharacter()
	if(pc != null):
		mult += pc.getCustomAttribute(BuffAttribute.PenisCumProduction)
		multFinal += pc.getCustomAttribute(BuffAttribute.PenisCumProductionFinal)
		
	return 100.0 * mult * max(multFinal, 0.0)

func getFluidSource():
	return FluidSource.Penis
