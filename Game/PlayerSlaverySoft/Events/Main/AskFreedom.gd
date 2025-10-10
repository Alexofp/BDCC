extends NpcOwnerEventBase

var freedomPrice:int = 0

func _init():
	id = "AskFreedom"

func onStart(_args:Array):
	freedomPrice = getFreedomPrice()
	setSubResult(SUB_CONTINUE)

func start():
	playStand()
	saynn("You ask your owner if {npc.he} can let you go.")
	
	if(freedomPrice <= 0):
		talkModularOwnerToPC("SoftSlaveryAskedFreedom") #"I guess I can. No point in me bugging you any further, you already know that you are my {npc.npcSlave}. Do you really want that though?"
		saynn("You ask if that means that you don't have to pay anything. {npc.He} {npc.verb('nod')}.")
		saynn("Do your want {npc.name} to stop being your owner?")
	
		addButton("CANCEL", "You changed your mind", "endEvent")
		addButton("Yes", "Ask them to stop being your owner", "commit")
	else:
		talkOwner(getModularDialogue(C_OWNER, C_PC, "SoftSlaveryAskedFreedomPay").replace("<CREDITS>", str(freedomPrice)+" credits"))
		saynn("Looks like it's gonna cost you..")
		
		addButton("Cancel", "You changed your mind", "endEvent")
		if(GM.pc.getCredits() >= freedomPrice):
			addButton("Pay", "Pay your owner "+str(freedomPrice)+" credits to become free again", "doPay")
		else:
			addDisabledButton("Pay", "You don't have this much credits..")
		
func start_do(_id:String, _args:Array):
	if(_id == "commit"):
		setState("committed")
	if(_id == "doPay"):
		GM.pc.addCredits(-freedomPrice)
		GM.main.addMessage("You paid "+str(freedomPrice)+" credits for your freedom!")
		setState("committed")
	
func committed():
	if(freedomPrice <= 0):
		saynn("You tell your owner that you do want that.")
		talkModularOwnerToPC("SoftSlaveryAskedFreedomEND") #Alright, well. Go away then.
		saynn("That was easy..")
	else:
		saynn("You hand your owner a credit chip with a hefty sum on it.")
		saynn("{npc.name} takes a quick look at it and then puts it away.")
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

func getFreedomPrice() -> int:
	var theNpcOwner := getNpcOwner()
	if(!theNpcOwner):
		return 0
	return theNpcOwner.calcFreedomPrice()

func saveData() -> Dictionary:
	var data := .saveData()
	
	data["freedomPrice"] = freedomPrice
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	freedomPrice = SAVE.loadVar(_data, "freedomPrice", 0)
