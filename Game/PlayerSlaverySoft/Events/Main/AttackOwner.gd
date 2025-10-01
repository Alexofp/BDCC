extends NpcOwnerEventBase

func _init():
	id = "AttackOwner"

func onStart(_args:Array):
	setSubResult(SUB_END)

func start():
	playStand()
	saynn("YOU DECIDE TO ATTACK YOUR OWNER!")
	talk(C_OWNER, "You're gonna regret it.")
	
	addButton("Fight", "Start the fight", "startFight", [getOwnerID()])
	
func start_fightResult(_didWin:bool):
	if(_didWin):
		setState("pcWon")
	else:
		setState("pcLost")

func pcWon():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER), npcAction="kneel"})
	saynn("YAY! YOU WON!")
	
	addInfluenceResist()
	
	addContinue("endEvent")

func pcLost():
	saynn("YOU LOST THE FIGHT.")
	
	talk(C_OWNER, "Time to punish you.")
	
	addContinue("startPunish")

func pcLost_do(_id:String, _args:Array):
	if(_id == "startPunish"):
		runPunishment()
