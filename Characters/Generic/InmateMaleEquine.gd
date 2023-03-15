extends Character

func _init():
	id = "inmateMaleEquine"
	disableSerialization = true
	
func _getName():
	return "Male inmate"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Generic male inmate"

func getSpecies():
	return ["equine"]

func getPenisSize():
	return 30.0

func getFluidAmount(fluidSource):
	if(fluidSource == FluidSource.Penis):
		return RNG.randf_range(400.0, 800.0)
		
	return .getFluidAmount(fluidSource)
