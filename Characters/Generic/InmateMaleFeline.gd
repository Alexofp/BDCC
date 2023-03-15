extends Character

func _init():
	id = "inmateMaleFeline"
	disableSerialization = true
	
func _getName():
	return "Male inmate"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Generic male inmate"

func getSpecies():
	return ["feline"]

func getPenisSize():
	return 18.0

func getFluidAmount(fluidSource):
	if(fluidSource == FluidSource.Penis):
		return RNG.randf_range(100.0, 300.0)
		
	return .getFluidAmount(fluidSource)
