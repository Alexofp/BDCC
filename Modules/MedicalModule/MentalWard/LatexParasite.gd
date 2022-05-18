extends Character

func _init():
	id = "latexParasite"
	
func _getName():
	return "Latex Parasite"

func getGender():
	return Gender.Other
	
func getSmallDescription() -> String:
	return "A shiny pile of black goo"

func getSpecies():
	return ["canine"]

func getPenisSize():
	return 20.0

func getFluidType(_fluidSource):
	return BodilyFluids.FluidType.BlackGoo

func getFluidAmount(_fluidSource):
	return RNG.randf_range(400.0, 600.0)
