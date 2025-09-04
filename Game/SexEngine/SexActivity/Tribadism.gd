extends SexActivityBase
var cumAmount:int = 0

func _init():
	id = "Tribadism"
	
	activityName = "Tribadism"
	activityDesc = "Sex where you are rubbing pussies together with the sub!"
	activityCategory = ["Fuck"]

func getGoals():
	return {
		SexGoal.Tribadism: 1.0,
	}

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(!_domInfo.getChar().hasReachableVagina() || !_subInfo.getChar().hasReachableVagina()):
		return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func isActivityImpossibleShouldStop() -> bool:
	if(!getSub().hasReachableVagina() || !getDom().hasReachableVagina()):
		return true
	
	return false

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return [SexActivityTag.VaginaUsed, SexActivityTag.HavingSex]
	if(_indx == SUB_0):
		return [SexActivityTag.VaginaUsed, SexActivityTag.HavingSex, SexActivityTag.PreventsSubTeasing]
	return []

func getCheckTagsDom() -> Array:
	return [SexActivityTag.VaginaUsed, SexActivityTag.HavingSex]
func getCheckTagsSub() -> Array:
	return [SexActivityTag.VaginaUsed, SexActivityTag.HavingSex]

func startActivity(_args):
	addText("{dom.You} {dom.youVerb('lie')} down and {dom.youVerb('interlock')} legs with {sub.you}, ready to start grinding "+RNG.pick(["pussies", "pussy slits", "kitties", "clits"])+" against each other"+getThroughClothingText(DOM_0, BodypartSlot.Vagina)+"!")
	
	stimulateTribadism(DOM_0, SUB_0, I_TEASE)
	
	#affectSub(subInfo.fetishScore({Fetish.Tribadism: 1.0}), 0.1, -0.1, -0.01)
	#affectDom(domInfo.fetishScore({Fetish.Tribadism: 1.0}), 0.1, -0.03)
	react(SexReaction.AboutToRubPussiesTogether)

func grinding_processTurn():
	addTextPick([
		"{dom.You} {dom.youVerb('grind')} {dom.yourHis} "+RNG.pick(["pussy", "clit"])+" against {sub.name}'s.",
		"{dom.You} and {sub.you} are scissoring, grinding their "+RNG.pick(["pussies", "vulvae"])+" against each other.",
		"{dom.You} "+RNG.pick(["dry {dom.youVerb('hump')}", "dry {dom.youVerb('fuck')}"])+" {sub.you}, stimulating each others "+RNG.pick(["pussies", "slits", "kitties"])+".",
	])
	
	stimulateTribadism(DOM_0, SUB_0, I_NORMAL)
#
#		affectSub(subInfo.fetishScore({Fetish.Tribadism: 1.0}), 0.1, -0.1, -0.01)
#		affectDom(domInfo.fetishScore({Fetish.Tribadism: 1.0}), 0.1, -0.03)
#		subInfo.stimulateArousalZone(0.1, BodypartSlot.Vagina, 0.5)
#		domInfo.stimulateArousalZone(0.1, BodypartSlot.Vagina, 0.5)
	
	if(OPTIONS.isContentEnabled(ContentType.CumStealing) && getDom().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) == null && getSub().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) == null):
		if(RNG.chance(20) && getDom().bodypartShareFluidsWith(BodypartSlot.Vagina, getSubID(), BodypartSlot.Vagina, 0.2)):
			addTextPick([
				"{dom.You} and {sub.you} [b]share some cum[/b] while "+RNG.pick(["rubbing pussies together", "doing tribadism", "scissoring"])+"!",
				"[b]Some cum gets shared[/b] between the two "+RNG.pick(["pussies", "slits", "kitties"])+"!",
				"[b]Some cum leaks from one pussy to another[/b].",
			])
	
	if(isCloseToCumming(DOM_0) && isCloseToCumming(SUB_0)):
		addTextPick([
			"Both lovers "+RNG.pick(["moan lustfully", "moan", "shiver slightly"])+" as they get closer to their orgasms!",
			"{dom.You} {dom.youVerb('see')} that {sub.youHe} {sub.youAre} close and so {dom.youAre} {dom.youHe}.",
			"Both "+RNG.pick(["pussies", "kitties", "pussy slits"])+" drip quite a bit of arousal.",
			"Both lovers gonna cum soon!",
		])
	elif(isCloseToCumming(DOM_0)):
		addTextPick([
			"{dom.You} gonna cum soon!",
			"{dom.Your} "+RNG.pick(["kitty", "pussy"])+" twitches slightly from all the rubbing.",
			"This amount of pleasure is gonna make {dom.you} cum soon!",
		])
	elif(isCloseToCumming(SUB_0)):
		addTextPick([
			"{sub.You} gonna cum soon!",
			"{sub.Your} "+RNG.pick(["kitty", "pussy"])+" twitches slightly from all the rubbing.",
			"This amount of pleasure is gonna make {sub.you} cum soon!",
		])

	react(SexReaction.TribadismHappens, [10.0, 5.0])

