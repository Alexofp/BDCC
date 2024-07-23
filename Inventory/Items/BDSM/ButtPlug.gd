extends ItemBase

func _init():
	id = "buttplug"

func getVisibleName():
	return "Buttplug"
	
func getDescription():
	return "A classic plug made out of black silicon, this one is of a normal size"

func getClothingSlot():
	return InventorySlot.Anal

func getRequiredBodypart():
	return BodypartSlot.Anus

func getBuffs():
	return [
		buff(Buff.AmbientLustBuff, [10]),
		buff(Buff.MinLoosenessAnusBuff, [2.0]),
		buff(Buff.BlocksAnusLeakingBuff),
		]

func getPrice():
	return 6

func getSellPrice():
	return 1

func canSell():
	return true

func getTags():
	return [ItemTag.CanBeForcedByGuards, ItemTag.CanBeForcedInStocks]#[ItemTag.BDSMRestraint]

func isRestraint():
	return true

func generateRestraintData():
	restraintData = RestraintButtplug.new()
	restraintData.setLevel(calculateBestRestraintLevel())

func getTakingOffStringLong(withS):
	if(withS):
		return "pulls the buttplug out from your butt"
	else:
		return "pull the buttplug out from your butt"

func getPuttingOnStringLong(withS):
	if(withS):
		return "inserts the buttplug into your butt"
	else:
		return "insert the buttplug into your butt"

func getForcedOnMessage(isPlayer = true):
	if(isPlayer):
		return getAStackNameCapitalize()+" was stuffed into your "+RNG.pick(["anus", "rear hole", "rear", "butt", "tailhole"])+". It shifts around while you move!"
	else:
		return getAStackNameCapitalize()+" was stuffed into {receiver.nameS} "+RNG.pick(["anus", "rear hole", "rear", "butt", "tailhole"])+". It shifts around while {receiver.he} {receiver.verbS('move')}!"

func getInventoryImage():
	return "res://Images/Items/bdsm/anal-plug.png"
