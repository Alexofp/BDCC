extends NpcOwnerEventBase

var sexSatisfaction:float = 1.0
var resultText:String = ""

func _init():
	id = "TaskFuckOwner"
	reactsToTags = [E_APPROACH]
	eventWeight = 0.5
	eventMinLevel = 0
	eventTags = {NOET.SubbyOwner: 1.0, NOET.Tasks: 0.5}

func getSubEventScore(_event, _tag:String, _args:Array) -> float:
	if(_event.ownerPersonality(PersonalityStat.Subby) < 0.0):
		return 0.0
	return .getSubEventScore(_event, _tag, _args)

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	var theNpcOwner := getNpcOwner()

	if(theNpcOwner.hasGivenPCAnyTasks()):
		return false
	genTasks()
	if(!theNpcOwner.hasGivenPCOwnerTasks()):
		theNpcOwner.clearOwnerTasks()
		return false
	return true

func genTasks():
	var theNpcOwner := getNpcOwner()
	if(RNG.chance(50)):
		theNpcOwner.generateOwnerTasks(2, 1.5, 3.0) # 2 hard task
	else:
		theNpcOwner.generateOwnerTasks(3, 1.0, 1.5) # 3 simple tasks

func start():
	playAnimation(StageScene.Grope, "tease", {npc=getOwnerID()})
	saynn("Your owner {npc.name} approaches you, looking a little.. shy.")
	talkModularOwnerToPC("SoftSlaveryTaskFuckOwner")
	saynn("Looks like {npc.he} {npc.verb('want')} to submit to you.. for a bit. Your owner lists what {npc.he} {npc.verb('want')} you to do with {npc.him} during sex.")
	
	sayOwnerTaskInfo("{npc.name} wants you to do this to {npc.him}:")
	
	saynn("{npc.He} will probably get angry if you don't do it all..")
	
	addButton("Accept", "Try to do it", "obey")
	addButton("Resist!", "You're not gonna do it", "resist")
	addButton("Different?", "Ask the owner to give you different tasks", "askDifferent")
	
	
func start_do(_id:String, _args:Array):
	if(_id == "obey"):
		setState("obey")
		#checkSubEvent("fuck", "You were about to start fucking {npc.name}..", [])
	if(_id == "resist"):
		getNpcOwner().clearOwnerTasks()
		runResist()
	if(_id == "askDifferent"):
		genTasks()
	
func obey():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER), npcAction="kneel"})
	
	saynn("You agree.. and so.. Your owner submits to you!")
	saynn("Time to have some fun.")
	#addInfluenceObey(RNG.randf_range(0.05, 0.1))
	addButton("Continue", "See what happens next", "startSex", ["pc", getRoleID(C_OWNER), SexType.DefaultSex, {}])
	
func obey_sexResult(_sexResult:SexEngineResult):
	if(_sexResult.isSubUnconscious(getOwnerID())):
		getNpcOwner().clearOwnerTasks()
		setState("madeDomUncon")
		return
	
	getNpcOwner().checkIfOwnerTasksGotCompleted()
	resultText = getOwnerTaskInfo()
	sexSatisfaction = _sexResult.getAverageDomSatisfaction()
	if(getNpcOwner().isEveryOwnerTaskCompleted()):
		setState("afterSex")
	else:
		setState("failedSex")
	getNpcOwner().clearOwnerTasks()

func afterSex():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("The sex has ended!")
	saynn(resultText)
	talkModularOwnerToPC("SoftSlaveryTaskFuckOwnerGood")
	saynn("It looks like your owner is satisfied!")
	addInfluenceObey()
	addContinue("endEvent")

func failedSex():
	playStand()
	saynn("The sex has ended!")
	saynn(resultText)
	talkModularOwnerToPC("SoftSlaveryTaskFuckOwnerBad")
	saynn("Looks like your owner isn't satisfied with your actions..")
	addButton("Obey", "Accept the punishment", "punish")
	addButton("Resist!", "You're not gonna just accept the punishment", "resist")

func madeDomUncon():
	playAnimation(StageScene.SexStart, "defeated", {npc=getOwnerID()})
	saynn("Oops, looks like your owner is weaker than you thought. Or maybe you did it on purpose..")
	saynn("Either way, {npc.he} won't be able to punish you even if {npc.he} wanted to!")
	addInfluenceResist()
	addContinue("endEventOwnerUncon")

func madeDomUncon_do(_id:String, _args:Array):
	if(_id == "endEventOwnerUncon"):
		var theOwnerID:String = getOwnerID()
		endEvent()
		stopRunner()
		GM.main.IS.startInteraction("Unconscious", {main=theOwnerID})

func failedSex_do(_id:String, _args:Array):
	if(_id == "punish"):
		runPunishment()
	if(_id == "resist"):
		runResist()

func saveData() -> Dictionary:
	var data := .saveData()
	
	data["sexSatisfaction"] = sexSatisfaction
	data["resultText"] = resultText
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	sexSatisfaction = SAVE.loadVar(_data, "sexSatisfaction", 1.0)
	resultText = SAVE.loadVar(_data, "resultText", "")
