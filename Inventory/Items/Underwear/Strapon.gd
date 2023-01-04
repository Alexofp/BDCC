extends ItemBase

func _init():
	id = "Strapon"

func getVisibleName():
	return "Strapon"
	
func getDescription():
	var text = "A strapon"

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
		ItemTag.Strapon,
		]

#func generateItemState():
#	itemState = PantiesState.new()

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"panties": "res://Inventory/RiggedModels/Strapons/HumancockStrapon.tscn",
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

func getStraponLength():
	return 20.0

func getStraponPleasureForDom():
	return 0.1

func onSexEnd():
	destroyMe()

func getPutOnScene():
	return "StraponPutOnScene"
