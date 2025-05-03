extends QuestBase

func _init():
	id = "ElizaQuest"

func getVisibleName():
	return "Queen of Alchemy"

func getProgress():
	var result = []
	
	var amountOfNurseryTasks:int = GM.main.SCI.getAmountOfCompletedNurseryTasks()
	var amountOfPillsUnlocked:int = GM.main.SCI.getUnlockedStrangePillsCount()
	var amountOfPillsTested:int = GM.main.SCI.getTestedStrangePillsCount()
	var s1hap:bool = getFlag("ElizaModule.s1hap", false)
	var s2hap:bool = getFlag("ElizaModule.s2hap", false)
	var s3hap:bool = getFlag("ElizaModule.s3hap", false)
	var s4hap:bool = getFlag("ElizaModule.s4hap", false)
	var s5hap:bool = getFlag("ElizaModule.s5hap", false)
	var s6hap:bool = getFlag("ElizaModule.s6hap", false)
	var s6DateHap:bool = getFlag("ElizaModule.s6DateHap", false)
	var s7hap:bool = getFlag("ElizaModule.s7hap", false)

	result.append("Eliza Quinn has told you to do 3 nursery bounties if you want to get a chance to become her lab assistant.\nApproach the bounty board in the nursery to see today's bounties. You have currently done "+str(amountOfNurseryTasks)+" task"+("s" if amountOfNurseryTasks != 1 else "")+".")
	
	var nurseryTasks:Array = GM.main.SCI.peekNurseryTasks()
	if(!nurseryTasks.empty()):
		var taskText:String = "Bounties that you remember:"
		for taskA in nurseryTasks:
			var task:NurseryTaskBase = taskA
			
			taskText += ("\n- "+task.getName())
		result.append(taskText)
	
	if(getFlag("ElizaModule.s0hap") && !s1hap && amountOfNurseryTasks >= 3):
		result.append("You have completed enough bounties, go see Eliza!")
	
	if(s1hap):
		result.append("Eliza wants you to find a 'strange pill' and bring it to her. Some of the inmates might have them but they won't share unless you make them. Check the 'Special Bounty' on the bounty board in the nursery to help you find inmates that possess these strange drugs.")
	
	if(s2hap):
		result.append("You now have access to the chemistry lab! Find more 'strange pills' and use the lab to discover what they do and how to make them. You need at least 3 pills unlocked in order to progress the story. You currently have "+str(amountOfPillsUnlocked)+".")
	
	if(s3hap):
		result.append("You can now explore the drug den! You can find the entrance in the yard area. You need at least 8 pills unlocked in order to progress the story. You currently have "+str(amountOfPillsUnlocked)+". [b]You also need at least 1 transformation tested[/b]! To test a transformation, eat the pill yourself or feed it to someone. Wait until the transformation reaches its final stage, then visit Eliza yourself or bring the transformed person. You currently have "+str(amountOfPillsTested)+" pill"+("s" if amountOfPillsTested != 1 else "")+" tested.")
	
	if(s4hap):
		result.append("You have met Eliza's mother.. You need at least 12 pills unlocked in order to progress the story. You currently have "+str(amountOfPillsUnlocked)+". You also need at least 3 transformations tested. You currently have "+str(amountOfPillsTested)+".")
	
	if(s5hap):
		result.append("Eliza can now automatically milk your slaves if you bring them to her. You need at least 15 pills unlocked in order to progress the story. You currently have "+str(amountOfPillsUnlocked)+". You also need at least 6 transformations tested. You currently have "+str(amountOfPillsTested)+".")
	
	if(s6hap && !s6DateHap):
		result.append("Eliza has offered you to meet after her shift ends, so you can rest and get to know each other a little better. Meet her in the medical lobby after 23:00 in order to progress the story.")
	
	if(s6DateHap):
		result.append("Eliza needs your help to discover and test all the drugs. Unlock [b]all[/b] of the drugs and test at least [b]10[/b] of them. After that, you can approach her to see what happens..")
	
	if(s7hap):
		result.append("Eliza decided to stay for now! You still have full access to her chemistry lab.")
	
	return result

func isVisible():
	return getFlag("ElizaModule.s0hap")

func isCompleted():
	return getFlag("ElizaModule.storyCompleted")

func isMainQuest():
	return false
