extends ItemState
class_name ShirtAndShortsState

var shortsPulledDown = false
var shirtOpened = false

func areShortsPulledDown():
	return shortsPulledDown

func pullDownShorts():
	shortsPulledDown = true

func isShirtOpened():
	return shirtOpened

func openShirt():
	shirtOpened = true

func getActions():
	return [
		"UniformExposeChest",
		"UniformExposeCrotch",
	]

func resetState():
	shortsPulledDown = false
	shirtOpened = false

func saveData():
	var data = {}
	
	data["shortsPulledDown"] = shortsPulledDown
	data["shirtOpened"] = shirtOpened

	return data
	
func loadData(_data):
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
	var result = [BodypartSlot.Body]
	if(!shortsPulledDown):
		result.append(BodypartSlot.Vagina)
		result.append(BodypartSlot.Penis)
		result.append(BodypartSlot.Anus)
	if(!shirtOpened):
		result.append(BodypartSlot.Breasts)
	
	return result

func getStateText():
	var text = ""
	if(shirtOpened):
		text += "Shirt is opened. "
	if(shortsPulledDown):
		text += "Shorts are pulled down. "
	return text
