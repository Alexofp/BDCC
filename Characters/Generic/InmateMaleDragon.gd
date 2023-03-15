extends Character

func _init():
	id = "inmateMaleDragon"
	disableSerialization = true
	
func _getName():
	return "Male inmate"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Generic male inmate"

func getSpecies():
	return ["dragon"]

func getPenisSize():
	return 22.0

func getFluidAmount(fluidSource):
	if(fluidSource == FluidSource.Penis):
		return RNG.randf_range(200.0, 500.0)
		
	return .getFluidAmount(fluidSource)
