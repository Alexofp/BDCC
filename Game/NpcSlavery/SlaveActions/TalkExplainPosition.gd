extends SlaveActionBase

func _init():
	id = "TalkExplainPosition"
	actionType = Talk
	#extraSlaves = {}
	#sceneID = ""
	slaveResistChanceMult = 0.0
	buttonPriority = 80

func getVisibleName():
	return "Explain position"

func getVisibleDesc():
	return "Tell them that they are a slave now"

func doActionSimple(_slaveID, _extraSlavesIDs = {}):
	var npcSlavery = getSlave(_slaveID)
	
	var theTexts = []
	theTexts.append("You explain {npc.name} {npc.his} position. You tell {npc.him} that {npc.he} {npc.isAre} now yours and there is nothing {npc.he} can do about it.")
	
	if(npcSlavery.getTalkedTimesToday() >= 2):
		theTexts.append("It didn't have much effect on {npc.him}. {npc.He} heard you too many times today already.")
	else:
		var awareness = npcSlavery.getAwareness()
		if(awareness > 0.7):
			theTexts.append("{npc.He} heard that a lot already, there is nothing new that you can tell {npc.him}.")
		elif(awareness > (0.25+npcSlavery.personalityScore({PersonalityStat.Subby: 0.1}))):
			npcSlavery.addTired(0.2)
			theTexts.append("{npc.He} knows this already, there is nothing new that you can tell {npc.him}.")
		else:
			if(npcSlavery.getWorkEfficiency() <= 0.4):
				npcSlavery.addTired(0.2)
				theTexts.append("{npc.He} is too tired to fully understand your words.")
			elif(npcSlavery.isActivelyResisting()):
				npcSlavery.addTired(0.2)
				npcSlavery.addAwareness(0.04)
				theTexts.append("{npc.He} doesn't like what {npc.he} hears at all. And yet, you feel like you were heard.")
			else:
				npcSlavery.addTired(0.2)
				npcSlavery.addAwareness(0.05)
				theTexts.append("{npc.He} listens you quietly. Looks like {npc.he} starts to understand {npc.his} position better.")
		
	npcSlavery.didTalkWithToday()
	return {
		text = Util.join(theTexts, "\n\n"),
	}
