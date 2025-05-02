extends Character

func _init():
	id = "ghostHands"
	disableSerialization = true
	
func _getName():
	return "Ghost hands"

func getGender():
	return Gender.Other
	
func getSmallDescription() -> String:
	return "Transparent ghost-like hands"

func getSpecies():
	return ["unknown"]

func getPenisSize():
	return 20.0

func getCustomFluidType(_fluidSource) -> String:
	return "WhiteGoo"

func getFluidAmount(_fluidSource):
	return RNG.randf_range(100.0, 200.0)

func getBaseFertility() -> float:
	return 0.0

# Can't get pregnant from it
func getBaseVirility() -> float:
	return 0.0
