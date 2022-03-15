extends Bodypart
class_name BodypartHead

var orifice: Orifice = null

func _init():
	limbSlot = LimbTypes.Head
	orifice = Orifice.new()

func getSlot():
	return BodypartSlot.Head

func getCompatibleSpecies():
	return [Species.Any]

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

func saveData():
	return {
		"orificeData": orifice.saveData(),
	}

func loadData(_data):
	orifice.loadData(SAVE.loadVar(_data, "orificeData", {}))
	
