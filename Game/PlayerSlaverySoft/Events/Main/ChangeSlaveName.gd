extends NpcOwnerEventBase

func _init():
	id = "ChangeSlaveName"

func onStart(_args:Array):
	setSubResult(SUB_CONTINUE)

func start():
	playStand()
	saynn("You ask your owner if {npc.he} can start calling you differently.")
	talk(C_OWNER, "How should I call my {npc.npcSlave} then?")
	saynn("Choose your new nickname.")
	
	addButton("CANCEL", "You changed your mind", "endEvent")
	var theNpcOwner := getNpcOwner()
	if(!theNpcOwner):
		return
	for nickname in theNpcOwner.getPossiblePCNames():
		addButton(nickname, "Choose this nickname", "setNickname", [nickname])

func start_do(_id:String, _args:Array):
	var theNpcOwner := getNpcOwner()
	if(theNpcOwner):
		theNpcOwner.setPCName(_args[0])
	setState("afterNamed")
	
func afterNamed():
	saynn("You tell your owner which name you would like {npc.him} to use.")
	talk(C_OWNER, "Alright. You will now be my {npc.npcSlave}.")
	addContinue("endEvent")
