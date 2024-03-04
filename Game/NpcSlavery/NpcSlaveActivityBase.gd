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

func preventsStatsDecay():
	return false

func preventsNormalInteractions():
	return false

func getActivityText():
	return "{npc.name} is doing something!"

func getInteractActions():
	return [
		{
			name = "Something",
			desc = "ASD",
			sceneID = "MeScene",
			args = [],
			buttonChecks = [],
		}
	]

func getSlave() -> NpcSlave:
	if(slavery == null):
		return null
	return slavery.get_ref()

func saveData():
	var data = {
		#"slaveType": slaveType,
	}
	
	return data

func loadData(_data):
	#slaveType = SAVE.loadVar(data, "slaveType", SlaveType.Slut)
	pass
