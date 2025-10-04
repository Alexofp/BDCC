extends NpcOwnerEventBase

func _init():
	id = "Intro"

func onStart(_args:Array):
	setState("start")

func start():
	playAnimation(StageScene.HangingDuo, "stand", {npc=getOwnerID()})
	
	if(isOwnerStaff()):
		setLocation(LOC_SOLITARY)
		saynn("You wake up.. hanging above the floor by your wrists.. in a small dark cell..")
		saynn("One of the walls.. is made out of thick glass. Behind it.. a figure.")
		talkModularOwnerToPC("SoftSlaveryIntro1") # You're up? Good.
		saynn("This doesn't look good..")
		saynn("The figure enters the cell and approaches you. It's {npc.name}.")
		talkModularOwnerToPC("SoftSlaveryIntro2") # You are now my slave. Undestand?
		saynn("Right.. You're unsure how to react to that.")
		talkModularOwnerToPC("SoftSlaveryIntro3") # You will do as I say or we will have a problem
		saynn("It sure doesn't seem like you have much of a choice..")
	else:
		setLocation(getOwnerHomeLoc())
		saynn("You wake up.. hanging above the floor by your wrists.. in a cell..")
		saynn("The more you look at it.. the more you realize.. this isn't your cell.")
		saynn("Someone walks in..")
		talkModularOwnerToPC("SoftSlaveryIntro1") # You're up? Good.
		saynn("This doesn't look good..")
		saynn("The figure approaches you. It's {npc.name}.")
		talkModularOwnerToPC("SoftSlaveryIntro2") # You are now my slave. Undestand?
		saynn("Right.. You're unsure how to react to that.")
		talkModularOwnerToPC("SoftSlaveryIntro3") # You will do as I say or we will have a problem
		saynn("It sure doesn't seem like you have much of a choice..")
	
	addContinue("setState", ["nearcellblock"])
	
func nearcellblock():
	playAnimation(StageScene.Duo, "stand", {npc=getOwnerID(), bodyState={leashedBy=getOwnerID()}})
	setLocation(LOC_CELLBLOCK_MIDDLE)
	
	saynn("After a brief.. introduction.. your new owner clicks a leash to your collar and walks you back to the cellblock.")
	talkModularOwnerToPC("SoftSlaveryIntroEND")# I will be checking on you ever so often. Don't forget who you belong to.
	saynn("Looks like {npc.he} {npc.is}n't gonna keep you in {npc.his} {npc.cell} all day long.. it's not like you can escape this place anyway.")
	addContinue("endEvent")
