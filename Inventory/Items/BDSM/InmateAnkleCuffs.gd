extends ItemBase

func _init():
	id = "inmateanklecuffs"

func getVisibleName():
	return "Iron ankle Cuffs"
	
func getDescription():
	return "Bulky metal restraints. Can be locked to bind legs together"

func getClothingSlot():
	return InventorySlot.Ankles

func getBuffs():
	return [
		buff(Buff.RestrainedLegsBuff),
		]

func getTakeOffScene():
	return "CuffTuggingScene"

func getTags():
	return [ItemTag.BDSMRestraint, ItemTag.CanBeForcedByGuards, ItemTag.CanBeForcedInStocks]

func isRestraint():
	return true

func generateRestraintData():
	restraintData = RestraintLegCuffs.new()
	restraintData.setLevel(calculateBestRestraintLevel())

func getForcedOnMessage(isPlayer = true):
	if(isPlayer):
		return getAStackNameCapitalize()+" were forced onto your legs, they are connected by a chain, forcing you to waddle or hop around!"
	else:
		return getAStackNameCapitalize()+" were forced onto {receiver.nameS} legs, they are connected by a chain, forcing {receiver.him} to waddle or hop around!"

func getUnriggedParts(_character):
	return {
		"ankle.L": ["res://Inventory/UnriggedModels/Cuff/CuffModel.tscn"],
		"ankle.R": ["res://Inventory/UnriggedModels/Cuff/CuffModel.tscn"],
	}

func updateDoll(doll: Doll3D):
	doll.setLegsCuffed(true)

func getChains():
	# Extra chains if we're wearing matching wrist cuffs
	if(isWornByWearer()):
		if(getWearer().getInventory().hasItemIDEquipped("inmatewristcuffs")):
			return [["short", "ankle.L", "ankle.R"], ["short", "wrist.R", "ankle.R"], ["short", "wrist.L", "ankle.L"]]
	
	return [["short", "ankle.L", "ankle.R"]]
