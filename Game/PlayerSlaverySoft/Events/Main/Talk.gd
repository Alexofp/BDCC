extends NpcOwnerEventBase

func _init():
	id = "Talk"

func onStart(_args:Array):
	setState("start")

func start():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("You approach your owner.")
	talkModularOwnerToPC("SoftSlaveryTalkStart") #What do you want, {npc.npcSlave}?
	
	var theNpcOwner := getNpcOwner()
	if(theNpcOwner):
		var theText:String = "{npc.name} is your owner!"
		for textLine in theNpcOwner.getOwnerInfo():
			theText += "\n- "+textLine
		
		#saynn("{npc.name} is your owner!\n- Slavery level: "+str(theNpcOwner.level)+"\n"+"- Influence: "+str(Util.roundF(theNpcOwner.influence*100.0, 1))+"%")
		
		saynn(theText)
		
		if(theNpcOwner.hasGivenPCTasks()):
			saynn("You have been given tasks that you need to complete:\n"+theNpcOwner.getQuestProgressText())
		
		var theTalkActions := theNpcOwner.getTalkActions(self)
		for actionEntry in theTalkActions:
			if(actionEntry.size() > 2):
				addButton(actionEntry[0], actionEntry[1], "doTalkAction", actionEntry)
			else:
				addDisabledButton(actionEntry[0], actionEntry[1])
	
	#addButton("Attack!", "Attack your owner", "startFight", [getOwnerID()])
	#addButton("Tasks!", "Get some test tasks", "getTasks")
	#addButton("Punish!", "Get punished for testing", "getPunished")
	addButton("Leave", "You have finished talking with your owner", "endEvent")



func start_do(_id:String, _args:Array):
	if(_id == "getTasks"):
		var theNpcOwner := getNpcOwner()
		if(theNpcOwner):
			theNpcOwner.generateTasks(3)
	if(_id == "getPunished"):
		runPunishment()
	if(_id == "doTalkAction"):
		var theNpcOwner := getNpcOwner()
		if(theNpcOwner):
			theNpcOwner.doTalkAction(self, _args[2], _args[3])
	
func start_fightResult(_didWin:bool):
	if(_didWin):
		setState("pcWon")
	else:
		setState("pcLost")

func pcWon():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER), npcAction="kneel"})
	saynn("YAY! YOU WON!")
	
	addInfluence(-1.0)
	
	addContinue("endEvent")

func pcLost():
	saynn("YOU LOST THE FIGHT.")
	
	saynn("YOU PROBABLY SHOULD BE PUNISHED.")
	
	addContinue("endEvent")
