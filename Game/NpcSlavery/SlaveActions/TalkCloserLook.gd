extends SlaveActionBase

func _init():
	id = "TalkCloserLook"
	actionType = Talk
	#extraSlaves = {}
	#sceneID = ""
	slaveResistChanceMult = 0.0
	buttonPriority = 90

func getVisibleName():
	return "Closer look"

func getVisibleDesc():
	return "Get a better look on them"

func doActionSimple(_slaveID, _extraSlavesIDs = {}):
	var npcSlavery = getSlave(_slaveID)
	var npc = npcSlavery.getChar()
	
	var theTexts = []
	theTexts.append("You decide to get a better look at {npc.name}.")

	var persTexts = []
	persTexts.append("[b]Personality:[/b]")
	var personality: Personality = npc.getPersonality()
	if(personality != null):
		for statID in PersonalityStat.getAll():
			var value = personality.getStat(statID)
			var statName = PersonalityStat.getVisibleName(statID)
			var statValue = PersonalityStat.getVisibleDesc(statID, value)
			
			persTexts.append(statName+": "+statValue)
	theTexts.append(Util.join(persTexts, "\n"))

	return {
		text = Util.join(theTexts, "\n\n"),
	}
