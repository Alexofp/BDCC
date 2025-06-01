extends SexActivityBase

func _init():
	id = "DomLeashesSub"
	
	activityName = "Grab leash"
	activityDesc = "Grab their leash!"
	activityCategory = ["Humiliate"]

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
	if(!getSub().getInventory().hasEquippedItemWithTag(ItemTag.AllowsEnslaving)):
		return true
	return false

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(!_subInfo.getChar().getInventory().hasEquippedItemWithTag(ItemTag.AllowsEnslaving)):
		return false
	if(_domInfo.getChar().hasBoundArms() || _domInfo.getChar().hasBlockedHands()):
		return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return _domInfo.personalityScore({PersonalityStat.Subby: -0.05}) + _subInfo.getResistScoreSmooth()*0.05

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return []
	if(_indx == SUB_0):
		return [SexActivityTag.Leashed]
	return []

func getCheckTagsDom() -> Array:
	return []

func getCheckTagsSub() -> Array:
	return [SexActivityTag.Leashed]

func startActivity(_args):
	addText("{dom.You} {dom.youVerb('clip')} a leash to {sub.your} collar!")

func processTurn():
	return
	
func getActions(_indx:int):
	if(_indx == DOM_0):
		addAction("stop", 0.0, "Remove leash", "Stop leashing them", {A_CATEGORY: ["Humiliate"]})
		if(!getSubInfo().isUnconscious()):
			var yankScore:float = getDomInfo().getIsAngryScore() * 1.0 * max(0.1, 0.1 + getDomInfo().personalityScore({PersonalityStat.Mean: 1.0})) - getSubInfo().getAboutToPassOutScore() * getDomInfo().fetishScore({Fetish.UnconsciousSex: -1.0})
			addAction("yank", yankScore, "Yank leash", "Yank on that leash hard!", {A_CATEGORY: ["Violence"]})
	#if(_indx == SUB_0):
	#	addAction("pullaway", getSubInfo().getResistScore(), "Pull away", "Try to pull away", {A_CHANCE: getSubResistChance(30.0, 25.0)})

func doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "stop"):
		endActivity()
		addText("{dom.You} {dom.youVerb('unclip')} the leash from {sub.your} collar.")
		return 
	if(_id == "yank"):
		addText("{dom.You} {dom.youVerb('yank')} on {sub.your} leash [b]hard[/b], choking {sub.youHim}.")
		choke(DOM_0, SUB_0, CHOKE_VERYHARD)
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
	
func getLeashes() -> Dictionary:
	return {
		DOM_0: SUB_0,
	}

func saveData():
	var data = .saveData()
	
	#data["tick"] = tick

	return data
	
func loadData(data):
	.loadData(data)
	
	#tick = SAVE.loadVar(data, "tick", 0)
