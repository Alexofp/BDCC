extends Reference
class_name SlaveActivityBase

var id = "Error"
var slavery:WeakRef

func getVisibleName():
	return "Change me"

func onStart(_args = []):
	pass

func onEnd():
	pass

func onNewDay():
	pass

func hoursPassed(_howMuch):
	pass

func preventsStatsDecay():
	return false

func preventsNormalInteractions():
	return false

func shouldTriggerEventsOnTalk():
	return !preventsNormalInteractions()

func getActivityText():
	return "{npc.name} is doing something!"

func getInteractActions():
	return [
#		{
#			name = "Something",
#			desc = "ASD",
#			sceneID = "MeScene",
#			args = [],
#			buttonChecks = [],
#		}
	]

func getCustomInteractAnimInfo():
	return null

func keepsSlaveIDBusy(_charID):
	return false

func getSlave() -> NpcSlave:
	if(slavery == null):
		return null
	return slavery.get_ref()

func getChar():
	if(slavery == null):
		return null
	return slavery.get_ref().getChar()

func getCharID() -> String:
	if(slavery == null):
		return ""
	return slavery.get_ref().getChar().getID()

func stopActivity():
	getSlave().stopActivity()

func onPawnDeleted(_pawn):
	pass

func onInteractionChanged(_newInteraction):
	pass

func onInteractionEvent(_eventID:String, _args:Dictionary):
	pass

func pawnShouldReturnHome() -> bool:
	return true

func pawnExist() -> bool:
	return GM.main.IS.hasPawn(getChar().getID())

func saveData():
	var data = {
		#"slaveType": slaveType,
	}
	
	return data

func loadData(_data):
	#slaveType = SAVE.loadVar(data, "slaveType", SlaveType.Slut)
	pass
