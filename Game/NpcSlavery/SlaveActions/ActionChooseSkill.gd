extends SlaveActionBase

func _init():
	id = "ActionChooseSkill"
	actionType = Action
	#extraSlaves = {}
	sceneID = "ActionSlaveryChooseSkill"
	slaveResistChanceMult = 0.0
	
	slaveMinLevel = 5
	slaveSkillsRequired = {
	}
	
	buttonPriority = 110

func getVisibleName():
	return "Specializations"

func getVisibleDesc():
	return "Change your slave's main specialization and make them learn new ones!"
