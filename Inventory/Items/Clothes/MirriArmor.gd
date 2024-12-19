extends ItemBase

func _init():
	id = "MirriArmor"

func getVisibleName():
	return "Mirri's Armor"
	
func getDescription():
	return "Skimpy variant of the guard armor that is missing quite a few pieces.."

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
		"clothing": "res://Inventory/RiggedModels/MirriArmor/MirriArmor.tscn",
	}

func getHidesParts(_character):
	if(itemState.isRemoved()):
		return null
	var removed = {
		BodypartSlot.Legs: true,
		BodypartSlot.Arms: true,
		#BodypartSlot.Body: true,
		BodypartSlot.Breasts: true,
		#"panties": true,
		"bra": true,
		"top": true,
	}
	#if(!itemState.areShortsPulledDown() && !itemState.isDamaged()):
	#	removed[BodypartSlot.Penis] = true
	
	return removed

#func getInventoryImage():
#	return "res://Images/Items/equipment/guardarmor.png"

func coversBodyparts():
	return {
		BodypartSlot.Body: true,
		BodypartSlot.Breasts: true,
		}
