extends NpcOwnerEventBase

func _init():
	id = "ResistGeneric"

func onStart(_args:Array):
	setState("start")

func start():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("You resist your owner's action!")
	talkModularOwnerToPC("SoftSlaveryResist") #"Really, {npc.npcSlave}? Is that how you wanna do this?"
	saynn("Looks like you're gonna have to fight {npc.him}.")
	
	addButton("Fight", "Start the fight", "startFight", [getOwnerID()])

func start_fightResult(_didWin:bool):
	if(_didWin):
		setState("pcWon")
	else:
		setState("pcLost")

func pcWon():
	playAnimation(StageScene.Duo, "stand", {npc=getOwnerID(), npcAction="kneel"})
	saynn("You won the fight! Your owner's influence over you has been reduced.")
	addInfluenceResist()
	
	addContinue("endEvent")

func pcLost():
	playAnimation(StageScene.Duo, "kneel", {npc=getOwnerID()})
	
	saynn("You lost the fight.")
	saynn("{npc.name} is about to punish you..")
	addContinue("startPunish")

func pcLost_do(_id:String, _args:Array):
	if(_id == "startPunish"):
		runEvent("punishment", "Punish")

func pcLost_eventResult(_event, _tag:String, _args:Array):
	endEvent()
