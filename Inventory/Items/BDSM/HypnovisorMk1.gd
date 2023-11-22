extends ItemBase

func _init():
	id = "HypnovisorMk1"

func getVisibleName():
	return "Hypnovisor Mk1"
	
func getDescription():
	return "Special prototype goggles that are supposed to make you happy. What the heck is 'YOT'?"

func getClothingSlot():
	return InventorySlot.Eyes

func getBuffs():
	return [
		buff(Buff.AmbientLustBuff, [300]),
		]

func getPrice():
	return 60

func canSell():
	return true

func getTags():
	if(GM.main != null && GM.main.getFlag("AlexRynardModule.ch1HypnovisorHappened")):
		return [ItemTag.BDSMRestraint, ItemTag.Hypnovisor, ItemTag.SoldByAlexRynard]
	return [ItemTag.BDSMRestraint, ItemTag.Hypnovisor]

func isRestraint():
	return true

func generateRestraintData():
	restraintData = RestraintHypnovisor.new()
	restraintData.setLevel(5)
	
func getForcedOnMessage(isPlayer = true):
	if(isPlayer):
		return getAStackNameCapitalize()+" was forced over your eyes."
	else:
		return getAStackNameCapitalize()+" was forced over {receiver.nameS} eyes!"

func getUnriggedParts(_character):
	return {
		"blindfold": ["res://Inventory/UnriggedModels/HypnoVisor/HypnoVisor.tscn"],
	}

func getInventoryImage():
	return "res://Images/Items/bdsm/hypnovisor.png"

func getTakeOffScene():
	return "RestraintTakeOffNopeScene"
