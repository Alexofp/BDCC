extends ItemBase

func _init():
	id = "SocketArmor"

func getVisibleName():
	return "Socket's Armor"
	
func getDescription():
	return "Armor that doesn't really protect you.. weird, huh.."

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
		return "takes off your armor"
	else:
		return "take off your armor"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your armor"
	else:
		return "put on your armor"

#func generateItemState():
#	itemState = ShirtAndShortsState.new()

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"clothing": "res://Inventory/RiggedModels/SocketArmor/SocketArmor.tscn",
	}

func getHidesParts(_character):
	if(itemState.isRemoved()):
		return null
	var removed = {
		BodypartSlot.Legs: true,
		BodypartSlot.Arms: true,
		#BodypartSlot.Body: true,
		#BodypartSlot.Breasts: true,
		#"panties": true,
		#"bra": true,
		#"top": true,
	}
	#if(!itemState.areShortsPulledDown() && !itemState.isDamaged()):
	#	removed[BodypartSlot.Penis] = true
	
	return removed

#func getInventoryImage():
#	return "res://Images/Items/equipment/guardarmor.png"
