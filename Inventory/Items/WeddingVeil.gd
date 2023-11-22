extends ItemBase

func _init():
	id = "WeddingVeil"

func getVisibleName():
	return "Wedding veil"
	
func getDescription():
	return "A fancy veil that you wear during weddings"

func getClothingSlot():
	return InventorySlot.Eyes

func getBuffs():
	return [
		]

func getTags():
	return [
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your veil"
	else:
		return "take off your veil"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your veil"
	else:
		return "put on your veil"

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"veil": "res://Inventory/RiggedModels/WeddingVeil/WeddingVeil.tscn",
	}

func getInventoryImage():
	return "res://Images/Items/equipment/veil.png"
