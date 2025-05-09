extends Reference
class_name SexTypeBase

var id = "error"
var sexEngineRef: WeakRef

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

func getDefaultAnimation():
	var sexEngine = getSexEngine()
	var subs = sexEngine.subs
	var doms = sexEngine.doms
	
	if(subs.size() == 0 || doms.size() == 0):
		return null
	
	var theSubID:String = subs.keys()[0] if !sexEngine.canSwitchPCTarget() else sexEngine.getPCTarget()
	if(subs[theSubID].isUnconscious()):
		return [StageScene.SexStart, "defeated", {pc=doms.keys()[0], npc=theSubID}]
	return [StageScene.SexStart, "start", {pc=doms.keys()[0], npc=theSubID}]

func saveData():
	return {
		
	}

func loadData(_data):
	pass
