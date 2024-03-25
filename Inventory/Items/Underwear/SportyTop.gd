extends ItemBase

func _init():
	id = "sportyTop"
	clothesColor = Color(0.19, 0.19, 0.19)

func getVisibleName():
	return "Sporty Top"
	
func getDescription():
	var text = "A cotton top designed to give breasts support during exercises."

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
		return "takes off your sporty top"
	else:
		return "take off your sporty top"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on the sporty top"
	else:
		return "put on the sporty top"

func getPrice():
	return 5

func getTags():
	return [
		ItemTag.SoldByUnderwearVendomat,
		]

func generateItemState():
	itemState = BraState.new()
	itemState.casualName = "top"
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
	return "res://Images/Items/underwear/sport-bra.png"

func canDye():
	return true
