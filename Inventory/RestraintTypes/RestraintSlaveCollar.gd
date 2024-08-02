extends RestraintData
class_name RestraintSlaveCollar

func canStruggle():
	return false

func canUnlockWithKey():
	return false

func getVisibleLevel(_isBlind = false):
	return "999, impossible to remove"

func getLevel():
	return 999

func alwaysSavedWhenStruggledOutOf():
	return true

func getDodgeDifficulty():
	return 10.0

func canBeEasilyRemovedByDom():
	var theItem = getItem()
	if(theItem != null):
		if(theItem.isWornByWearer()):
			var wearerObj = theItem.getWearer()
			if(wearerObj.isSlaveToPlayer()):
				return false
	return true

func saveData():
	var data = {}
	data["aiWontResist"] = aiWontResist
	
	if(smartLock != null):
		data["smartLock"] = {
			id = smartLock.id,
			data = smartLock.saveData(),
		}
	return data
	
func loadData(_data):
	if(_data.has("aiWontResist")):
		aiWontResist = SAVE.loadVar(_data, "aiWontResist", false)
	loadSmartLock(_data)
