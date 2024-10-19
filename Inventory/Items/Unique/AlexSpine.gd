extends ItemBase

func _init():
	id = "AlexSpine"

func getVisibleName():
	return "Exospine"
	
func getDescription():
	return "Spine prosthetic that plugs directly into your nervous system"

func getClothingSlot():
	return InventorySlot.Unique

func getBuffs():
	return [
		]

#func generateItemState():
#	itemState = ShirtAndShortsState.new()

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"spine": "res://Inventory/RiggedModels/AlexSpine/AlexSpine.tscn",
	}

func canDye():
	return true
