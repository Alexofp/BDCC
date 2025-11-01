extends NpcOwnerEventBase

var sexSatisfaction:float = 1.0

func _init():
	id = "AskFuckOwner"

func onStart(_args:Array):
	#freedomPrice = getFreedomPrice()
	#setSubResult(SUB_CONTINUE)
	pass

func start():
	playAnimation(StageScene.Duo, "stand", {npc=getOwnerID(), npcAction="kneel"})
	saynn("You ask {npc.name} if you can fuck {npc.him}.")
	talkModularOwnerToPC("SoftSlaveryAskFuckOwner") #Hm. Alright. But only because I want it.
	saynn("Your owner submits, kneeling in front of you!")
	
	addButton("Continue", "See what happens next", "startSex", ["pc", getOwnerID(), SexType.DefaultSex, {}])

func start_sexResult(_sexResult:SexEngineResult):
	if(_sexResult.isSubUnconscious(getOwnerID())):
		setState("domBlackedOut")
		return
	sexSatisfaction = _sexResult.getAverageSubSatisfaction()
	setState("afterSex")

func domBlackedOut():
	playAnimation(StageScene.SexStart, "defeated", {npc=getOwnerID()})
	saynn("Oops, looks like your owner is weaker than you thought. Oh well.")
	addContinue("endEventOwnerUncon")

func domBlackedOut_do(_id:String, _args:Array):
	if(_id == "endEventOwnerUncon"):
		var theOwnerID:String = getOwnerID()
		endEvent()
		stopRunner()
		GM.main.IS.startInteraction("Unconscious", {main=theOwnerID})

func afterSex():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("The sex has ended!")
	if(sexSatisfaction < 0.5):
		talkModularOwnerToPC("SoftSlaveryAskFuckOwnerBad") #"That was awful. I'm a subby bitch but even I can top better!"
	elif(sexSatisfaction < 0.8):
		talkModularOwnerToPC("SoftSlaveryAskFuckOwnerOkay") #"That was okay, I guess. Are you sure you're able to top?"
	else:
		talkModularOwnerToPC("SoftSlaveryAskFuckOwnerGood") #"Not bad, that scratched the itch. Thanks, {npc.npcSlave}."
	#if(sexSatisfaction > 0.4):
	#	addInfluenceObey(sexSatisfaction)
	#else:
	#	addInfluenceResist(1.0-sexSatisfaction)
	addContinue("endEvent")

func saveData() -> Dictionary:
	var data := .saveData()
	
	data["sexSatisfaction"] = sexSatisfaction
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	sexSatisfaction = SAVE.loadVar(_data, "sexSatisfaction", 1.0)
