extends SlaveActionBase

func _init():
	id = "ActionSubMassageToPC"
	actionType = Action
	#extraSlaves = {}
	sceneID = "ActionSlaverySubMassageToPC"
	slaveResistChanceMult = 1.0
	
	slaveMinLevel = 0
	slaveSkillsRequired = {
		SlaveType.Submissive: 7,
	}
	
	buttonPriority = 60

func getVisibleName():
	return "Receive massage"

func getVisibleDesc():
	return "Order your sub to give you a massage"

func isActionVisible(_slaveID):
	var npcSlavery:NpcSlave = getSlave(_slaveID)
	if(npcSlavery.getSlaveSkill(SlaveType.Submissive) < 7):
		return false
	return true
