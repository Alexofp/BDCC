extends ItemBase

func _init():
	id = "plainBriefs"

func getVisibleName():
	return "Briefs"
	
func getDescription():
	var text = "Boring but otherwise quite comfy briefs."

	return text

func getClothingSlot():
	return InventorySlot.UnderwearBottom

func getBuffs():
	return [
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "slips down your briefs"
	else:
		return "slip down your briefs"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on the briefs"
	else:
		return "put on the briefs"

func getPrice():
	return 1

func getTags():
	return [
		ItemTag.SoldByUnderwearVendomat,
		]

func generateItemState():
	itemState = PantiesState.new()
	itemState.canShiftAside = false
	itemState.casualName = "briefs"

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"panties": "res://Inventory/RiggedModels/Briefs/Briefs.tscn",
	}

func getInventoryImage():
	return "res://Images/Items/underwear/boxers.png"
