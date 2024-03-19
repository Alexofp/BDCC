extends SlaveActivityBase

var willWashSlaves = false
var willHelpGiveBirth = false

var currentTargetID:String = ""
var currentHelpingTask:String = "" #birth, wash

func _init():
	id = "SubHelper"
	
func getVisibleName():
	return "Slave helper"

func getActivityText():
	if(currentHelpingTask != ""):
		var otherSlave:BaseCharacter = GlobalRegistry.getCharacter(currentTargetID)
		if(otherSlave == null):
			return "{npc.name} is busy with a slave."
		return "{npc.name} is busy with "+otherSlave.getName()+"."
	
	if(willWashSlaves && willHelpGiveBirth):
		return "This sub will automatically wash other slaves and bring pregnant ones to the nursery"
	if(willHelpGiveBirth):
		return "This sub will automatically bring pregnant slaves to the nursery"
	if(willWashSlaves):
		return "This sub will automatically wash other slaves"
	return "{npc.name} is being a slave helper!"


func onStart(_args = []):
	pass

func onNewDay():
	pass

func preventsStatsDecay():
	return false

func preventsNormalInteractions():
	if(currentHelpingTask != ""):
		return true
	return false

func hasAnythingToggledOn():
	if(willWashSlaves || willHelpGiveBirth):
		return true
	return false

func keepsSlaveIDBusy(_charID):
	if(currentTargetID != "" && currentTargetID == _charID):
		return true
	return false

func hoursPassed(_howMuch):
	if(currentHelpingTask != ""):
		var otherSlave:BaseCharacter = GlobalRegistry.getCharacter(currentTargetID)
		
		if(otherSlave == null || !otherSlave.isSlaveToPlayer()):
			currentTargetID = ""
			currentHelpingTask = ""
			return
		
		if(currentHelpingTask == "wash"):
			otherSlave.afterTakingAShower()
			GM.main.addMessage(getChar().getName()+" just washed your slave named "+otherSlave.getName()+" in the shower")
			getSlave().addExperience(10)
		if(currentHelpingTask == "birth"):
			if(otherSlave.isReadyToGiveBirth()):
				var bornChilds = otherSlave.giveBirth()
				var bornChildAmount = bornChilds.size()
				var bornString = GM.CS.getChildBirthInfoString(bornChilds)
				
				if(bornChildAmount > 0):
					GM.main.addLogMessage("News (Slave)", "You just received news that "+otherSlave.getName()+" was just brought into nursery by "+getChar().getName()+" where "+otherSlave.heShe()+" gave birth to "+str(bornChildAmount)+" kid"+("s" if bornChildAmount != 1 else "")+":\n\n"+bornString)
				getSlave().addExperience(30)
				otherSlave.getNpcSlavery().addExperience(50)
				
		otherSlave.getNpcSlavery().stopActivity()
		currentHelpingTask = ""
		currentTargetID = ""
	else:
		if(getSlave().getWorkEfficiency() <= 0.25 || getSlave().isActivelyResisting()):
			return
		
		if(GM.main.characterIsVisible(getChar().getID()) || getChar().isVisiblyPregnant()):
			return
		
		if(willHelpGiveBirth):
			for otherSlave in getNotBusySlaves():
				if(!otherSlave.isReadyToGiveBirth()):
					continue
				currentHelpingTask = "birth"
				currentTargetID = otherSlave.getID()
				otherSlave.getNpcSlavery().startActivity("BusyBeingHelpedBy", [getChar().getID()])
				getSlave().addTired(2)
				return
		
		if(willWashSlaves):
			for otherSlave in getNotBusySlaves():
				if(!otherSlave.hasEffect(StatusEffect.CoveredInCum)):
					continue
				currentHelpingTask = "wash"
				currentTargetID = otherSlave.getID()
				otherSlave.getNpcSlavery().startActivity("BusyBeingHelpedBy", [getChar().getID()])
				getSlave().addTired(2)
				return
				

func getInteractActions():
	return [
	]

func getNotBusySlaves():
	var result = []
	var slaveIDs = GM.main.getPCSlavesIDs()
	for slaveID in slaveIDs:
		var otherSlave:DynamicCharacter = GlobalRegistry.getCharacter(slaveID)
		if(getChar() == otherSlave):
			continue
		if(GM.main.characterIsVisible(slaveID)):
			continue
		var npcSlavery:NpcSlave = otherSlave.getNpcSlavery()
		if(npcSlavery == null):
			continue
		if(npcSlavery.isDoingActivity()):
			continue
		result.append(otherSlave)
	return result
	
func getCustomInteractAnimInfo():
	if(currentHelpingTask != ""):
		return [StageScene.Solo, "stand", {pc="pc"}]
	else:
		return .getCustomInteractAnimInfo()

func saveData():
	var data = .saveData()
	
	data["willWashSlaves"] = willWashSlaves
	data["willHelpGiveBirth"] = willHelpGiveBirth
	data["currentTargetID"] = currentTargetID
	data["currentHelpingTask"] = currentHelpingTask
	
	return data

func loadData(_data):
	.loadData(_data)
	
	willWashSlaves = SAVE.loadVar(_data, "willWashSlaves", false)
	willHelpGiveBirth = SAVE.loadVar(_data, "willHelpGiveBirth", false)
	currentTargetID = SAVE.loadVar(_data, "currentTargetID", "")
	currentHelpingTask = SAVE.loadVar(_data, "currentHelpingTask", "")
