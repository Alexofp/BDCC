extends SmartLockBase

var keyAmount:int = 3

func _init():
	id = SmartLock.TightLock

func getName():
	return "Tight lock"

func getUnlockDescription():
	return "Unable to struggle off. Has "+str(keyAmount)+" keyholes, requiring that many restraint keys to unlock."

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
