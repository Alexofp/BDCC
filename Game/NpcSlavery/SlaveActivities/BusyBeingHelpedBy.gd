extends SlaveActivityBase

var otherSlaveID = ""

func _init():
	id = "BusyBeingHelpedBy"
	
func getVisibleName():
	return "Busy being helped"

func onStart(_args = []):
	otherSlaveID = _args[0]

func onNewDay():
	pass

func preventsStatsDecay():
	return false

func preventsNormalInteractions():
	return true

func getActivityText():
	return "{npc.name} is busy with another one of your slaves. Check back later."

func hoursPassed(_howMuch):
	var otherSlave:DynamicCharacter = GlobalRegistry.getCharacter(otherSlaveID)
	if(otherSlave == null || !otherSlave.isSlaveToPlayer()):
		getSlave().stopActivity()
		return
	var npcSlavery:NpcSlave = otherSlave.getNpcSlavery()
	if(!npcSlavery.isDoingActivity() || !npcSlavery.getActivity().keepsSlaveIDBusy(getChar().getID())):
		getSlave().stopActivity()
		return

func getCustomInteractAnimInfo():
	return [StageScene.Solo, "stand", {pc="pc"}]

func saveData():
	var data = .saveData()
	
	data["otherSlaveID"] = otherSlaveID
	
	return data

func loadData(_data):
	.loadData(_data)
	
	otherSlaveID = SAVE.loadVar(_data, "otherSlaveID", "")
