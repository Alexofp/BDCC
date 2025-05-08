extends SexActivityBase
var cumAmount:int = 0

func _init():
	id = "Tribadism"

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

func getVisibleName():
	return "Tribadism"

func getCategory():
	return ["Fuck"]

func getDomTags():
	var thetags = [SexActivityTag.VaginaUsed, SexActivityTag.HavingSex]
	return thetags

func getSubTags():
	var thetags = [SexActivityTag.VaginaUsed, SexActivityTag.HavingSex, SexActivityTag.PreventsSubTeasing]
	return thetags

func getDomTagsCheck():
	return [SexActivityTag.VaginaUsed, SexActivityTag.HavingSex]

func getSubTagsCheck():
	return [SexActivityTag.VaginaUsed, SexActivityTag.HavingSex]

func startActivity(_args):
	setState("")
	
	addText("{dom.You} {dom.youVerb('lie')} down and {dom.youVerb('interlock')} legs with {sub.you}, ready to start grinding "+RNG.pick(["pussies", "pussy slits", "kitties", "clits"])+" against each other"+getThroughClothingText(DOM_0, BodypartSlot.Vagina)+"!")
	
	stimulate(DOM_0, S_VAGINA, SUB_0, S_VAGINA, I_TEASE, Fetish.Tribadism)
	
	#affectSub(subInfo.fetishScore({Fetish.Tribadism: 1.0}), 0.1, -0.1, -0.01)
	#affectDom(domInfo.fetishScore({Fetish.Tribadism: 1.0}), 0.1, -0.03)
	talk(DOM_0, SUB_0, SexReaction.AboutToRubPussiesTogether)

func onSwitchFrom(_otherActivity, _args):
	return

func grinding_processTurn():
	addTextPick([
		"{dom.You} {dom.youVerb('grind')} {dom.yourHis} "+RNG.pick(["pussy", "clit"])+" against {sub.name}'s.",
		"{dom.You} and {sub.you} are scissoring, grinding their "+RNG.pick(["pussies", "vulvae"])+" against each other.",
		"{dom.You} "+RNG.pick(["dry {dom.youVerb('hump')}", "dry {dom.youVerb('fuck')}"])+" {sub.you}, stimulating each others "+RNG.pick(["pussies", "slits", "kitties"])+".",
	])
	
	stimulate(DOM_0, S_VAGINA, SUB_0, S_VAGINA, I_SEX, Fetish.Tribadism)
#
#		affectSub(subInfo.fetishScore({Fetish.Tribadism: 1.0}), 0.1, -0.1, -0.01)
#		affectDom(domInfo.fetishScore({Fetish.Tribadism: 1.0}), 0.1, -0.03)
#		subInfo.stimulateArousalZone(0.1, BodypartSlot.Vagina, 0.5)
#		domInfo.stimulateArousalZone(0.1, BodypartSlot.Vagina, 0.5)
	
	if(OPTIONS.isContentEnabled(ContentType.CumStealing) && getDom().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) == null && getSub().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) == null):
		if(RNG.chance(20) && getDom().bodypartShareFluidsWith(BodypartSlot.Vagina, subID, BodypartSlot.Vagina, 0.2)):
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

func getActions(_indx:int):
	if(_indx == DOM_0):
		addAction("stop", getStopScore(), "Stop tribadism", "Enough pussy rubbing")

func doAction(_indx:int, _action:String, _actionDict:Dictionary):
	if(_action == "stop"):
		endActivity()
		addTextPick([
			"{dom.You} pulled {dom.yourHis} pussy away, ending the fun.",
		])

func _getActions(_indx:int):
	if(_indx == DOM_0):
		addAction("startgrinding", 1.0, "Start grinding", "Begin to rub kitties together!")

func _doAction(_indx:int, _action:String, _actionDict:Dictionary):
	if(_action == "startgrinding"):
		setState("grinding")
		addTextPick([
			"{dom.You} began grinding "+RNG.pick(["pussies", "kitties", "vulvae"])+" together with {sub.you}, stimulating each other's clits"+getThroughClothingText(DOM_0, BodypartSlot.Vagina)+"!",
		])
		stimulate(DOM_0, S_VAGINA, SUB_0, S_VAGINA, I_TEASE, Fetish.Tribadism)

func grinding_getActions(_indx:int):
	if(_indx == DOM_0):
		addAction("moanDom", 0.3, "Moan", "Show how much you enjoy it.")
		if(isReadyToCum(DOM_0) && isHandlingDomOrgasms()):
			addAction("cumDom", 1.0, "Cum!", "You gonna cum.", {A_PRIORITY:1001})

