extends SlaveActionBase

func _init():
	id = "ActionSlutThreesome"
	actionType = Action
	#extraSlaves = {}
	sceneID = "ActionSlutThreesomeScene"
	slaveResistChanceMult = 1.0
	
	slaveMinLevel = 0
	slaveSkillsRequired = {
		SlaveType.Slut: 5,
	}

	extraSlaves = {
		"sub2": {
			name = "Second slave",
			desc = "Who is gonna be the second sub in the sex",
			slaveSkillsRequired = {
			},
			slaveMinLevel = 0,
		}
	}
	
	onlyShowWhenHaveRequiredSkills = true
	endsTalkScene = true
	
	buttonPriority = 70

func getVisibleName():
	return "Threesome (2 subs)"

func getVisibleDesc():
	return "Fuck 2 of your slaves at the same time"

func fitsAsExtraSlaveAdvanced(_role, _charID):
#	if(_role == "dom"):
#		var npcSlave:NpcSlave = getSlave(_charID)
#		var theChar:BaseCharacter = npcSlave.getChar()
#		if(theChar.hasBoundArms() || theChar.hasBlockedHands() || theChar.isGagged() || theChar.hasBoundLegs()):
#			return [false, "Dominant has restraints on that prevent being able to do this"]
#
	return .fitsAsExtraSlaveAdvanced(_role, _charID)
