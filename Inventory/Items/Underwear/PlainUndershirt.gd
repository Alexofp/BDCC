extends ItemBase

func _init():
	id = "plainUndershirt"

func getVisibleName():
	return "Undershirt"
	
func getDescription():
	var text = "Sleeveless shirt that covers your chest."

	return text

func getClothingSlot():
	return InventorySlot.UnderwearTop

func getBuffs():
	return [
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your undershirt"
	else:
		return "take off your undershirt"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on the undershirt"
	else:
		return "put on the undershirt"

func getPrice():
	return 1

func getTags():
	return [
		ItemTag.SoldByUnderwearVendomat,
		]

func coversBodyparts():
	if(itemState != null):
		return itemState.coversBodyparts()
	return [BodypartSlot.Breasts]

func generateItemState():
	itemState = BraState.new()
	itemState.casualName = "undershirt"
