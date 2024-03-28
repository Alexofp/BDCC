extends SlaveActionBase

func _init():
	id = "ActionChangeName"
	actionType = Action
	#extraSlaves = {}
	sceneID = "ActionSlaveryChangeName"
	slaveResistChanceMult = 1.0
	
	slaveMinLevel = 7
	slaveSkillsRequired = {
	}
	
	buttonPriority = 30

func getVisibleName():
	return "Change name"

func getVisibleDesc():
	return "Give your slave a new name"
