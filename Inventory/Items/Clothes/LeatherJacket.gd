extends ItemBase

func _init():
	id = "LeatherJacket"

func getVisibleName():
	return "Leather jacket"
	
func getDescription():
	return "A cool leather jacket and some black pants"

func getClothingSlot():
	return InventorySlot.Body

func getBuffs():
	return [
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your jacket and pulls down the pants"
	else:
		return "take off your jacket and pull down the pants"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your jacket and the pants"
	else:
		return "put on your jacket and the pants"

func generateItemState():
	itemState = ShirtAndShortsState.new()

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"clothing": "res://Inventory/RiggedModels/LeatherJacket/LeatherJacket.tscn",
	}

func getHidesParts(_character):
	if(itemState.isRemoved()):
		return null
	var removed = {
		BodypartSlot.Body: true,
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

#func updateDoll(doll: Doll3D):
#	doll.setState("armalpha", "hidearms")