func grinding_doAction(_indx:int, _action:String, _actionDict:Dictionary):
	if(_action == "moanDom"):
		addTextPick([
			"{dom.You} "+RNG.pick(["{dom.youVerb('let')} out a moan", "{dom.youVerb('moan')}", "{dom.youVerb('produce')} a moan", "{dom.youVerb('make')} a noise of pleasure"])+" while "+RNG.pick(["rubbing pussies", "scissoring", "grinding slits"])+" with {sub.youHim}!",
		])
		getDomInfo().addAnger(-0.02)
		getDomInfo().addLust(5)
		getSubInfo().addLust(5)
	if(_action == "cumDom"):
		stimulate(DOM_0, S_VAGINA, SUB_0, S_VAGINA, I_HARDSEX, Fetish.Tribadism)
		#subInfo.stimulateArousalZone(0.2, BodypartSlot.Vagina, 1.0)
		if(doCheckDoubleOrgasm()):
			satisfyGoals()
			return
		
		cumAmount += 1
		if(cumAmount >= 2):
			satisfyGoals()
		
		getDom().cumOnFloor()
		getDomInfo().cum()
		sendSexEvent(SexEvent.UniqueOrgasm, SUB_0, DOM_0, {orgasmType="trib"})
		addGenericDomOrgasmText()

func getDomActions():
	var actions = []

	if(state in [""]):
		actions.append({
			"id": "startgrinding",
			"score": 1.0,
			"name": "Start grinding",
			"desc": "Begin to rub kitties together!",
		})

	if(state in ["grinding"]):
		actions.append({
			"id": "moan",
			"score": 0.3,
			"name": "Moan",
			"desc": "Show how much you enjoy it.",
		})
		
		if(domInfo.isReadyToCum() && isHandlingDomOrgasms()):
			actions.append({
				"id": "cum",
				"score": 1.0,
				"name": "Cum!",
				"desc": "You gonna cum.",
				"priority": 1001,
			})

	actions.append({
		"id": "stop",
		"score": getStopScore(),
		"name": "Stop tribadism",
		"desc": "Enough pussy rubbing",
	})

	return actions

func doCheckDoubleOrgasm():
	if(isReadyToCum(DOM_0) && isHandlingDomOrgasms()):
		if(isReadyToCum(SUB_0) && isHandlingSubOrgasms()):
			getDom().cumOnFloor()
			getDomInfo().cum()
			sendSexEvent(SexEvent.UniqueOrgasm, SUB_0, DOM_0, {orgasmType="trib"})
			getSub().cumOnFloor(getDomID())
			getSubInfo().cum()
			sendSexEvent(SexEvent.UniqueOrgasm, DOM_0, SUB_0, {orgasmType="trib"})
			addText("[b]Double orgasm![/b]")
			addGenericDomOrgasmText()
			addGenericSubOrgasmText()
			return true
	return false
	
func doDomAction(_id, _actionInfo):
	if(_id == "cum"):
		subInfo.stimulateArousalZone(0.2, BodypartSlot.Vagina, 1.0)
		var doubleOrgasm = doCheckDoubleOrgasm()
		if(doubleOrgasm != null):
			satisfyGoals()
			return doubleOrgasm
		
		cumAmount += 1
		if(cumAmount >= 2):
			satisfyGoals()
		
		getDom().cumOnFloor()
		domInfo.cum()
		sendSexEvent(SexEvent.UniqueOrgasm, SUB_0, DOM_0, {orgasmType="feet"})
		return getGenericDomOrgasmData()
	
	if(_id == "moan"):
		var text = RNG.pick([
			"{dom.You} "+RNG.pick(["{dom.youVerb('let')} out a moan", "{dom.youVerb('moan')}", "{dom.youVerb('produce')} a moan", "{dom.youVerb('make')} a noise of pleasure"])+" while "+RNG.pick(["rubbing pussies", "scissoring", "grinding slits"])+" with {sub.youHim}!",
		])
		domInfo.addAnger(-0.02)
		domInfo.addLust(5)
		subInfo.addLust(5)
		return {text = text}
	
	if(_id == "startgrinding"):
		var clothingItem = getDom().getFirstItemThatCoversBodypart(BodypartSlot.Vagina)
		var throughTheClothing = ""
		if(clothingItem != null):
			throughTheClothing = " through {dom.yourHis} "+clothingItem.getCasualName()
		
		state = "grinding"
		var text = RNG.pick([
			"{dom.You} began grinding "+RNG.pick(["pussies", "kitties", "vulvae"])+" together with {sub.you}, stimulating each other's clits"+throughTheClothing+"!",
		])
		
		affectSub(subInfo.fetishScore({Fetish.Tribadism: 1.0}), 0.1, -0.1, -0.01)
		affectDom(domInfo.fetishScore({Fetish.Tribadism: 1.0}), 0.1, -0.03)
		subInfo.addArousalForeplay(0.05)
		domInfo.addArousalForeplay(0.05)
		
		return {text = text}

	if(_id == "stop"):
		endActivity()

		var text = RNG.pick([
			"{dom.You} pulled {dom.yourHis} pussy away, ending the fun.",
		])

		return {text = text}