func getActions(_indx:int):
	if(_indx == DOM_0):
		addAction("stop", getStopScore(), "Stop tribadism", "Enough pussy rubbing")
	if(_indx == SUB_0):
		addAction("pullaway", getResistScore(SUB_0), "Pull away", "Try to pull away", {
			A_CHANCE: getResistChance(SUB_0, DOM_0, RESIST_LEGS_FOCUS, 30.0, 25.0),
		})

func doAction(_indx:int, _action:String, _actionDict:Dictionary):
	if(_action == "stop"):
		endActivity()
		addTextPick([
			"{dom.You} pulled {dom.yourHis} pussy away, ending the fun.",
		])
	if(_action == "pullaway"):
		var successChance:float = getResistChance(SUB_0, DOM_0, RESIST_LEGS_FOCUS, 30.0, 25.0)
		if(RNG.chance(successChance)):
			addText("{sub.You} {sub.youVerb('pull')} away from {dom.you}.")
			getDomInfo().addAnger(0.3)
			if(getState() != ""):
				setState("")
			else:
				endActivity()
		else:
			addText("{sub.You} {sub.youVerb('try', 'tries')} to pull away from {dom.you} but {sub.youVerb('fail')}.")
			getDomInfo().addAnger(0.1)
			reactSub(SexReaction.ActivelyResisting, [50])

func init_getActions(_indx:int):
	if(_indx == DOM_0):
		addAction("startgrinding", 1.0, "Start grinding", "Begin to rub kitties together!")

func init_doAction(_indx:int, _action:String, _actionDict:Dictionary):
	if(_action == "startgrinding"):
		setState("grinding")
		addTextPick([
			"{dom.You} began grinding "+RNG.pick(["pussies", "kitties", "vulvae"])+" together with {sub.you}, stimulating each other's clits"+getThroughClothingText(DOM_0, BodypartSlot.Vagina)+"!",
		])
		stimulateTribadism(DOM_0, SUB_0, I_TEASE)

func grinding_getActions(_indx:int):
	if(_indx == DOM_0):
		addAction("moanDom", 0.3, "Moan", "Show how much you enjoy it.")
		if(isReadyToCum(DOM_0) && isHandlingOrgasms(DOM_0)):
			addAction("cumDom", 1.0, "Cum!", "You gonna cum.", {A_PRIORITY:1001})
	if(_indx == SUB_0):
		addAction("moanSub", getComplyScore(SUB_0)/3.0, "Moan", "Show how much you enjoy it.")
		if(isReadyToCum(SUB_0) && isHandlingOrgasms(SUB_0)):
			addAction("cumSub", 1.0, "Cum!", "You gonna cum.", {A_PRIORITY:1001})

