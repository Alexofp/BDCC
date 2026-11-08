extends ItemBase

func _init():
	id = "ChastityCagePortal"

func getVisibleName():
	return "Portal Cage"
	
func getDescription():
	return "Sends your erection straight into the bluespace!"

func getClothingSlot():
	return InventorySlot.Penis

func getRequiredBodypart():
	return BodypartSlot.Penis

func getBuffs():
	return [
		buff(Buff.ChastityPenisBuff),
		buff(Buff.SensitivityGainBuff, [25.0]),
		]

func getTakeOffScene():
	return "RestraintTakeOffNopeScene"

func getPrice():
	return 20

func canSell():
	return true

func getTags():
	if(GM.main != null && GM.main.SCI != null && GM.main.SCI.hasUpgrade("advStrapon")):
		return [
			ItemTag.BDSMRestraint, ItemTag.ChastityCage, ItemTag.PortalCage,
			ItemTag.SoldByMedicalVendomat,
			]
	return [ItemTag.BDSMRestraint, ItemTag.ChastityCage, ItemTag.PortalCage]

func isRestraint():
	return true

func generateRestraintData():
	restraintData = RestraintChastityCage.new()
	restraintData.setLevel(5)
	
func getForcedOnMessage(isPlayer = true):
	if(isPlayer):
		return getAStackNameCapitalize()+" was locked onto your penis, making it useless!"
	else:
		return getAStackNameCapitalize()+" was locked onto {receiver.nameS} penis, making it useless!"

func getRiggedParts(_character):
	return {
		"chastity_cage": "res://Inventory/RiggedModels/FlatCage/PortalCage.tscn",
	}

func getHidesParts(_character):
	return {
		BodypartSlot.Penis: true,
	}

func shouldBeVisibleOnDoll(_character, _doll):
	if(!_character.isBodypartCovered(BodypartSlot.Penis) || _doll.isForcedExposed(BodypartSlot.Penis)):
		return true
	return false

func isImportant():
	return true

func getInventoryImage():
	return "res://Images/Items/bdsm/flatcage.png"
