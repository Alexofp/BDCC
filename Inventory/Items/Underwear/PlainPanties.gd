extends ItemBase

func _init():
	id = "plainPanties"

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

func coversBodyparts():
	if(itemState != null):
		return itemState.coversBodyparts()
	return [BodypartSlot.Vagina, BodypartSlot.Penis, BodypartSlot.Anus]

func generateItemState():
	itemState = PantiesState.new()
