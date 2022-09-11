extends ItemBase

func _init():
	id = "PortalPanties"

func getVisibleName():
	return "Portal Panties"
	
func getDescription():
	return "Panties with some hi-tec gear attached to them"

func getClothingSlot():
	return InventorySlot.UnderwearBottom

func getBuffs():
	return [
		]

func getPrice():
	return 20

func canSell():
	return false

func getTags():
	return [ItemTag.BDSMRestraint]

func isRestraint():
	return true

func generateRestraintData():
	restraintData = RestraintUnremovable.new()
	restraintData.setLevel(calculateBestRestraintLevel())

func getTakingOffStringLong(withS):
	if(withS):
		return "temporary disables and slips down your panties"
	else:
		return "temporary disable and slip down your panties"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on the panties"
	else:
		return "put on the panties"

func getRiggedParts(_character):
	return {
		"panties": "res://Modules/PortalPantiesModule/PortalPanties/RiggedModel/PortalPanties.tscn",
	}

func getHidesParts(_character):
	return {
		BodypartSlot.Penis: true,
	}

func getTakeOffScene():
	return "PortalPantiesTakeOffScene"
