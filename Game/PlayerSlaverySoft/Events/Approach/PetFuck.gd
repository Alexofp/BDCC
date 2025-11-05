extends NpcOwnerEventBase

var sexSatisfaction:float = 1.0

func _init():
	id = "PetFuck"
	reactsToTags = [E_APPROACH]
	eventWeight = 0.5
	eventMinLevel = 0
	eventTags = {NOET.OwnerSex: 1.0, NOET.Petplay: 1.0}

func start():
	playAnimation(StageScene.Grope, "tease", {npc=getOwnerID()})
	saynn("{npc.name} approaches you, holding puppy restraints in {npc.his} hands!")
	talkModularOwnerToPC("SoftSlaveryPetFuck") # I wanna have some fun with my {npc.npcSlave}. Hold this while I secure this bitchsuit on you.
	saynn("Looks like {npc.he} {npc.verb('want')} to make you wear a bitchsuit!")
	
	addButton("Obey", "Allow them to do it", "obey")
	addButton("Resist!", "You're not gonna let them do it", "resist")
	if(canSetLimits()):
		addButton("Yes, but..", "Obey but put limits to what your owner can do to you during sex", "yesbut")
	else:
		addDisabledButton("Yes, but..", "Your relationship hasn't progressed far enough for you to be able to set limits")

func start_do(_id:String, _args:Array):
	if(_id == "obey"):
		setState("obey")
		#checkSubEvent("fuck", "You were about to be restrained by {npc.name}..", [])
	if(_id == "resist"):
		runResist()
	if(_id == "yesbut"):
		runEvent("yesbut", "SetOwnerLimits")
		setState("obey")
	
func obey():
	playAnimation(StageScene.PuppyDuo, "stand", {pc=getOwnerID(), npcBodyState={naked=true}})
	
	saynn("You submit to your owner, allowing {npc.him} to put puppy gear on you!")
	saynn("And now, you are completely helpless..")
	addInfluenceObey(RNG.randf_range(0.05, 0.1))
	addButton("Continue", "See what happens next", "startSex", [getOwnerID(), "pc", SexType.BitchsuitSex, {SexMod.DisableDynamicJoiners:true,SexMod.SubsStartNaked:true}])
	
func obey_sexResult(_sexResult:SexEngineResult):
	sexSatisfaction = _sexResult.getAverageDomSatisfaction()
	setState("afterSex")

func afterSex():
	playAnimation(StageScene.PuppyDuo, "stand", {pc=getOwnerID(), npcBodyState={naked=true}})
	saynn("The sex has ended!")
	if(sexSatisfaction < 0.5):
		talkModularOwnerToPC("SoftSlaveryFuckResultBad") #"That was awful. Are you trying to make me mad, {npc.npcSlave}? Whatever, I will be back soon."
	elif(sexSatisfaction < 0.8):
		talkModularOwnerToPC("SoftSlaveryFuckResultOkay") #"That was okay. Can't you moan a little louder, {npc.npcSlave}? I will be back when I'm horny again."
	else:
		talkModularOwnerToPC("SoftSlaveryFuckResultGood") #"Not bad for a {npc.npcSlave}. I will be back when I'm horny again."
	if(sexSatisfaction > 0.4):
		addInfluenceObey(sexSatisfaction)
	else:
		addInfluenceResist(1.0-sexSatisfaction)
	saynn("Your owner starts taking off the puppy gear from you..")
	addContinue("endEvent")

func saveData() -> Dictionary:
	var data := .saveData()
	
	data["sexSatisfaction"] = sexSatisfaction
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	sexSatisfaction = SAVE.loadVar(_data, "sexSatisfaction", 1.0)
