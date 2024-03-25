extends ItemBase

func _init():
	id = "sportyBriefs"
	clothesColor = Color(0.19, 0.19, 0.19)

func getVisibleName():
	return "Sporty briefs"
	
func getDescription():
	var text = "Cotton sporty briefs, perfect to wear during exercises."

	return text

func getClothingSlot():
	return InventorySlot.UnderwearBottom

func getBuffs():
	return [
		buff(Buff.PhysicalArmorBuff, [5]),
		buff(Buff.StatBuff, [Stat.Agility, 3]),
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
	return 5

func getTags():
	return [
		ItemTag.SoldByUnderwearVendomat,
		]

func generateItemState():
	itemState = PantiesState.new()
	itemState.canShiftAside = false
	itemState.casualName = "briefs"
	itemState.canActuallyBeDamaged = true

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	if(itemState.isDamaged()):
		return {
			"panties": "res://Inventory/RiggedModels/Briefs/BriefsDamaged.tscn",
		}
	return {
		"panties": "res://Inventory/RiggedModels/Briefs/Briefs.tscn",
	}

func getInventoryImage():
	return "res://Images/Items/underwear/boxers.png"

func canDye():
	return true
