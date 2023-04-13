extends Character

func _init():
	id = "inmateMaleHuman"
	disableSerialization = true
	
func _getName():
	return "Male inmate"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Generic male inmate"

func getSpecies():
	return ["human"]

func getPenisSize():
	return 16.0

func getFluidAmount(fluidSource):
	if(fluidSource == FluidSource.Penis):
		return RNG.randf_range(60.0, 200.0)
		
	return .getFluidAmount(fluidSource)
