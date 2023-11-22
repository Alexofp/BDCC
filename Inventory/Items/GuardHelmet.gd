extends ItemBase

func _init():
	id = "GuardHelmet"

func getVisibleName():
	return "Guard helmet"
	
func getDescription():
	return "An armored helmet"

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
		return "takes off your helmet"
	else:
		return "take off your helmet"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your helmet"
	else:
		return "put on your helmet"

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"helmet": "res://Inventory/RiggedModels/GuardHelmet/GuardHelmet.tscn",
	}

func getHidesParts(_character):
	if(itemState.isRemoved()):
		return null
	var removed = {
		BodypartSlot.Hair: true,
		BodypartSlot.Head: true,
		BodypartSlot.Ears: true,
		BodypartSlot.Horns: true,
	}
	
	return removed

func getInventoryImage():
	return "res://Images/Items/equipment/guardhelmet.png"
