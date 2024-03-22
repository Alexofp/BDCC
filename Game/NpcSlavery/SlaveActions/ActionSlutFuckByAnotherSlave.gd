extends SlaveActionBase

func _init():
	id = "ActionSlutFuckByAnotherSlave"
	actionType = Action
	#extraSlaves = {}
	sceneID = "ActionSlutFuckByAnotherSlaveScene"
	slaveResistChanceMult = 1.0
	
	slaveMinLevel = 0
	slaveSkillsRequired = {
		SlaveType.Slut: 2,
	}

	extraSlaves = {
		"dom": {
			name = "Dominant",
			desc = "Person who will fuck your slut",
			slaveSkillsRequired = {},
			slaveMinLevel = 0,
		}
	}
	
	onlyShowWhenHaveRequiredSkills = true
	endsTalkScene = true
	
	buttonPriority = 70

func getVisibleName():
	return "Slave-on-Slut"

func getVisibleDesc():
	return "Order your slut to be fucked by one of your other slaves"

func fitsAsExtraSlaveAdvanced(_role, _charID):
	if(_role == "dom"):
		var npcSlave:NpcSlave = getSlave(_charID)
		var theChar:BaseCharacter = npcSlave.getChar()
		if(theChar.hasBoundArms() || theChar.hasBlockedHands() || theChar.isGagged() || theChar.hasBoundLegs()):
			return [false, "Dominant has restraints on that prevent being able to do this"]
	
	return .fitsAsExtraSlaveAdvanced(_role, _charID)
