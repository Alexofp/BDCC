extends NpcOwnerEventBase

func _init():
	id = "Talk"

func onStart(_args:Array):
	setState("start")

func start():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("Test!")
	talk(C_OWNER, "Meow meow.")
	#if(onlyOnce()):
	#	sayAppend("[color=red]OW[/color]")
	#	GM.pc.addPain(10)
	addInfluence(0.01)
	
	addButton("Pet", "Pet the cat", "pet")
	addButton("Pet 2", "Pet the cat but better", "setState", ["petted"])
	addButton("Stop it!", "Stop the petting", "end")
	addButton("Fight!", "Wagh", "startFight", [getOwnerID()])

func start_do(_id:String, _args:Array):
	if(_id == "end"):
		endEvent()
	if(_id == "pet"):
		setState("petted")
		#runEvent(id, args)

#func start_eventResult(_id:String, _args:Array)

func start_fightResult(_didWin:bool):
	if(_didWin):
		setState("weWon")

func weWon():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER), npcAction="kneel"})
	saynn("YAY! YOU WON!")
	addButton("Back", "Go back", "setState", ["start"])

func petted():
	saynn("You pet the cat.")
	saynn("The cat purrs.")
	
	addButton("Back", "Go back", "setState", ["start"])
