extends ItemBase

func _init():
	id = "GuardArmor"

func getVisibleName():
	return "Guard armor"
	
func getDescription():
	return "A standard armor for guards"

func getClothingSlot():
	return InventorySlot.Body

func getBuffs():
	return [
		]

func getTags():
	return [
		ItemTag.GuardUniform,
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your armor"
	else:
		return "take off your armor"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your armor"
	else:
		return "put on your armor"

func generateItemState():
	itemState = ShirtAndShortsState.new()

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"clothing": "res://Inventory/RiggedModels/GuardClothes/GuardClothes.tscn",
	}

func getHidesParts(_character):
	if(itemState.isRemoved()):
		return null
	var removed = {
		BodypartSlot.Legs: true,
		BodypartSlot.Arms: true,
		BodypartSlot.Body: true,
		BodypartSlot.Breasts: true,
		"panties": true,
		"bra": true,
		"top": true,
	}
	if(!itemState.areShortsPulledDown() && !itemState.isDamaged()):
		removed[BodypartSlot.Penis] = true
	
	return removed

#func updateDoll(doll: Doll3D):
#	doll.setState("armalpha", "hidearms")

func getInventoryImage():
	return "res://Images/Items/equipment/guardarmor.png"
