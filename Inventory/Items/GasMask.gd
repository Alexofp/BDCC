extends ItemBase

func _init():
	id = "GasMask"

func getVisibleName():
	return "Gas mask"
	
func getDescription():
	return "A mask that can filter air"

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
		return "takes off your gas mask"
	else:
		return "take off your gas mask"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your gas mask"
	else:
		return "put on your gas mask"

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"gasmask": "res://Inventory/RiggedModels/GasMask/GasMask.tscn",
	}

func getInventoryImage():
	return "res://Images/Items/equipment/gas-mask.png"
