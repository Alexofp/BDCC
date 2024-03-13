extends SlaveActionBase

func _init():
	id = "ActionSlutStartProstitution"
	actionType = Action
	#extraSlaves = {}
	sceneID = "ActionSlutStartProstitutionScene"
	slaveResistChanceMult = 1.0
	
	slaveMinLevel = 0
	slaveSkillsRequired = {
		SlaveType.Slut: 5,
	}
	onlyShowWhenHaveRequiredSkills = true
	endsTalkScene = true
	
	buttonPriority = 50

func getVisibleName():
	return "Prostitution"

func getVisibleDesc():
	return "Tell your slut to start whoring herself out"
