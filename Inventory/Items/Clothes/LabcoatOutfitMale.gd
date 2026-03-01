extends ItemBase

func _init():
	id = "LabcoatOutfitMale"

func getVisibleName():
	return "Labcoat"
	
func getDescription():
	return "A labcoat above some official clothes."

func getClothingSlot():
	return InventorySlot.Body

func getBuffs():
	return [
		]

func getTags():
	return [
		#ItemTag.NurseUniform,
		#ItemTag.Illegal,
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your labcoat and uniform"
	else:
		return "take off your labcoat and uniform"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your labcoat and uniform"
	else:
		return "put on your labcoat and uniform"

func generateItemState():
	itemState = ShirtAndShortsState.new()

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"clothing": "res://Inventory/RiggedModels/OfficialClothes/OfficialClothesLabcoat.tscn",
	}

func getHidesParts(_character):
	if(itemState.isRemoved()):
		return null
	var removed = {
		#BodypartSlot.Body: true,
		BodypartSlot.Legs: true,
		BodypartSlot.Arms: true,
		BodypartSlot.Breasts: true,
		"panties": true,
		"bra": true,
		"top": true,
	}
	if(!itemState.areShortsPulledDown() && !itemState.isDamaged()):
		removed[BodypartSlot.Penis] = true
	
	return removed
