extends NpcOwnerEventBase

func _init():
	id = "AskFreedom"

func onStart(_args:Array):
	setSubResult(SUB_CONTINUE)

func start():
	playStand()
	saynn("You ask your owner if {npc.he} can let you go.")
	talkModularOwnerToPC("SoftSlaveryAskedFreedom") #"I guess I can. No point in me bugging you any further, you already know that you are my {npc.npcSlave}. Do you really want that though?"
	saynn("Do your want {npc.name} to stop being your owner?")
	
	addButton("CANCEL", "You changed your mind", "endEvent")
	addButton("Yes", "Ask them to stop being your owner", "commit")

func start_do(_id:String, _args:Array):
	if(_id == "commit"):
		setState("committed")
	
func committed():
	saynn("You tell your owner that you do want that.")
	talkModularOwnerToPC("SoftSlaveryAskedFreedomEND") #Alright, well. Go away then.
	saynn("That was easy..")
	addContinue("doEndEveything")

func committed_do(_id:String, _args:Array):
	if(_id == "doEndEveything"):
		var theNpcOwner := getNpcOwner()
		stopRunner()
		endEvent()
		if(theNpcOwner):
			theNpcOwner.endSlavery()
