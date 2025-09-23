extends NpcOwnerEventBase

func _init():
	id = "ResistGeneric"

func onStart(_args:Array):
	setState("start")

func start():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("YOU RESIST!")
	#addInfluenceResist()
	talk(C_OWNER, "I'M GONNA FUCK YOU UP!")
	
	addButton("Fight", "Start the fight", "startFight", [getOwnerID()])

func start_fightResult(_didWin:bool):
	if(_didWin):
		setState("pcWon")
		setSubResult(SUB_END)
	else:
		setState("pcLost")

func pcWon():
	playAnimation(StageScene.Duo, "stand", {npc=getOwnerID(), npcAction="kneel"})
	saynn("YOU WON!")
	addInfluenceResist()
	
	addContinue("endEvent")

func pcLost():
	playAnimation(StageScene.Duo, "kneel", {npc=getOwnerID()})
	
	saynn("YOU LOST!")
	addContinue("endEvent") #TODO: Run a punishment event instead?
