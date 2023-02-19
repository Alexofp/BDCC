extends ItemBase

func _init():
	id = "LatexSuit"

func getVisibleName():
	return "Latex suit"
	
func getDescription():
	return "A very shiny catsuit"

func getClothingSlot():
	return InventorySlot.Body

func getBuffs():
	return [
		]

func getTags():
	return [
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your latex suit"
	else:
		return "take off your latex suit"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your latex suit"
	else:
		return "put on your latex suit"

func generateItemState():
	itemState = ShirtAndShortsState.new()

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"clothing": "res://Inventory/RiggedModels/LatexSuit/LatexSuit.tscn",
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
