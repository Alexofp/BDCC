extends ItemBase

func _init():
	id = "AndroidSuit"

func getVisibleName():
	return "Android suit"
	
func getDescription():
	return "A cool sci-fi suit that you totally not supposed to have as a player"

func getClothingSlot():
	return InventorySlot.Body

func getBuffs():
	return [
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your suit"
	else:
		return "take off your suit"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your suit"
	else:
		return "put on your suit"

#func generateItemState():
#	itemState = ShirtAndShortsState.new()

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"clothing": "res://Inventory/RiggedModels/AndroidSuit/AndroidSuit.tscn",
	}

func canDye():
	return true
