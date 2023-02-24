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
	
	if(subs[subs.keys()[0]].isUnconscious()):
		return [StageScene.SexStart, "defeated", {pc=doms.keys()[0], npc=subs.keys()[0]}]
	return [StageScene.SexStart, "start", {pc=doms.keys()[0], npc=subs.keys()[0]}]

func saveData():
	return {
		
	}

func loadData(_data):
	pass
