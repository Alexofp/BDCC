extends Bodypart
class_name BodypartVagina

var orifice: Orifice = null

func _init():
	limbSlot = null
	orifice = Orifice.new()

func getSlot():
	return BodypartSlot.Vagina

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

func isStuffed():
	return !isEmpty()

func getOrifice():
	return orifice

func clearFluids():
	assert(orifice != null)
	orifice.clear()

func processTime(_seconds: int):
	if(orifice == null):
		return
	orifice.processTime(_seconds)

func hoursPassed(_howmuch):
	if(orifice == null):
		return
	orifice.hoursPassed(_howmuch)

func handleInsertion(size: float):
	if(orifice == null):
		return
	orifice.handleInsertion(size)

func getOrificeName():
	return "pussy"

func saveData():
	return {
		"orificeData": orifice.saveData(),
	}

func loadData(_data):
	orifice.loadData(SAVE.loadVar(_data, "orificeData", {}))
	
func safeWhenExposed():
	return false
