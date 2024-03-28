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

	var likesTexts = []
	likesTexts.append("[b]Likes/dislikes:[/b] (That you have discovered)")
	var enemyLustInterests = npc.getLustInterests()
	if(!enemyLustInterests.hasAnyInterests()):
		likesTexts.append("- None")
	else:
		var whatPlayerKnows = enemyLustInterests.getPlayerKnowledge()
		
		if(whatPlayerKnows.size() > 0):
			for topicID in whatPlayerKnows:
				var topic = GlobalRegistry.getLustTopic(topicID)
				likesTexts.append("- {npc.name} [color="+Interest.getColorString(whatPlayerKnows[topicID])+"]" + Interest.getVisibleName(whatPlayerKnows[topicID])+"[/color] seeing "+str(topic.getVisibleName(topicID)))
		else:
			likesTexts.append("- Nothing yet")
	theTexts.append(Util.join(likesTexts, "\n"))

	var fetishTexts = []
	var texts = []
	var fetishHolder: FetishHolder = npc.getFetishHolder()
	fetishTexts.append("[b]Fetishes:[/b]")
	for fetishID in fetishHolder.getFetishes():
		var fetish:FetishBase = GlobalRegistry.getFetish(fetishID)
		if(fetish == null):
			continue
		var fetishInterest = fetishHolder.getFetishInterest(fetishID)
		if(fetishInterest == FetishInterest.Neutral):
			continue
		var fetishColor = FetishInterest.getColorString(fetishInterest)
		var fetishInterestText = FetishInterest.getVisibleName(fetishInterest)
		
		texts.append("[cell]"+fetish.getVisibleName()+": "+"[color="+fetishColor+"]"+fetishInterestText+"[/color][/cell]")
	fetishTexts.append("[table=2]"+Util.join(texts, "")+"[/table]")
	theTexts.append(Util.join(fetishTexts, "\n"))

	return {
		text = Util.join(theTexts, "\n\n"),
	}
