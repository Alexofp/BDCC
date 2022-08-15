extends ItemBase

func _init():
	id = "LaceBra"

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
		buff(Buff.LustDamageBuff, [15]),
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
