extends SlaveActionBase

func _init():
	id = "ActionSubSlaveHelper"
	actionType = Action
	#extraSlaves = {}
	sceneID = "ActionSlaverySubManageHelper"
	slaveResistChanceMult = 1.0
	
	slaveMinLevel = 0
	slaveSkillsRequired = {
		SlaveType.Submissive: 15,
	}
	onlyShowWhenHaveRequiredSkills = true
	
	buttonPriority = 40

func getVisibleName():
	return "Slave helper"

func getVisibleDesc():
	return "Manage how your sub will help other slaves"

