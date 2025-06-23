extends SexActivityBase

var isThrusting:bool = false

func _init():
	id = "SexPawjob"
	
	activityName = "Pawjob"
	activityDesc = "Humiliate the sub by making them cum with your feet/hind paws"
	activityCategory = ["Humiliate"]

func getVisibleName() -> String:
	if(GM.pc):
		if(GM.pc.bodypartHasTrait(BodypartSlot.Legs, PartTrait.LegsPlanti)):
			return "Footjob"
	return activityName

func getGoals():
	return {
		SexGoal.Pawjob: 1.0,
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		#SexType.StocksSex: true,
		#SexType.SlutwallSex: true,
	}

func isActivityImpossibleShouldStop() -> bool:
	if(!getSub().hasReachablePenis()):
		return true
	if(getSubInfo().isUnconscious()):
		return true
	return false

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(!_subInfo.getChar().hasReachablePenis()):
		return false
	if(_subInfo.isUnconscious()):
		return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return [SexActivityTag.HavingSex]
	if(_indx == SUB_0):
		return [SexActivityTag.HavingSex, SexActivityTag.PenisUsed, SexActivityTag.PreventsSubTeasing]
	return []

func getCheckTagsDom() -> Array:
	return [SexActivityTag.HavingSex]

func getCheckTagsSub() -> Array:
	return [SexActivityTag.HavingSex, SexActivityTag.PenisUsed]

func startActivity(_args):
	addText("{dom.You} {dom.youVerb('sit')} down and {dom.youVerb('reach', 'reaches')} {dom.yourHis} {dom.feet} out towards {sub.your} crotch!")
	
	stimulate(DOM_0, S_LEGS, SUB_0, S_PENIS, I_TEASE, Fetish.FeetplayGiving)
	
	react(SexReaction.PawjobStart)

func processTurn():
	return

func pawjob_processTurn():
	stimulate(DOM_0, S_LEGS, SUB_0, S_PENIS, I_NORMAL, Fetish.FeetplayGiving, SPEED_SLOW if !isThrusting else SPEED_MEDIUM)
	if(isThrusting):
		addTextPick([
			"{sub.You} {sub.youVerb('thrust')} {sub.yourHis} {sub.penisType} between the {dom.feet}.",
			"{sub.You} eagerly {sub.youVerb('thrust')} {sub.yourHis} {sub.penisType} between the {dom.feet}.",
		])
	rubWithFeet(DOM_0, SUB_0, S_PENIS)
	react(SexReaction.PawjobHappens, [20, 10])
	
	
func getActions(_indx:int):
	if(_indx == DOM_0):
		addAction("stop", getStopScore(), "Stop "+getVisibleName(), "Stop the humiliation")
		
		if(state == ""):
			if(hasBodypartUncovered(SUB_0, S_PENIS)):
				addAction("stroke", getContinueSexScore(DOM_0, SUB_0, S_PENIS, S_LEGS), "Stroke cock", "Begin stroking the sub's penis with your feet/hind paws")
		if(state == "pawjob"):
			addAction("pause", getPauseSexScore(DOM_0, SUB_0, S_PENIS, S_LEGS), "Pause stroking", "Pause the stroking")
			addAction("rubballs", 0.1, "Rub balls", "Rub the sub's balls with your feet!")
			addAction("squeeze", getDomInfo().getSadisticActionStore(), "Squeeze cock!", "Painfully squeeze that cock between your feet")
			
	if(_indx == SUB_0):
		addAction("pullaway", getSubInfo().getResistScore(), "Pull away", "Try to pull away", {A_CHANCE: getSubResistChance(30.0, 25.0)})
		if(state == "pawjob"):
			if(isReadyToCumHandled(SUB_0)):
				addAction("subcum", 1.0, "Cum!", "You're about to cum", {A_PRIORITY: 1001})
			if(!isThrusting):
				addAction("subthrust", fetish(SUB_0, Fetish.FeetplayReceiving)*0.5, "Thrust!", "Begin thrusting your cock between their legs.")
		
func doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "stop"):
		endActivity()
		addText("{dom.You} pulled {dom.yourHis} legs away.")
		return 
	if(_id == "stroke"):
		state = "pawjob"
		addText("{dom.You} gently {dom.youVerb('wrap')} {dom.yourHis} {dom.feet} around {sub.yourHis} member.")
		return
	if(_id == "squeeze"):
		addText("{dom.You} suddenly {dom.youVerb('close')} {dom.yourHis} {dom.feet} around {sub.yourHis} {sub.penisShort}, [b]squeezing it hard[/b]!")
		strike(DOM_0, SUB_0, STRIKE_NORMAL)
		# ow ow
		return
	if(_id == "rubballs"):
		cupballs(DOM_0, SUB_0, " using {dom.yourHis} {dom.feet}")
		stimulate(DOM_0, S_LEGS, SUB_0, S_PENIS, I_NORMAL, Fetish.FeetplayGiving, SPEED_SLOW)
		react(SexReaction.PawjobStart, [30, 10])
		return
		
	if(_id == "pause"):
		state = ""
		isThrusting = false
		addText("{dom.You} {dom.youVerb('decide')} to take a pause.")
		return
	
	if(_id == "subcum"):
		cumOnto(SUB_0, DOM_0, {"generic": true, "uniqueOrgasm": UniqueOrgasm.Feet})
		state = ""
		satisfyGoals()
		return
	if(_id == "subthrust"):
		isThrusting = true
		addText("{sub.You} {sub.youVerb('begin', 'began')} thrusting {sub.yourHis} hips forward!")
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
	if(state == "pawjob"):
		if(isThrusting):
			if(isCloseToCumming(SUB_0)):
				return [StageScene.SexPawjob, "thrustfast", {pc=SUB_0, npc=DOM_0, bodyState={hard=true}}]
			return [StageScene.SexPawjob, "thrust", {pc=SUB_0, npc=DOM_0, bodyState={hard=true}}]
		if(isCloseToCumming(SUB_0)):
			return [StageScene.SexPawjob, "fast", {pc=SUB_0, npc=DOM_0, bodyState={hard=true}}]
		return [StageScene.SexPawjob, "sex", {pc=SUB_0, npc=DOM_0, bodyState={hard=true}}]
	return [StageScene.SexPawjob, "tease", {pc=SUB_0, npc=DOM_0}]

func getAnimationPriority():
	return 10

func getOrgasmHandlePriority(_indx:int) -> int:
	if(_indx == SUB_0):
		return 10
	return -1

func saveData():
	var data = .saveData()
	
	data["isThrusting"] = isThrusting

	return data
	
func loadData(data):
	.loadData(data)
	
	isThrusting = SAVE.loadVar(data, "isThrusting", false)
