extends Character

func _init():
	id = "plantTentacles"
	disableSerialization = true
	
func _getName():
	return "Plant Tentacles"

func getGender():
	return Gender.Other
	
func getSmallDescription() -> String:
	return "Some green tentacles that really want to grab you.."

func getSpecies():
	return ["unknown"]

func getPenisSize():
	return 20.0

func getCustomFluidType(_fluidSource) -> String:
	return "IvyNectar"

func getFluidAmount(_fluidSource):
	return RNG.randf_range(350.0, 750.0)

func getBaseFertility() -> float:
	return 0.0

# Can't get pregnant from it
func getBaseVirility() -> float:
	return 0.0
