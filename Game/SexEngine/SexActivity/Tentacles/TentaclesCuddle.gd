extends SexActivityBase
var waitTimer:int = 0

func _init():
	id = "TentaclesCuddle"
	
	activityName = "Cuddle"
	activityDesc = "Make them feel good"
	activityCategory = []

func getGoals():
	return {
		SexGoal.Cuddle: 1.0,
	}

func getSupportedSexTypes():
	return {
		SexType.TentaclesSex: true,
	}

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	#if(!_subInfo.getChar().hasReachablePenis() && !_subInfo.getChar().hasReachableVagina()):
	#if(!_subInfo.getChar().hasReachablePenis()):
	#	return false
	#if(_domInfo.getChar().isOralBlocked()):
	#	return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return [SexActivityTag.HavingSex]
	if(_indx == SUB_0):
		return [SexActivityTag.HavingSex]
	return []

func getCheckTagsDom() -> Array:
	return [SexActivityTag.OrderedToDoSomething, SexActivityTag.HavingSex]

func getCheckTagsSub() -> Array:
	return [SexActivityTag.OrderedToDoSomething, SexActivityTag.HavingSex]

func isActivityImpossibleShouldStop() -> bool:
	return false

func startActivity(_args):
	addText("The tentacles grab {sub.you} and start cuddling with {sub.youHim}!")

func addSoftSlaveryTentaclesTalk(_text:String):
	#if(true):
	#	addTextRaw("\n\n[say="+getDomID()+"]"+_text+"[/say]\n\n")
	#	return
	
	var theTentaclesChar := getDom()
	if(theTentaclesChar && theTentaclesChar.has_method("tentaclesProcessTalk")):
		_text = theTentaclesChar.tentaclesProcessTalk(_text)
	
	if(_text.empty()):
		return
	addTextRaw("\n\n[say="+getDomID()+"]"+_text+"[/say]\n\n")

func processTurn():
	waitTimer += 1
	if(waitTimer >= 3 && RNG.chance(50)):
		waitTimer = 0
		satisfyGoals()
	
	addTextPick([
		"The tentacles softly pillow {sub.your} body, offering a comfy rest.",
		"The tentacles hold {sub.you} close, their grip firm and warm.",
		"A warm tentacle strokes slowly up and down {sub.your} back.",
		"The tentacles cuddle {sub.you} gently.",
		"The tentacles embrace {sub.your} body, curling around {sub.yourHis} limbs.",
		"The tentacles shift gently, keeping {sub.you} comfortably tucked in.",
		"A soft tentacle strokes over {sub.your} shoulder.",
	])
	if(waitTimer < 3):
		addSoftSlaveryTentaclesTalk(RNG.pick([
			"The stars fascinate us.",
			"We thank you for being near us.",
			"We wish for you to feel comfortable.",
			"Thank you for being here with us.",
			"We wonder how big this world is.",
			"Could there be others like us in the world?",
			"This room is cold. And yet, we feel warm.",
			"We are glad you are not afraid of us.",
			"We feel calm when you are near.",
			"Your warmth feels nice.",
			"Do the stars make patterns, or do we imagine them?",
			"We have wondered about the taste of sunlight.",
			"The world outside seems very far away now.",
			"We think we could rest like this for a long time.",
			"Do you ever listen to the silence?",
		]))
		
		addText("The tentacles seem to want to cuddle {sub.youHim} a bit more.")
	getSub().addStamina(10)
	getSub().addPain(-10)
	getDomInfo().addAnger(-0.05)
	getSubInfo().addFear(-0.05)
	if(getSubInfo().getConsciousness() > 0.0):
		getSubInfo().addConsciousness(0.05)

func getActions(_indx:int):
	if(_indx == DOM_0):
		addAction("stop", getStopScore(), "Stop cuddle", "Stop cuddling")
	
	if(_indx == SUB_0):
		addAction("pullaway", getResistScore(SUB_0), "Pull away", "Try to pull away", {A_CHANCE: getResistChance(SUB_0, DOM_0, RESIST_ORAL_FOCUS, 30.0, 25.0)})

func doAction(_indx:int, _id:String, _action:Dictionary):

	if(_id == "stop"):
		endActivity()
		addText("The tentacles stop cuddling {sub.you}.")

	if(_id == "pullaway"):
		var successChance:float = getResistChance(SUB_0, DOM_0, RESIST_ORAL_FOCUS, 30.0, 25.0)
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
			reactSub(SexReaction.ActivelyResisting, [50])
			return



func getAnimation():
	return [StageScene.TentaclesCuddle, "cuddle", {pc=SUB_0}]

func saveData():
	var data = .saveData()
	
	data["waitTimer"] = waitTimer

	return data
	
func loadData(data):
	.loadData(data)
	
	waitTimer = SAVE.loadVar(data, "waitTimer", 0)
