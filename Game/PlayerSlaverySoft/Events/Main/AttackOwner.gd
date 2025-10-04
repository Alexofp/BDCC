extends NpcOwnerEventBase

func _init():
	id = "AttackOwner"

func onStart(_args:Array):
	setSubResult(SUB_END)

func start():
	playStand()
	saynn("You decide to attack your owner!")
	talkModularOwnerToPC("SoftSlaveryAttackReaction") #You're gonna regret it.
	
	addButton("Fight", "Start the fight", "startFight", [getOwnerID()])
	
func start_fightResult(_didWin:bool):
	if(_didWin):
		setState("pcWon")
	else:
		setState("pcLost")

func pcWon():
	playAnimation(StageScene.Duo, "stand", {npc=getOwnerID(), npcAction="kneel"})
	saynn("You won the fight! Your weakened owner is on {npc.his} knees in front of you.")
	talkModularOwnerToPC("SoftSlaveryAttackLost") #"Ugh.. so? You're still my {npc.npcSlave}."
	addInfluenceResist()
	saynn("{npc.name}'s influence over you has decreased!")
	
	addContinue("endEvent")

func pcLost():
	playAnimation(StageScene.Duo, "kneel", {npc=getOwnerID()})
	saynn("You have lost the fight against your owner.")
	talkModularOwnerToPC("SoftSlaveryAttackWon") #"And now.. I'm gonna punish you."
	saynn("Now you will have to endure what they have in mind for you.")
	addContinue("startPunish")

func pcLost_do(_id:String, _args:Array):
	if(_id == "startPunish"):
		runPunishment()