func getSubActions():
	var actions = []

	if(state in ["grinding"]):
		actions.append({
			"id": "moan",
			"score": subInfo.getComplyScore()/3.0,
			"name": "Moan",
			"desc": "Show how much you enjoy it.",
		})

	if(subInfo.isReadyToCum() && isHandlingSubOrgasms()):
		actions.append({
			"id": "cum",
			"score": 1.0,
			"name": "Cum!",
			"desc": "You gonna cum.",
			"priority": 1001,
		})

	actions.append({
		"id": "pullaway",
		"score": subInfo.getResistScore(),
		"name": "Pull away",
		"desc": "Try to pull away",
		"chance": getSubResistChance(30.0, 25.0),
	})


	return actions

func getSubResistChance(baseChance, domAngerRemoval):
	var theChance = baseChance - domInfo.getAngerScore()*domAngerRemoval
	if(getSub().hasBlockedHands()):
		theChance *= 0.8
	if(getSub().hasBoundArms()):
		theChance *= 0.8
	if(getSub().isBlindfolded()):
		theChance *= 0.8
	if(getSub().hasBoundLegs()):
		theChance *= 0.5
	
	return max(theChance, 5.0)

func doSubAction(_id, _actionInfo):
	if(_id == "cum"):
		domInfo.stimulateArousalZone(0.2, BodypartSlot.Vagina, 1.0)
		var doubleOrgasm = doCheckDoubleOrgasm()
		if(doubleOrgasm != null):
			satisfyGoals()
			return doubleOrgasm
		
		cumAmount += 1
		if(cumAmount >= 2):
			satisfyGoals()
		
		getSub().cumOnFloor(domID)
		subInfo.cum()
		sendSexEvent(SexEvent.UniqueOrgasm, DOM_0, SUB_0, {orgasmType="trib"})
		return getGenericSubOrgasmData()
	
	if(_id == "moan"):
		var text = RNG.pick([
			"{sub.You} "+RNG.pick(["{sub.youVerb('let')} out a moan", "{sub.youVerb('moan')}", "{sub.youVerb('produce')} a moan", "{sub.youVerb('make')} a noise of pleasure"])+" while {sub.yourHis} "+RNG.pick(["pussy", "kitty", "slit"])+" is being rubbed!",
		])
		domInfo.addAnger(-0.02)
		domInfo.addLust(5)
		subInfo.addLust(5)
		return {text = text}

	if(_id == "pullaway"):
		var successChance = getSubResistChance(30.0, 25.0)
		if(RNG.chance(successChance)):
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('pull')} away from {dom.you}.",
			])
			domInfo.addAnger(0.3)
			if(state != ""):
				state = ""
			else:
				endActivity()
			return {text = text}
		else:
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('try', 'tries')} to pull away from {dom.you} but {sub.youVerb('fail')}.",
			])
			domInfo.addAnger(0.1)
			return {text = text,subSay=subReaction(SexReaction.ActivelyResisting, 50)}

	return

func getAnimation():
	if(getState() in [""]):
		return [StageScene.SexTribadism, "tease", {pc=DOM_0, npc=SUB_0}]
	if(isCloseToCumming(DOM_0)):
		return [StageScene.SexTribadism, "fast", {pc=DOM_0, npc=SUB_0}]
	return [StageScene.SexTribadism, "sex", {pc=DOM_0, npc=SUB_0}]
	
func getDomOrgasmHandlePriority():
	return 5

func getSubOrgasmHandlePriority():
	return 5

func saveData():
	var data = .saveData()
	
	data["cumAmount"] = cumAmount

	return data
	
func loadData(data):
	.loadData(data)
	
	cumAmount = SAVE.loadVar(data, "cumAmount", 0)
