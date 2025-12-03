extends NpcOwnerEventBase

#var creditsAmount:int = 10

func _init():
	id = "OfferGearUnlock"
	reactsToTags = [E_APPROACH]
	
	eventWeight = 999993.9

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	var theNpcOwner := getNpcOwner()
	
	if(theNpcOwner.ownerOfferedUnlock || !theNpcOwner.hasOwnerLock() || !theNpcOwner.checkReadyToUnlockOwnerLock()):
		return false
	
	theNpcOwner.ownerOfferedUnlock = true
	return true

func start():
	playStand()
	saynn("Your owner walks up to you and smiles, {npc.his} hand holding a key.")
	talkModularOwnerToPC("SoftSlaveryOfferGearUnlock") #You've been locked for quite a while. Ready to be unlocked?
	saynn("Looks like {npc.he} {npc.verb('want')} to remove key-locked gear..")
	
	addButton("Okay", "Agree to be unlocked", "beUnlocked")
	addButton("Keep it", "Ask the owner to keep it", "keepGear")

func start_do(_id:String, _args:Array):
	if(_id == "beUnlocked"):
		getNpcOwner().unlockOwnerLock()
		setState("afterUnlocked")
	if(_id == "keepGear"):
		setState("askedKeep")

func afterUnlocked():
	playStand()
	saynn("You agree, allowing {npc.name} to use {npc.his} key to unlock your locked gear!")
	talkModularOwnerToPC("SoftSlaveryOfferGearUnlock2") #There you go, much better, right? I'm not done with you yet though.
	saynn("Looks like {npc.he} {npc.verb('want')} to do something else with you..")
	addContinue("startApproach")

func afterUnlocked_do(_id:String, _args:Array):
	if(_id == "startApproach"):
		runEvent("", "Approach")

func askedKeep():
	playStand()
	saynn("You ask {npc.name} to keep the locked gear on you.")
	talkModularOwnerToPC("SoftSlaveryOfferGearUnlockKeep") #Keep it? Sure, why not. It fits you.
	addInfluenceObey(0.2)
	saynn("{npc.He} {npc.verb('put')} the key away.")
	talkModularOwnerToPC("SoftSlaveryOfferGearUnlockKeep2") #Now, I still wanna do something else with you.
	addContinue("startApproach")

func askedKeep_do(_id:String, _args:Array):
	if(_id == "startApproach"):
		runEvent("", "Approach")

func saveData() -> Dictionary:
	var data := .saveData()
	
	#data["creditsAmount"] = creditsAmount
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	#creditsAmount = SAVE.loadVar(_data, "creditsAmount", 10)
