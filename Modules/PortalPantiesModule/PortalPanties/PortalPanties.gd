extends ItemBase

var coversPenis = true
var unlocked = false

func _init():
	id = "PortalPanties"

func getVisibleName():
	return "Portal Panties"
	
func getDescription():
	var extraDesc = ""
	if(coversPenis):
		extraDesc = " Currently they [b]will[/b] also cover the penis."
	else:
		extraDesc = " Currently they will [b]NOT[/b] cover the penis."
	return "Panties with some hi-tec gear attached to them."+extraDesc

func getClothingSlot():
	return InventorySlot.UnderwearBottom

func getBuffs():
	if(!coversPenis):
		return [
			buff(Buff.ChastityVaginaBuff),
			buff(Buff.ChastityAnusBuff),
			buff(Buff.BlocksUrinationVaginaBuff),
			]
	return [
		buff(Buff.ChastityPenisBuff),
		buff(Buff.ChastityVaginaBuff),
		buff(Buff.ChastityAnusBuff),
		buff(Buff.BlocksUrinationPenisBuff),
		buff(Buff.BlocksUrinationVaginaBuff),
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
	if(unlocked):
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
	if(unlocked):
		return false
	return true

func getInventoryImage():
	return "res://Images/Items/underwear/portalpanties.png"

func saveData():
	var data = .saveData()
	
	data["coversPenis"] = coversPenis
	data["unlocked"] = unlocked
	
	return data
	
func loadData(data):
	.loadData(data)
	
	coversPenis = SAVE.loadVar(data, "coversPenis", true)
	unlocked = SAVE.loadVar(data, "unlocked", false)
