extends ItemBase

func _init():
	id = "sportyTankTop"

func getVisibleName():
	return "Sporty Tank Top"
	
func getDescription():
	var text = "A cotton tank top, perfect to wear during exercises."

	return text

func getClothingSlot():
	return InventorySlot.UnderwearTop

func getBuffs():
	return [
		buff(Buff.PhysicalArmorBuff, [5]),
		buff(Buff.StatBuff, [Stat.Agility, 2]),
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your sporty tank top"
	else:
		return "take off your sporty tank top"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on the sporty tank top"
	else:
		return "put on the sporty tank top"

func getPrice():
	return 5

func getTags():
	return [
		ItemTag.SoldByUnderwearVendomat,
		]

func generateItemState():
	itemState = BraState.new()
	itemState.casualName = "tanktop"

func getRiggedParts(_character):
	if(itemState.isRemoved() || itemState.isBraPulledUp()):
		return null
	return {
		"top": "res://Inventory/RiggedModels/Undershirt/Undershirt.tscn",
	}

func getInventoryImage():
	return "res://Images/Items/underwear/tanktop.png"
