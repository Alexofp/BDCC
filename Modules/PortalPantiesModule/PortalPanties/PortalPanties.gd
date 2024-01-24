extends ItemBase

var coversPenis = true

func _init():
	id = "PortalPanties"

func getVisibleName():
	return "Portal Panties"
	
func getDescription():
	var extraDesc = ""
	if(coversPenis):
		extraDesc = " Currently they will also cover the penis."
	else:
		extraDesc = " Currently they will Not cover the penis."
	return "Panties with some hi-tec gear attached to them."+extraDesc

func getClothingSlot():
	return InventorySlot.UnderwearBottom

func getBuffs():
	if(!coversPenis):
		return [
			buff(Buff.ChastityVaginaBuff),
			buff(Buff.ChastityAnusBuff),
			]
	return [
		buff(Buff.ChastityPenisBuff),
		buff(Buff.ChastityVaginaBuff),
		buff(Buff.ChastityAnusBuff),
		]

func getPrice():
	return 30

func getSellPrice():
	return 30

func canSell():
	return true

func getTags():
	if(GM.main != null && (GM.main.getFlag("PortalPantiesModule.Panties_PcDenied") || GM.main.getFlag("PortalPantiesModule.Panties_FleshlightsReturnedToAlex"))):
		return [ItemTag.BDSMRestraint, ItemTag.SoldByAlexRynard, ItemTag.PortalPanties]
	return [ItemTag.BDSMRestraint, ItemTag.PortalPanties]

func isRestraint():
	return true

func isImportant():
	if(isWornByWearer()):
		var wearer = getWearer()
		# Static characters are always wearing 'unlocked' portal panties
		if(!wearer.isPlayer() && !wearer.isDynamicCharacter()):
			return false
	return true

func canForceOntoNpc():
	return true

func canForceOntoStaticNpc(): # Messes with the content of static npcs
	return false

func canBeEasilyRemovedByDom():
	return true

func generateRestraintData():
	restraintData = load("res://Modules/PortalPantiesModule/PortalPanties/RestraintPortalPanties.gd").new()
	restraintData.setLevel(10)

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
	if(!coversPenis):
		return {}
	return {
		BodypartSlot.Penis: true,
	}

func getTakeOffScene():
	return "PortalPantiesTakeOffScene"

func coversBodyparts():
	if(!coversPenis):
		return {
			BodypartSlot.Vagina: true,
			BodypartSlot.Anus: true,
			}
	return {
		BodypartSlot.Vagina: true,
		BodypartSlot.Penis: true,
		BodypartSlot.Anus: true,
		}

func alwaysVisible():
	if(isWornByWearer()):
		var wearer = getWearer()
		# Static characters are always wearing 'unlocked' portal panties
		if(!wearer.isPlayer() && !wearer.isDynamicCharacter()):
			return false
	return true

func getInventoryImage():
	return "res://Images/Items/underwear/portalpanties.png"

func saveData():
	var data = .saveData()
	
	data["coversPenis"] = coversPenis
	
	return data
	
func loadData(data):
	.loadData(data)
	
	coversPenis = SAVE.loadVar(data, "coversPenis", true)
