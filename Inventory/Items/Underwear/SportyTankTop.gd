extends ItemBase

func _init():
	id = "sportyTankTop"
	clothesColor = Color(0.19, 0.19, 0.19)

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
	itemState.canActuallyBeDamaged = true

func getRiggedParts(_character):
	if(itemState.isRemoved() || itemState.isBraPulledUp()):
		return null
	if(itemState.isDamaged()):
		return {
			"top": "res://Inventory/RiggedModels/Undershirt/UndershirtDamaged.tscn",
		}
	return {
		"top": "res://Inventory/RiggedModels/Undershirt/Undershirt.tscn",
	}

func getHidesParts(_character):
	if(itemState.isRemoved() || itemState.isBraPulledUp() || itemState.isDamaged()):
		return null
	return {
		BodypartSlot.Breasts: true,
	}

func getInventoryImage():
	return "res://Images/Items/underwear/tanktop.png"

func canDye():
	return true
