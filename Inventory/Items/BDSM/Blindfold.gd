extends ItemBase

func _init():
	id = "blindfold"

func getVisibleName():
	return "Blindfold"
	
func getDescription():
	return "A simple piece of cloth"

func getClothingSlot():
	return InventorySlot.Eyes

func getBuffs():
	return [
		buff(Buff.BlindfoldBuff),
		]

func getPrice():
	return 2

func getSellPrice():
	return 1

func canSell():
	return true

func getTags():
	return [ItemTag.BDSMRestraint, ItemTag.CanBeForcedByGuards, ItemTag.CanBeForcedInStocks]

func isRestraint():
	return true

func generateRestraintData():
	restraintData = RestraintBlindfold.new()
	restraintData.setLevel(RNG.randi_range(1, 2))
	
func getForcedOnMessage(isPlayer = true):
	if(isPlayer):
		return getAStackNameCapitalize()+" was forced over your eyes. You are blind!"
	else:
		return getAStackNameCapitalize()+" was forced over {receiver.nameS} eyes! {receiver.He} {receiver.is} blind!"

func getUnriggedParts(_character):
	return {
		"blindfold": ["res://Inventory/UnriggedModels/Blindfold/BlindfoldModel.tscn"],
	}

func getInventoryImage():
	return "res://Images/Items/bdsm/blindfold.png"