func grinding_doAction(_indx:int, _action:String, _actionDict:Dictionary):
	if(_action == "moanDom"):
		addTextPick([
			"{dom.You} "+RNG.pick(["{dom.youVerb('let')} out a moan", "{dom.youVerb('moan')}", "{dom.youVerb('produce')} a moan", "{dom.youVerb('make')} a noise of pleasure"])+" while "+RNG.pick(["rubbing pussies", "scissoring", "grinding slits"])+" with {sub.youHim}!",
		])
		moan(DOM_0)
	if(_action == "moanSub"):
		addTextPick([
			"{sub.You} "+RNG.pick(["{sub.youVerb('let')} out a moan", "{sub.youVerb('moan')}", "{sub.youVerb('produce')} a moan", "{sub.youVerb('make')} a noise of pleasure"])+" while {sub.yourHis} "+RNG.pick(["pussy", "kitty", "slit"])+" is being rubbed!",
		])
		moan(SUB_0)
		
	if(_action == "cumDom"):
		stimulate(DOM_0, S_VAGINA, SUB_0, S_VAGINA, I_HIGH, Fetish.Tribadism)
		#subInfo.stimulateArousalZone(0.2, BodypartSlot.Vagina, 1.0)
		if(doCheckDoubleOrgasm()):
			satisfyGoals()
			return
		fetishAffect(DOM_0, Fetish.Tribadism, 3.0)
		
		cumAmount += 1
		if(cumAmount >= 2):
			satisfyGoals()
		
		getDom().cumOnFloor()
		getDomInfo().cum()
		sendSexEvent(SexEvent.UniqueOrgasm, SUB_0, DOM_0, {orgasmType="trib"})
		addGenericOrgasmText(DOM_0)
	if(_action == "cumSub"):
		stimulate(SUB_0, S_VAGINA, DOM_0, S_VAGINA, I_HIGH, Fetish.Tribadism)
		#domInfo.stimulateArousalZone(0.2, BodypartSlot.Vagina, 1.0)
		if(doCheckDoubleOrgasm()):
			satisfyGoals()
			return
		fetishAffect(SUB_0, Fetish.Tribadism, 3.0)
		
		cumAmount += 1
		if(cumAmount >= 2):
			satisfyGoals()
		
		getSub().cumOnFloor(getDomID())
		getSubInfo().cum()
		sendSexEvent(SexEvent.UniqueOrgasm, DOM_0, SUB_0, {orgasmType="trib"})
		addGenericOrgasmText(SUB_0)

func doCheckDoubleOrgasm():
	if(isReadyToCum(DOM_0) && isHandlingOrgasms(DOM_0)):
		if(isReadyToCum(SUB_0) && isHandlingOrgasms(SUB_0)):
			getDom().cumOnFloor()
			getDomInfo().cum()
			sendSexEvent(SexEvent.UniqueOrgasm, SUB_0, DOM_0, {orgasmType="trib"})
			getSub().cumOnFloor(getDomID())
			getSubInfo().cum()
			sendSexEvent(SexEvent.UniqueOrgasm, DOM_0, SUB_0, {orgasmType="trib"})
			addText("[b]Double orgasm![/b]")
			addGenericOrgasmText(DOM_0)
			addGenericOrgasmText(SUB_0)
			fetishAffect(DOM_0, Fetish.Tribadism, 3.0)
			fetishAffect(SUB_0, Fetish.Tribadism, 3.0)
			return true
	return false
	
func getOrgasmHandlePriority(_indx:int) -> int:
	return 5

func getAnimation():
	if(getState() in [""]):
		return [StageScene.SexTribadism, "tease", {pc=DOM_0, npc=SUB_0}]
	if(isCloseToCumming(DOM_0)):
		return [StageScene.SexTribadism, "fast", {pc=DOM_0, npc=SUB_0}]
	return [StageScene.SexTribadism, "sex", {pc=DOM_0, npc=SUB_0}]

func saveData():
	var data = .saveData()
	
	data["cumAmount"] = cumAmount

	return data
	
func loadData(data):
	.loadData(data)
	
	cumAmount = SAVE.loadVar(data, "cumAmount", 0)
