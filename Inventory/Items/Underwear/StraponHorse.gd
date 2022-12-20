extends ItemBase

func _init():
	id = "StraponHorse"

func getVisibleName():
	return "Strapon (horse)"
	
func getDescription():
	var text = "A huge ass strapon"

	return text

func getClothingSlot():
	return InventorySlot.UnderwearBottom

func getBuffs():
	return [
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your strapon"
	else:
		return "take off your strapon"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on the strapon"
	else:
		return "put on the strapon"

func getPrice():
	return 20

func getTags():
	return [
		]

#func generateItemState():
#	itemState = PantiesState.new()

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"panties": "res://Inventory/RiggedModels/Strapons/HorsecockStrapon.tscn",
	}

func getHidesParts(_character):
	return {
		BodypartSlot.Penis: true,
	}

func shouldBeVisibleOnDoll(_character, _doll):
	if(!_character.isBodypartCovered(BodypartSlot.Penis) || _doll.isForcedExposed(BodypartSlot.Penis)):
		return true
	return false

func updateDoll(doll: Doll3D):
	doll.setPenisScale(1.0)
	doll.setBallsScale(1.0)
