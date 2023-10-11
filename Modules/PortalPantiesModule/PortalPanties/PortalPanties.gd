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
		buff(Buff.ChastityPenisBuff),
		buff(Buff.ChastityVaginaBuff),
		buff(Buff.ChastityAnusBuff),
		]

func getPrice():
	return 20

func canSell():
	return false

func getTags():
	return [ItemTag.BDSMRestraint]

func isRestraint():
	return true

func isImportant():
	return true

func generateRestraintData():
	restraintData = load("res://Modules/PortalPantiesModule/PortalPanties/RestraintPortalPanties.gd").new()
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

func coversBodyparts():
	return {
		BodypartSlot.Vagina: true,
		BodypartSlot.Penis: true,
		BodypartSlot.Anus: true,
		}

func alwaysVisible():
	return true

func getInventoryImage():
	return "res://Images/Items/underwear/portalpanties.png"
