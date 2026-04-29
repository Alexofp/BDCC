extends Reference
class_name RecuitSystem

var recruits:Dictionary = {}

var currentID:String = ""

func _init():
	for recruitID in GlobalRegistry.getRecruits():
		var theRec = GlobalRegistry.createRecruit(recruitID)
		if(!theRec):
			continue
		recruits[recruitID] = theRec

func saveData() -> Dictionary:
	var recData:Dictionary = {}
	for recruitID in recruits:
		var theRec = recruits[recruitID]
		if(!theRec.needsToBeSaved()):
			continue
		recData[recruitID] = theRec.saveData()
	
	return {
		currentID = currentID,
		recruits = recData,
	}

func loadData(_data:Dictionary):
	currentID = SAVE.loadVar(_data, "currentID", "")
	
	# Assumes we re-create this system on load
	var recData:Dictionary = SAVE.loadVar(_data, "recruits", {})
	for recruitID in recData:
		if(!recruits.has(recruitID)):
			continue
		recruits[recruitID].loadData(recData[recruitID])
