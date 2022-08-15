extends ItemState
class_name ShirtAndShortsState

var shortsPulledDown = false
var shirtOpened = false

func areShortsPulledDown():
	return shortsPulledDown

func pullDownShorts():
	shortsPulledDown = true
	updateWearerAppearance()

func isShirtOpened():
	return shirtOpened

func openShirt():
	shirtOpened = true

func getActions():
	return [
		"UniformExposeChest",
		"UniformExposeCrotch",
		"UniformShakeShortsOff",
	]

func resetState():
	.resetState()
	shortsPulledDown = false
	shirtOpened = false

func saveData():
	var data = .saveData()
	
	data["shortsPulledDown"] = shortsPulledDown
	data["shirtOpened"] = shirtOpened

	return data
	
func loadData(_data):
	.loadData(_data)
	
	shortsPulledDown = SAVE.loadVar(_data, "shortsPulledDown", false)
	shirtOpened = SAVE.loadVar(_data, "shirtOpened", false)

func blocksInventorySlots():
	var result = []
	if(!shortsPulledDown):
		result.append(InventorySlot.UnderwearBottom)
	if(!shirtOpened):
		result.append(InventorySlot.UnderwearTop)
	return result

func coversBodyparts():
	var result = {}
	if(!shortsPulledDown):
		result[BodypartSlot.Vagina] = true
		result[BodypartSlot.Penis] = true
		result[BodypartSlot.Anus] = true
	if(!shirtOpened):
		result[BodypartSlot.Breasts] = true
	
	return result

func getStateText():
	var text = ""
	if(shirtOpened):
		text += "Shirt is opened. "
	if(shortsPulledDown):
		text += "Shorts are pulled down. "
	return text
