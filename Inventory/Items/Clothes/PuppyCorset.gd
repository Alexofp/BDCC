extends ItemBase

func _init():
	id = "PuppyCorset"

func getVisibleName():
	return "Corset"
	
func getDescription():
	return "A tight shiny corset that doesn't hide anything"

func getClothingSlot():
	return InventorySlot.Torso

func getBuffs():
	return [
		buff(Buff.PregnantBellySizeModifierBuff, [-50.0])
		]

func getTags():
	return [
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your corset"
	else:
		return "take off your corset"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your corset"
	else:
		return "put on your corset"

func getRiggedParts(_character):
	if(itemState != null && itemState.isRemoved()):
		return null
	return {
		"corset": "res://Inventory/RiggedModels/PuppyCorset/PuppyCorset.tscn",
	}

#func coversBodyparts():
#	return {
#		BodypartSlot.Body: true,
#	}
