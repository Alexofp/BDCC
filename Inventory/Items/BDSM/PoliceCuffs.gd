extends ItemBase

func _init():
	id = "policecuffs"

func getVisibleName():
	return "Police cuffs"
	
func getDescription():
	return "Pretty standart police cuffs that go on your wrists"

func getClothingSlot():
	return InventorySlot.Wrists

func getBuffs():
	return [
		buff(Buff.RestrainedArmsBuff),
		]

func getTakeOffScene():
	return "CuffTuggingScene"

func getPrice():
	return 0

func canSell():
	return true
	
func getTags():
	return [ItemTag.BDSMRestraint]

func isRestraint():
	return true

func generateRestraintData():
	restraintData = RestraintHandCuffs.new()
	restraintData.setLevel(calculateBestRestraintLevel())

func getForcedOnMessage(isPlayer = true):
	if(isPlayer):
		return getAStackNameCapitalize()+" were locked onto your arms, chaining them together"
	else:
		return getAStackNameCapitalize()+" were locked onto {receiver.nameS} arms, chaining them together"

func getUnriggedParts(_character):
	return {
		"wrist.L": ["res://Inventory/UnriggedModels/Cuff/CuffModel.tscn"],
		"wrist.R": ["res://Inventory/UnriggedModels/Cuff/CuffModel.tscn"],
	}

func updateDoll(doll: Doll3D):
	doll.setArmsCuffed(true)

func getInventoryImage():
	return "res://Images/Items/bdsm/cuff.png"
