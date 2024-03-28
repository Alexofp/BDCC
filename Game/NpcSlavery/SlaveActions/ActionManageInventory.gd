extends SlaveActionBase

func _init():
	id = "ActionManageInventory"
	actionType = Action
	#extraSlaves = {}
	sceneID = "ActionSlaveryManageInventory"
	slaveResistChanceMult = 1.0
	
	slaveMinLevel = 1
	slaveSkillsRequired = {
	}
	
	buttonPriority = 110

func getVisibleName():
	return "Manage inventory"

func getVisibleDesc():
	return "Change what your slave is wearing"
