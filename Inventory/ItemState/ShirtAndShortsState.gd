extends ItemState
class_name ShirtAndShortsState

var shortsPulledDown = false
var shirtOpened = false
var clothesDamaged = false
var halfDamage = false
var canActuallyBeDamaged = false
var superDamage = false

func getCasualName():
	return "uniform"

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
	data["halfDamage"] = halfDamage
	data["superDamage"] = superDamage

	return data
	
func loadData(_data):
	.loadData(_data)
	
	shortsPulledDown = SAVE.loadVar(_data, "shortsPulledDown", false)
	shirtOpened = SAVE.loadVar(_data, "shirtOpened", false)
	clothesDamaged = SAVE.loadVar(_data, "clothesDamaged", false)
	halfDamage = SAVE.loadVar(_data, "halfDamage", false)
	superDamage = SAVE.loadVar(_data, "superDamage", false)

func blocksInventorySlots():
	var result = []
	if(!shortsPulledDown && !clothesDamaged):
		result.append(InventorySlot.UnderwearBottom)
	if(!shirtOpened && !clothesDamaged):
		result.append(InventorySlot.UnderwearTop)
	return result

func coversBodyparts():
	if(isRemoved()):
		return {}
	
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
	return !superDamage && canActuallyBeDamaged && !isRemoved()

func isDamaged():
	return clothesDamaged

func isHalfDamaged():
	return halfDamage# || clothesDamaged

func isSuperDamaged():
	return superDamage# || clothesDamaged

func receiveDamage():
	if(!halfDamage):
		halfDamage = true
		return [true, "The uniform's fabric got scratched and now has holes in a few places!"]
	elif(!clothesDamaged):
		clothesDamaged = true
		return [true, "Pieces of the uniform's fabric got ripped off, exposing privates!"]
	elif(!superDamage):
		superDamage = true
		return [true, "The uniform's fabric got scratched even further, forming huge gaping holes!"]
	
	return .receiveDamage()

func canRepair():
	return isDamaged() || halfDamage

func repairDamage():
	clothesDamaged = false
	halfDamage = false
	superDamage = false

func getDamageDescription():
	if(superDamage):
		return "Lots of gaping holes in the fabric, exposing privates"
	if(clothesDamaged):
		return "Pieces of fabric are ripped off, exposing privates"
	if(halfDamage):
		return "Fabric has holes in a few places"
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
