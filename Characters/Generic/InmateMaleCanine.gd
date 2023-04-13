extends Character

func _init():
	id = "inmateMaleCanine"
	disableSerialization = true
	
func _getName():
	return "Male inmate"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Generic male inmate"

func getSpecies():
	return ["canine"]

func getPenisSize():
	return 20.0

func getFluidAmount(fluidSource):
	if(fluidSource == FluidSource.Penis):
		return RNG.randf_range(200.0, 300.0)
		
	return .getFluidAmount(fluidSource)
