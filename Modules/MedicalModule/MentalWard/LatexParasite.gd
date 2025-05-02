extends Character

func _init():
	id = "latexParasite"
	disableSerialization = true
	
func _getName():
	return "Latex Parasite"

func getGender():
	return Gender.Other
	
func getSmallDescription() -> String:
	return "A shiny pile of black goo"

func getSpecies():
	return ["unknown"]

func getPenisSize():
	return 20.0

func getCustomFluidType(_fluidSource) -> String:
	return "BlackGoo"

func getFluidAmount(_fluidSource):
	return RNG.randf_range(400.0, 600.0)

func getBaseFertility() -> float:
	return 0.0

# Can't get pregnant from it
func getBaseVirility() -> float:
	return 0.0
