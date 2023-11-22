extends ItemBase

func _init():
	id = "plainBra"

func getVisibleName():
	return "Bra"
	
func getDescription():
	var text = "Generic bra made out of a cheap but stretchy material."

	return text

func getClothingSlot():
	return InventorySlot.UnderwearTop

func getBuffs():
	return [
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "unbuttons your bra and takes it off"
	else:
		return "unbutton your bra and take it off"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on the bra"
	else:
		return "put on the bra"

func getPrice():
	return 1

func getTags():
	return [
		ItemTag.SoldByUnderwearVendomat,
		]

func generateItemState():
	itemState = BraState.new()

func getRiggedParts(_character):
	if(itemState.isRemoved() || itemState.isBraPulledUp()):
		return null
	return {
		"bra": "res://Inventory/RiggedModels/Bra/PinkBra.tscn",
	}

func getInventoryImage():
	return "res://Images/Items/underwear/pinkbra.png"
