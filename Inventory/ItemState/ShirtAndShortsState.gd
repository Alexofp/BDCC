extends ItemState
class_name ShirtAndShortsState

var shortsPulledDown = false
var shirtOpened = false
var clothesDamaged = false

func areShortsPulledDown():
	return shortsPulledDown

func pullDownShorts():
	shortsPulledDown = true
	updateWearerAppearance()

func isShirtOpened():
	return shirtOpened

func openShirt():
	shirtOpened = true
	updateWearerAppearance()

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
	data["clothesDamaged"] = clothesDamaged

	return data
	
func loadData(_data):
	.loadData(_data)
	
	shortsPulledDown = SAVE.loadVar(_data, "shortsPulledDown", false)
	shirtOpened = SAVE.loadVar(_data, "shirtOpened", false)
	clothesDamaged = SAVE.loadVar(_data, "clothesDamaged", false)

func blocksInventorySlots():
	var result = []
	if(!shortsPulledDown && !clothesDamaged):
		result.append(InventorySlot.UnderwearBottom)
	if(!shirtOpened && !clothesDamaged):
		result.append(InventorySlot.UnderwearTop)
	return result

func coversBodyparts():
	var result = {}
	result[BodypartSlot.Body] = true
	if(!shortsPulledDown && !clothesDamaged):
		result[BodypartSlot.Vagina] = true
		result[BodypartSlot.Penis] = true
		result[BodypartSlot.Anus] = true
	if(!shirtOpened && !clothesDamaged):
		result[BodypartSlot.Breasts] = true
	
	return result

func getStateText():
	var text = ""
	if(shirtOpened):
		text += "Shirt is opened. "
	if(shortsPulledDown):
		text += "Shorts are pulled down. "
	return text

func canDamage():
	return !clothesDamaged

func isDamaged():
	return clothesDamaged

func receiveDamage():
	clothesDamaged = true

func repairDamage():
	clothesDamaged = false

func getDamageDescription():
	if(clothesDamaged):
		return "Pieces of fabric are ripped off, exposing privates"
	return ""

func getHidesParts(_character):
	if(isRemoved()):
		return null
	if(areShortsPulledDown()):
		return null
	if(isDamaged()):
		return null
	return {
		BodypartSlot.Penis: true,
	}
