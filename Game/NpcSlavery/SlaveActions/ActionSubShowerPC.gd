extends SlaveActionBase

func _init():
	id = "ActionSubShowerPC"
	actionType = Action
	#extraSlaves = {}
	sceneID = "ActionSlaveryShower"
	slaveResistChanceMult = 0.5
	
	slaveMinLevel = 0
	slaveSkillsRequired = {
		SlaveType.Submissive: 4,
	}
	
	buttonPriority = 90

func getVisibleName():
	return "Shower"

func getVisibleDesc():
	return "Order your sub to shower you"

func isActionVisible(_slaveID):
	var npcSlavery:NpcSlave = getSlave(_slaveID)
	if(npcSlavery.getSlaveSkill(SlaveType.Submissive) < 4):
		return false
	return true
