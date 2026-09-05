extends Reference
class_name SexTypeBase

var id = "error"
var sexEngineRef: WeakRef

func processArgs(_args:Dictionary):
	pass

func initArgs(_args = {}):
	pass

func setSexEngine(sexEngine):
	sexEngineRef = weakref(sexEngine)

func getSexEngine():
	if(sexEngineRef == null):
		return null
	return sexEngineRef.get_ref()

func getSupportedSexActivities():
	return [id]

func isUnconscious(_charID:String) -> bool:
	var sexEngine = getSexEngine()
	if(sexEngine.subs.has(_charID)):
		return sexEngine.subs[_charID].isUnconscious()
	return false

func getDefaultAnimation():
	var sexEngine = getSexEngine()
	var theDomIDs:Array = sexEngine.getXFreeDomIDsForAnim(2)
	var theSubIDs:Array = sexEngine.getXFreeSubIDsForAnim(2)
	
	if(theDomIDs.empty() && theSubIDs.empty()):
		return null
	if(theDomIDs.empty()):
		if(isUnconscious(theSubIDs[0])):
			return [StageScene.Sleeping, "sleep", {pc=theSubIDs[0]}]
		return [StageScene.GivingBirth, "idle", {pc=theSubIDs[0]}]
	if(theSubIDs.empty()):
		return [StageScene.Solo, "stand", {pc=theDomIDs[0]}]
	
	if(theDomIDs.size() > 1):
		if(isUnconscious(theSubIDs[0])):
			return [StageScene.SexStartDDS, "defeated", {pc=theSubIDs[0], npc=theDomIDs[0], npc2=theDomIDs[1]}]
		return [StageScene.SexStartDDS, "start", {pc=theSubIDs[0], npc=theDomIDs[0], npc2=theDomIDs[1]}]
	
	if(theSubIDs.size() > 1 && !isUnconscious(theSubIDs[0]) && !isUnconscious(theSubIDs[1])):
		return [StageScene.SexStartDSS, "start", {pc=theDomIDs[0], npc=theSubIDs[0], npc2=theSubIDs[1]}]
	
	if(isUnconscious(theSubIDs[0])):
		return [StageScene.SexStart, "defeated", {pc=theDomIDs[0], npc=theSubIDs[0]}]
	return [StageScene.SexStart, "start", {pc=theDomIDs[0], npc=theSubIDs[0]}]

func processAnimationArgs(_args:Dictionary):
	pass

func saveData():
	return {
		
	}

func loadData(_data):
	pass
