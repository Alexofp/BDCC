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
	
	var theSubIDs:Array = subs.keys()
	var theDomIDs:Array = doms.keys()
	
	#TODO: Make this better. Choose best anim out of all activities
	var pcTarget:String = sexEngine.getPCTarget() #!sexEngine.canSwitchPCTarget()
	var theSubID:String = theSubIDs[0]
	var theDomID:String = theDomIDs[0]
	if(pcTarget != ""):
		var isPCTargetDom:bool = sexEngine.isDom(pcTarget)
		if(isPCTargetDom):
			theDomID = pcTarget
		else:
			theSubID = pcTarget
	
	if(subs[theSubID].isUnconscious()):
		return [StageScene.SexStart, "defeated", {pc=theDomID, npc=theSubID}]
	return [StageScene.SexStart, "start", {pc=theDomID, npc=theSubID}]

func saveData():
	return {
		
	}

func loadData(_data):
	pass
