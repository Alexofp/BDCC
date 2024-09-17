extends SmartLockBase

var keyAmount:int = 3

func _init():
	id = SmartLock.TightLock

func getName():
	return "Tight lock"

func getUnlockDescription():
	var restData:RestraintData = getRestraintData()
	if(restData == null):
		return "ERROR, SOMETHING WENT WRONG"
	var requiredItemID:String = restData.getTightLockRequiredItemID()
	var reqItem:ItemBase = GlobalRegistry.getItemRef(requiredItemID)
	if(reqItem == null):
		return "ERROR, SOMETHING WENT WRONG"
	
	return "Unable to struggle off, requires a special item to unlock! Alternatively, has "+str(keyAmount)+" keyholes, requiring that many restraint keys to unlock.\nRequired item to unlock: "+reqItem.getVisibleName()

func getKeysAmountToUnlock() -> int:
	return keyAmount

func onLocked(_contex):
	keyAmount = RNG.randi_range(2, 5)
	if(OPTIONS.isHardStruggleEnabled()): #Evil
		keyAmount = RNG.randi_range(2, 8)

func saveData():
	return {
		keyAmount = keyAmount,
	}

func loadData(_data):
	keyAmount = SAVE.loadVar(_data, "keyAmount", 2)
