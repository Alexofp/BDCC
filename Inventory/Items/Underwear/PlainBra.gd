extends ItemBase

func _init():
	id = "plainBra"
	clothesColor = Color(1.0, 0.53, 0.73)

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
	itemState.canActuallyBeDamaged = true

func getInventoryImage():
	return "res://Images/Items/underwear/pinkbra.png"

func getRiggedParts(_character):
	if(itemState.isRemoved() || itemState.isBraPulledUp()):
		return null
	if(itemState.isDamaged()):
		return {
			"bra": "res://Inventory/RiggedModels/Bra/BraDamaged.tscn",
		}
	return {
		"bra": "res://Inventory/RiggedModels/Bra/Bra.tscn",
	}

func canDye():
	return true
