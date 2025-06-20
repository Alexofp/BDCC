extends SexActivityBase

var orgasmAmount:int = 0
var offerTime:int = 0
var canJustContinue:bool = false

func _init():
	id = "SexPawjobMutual"
	
	activityName = "Mutual pawjob"
	activityDesc = "Humiliate the sub by making them cum with your feet/hind paws. Get some fun in return too!"
	activityCategory = ["Humiliate"]

func getVisibleName() -> String:
	if(GM.pc):
		if(GM.pc.bodypartHasTrait(BodypartSlot.Legs, PartTrait.LegsPlanti)):
			return "Mutual footjob"
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
	if(!getDom().hasReachablePenis() && !getDom().hasReachableVagina()):
		return true
	return false

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(!_subInfo.getChar().hasReachablePenis()):
		return false
	if(_subInfo.isUnconscious()):
		return false
	if(!_domInfo.getChar().hasReachablePenis() && !_domInfo.getChar().hasReachableVagina()):
		return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return [SexActivityTag.HavingSex, SexActivityTag.PenisUsed, SexActivityTag.VaginaUsed]
	if(_indx == SUB_0):
		return [SexActivityTag.HavingSex, SexActivityTag.PenisUsed, SexActivityTag.PreventsSubTeasing]
	return []

func getCheckTagsDom() -> Array:
	return [SexActivityTag.HavingSex, SexActivityTag.PenisUsed, SexActivityTag.VaginaUsed]

func getCheckTagsSub() -> Array:
	return [SexActivityTag.HavingSex, SexActivityTag.PenisUsed]

func startActivity(_args):
	addText("{dom.You} {dom.youVerb('pull')} {sub.you} down to the floor. {dom.YourHis} {dom.feet} are resting near {sub.your} {sub.penisShort}.")
	
	stimulate(DOM_0, S_LEGS, SUB_0, S_PENIS, I_TEASE, Fetish.FeetplayGiving)
	
	react(SexReaction.PawjobStart)

func onSwitchFrom(_otherActivity, _args):
	pass

func getDomHole() -> String:
	if(getDom().hasReachablePenis()):
		return S_PENIS
	if(getDom().hasReachableVagina()):
		return S_VAGINA
	return ""

func processTurn():
	if(offerTime > 0):
		offerTime -= 1
		getDomInfo().addAnger(0.1)
		if(offerTime == 0):
			getDomInfo().addAnger(0.4)
			addText("{dom.You} gave up waiting.")
		

func pawjob_processTurn():
	offerTime = 0
	stimulate(DOM_0, S_LEGS, SUB_0, S_PENIS, I_NORMAL, Fetish.FeetplayGiving, SPEED_MEDIUM)
	stimulate(SUB_0, S_LEGS, DOM_0, getDomHole(), I_NORMAL, Fetish.FeetplayGiving, SPEED_MEDIUM)
	rubWithFeet(DOM_0, SUB_0, S_PENIS)
	rubWithFeet(SUB_0, DOM_0, getDomHole())
	react(SexReaction.PawjobHappens, [20, 10])

func getActions(_indx:int):
	if(_indx == DOM_0):
		addAction("stop", getStopScore(), "Stop "+getVisibleName(), "Stop the fun")
		if(state == ""):
			if(hasBodypartUncovered(SUB_0, S_PENIS) && hasBodypartUncovered(DOM_0, getDomHole())):
				addAction("force", 1.0, "Force pawjob" if !canJustContinue else "Continue pawjob", "Make the sub pleasure you while you pleasure them.", {A_CHANCE: 30.0})
			if(!canJustContinue && offerTime <= 0):
				addAction("offer", 1.0 - getDomInfo().getAngerScore(), "Offer mutual", "Offer a mutual pawjob to the sub!")
		if(state == "pawjob"):
			addAction("pause", getPauseSexScore(DOM_0, SUB_0, S_PENIS, S_LEGS) + getPauseSexScore(DOM_0, SUB_0, getDomHole()), "Pause stroking", "Pause the stroking")
			if(isReadyToCumHandled(DOM_0)):
				addAction("domcum", 1.0, "Cum!", "You're about to cum", {A_PRIORITY: 1001})
		
	if(_indx == SUB_0):
		if(state == ""):
			if(offerTime > 0):
				addAction("agree", getComplyScore(SUB_0), "Agree", "Begin to do mutual fun with the dom")
		addAction("pullaway", getResistScore(SUB_0), "Pull away", "Try to pull away", {A_CHANCE: getSubResistChance(30.0, 25.0)})
		if(state == "pawjob"):
			if(isReadyToCumHandled(SUB_0)):
				addAction("subcum", 1.0, "Cum!", "You're about to cum", {A_PRIORITY: 1001})

func doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "stop"):
		endActivity()
		addText("{dom.You} pulled away.")
		return 
	if(_id == "force"):
		offerTime = 0
		if(canJustContinue):
			state = "pawjob"
			return
		
		if(RNG.chance(30)):
			state = "pawjob"
			getSubInfo().addResistance(0.2)
			addText("{dom.You} [b]{dom.youVerb('manage')} to force[/b] {sub.you} to start using {sub.yourHis} {sub.feet} to pleasure {dom.youHim}!")
		else:
			getSubInfo().addResistance(0.1)
			addText("{dom.You} {dom.youVerb('try', 'tries')} to force {sub.you} to start using {sub.yourHis} {sub.feet} to pleasure {dom.youHim}.")
		return
	if(_id == "agree"):
		offerTime = 0
		state = "pawjob"
		getDomInfo().addAnger(-0.2)
		if(getDom().hasReachablePenis()):
			addText("{sub.You} {sub.youVerb('agree')} to the offer and {sub.youVerb('begin')} teasing {dom.your} {dom.penisShort} with {sub.yourHis} {sub.feet}.")
		else:
			addText("{sub.You} {sub.youVerb('agree')} to the offer and {sub.youVerb('begin')} teasing {dom.your} {pussy} with {sub.yourHis} {sub.feet}.")
		return
	if(_id == "offer"):
		offerTime = 3
		addText("{dom.You} {dom.youVerb('offer')} {sub.you} to start pleasuring each other with legs.")
		return
	if(_id == "pause"):
		state = ""
		addText("{dom.You} {dom.youVerb('pause')} the action.")
		canJustContinue = true
		return
	if(_id == "pullaway"):
		var successChance:float = getSubResistChance(30.0, 25.0)
		if(RNG.chance(successChance)):
			addText("{sub.You} {sub.youVerb('pull')} away from {dom.you}.")
			getDomInfo().addAnger(0.3)
			if(getState() != ""):
				setState("")
				canJustContinue = false
			else:
				endActivity()
			return
		else:
			addText("{sub.You} {sub.youVerb('try', 'tries')} to pull away from {dom.you} but {sub.youVerb('fail')}.")
			getDomInfo().addAnger(0.1)
			return
	if(_id == "subcum"):
		cumOnto(SUB_0, SUB_0, {"generic": true, "uniqueOrgasm": UniqueOrgasm.Feet})
		#state = ""
		orgasmAmount += 1
		if(orgasmAmount >= 2):
			satisfyGoals()
		return
	if(_id == "domcum"):
		if(getDom().hasReachablePenis()):
			cumOnto(DOM_0, DOM_0, {"generic": true, "uniqueOrgasm": UniqueOrgasm.Feet})
		else:
			squirtOnto(DOM_0, SUB_0, {"generic": true, "uniqueOrgasm": UniqueOrgasm.Feet})
		#state = ""
		orgasmAmount += 1
		if(orgasmAmount >= 2):
			satisfyGoals()
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
		var isAnyoneClose:bool = isCloseToCumming(SUB_0) || isCloseToCumming(DOM_0)
		if(getDomHole() == S_PENIS):
			if(isAnyoneClose):
				return [StageScene.PawJobMutual, "fast", {pc=DOM_0, npc=SUB_0, bodyState={hard=true}, npcBodyState={hard=true}}]
			return [StageScene.PawJobMutual, "sex", {pc=DOM_0, npc=SUB_0, bodyState={hard=true}, npcBodyState={hard=true}}]
		if(isAnyoneClose):
			return [StageScene.PawJobMutual, "rubfast", {pc=DOM_0, npc=SUB_0, bodyState={hard=true}, npcBodyState={hard=true}}]
		return [StageScene.PawJobMutual, "rub", {pc=DOM_0, npc=SUB_0, bodyState={hard=true}, npcBodyState={hard=true}}]

	return [StageScene.PawJobMutual, "tease", {pc=DOM_0, npc=SUB_0}]

func getAnimationPriority():
	return 10

func getOrgasmHandlePriority(_indx:int) -> int:
	return 10

func saveData():
	var data = .saveData()
	
	data["canJustContinue"] = canJustContinue
	data["orgasmAmount"] = orgasmAmount
	data["offerTime"] = offerTime

	return data
	
func loadData(data):
	.loadData(data)
	
	canJustContinue = SAVE.loadVar(data, "canJustContinue", false)
	orgasmAmount = SAVE.loadVar(data, "orgasmAmount", 0)
	offerTime = SAVE.loadVar(data, "offerTime", 0)
