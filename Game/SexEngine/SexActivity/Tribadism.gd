extends SexActivityBase
var cumAmount = 0

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
	state = ""
	
	var clothingItem = getDom().getFirstItemThatCoversBodypart(BodypartSlot.Vagina)
	var throughTheClothing = ""
	if(clothingItem != null):
		throughTheClothing = " through the "+clothingItem.getCasualName()
	
	var text = RNG.pick([
		"{dom.You} {dom.youVerb('lie')} down and {dom.youVerb('interlock')} legs with {sub.you}, ready to start grinding "+RNG.pick(["pussies", "pussy slits", "kitties", "clits"])+" against each other"+throughTheClothing+"!",
	])
	
	affectSub(subInfo.fetishScore({Fetish.Tribadism: 1.0}), 0.1, -0.1, -0.01)
	affectDom(domInfo.fetishScore({Fetish.Tribadism: 1.0}), 0.1, -0.03)
	
	return {
		text = text,
		domSay = domReaction(SexReaction.AboutToRubPussiesTogether),
	}

func onSwitchFrom(_otherActivity, _args):
	return

func processTurn():
	if(state == "grinding"):
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('grind')} {dom.yourHis} "+RNG.pick(["pussy", "clit"])+" against {sub.name}'s.",
			"{dom.You} and {sub.you} are scissoring, grinding their "+RNG.pick(["pussies", "vulvae"])+" against each other.",
			"{dom.You} "+RNG.pick(["dry {dom.youVerb('hump')}", "dry {dom.youVerb('fuck')}"])+" {sub.you}, stimulating each others "+RNG.pick(["pussies", "slits", "kitties"])+".",
		])
		affectSub(subInfo.fetishScore({Fetish.Tribadism: 1.0}), 0.1, -0.1, -0.01)
		affectDom(domInfo.fetishScore({Fetish.Tribadism: 1.0}), 0.1, -0.03)
		subInfo.stimulateArousalZone(0.1, BodypartSlot.Vagina, 0.5)
		domInfo.stimulateArousalZone(0.1, BodypartSlot.Vagina, 0.5)
		
		if(OPTIONS.isContentEnabled(ContentType.CumStealing) && getDom().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) == null && getSub().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) == null):
			if(RNG.chance(20) && getDom().bodypartShareFluidsWith(BodypartSlot.Vagina, subID, BodypartSlot.Vagina, 0.2)):
				text += RNG.pick([
					" {dom.You} and {sub.you} [b]share some cum[/b] while "+RNG.pick(["rubbing pussies together", "doing tribadism", "scissoring"])+"!",
					" [b]Some cum gets shared[/b] between the two "+RNG.pick(["pussies", "slits", "kitties"])+"!",
					" [b]Some cum leaks from one pussy to another[/b].",
				])
		
		if(domInfo.isCloseToCumming() && subInfo.isCloseToCumming()):
			text += RNG.pick([
				" Both lovers "+RNG.pick(["moan lustfully", "moan", "shiver slightly"])+" as they get closer to their orgasms!",
				" {dom.You} {dom.youVerb('see')} that {sub.youHe} {sub.youAre} close and so {dom.youAre} {dom.youHe}.",
				" Both "+RNG.pick(["pussies", "kitties", "pussy slits"])+" drip quite a bit of arousal.",
				" Both lovers gonna cum soon!",
			])
		elif(domInfo.isCloseToCumming()):
			text += RNG.pick([
				" {dom.You} gonna cum soon!",
				" {dom.Your} "+RNG.pick(["kitty", "pussy"])+" twitches slightly from all the rubbing.",
				" This amount of pleasure is gonna make {dom.you} cum soon!",
			])
		elif(subInfo.isCloseToCumming()):
			text += RNG.pick([
				" {sub.You} gonna cum soon!",
				" {sub.Your} "+RNG.pick(["kitty", "pussy"])+" twitches slightly from all the rubbing.",
				" This amount of pleasure is gonna make {sub.you} cum soon!",
			])
		
		return {text = text}
		
	return
	
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
	if(domInfo.isReadyToCum() && isHandlingDomOrgasms()):
		if(subInfo.isReadyToCum() && isHandlingSubOrgasms()):
			getDom().cumOnFloor()
			domInfo.cum()
			sendSexEvent(SexEvent.UniqueOrgasm, subID, domID, {orgasmType="feet"})
			getSub().cumOnFloor(domID)
			subInfo.cum()
			sendSexEvent(SexEvent.UniqueOrgasm, domID, subID, {orgasmType="trib"})
			return combineData({text="[b]Double orgasm![/b]"}, combineData(getGenericDomOrgasmData(), getGenericSubOrgasmData()))
	return null
	
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
		sendSexEvent(SexEvent.UniqueOrgasm, subID, domID, {orgasmType="feet"})
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
		sendSexEvent(SexEvent.UniqueOrgasm, domID, subID, {orgasmType="trib"})
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
	if(state in [""]):
		return [StageScene.SexTribadism, "tease", {pc=domID, npc=subID}]
	if(domInfo.isCloseToCumming()):
		return [StageScene.SexTribadism, "fast", {pc=domID, npc=subID}]
	return [StageScene.SexTribadism, "sex", {pc=domID, npc=subID}]
	
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
