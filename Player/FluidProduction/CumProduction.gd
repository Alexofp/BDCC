extends FluidProduction
class_name CumProduction

func getCapacity() -> float:
	var penis = getBodypart()
	var lenCM = penis.getLength()
	
	var mult = 1.0
	var pc = getCharacter()
	if(pc != null):
		mult += pc.getCustomAttribute(BuffAttribute.PenisBallsVolume)
	
	return max(round((50.0 + pow(lenCM, 2.0)) * mult), 0.0)

func getProductionSpeedPerHour() -> float:
	if(!shouldProduce()):
		return 0.0
		
	var mult = 1.0
	var pc = getCharacter()
	if(pc != null):
		mult += pc.getCustomAttribute(BuffAttribute.PenisCumProduction)
		
	return 100.0 * mult

func getFluidSource():
	return FluidSource.Penis
