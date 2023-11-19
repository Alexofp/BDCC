extends ItemBase

func _init():
	id = "HypnovisorDisabled"

func getVisibleName():
	return "Stylish Visor"
	
func getDescription():
	return "Just some fancy goggles"

func getClothingSlot():
	return InventorySlot.Eyes

func getBuffs():
	return [
		]

func getPrice():
	return 10

func canSell():
	return true

func getTags():
	return []

func getForcedOnMessage(isPlayer = true):
	if(isPlayer):
		return getAStackNameCapitalize()+" was forced over your eyes."
	else:
		return getAStackNameCapitalize()+" was forced over {receiver.nameS} eyes!"

func getUnriggedParts(_character):
	return {
		"blindfold": ["res://Inventory/UnriggedModels/HypnoVisor/HypnoVisorDisabled.tscn"],
	}

func getInventoryImage():
	return "res://Images/Items/bdsm/hypnovisor.png"
