extends Bodypart
class_name BodypartAnus

var orifice: Orifice = null

func _init():
	limbSlot = null
	orifice = Orifice.new()

func getSlot():
	return BodypartSlot.Anus

func getCompatibleSpecies():
	return [Species.Any]
	
func getTooltipInfo():
	return "Gonna be stuff here"

func addFluid(fluidType, amount: float, charID = null):
	assert(orifice != null)
	orifice.addFluid(fluidType, amount, charID)

func isEmpty():
	assert(orifice != null)
	return orifice.isEmpty()

func getOrifice():
	return orifice

func clearFluids():
	assert(orifice != null)
	orifice.clear()

func processTime(_seconds: int):
	if(orifice == null):
		return
	orifice.processTime(_seconds)

func saveData():
	return {
		"orificeData": orifice.saveData(),
	}

func loadData(_data):
	orifice.loadData(SAVE.loadVar(_data, "orificeData", {}))
	
func safeWhenExposed():
	return false
