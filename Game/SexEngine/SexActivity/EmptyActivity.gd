extends SexActivityBase

func _init():
	id = "EmptyActivity"
	
	activityName = "Change me"
	activityDesc = "Change me too"
	activityCategory = ["Fuck"]

func getGoals():
	return {
		#SexGoal.SubUndressSub: 1.0,
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		#SexType.StocksSex: true,
		#SexType.SlutwallSex: true,
	}

func isActivityImpossibleShouldStop() -> bool:
	return false

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(true):
		return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return []
	if(_indx == SUB_0):
		return []
	return []

func getCheckTagsDom() -> Array:
	return []

func getCheckTagsSub() -> Array:
	return []

func startActivity(_args):
	addText("Change me.")

func processTurn():
	return
	
func getActions(_indx:int):
	if(_indx == DOM_0):
		addAction("stop", getStopScore(), "Stop", "Stop the sex activity")
	if(_indx == SUB_0):
		addAction("pullaway", getSubInfo().getResistScore(), "Pull away", "Try to pull away", {A_CHANCE: getSubResistChance(30.0, 25.0)})

func doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "stop"):
		endActivity()
		addText("{dom.You} pulled away.")
		return 

	if(_id == "pullaway"):
		var successChance:float = getSubResistChance(30.0, 25.0)
		if(RNG.chance(successChance)):
			addText("{sub.You} {sub.youVerb('pull')} away from {dom.you}.")
			getDomInfo().addAnger(0.3)
			if(getState() != ""):
				setState("")
			else:
				endActivity()
			return
		else:
			addText("{sub.You} {sub.youVerb('try', 'tries')} to pull away from {dom.you} but {sub.youVerb('fail')}.")
			getDomInfo().addAnger(0.1)
			return
			
func getSubResistChance(baseChance:float, domAngerRemoval:float) -> float:
	var theChance = baseChance - getDomInfo().getAngerScore()*domAngerRemoval
	if(getSub().hasBlockedHands()):
		theChance *= 0.5
	if(getSub().hasBoundArms()):
		theChance *= 0.5
	if(getSub().isBlindfolded()):
		theChance *= 0.8
	
	return max(theChance, 5.0)

func getAnimation():
	return [StageScene.Duo, "stand", {pc=SUB_0, npc=DOM_0, npcAction="stand"}]

func getAnimationPriority():
	return 10

func getOrgasmHandlePriority(_indx:int) -> int:
	return -1

func saveData():
	var data = .saveData()
	
	#data["tick"] = tick

	return data
	
func loadData(data):
	.loadData(data)
	
	#tick = SAVE.loadVar(data, "tick", 0)
