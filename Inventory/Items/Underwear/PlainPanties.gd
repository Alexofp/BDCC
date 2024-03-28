extends ItemBase

func _init():
	id = "plainPanties"
	clothesColor = Color(1.0, 0.53, 0.73)

func getVisibleName():
	return "Panties"
	
func getDescription():
	var text = "The most plain type of panties you can get but they get the job done."

	return text

func getClothingSlot():
	return InventorySlot.UnderwearBottom

func getBuffs():
	return [
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "slips down your panties"
	else:
		return "slip down your panties"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on the panties"
	else:
		return "put on the panties"


func getPrice():
	return 1

func getTags():
	return [
		ItemTag.SoldByUnderwearVendomat,
		]

func generateItemState():
	itemState = PantiesState.new()
	itemState.canActuallyBeDamaged = true

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	if(itemState.isDamaged()):
		return {
			"panties": "res://Inventory/RiggedModels/Panties/PantiesDamaged.tscn",
		}
	return {
		"panties": "res://Inventory/RiggedModels/Panties/Panties.tscn",
	}

func getInventoryImage():
	return "res://Images/Items/underwear/pinkpanties.png"
	
func canDye():
	return true
