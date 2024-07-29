extends SmartLockBase

var keyAmount:int = 5
var npcID:String = ""

func _init():
	id = SmartLock.KeyholderLock

func getName():
	return "Keyholder lock"

func getUnlockDescription():
	var keyholderName = "unknown"
	if(npcID != ""):
		var character:BaseCharacter = GlobalRegistry.getCharacter(npcID)
		if(character != null):
			keyholderName = character.getName()
	
	return "Unable to struggle off. A unique key to this restraint is possessed by "+str(keyholderName)+".\nAlternatively, it seems to have "+str(keyAmount)+" keyholes."

func getKeysAmountToUnlock() -> int:
	return keyAmount

func onLocked(_contex):
	keyAmount = RNG.randi_range(2, 3)
	if(OPTIONS.isHardStruggleEnabled()): #Evil
		keyAmount = RNG.randi_range(2, 8)
	
	var forcer = null#_contex["forcer"]
	if(_contex.has("forcer")):
		forcer = _contex["forcer"]
	
	if(forcer == null): # Pick a random char, whatever, shouldn't happen
		forcer = GlobalRegistry.getCharacter(RNG.pick(GM.main.dynamicCharacters))
	if(forcer == null):
		forcer = GlobalRegistry.getCharacter("nova")
	
	if(forcer != null):
		npcID = forcer.getID()
	
func isKeyholder(_charID:String):
	if(npcID == _charID):
		return true
	return false
	
func saveData():
	return {
		keyAmount = keyAmount,
		npcID = npcID,
	}

func loadData(_data):
	keyAmount = SAVE.loadVar(_data, "keyAmount", 2)
	npcID = SAVE.loadVar(_data, "npcID", "")
