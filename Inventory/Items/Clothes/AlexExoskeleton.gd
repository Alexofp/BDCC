extends ItemBase

func _init():
	id = "AlexExoskeleton"

func getVisibleName():
	return "Exoskeleton"
	
func getDescription():
	return "Helps you move and fight"

func getClothingSlot():
	return InventorySlot.Torso

func getBuffs():
	return [
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your exoskeleton"
	else:
		return "take off your exoskeleton"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your exoskeleton"
	else:
		return "put on your exoskeleton"

#func generateItemState():
#	itemState = ShirtAndShortsState.new()

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"suit": "res://Inventory/RiggedModels/Exoskeleton/ExoSkeleton.tscn",
	}
