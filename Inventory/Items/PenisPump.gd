extends ItemBase

func _init():
	id = "PenisPump"

func getVisibleName():
	return "Penis Pump"
	
func getDescription():
	return "A tool that can extract seed."

func getClothingSlot():
	return InventorySlot.Penis

func getBuffs():
	return [
		buff(Buff.ChastityPenisBuff),
		]

func getPrice():
	return 10

func canSell():
	return true

func getTags():
	return [ItemTag.SoldByMedicalVendomat, ItemTag.PenisPump, ItemTag.PenisPumpUsableByNPC]

func generateFluids():
	fluids = Fluids.new()
	fluids.setCapacity(1000.0)
	#fluids.addFluid("Milk", 250.0)
	#var _ok = fluids.connect("contentsChanged", self, "updatePcIfNeeded")

func getPossibleActions():
	return [
		{
			"name": "Milk self",
			"scene": "PenisPumpMilkingScene",
			"description": "Use the penis pump",
		},
		{
			"name": "Transfer fluids",
			"scene": "FluidTransferScene",
			"description": "Transfer the fluids between fluid containers",
		},
		{
			"name": "Drink from",
			"scene": "DrinkFromScene",
			"description": "Swallow the contents of this item",
		},
	]

func isAdvancedPenisPump():
	return false

func getNormalPenisPumpScene():
	return "res://Inventory/RiggedModels/PenisPump/PenisPump.tscn"

func getBigPenisPumpScene():
	return "res://Inventory/RiggedModels/PenisPump/BigPenisPump.tscn"

func getRiggedParts(_character):
	var normalScene = {"chastity_cage": getNormalPenisPumpScene(),}
	var bigScene = {"chastity_cage": getBigPenisPumpScene(),}
	
	if(!isWornByWearer()):
		return normalScene
	
	var wearer = getWearer()
	if(!wearer.hasBodypart(BodypartSlot.Penis)):
		return normalScene
	
	var penis = wearer.getBodypart(BodypartSlot.Penis)
	if(penis.has_method("getCustomPumpScene")):
		var customScene = penis.getCustomPumpScene(isAdvancedPenisPump())
		if(customScene != null):
			return {"chastity_cage": customScene}
	
	if(!penis.has_method("shouldUseBigPump")):
		return normalScene
	
	if(penis.shouldUseBigPump()):
		return bigScene
	return normalScene

func getHidesParts(_character):
	return {
	}

func shouldBeVisibleOnDoll(_character, _doll):
	if(!_character.isBodypartCovered(BodypartSlot.Penis) || _doll.isForcedExposed(BodypartSlot.Penis)):
		return true
	return false

func updateDoll(doll: Doll3D):
	doll.setState("cock", "hard")

func getInventoryImage():
	return "res://Images/Items/breastpump/penisPump.png"

func alwaysRecoveredAfterSex():
	return true
