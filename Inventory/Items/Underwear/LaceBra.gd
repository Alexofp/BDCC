extends ItemBase

func _init():
	id = "LaceBra"
	clothesColor = Color(0.19, 0.19, 0.19)

func getVisibleName():
	return "Lace bra"
	
func getDescription():
	var text = "Sexy-looking bra that will emphasize your breasts in just the right way"

	return text

func getClothingSlot():
	return InventorySlot.UnderwearTop

func getBuffs():
	return [
		buff(Buff.LustArmorBuff, [10]),
		buff(Buff.StatBuff, [Stat.Sexiness, 5]),
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your lace bra"
	else:
		return "take off your lace bra"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on the lace bra"
	else:
		return "put on the lace bra"

func getPrice():
	return 8

func getTags():
	return [
		ItemTag.SoldByUnderwearVendomat,
		]

func generateItemState():
	itemState = BraState.new()
	itemState.canActuallyBeDamaged = true

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

func getInventoryImage():
	return "res://Images/Items/underwear/lacebra.png"

func canDye():
	return true
