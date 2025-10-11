extends NpcOwnerEventBase

func _init():
	id = "Punish3TestSubject"
	reactsToTags = [E_PUNISH_GET_RID_OF]

func getSubEventScore(_event, _tag:String, _args:Array) -> float:
	return 1.0

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	var npcOwner := getNpcOwner()
	if(!npcOwner):
		return false
	return true
	
func start():
	playAnimation(StageScene.Duo, "stand", {npc=getOwnerID(), bodyState={leashedBy=getOwnerID()}})
	sayPretext()
	saynn("Your owner forcefully clicks a leash to your collar and starts yanking on it.")
	talk(C_OWNER, "You are going with me, {npc.npcSlave}.")
	saynn("{npc.He} sounds quite pissed off..")
	
	addContinue("goToEliza")

func start_do(_id:String, _args:Array):
	if(_id == "goToEliza"):
		involveCharID(C_EXTRA1, "eliza")
		setLocation(LOC_MED_COUNTER)
		setState("nearEliza")
	
func nearEliza():
	playAnimation(StageScene.Duo, "stand", {pc=getOwnerID(), npc="eliza"})
	
	saynn("Soon, you arrive.. to the medical block. {npc.name} approaches the counter.. and get the attention of a feline that is sitting behind it.")
	talk(C_EXTRA1, "Dr. Quinn here, how can I help?")
	talk(C_OWNER, "I think I found a perfect test subject for your studies.")
	saynn("The feline raises her brow and looks over the shoulder of your owner.")
	talk(C_EXTRA1, "Did you? That sounds great.")
	talk(C_OWNER, "Yeah, {pc.he} {pc.isAre} a bit bratty. I'm kinda sick of {pc.him} to be honest. Maybe you will be able to make better use of {pc.him}.")
	saynn("The feline doctor smiles and gets up.")
	talk(C_EXTRA1, "It's a good thing that science doesn't care about brattiness~. And yes, we could always use more test subjects.")
	saynn("She steps from behind the counter and approaches you.")
	talk(C_OWNER, "Here is the leash. You might have to give it a hard pull occasionally. Cuffs will help too.")
	talk(C_EXTRA1, "Don't worry, we have just the right tools to make sure our science projects go smooth~.")
	saynn("The feline takes the leash.. and invites you to follow.")
	saynn("Your owner.. ex-owner.. turns around and just heads for the elevator.")
	
	addContinue("setState", ["elizaTalk"])

func elizaTalk():
	playStand(true, C_EXTRA1, C_PC)
	setLocation("medical_near_pccell")
	
	saynn("The feline doctor brings you somewhere..")
	talk(C_EXTRA1, "Wonder what you did to earn such a punishment.")
	saynn("Suddenly, you feel a prick on your neck.. The girl has injected you with something.")
	talk(C_EXTRA1, "Doesn't matter much~. I will fix you and your bratty behaviour.")
	saynn("And soon.. the cold surface of the floor meets with your sleepy face..")
	addContinue("startTheThing")

func elizaTalk_do(_id:String, _args:Array):
	var npcOwner := getNpcOwner()
	if(npcOwner):
		npcOwner.endSlavery()
	endEvent()
	stopRunner()
	
	GlobalRegistry.getModule("MedicalModule").preparePCForMentalWard()
	GM.main.startNewDay()
	GM.main.runScene("MentalWardScene")
