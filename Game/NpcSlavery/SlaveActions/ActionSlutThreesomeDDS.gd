extends SlaveActionBase

func _init():
	id = "ActionSlutThreesomeDDS"
	actionType = Action
	#extraSlaves = {}
	sceneID = "ActionSlutThreesomeDDSScene"
	slaveResistChanceMult = 1.0
	
	slaveMinLevel = 0
	slaveSkillsRequired = {
		SlaveType.Slut: 5,
	}

	extraSlaves = {
		"dom": {
			name = "Dominant",
			desc = "Who is gonna be the second dom in the sex",
			slaveSkillsRequired = {
			},
			slaveMinLevel = 0,
		}
	}
	
	onlyShowWhenHaveRequiredSkills = true
	endsTalkScene = true
	
	buttonPriority = 70

func getVisibleName():
	return "Threesome (+dom)"

func getVisibleDesc():
	return "Fuck your slave together with one of your other slaves"

func fitsAsExtraSlaveAdvanced(_role, _charID):
	if(_role == "dom"):
		var npcSlave:NpcSlave = getSlave(_charID)
		var theChar:BaseCharacter = npcSlave.getChar()
		if(theChar.hasBoundArms() || theChar.hasBlockedHands() || theChar.isGagged() || theChar.hasBoundLegs()):
			return [false, "Dominant has restraints on that prevent being able to do this"]

	return .fitsAsExtraSlaveAdvanced(_role, _charID)
