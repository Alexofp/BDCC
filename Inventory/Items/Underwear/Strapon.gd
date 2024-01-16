extends ItemBase

func _init():
	id = "Strapon"

func getVisibleName():
	return "Strapon"
	
func getDescription():
	var text = "A strapon that can be used during sex. Can wear it only if you don't have a dick already"

	return text

func getClothingSlot():
	return InventorySlot.Strapon

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
	return 10

func getTags():
	return [
		ItemTag.Strapon,
		ItemTag.SoldByTheAnnouncer,
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
		"chastity_cage": true,
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

func getCasualName():
	return "strapon"

func generateFluids():
	fluids = Fluids.new()
	fluids.setCapacity(500.0)

func getPossibleActions():
	return [
		{
			"name": "Transfer fluids",
			"scene": "FluidTransferScene",
			"description": "Transfer the fluids between fluid containers",
		},
	]

func getInventoryImage():
	return "res://Images/Items/strapons/human.png"

func alwaysRecoveredAfterSex():
	return true
