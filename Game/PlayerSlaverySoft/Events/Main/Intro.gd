extends NpcOwnerEventBase

var isWilling:bool = false

func _init():
	id = "Intro"

func onStart(_args:Array):
	if(_args.size() > 0 && _args[0] == "willing"):
		isWilling = true
	setState("start")

func start():
	playAnimation(StageScene.HangingDuo, "stand", {npc=getOwnerID()})
	
	if(isOwnerStaff()):
		setLocation(LOC_SOLITARY)
		
		if(!isWilling):
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
			saynn("You get brought into the solitary confinement area.. {npc.name} grabs your wrists and cuffs them high above your head..")
			talkModularOwnerToPC("SoftSlaveryIntro1Willing") # Now let's talk.
			saynn("This is exciting..")
			saynn("{npc.name} grabs your chin and makes you look at {npc.him}.")
			talkModularOwnerToPC("SoftSlaveryIntro2") # You are now my slave. Undestand?
			saynn("You nod.")
			talkModularOwnerToPC("SoftSlaveryIntro3") # You will do as I say or we will have a problem
			saynn("It sure doesn't seem like you have much of a choice.. good.")
	else:
		setLocation(getOwnerHomeLoc())
		
		if(!isWilling):
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
		else:
			saynn("You get brought into a little cell.. {npc.name} grabs your wrists and cuffs them high above your head..")
			talkModularOwnerToPC("SoftSlaveryIntro1Willing") # Now let's talk.
			saynn("This is exciting..")
			saynn("{npc.name} grabs your chin and makes you look at {npc.him}.")
			talkModularOwnerToPC("SoftSlaveryIntro2") # You are now my slave. Undestand?
			saynn("You nod.")
			talkModularOwnerToPC("SoftSlaveryIntro3") # You will do as I say or we will have a problem
			saynn("It sure doesn't seem like you have much of a choice.. good.")
	
	addContinue("setState", ["nearcellblock"])
	
func nearcellblock():
	playAnimation(StageScene.Duo, "stand", {npc=getOwnerID(), bodyState={leashedBy=getOwnerID()}})
	setLocation(LOC_CELLBLOCK_MIDDLE)
	
	saynn("After a brief.. introduction.. your new owner clicks a leash to your collar and walks you back to the cellblock.")
	talkModularOwnerToPC("SoftSlaveryIntroEND")# I will be checking on you ever so often. Don't forget who you belong to.
	saynn("Looks like {npc.he} {npc.is}n't gonna keep you in {npc.his} {npc.cell} all day long.. it's not like you can escape this place anyway.")
	if(onlyOnce()):
		var theNpcOwner := getNpcOwner()
		if(theNpcOwner):
			theNpcOwner.checkNextApproachDay()
	addContinue("endEvent")

func saveData() -> Dictionary:
	var data := .saveData()
	
	data["isWilling"] = isWilling
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	isWilling = SAVE.loadVar(_data, "isWilling", false)
