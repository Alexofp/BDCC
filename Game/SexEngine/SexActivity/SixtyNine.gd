extends SexActivityBase
var cumAmount:int = 0
var domFocus = BodypartSlot.Vagina
var subFocus = BodypartSlot.Vagina

func _init():
	id = "SixtyNine"

func getGoals():
	return {
		SexGoal.Fuck69: 1.0,
	}

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(!_domInfo.getChar().hasReachableVagina() && !_domInfo.getChar().hasReachablePenis()):
		return false
	if(!_subInfo.getChar().hasReachableVagina() && !_subInfo.getChar().hasReachablePenis()):
		return false
	if(_domInfo.getChar().isOralBlocked()):
		return false
	if(_subInfo.getChar().isOralBlocked()):
		return false
		
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getVisibleName():
	return "69"

func getCategory():
	return ["Fuck"]

func getDomTags():
	var thetags = [SexActivityTag.HavingSex, SexActivityTag.MouthUsed]
	return thetags

func getSubTags():
	var thetags = [SexActivityTag.HavingSex, SexActivityTag.PreventsSubTeasing, SexActivityTag.MouthUsed]
	return thetags

func getDomTagsCheck():
	return [SexActivityTag.HavingSex]

func getSubTagsCheck():
	return [SexActivityTag.HavingSex]

func domCanSwitchFocus():
	if(getSub().hasReachablePenis() && getSub().hasReachableVagina()):
		return true
	return false

func subCanSwitchFocus():
	if(getDom().hasReachablePenis() && getDom().hasReachableVagina()):
		return true
	return false

func startActivity(_args):
	state = ""
	
	#var clothingItem = getDom().getFirstItemThatCoversBodypart(BodypartSlot.Vagina)
	#var throughTheClothing = ""
	#if(clothingItem != null):
	#	throughTheClothing = " through the "+clothingItem.getCasualName()
	
	var possibleDomFocus = []
	if(getSub().hasReachablePenis()):
		possibleDomFocus.append(BodypartSlot.Penis)
	if(getSub().hasReachableVagina()):
		possibleDomFocus.append(BodypartSlot.Vagina)
	domFocus = RNG.pick(possibleDomFocus)
	
	var possibleSubFocus = []
	if(getDom().hasReachablePenis()):
		possibleSubFocus.append(BodypartSlot.Penis)
	if(getDom().hasReachableVagina()):
		possibleSubFocus.append(BodypartSlot.Vagina)
	subFocus = RNG.pick(possibleSubFocus)
	
	var text = RNG.pick([
		#"{dom.You} {dom.youVerb('lie')} down and {dom.youVerb('interlock')} legs with {sub.you}, ready to start grinding "+RNG.pick(["pussies", "pussy slits", "kitties", "clits"])+" against each other"+throughTheClothing+"!",
		"69 ABOUT TO HAPPEN. DOM WILL LICK: "+str(domFocus)+", SUB WILL LICK: "+str(subFocus),
	])
	
	affectSub(subInfo.fetishScore({Fetish.OralSexGiving: 1.0}), 0.1, -0.1, -0.01)
	affectDom(domInfo.fetishScore({Fetish.OralSexGiving: 1.0}), 0.1, -0.03)
	
	return {
		text = text,
		#domSay = domReaction(SexReaction.AboutToRubPussiesTogether),
	}

func onSwitchFrom(_otherActivity, _args):
	return

func processTurn():
	if(state == "sex"):
		var text = RNG.pick([
			"FUN IS HAPPENING.",
		])
		
		affectSub(subInfo.fetishScore({Fetish.OralSexGiving: 0.75, Fetish.OralSexReceiving: 1.0}), 0.1, -0.1, -0.01)
		affectDom(domInfo.fetishScore({Fetish.OralSexGiving: 0.75, Fetish.OralSexReceiving: 1.0}), 0.1, -0.03)
		subInfo.addArousalSex(0.1)
		domInfo.addArousalSex(0.1)
		
		if(domFocus == BodypartSlot.Vagina && !getSub().hasReachableVagina()):
			state = ""
		if(domFocus == BodypartSlot.Penis && !getSub().hasReachablePenis()):
			state = ""
		if(subFocus == BodypartSlot.Vagina && !getDom().hasReachableVagina()):
			state = ""
		if(subFocus == BodypartSlot.Penis && !getDom().hasReachablePenis()):
			state = ""
			
		return {text = text}
	
	return
	
func getDomActions():
	var actions = []

	if(domCanSwitchFocus()):
		actions.append({
			"id": "switch",
			"score": 0.0,
			"name": "Switch focus",
			"desc": "Switch focus to their other bits",
		})
	actions.append({
		"id": "stop",
		"score": getStopScore(),
		"name": "Stop 69",
		"desc": "Enough licking and sucking",
	})

	return actions

func doDomAction(_id, _actionInfo):

	if(_id == "switch"):
		if(domFocus == BodypartSlot.Penis):
			domFocus = BodypartSlot.Vagina
		else:
			domFocus = BodypartSlot.Penis
		
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('switch', 'switches')} {dom.yourHis} focus to {sub.your} "+("{sub.penis}" if domFocus == BodypartSlot.Penis else "{sub.pussyStretch} pussy")+".",
		])
		
		return {text = text}

	if(_id == "stop"):
		endActivity()

		var text = RNG.pick([
			"{dom.You} {dom.youVerb('pull')} {dom.yourHis} crotch away from {sub.your} face, ending the fun.",
		])

		return {text = text}
	
func _domActions():
	var actions = []
	actions.append({
		"id": "tease",
		"score": 1.0,
		"name": "Tease "+BodypartSlot.getVisibleName(domFocus),
		"desc": "Tease them!",
	})
	
	if(getSub().getFirstItemThatCoversBodypart(domFocus) == null):
		if(getDom().hasReachableVagina() && getDom().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) == null):
			actions.append({
				"id": "orderlick",
				"score": 1.0 - domInfo.getAngerScore(),
				"name": "Order to lick",
				"desc": "Order them to start licking your pussy!",
			})
			actions.append({
				"id": "forcelick",
				"score": domInfo.getAngerScore(),
				"name": "Force to lick",
				"desc": "Force the sub to start licking you off!",
				"chance": getDomForceChance(),
			})

		if(getDom().hasReachablePenis() && getDom().getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
			actions.append({
				"id": "ordersuck",
				"score": 1.0 - domInfo.getAngerScore(),
				"name": "Order to suck",
				"desc": "Order them to start sucking your cock!",
			})
			actions.append({
				"id": "forcesuck",
				"score": domInfo.getAngerScore(),
				"name": "Force to suck",
				"desc": "Force the sub to start sucking you off!",
				"chance": getDomForceChance(),
			})

	return actions
	
func _doDomAction(_id, _actionInfo):
	if(_id == "orderlick"):
		state = "order"
		subFocus = BodypartSlot.Vagina
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('order')} TO LICK.",
		])
		
		return {text = text}
	if(_id == "ordersuck"):
		state = "order"
		subFocus = BodypartSlot.Penis
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('order')} TO SUCK.",
		])
		
		return {text = text}
		
	if(_id in ["forcelick", "forcesuck"]):
		var succChance:float = getDomForceChance()
		if(_id == "forcelick"):
			subFocus = BodypartSlot.Vagina
		if(_id == "forcesuck"):
			subFocus = BodypartSlot.Penis
		
		if(!RNG.chance(succChance)):
			var text = RNG.pick([
				"{dom.You} {dom.youVerb('try', 'tries')} TO FORCE.",
			])
			domInfo.addAnger(-0.05)
			
			return {text = text}
		
		state = "sex"
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('force')} THE FUN.",
		])
		domInfo.addAnger(-0.1)
		
		return {text = text}

func order_subActions():
	var actions := []
	
	actions.append({
		"id": "obey",
		"score": subInfo.getComplyScore(),
		"name": "Obey",
		"desc": "Start "+("sucking" if subFocus == BodypartSlot.Penis else "licking"),
		"priority": 1001,
	})
	actions.append({
		"id": "refuse",
		"score": subInfo.getResistScore()*((1.0+subInfo.personalityScore({PersonalityStat.Mean:-1.0})) if !getSub().isBitingBlocked() else 1.0),
		"name": "Refuse",
		"desc": "Refuse to do it",
		"priority": 1001,
	})
	if(!getSub().isBitingBlocked()):
		actions.append({
			"id": "bite",
			"score": subInfo.getResistScore()/2.0*(1.0+subInfo.personalityScore({PersonalityStat.Mean:1.0})),
			"name": "Bite!",
			"desc": "Refuse to do it",
			"priority": 1001,
			"chance": getSubBiteChance(50.0, 30.0),
		})
	
	return actions

func order_doSubAction(_id, _info):
	if(_id == "obey"):
		state = "sex"
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('begin', 'began')} OBEY AND BEGIN THE FUN.",
		])
		
		return {text = text}
	if(_id == "refuse"):
		state = ""
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('refuse')}.",
		])
		domInfo.addAnger(0.3)
		
		return {text = text}
	if(_id == "bite"):
		var successChance = getSubBiteChance(50.0, 30.0)
		if(RNG.chance(successChance)):
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('bite')} {dom.your} genitals! {dom.YouHe} {dom.youVerb('cry', 'cries')} from pain and {dom.youVerb('pull')} away.",
			])
			domInfo.addPain(10)
			sendSexEvent(SexEvent.PainInflicted, subID, domID, {pain=10,isDefense=true,intentional=true})
			domInfo.addAnger(1.0 - domInfo.fetishScore({Fetish.Masochism: 0.5}))
			domInfo.addLust(-5 + 10 * domInfo.fetishScore({Fetish.Masochism: 1.0}))
			if(RNG.chance(50)):
				failGoals()
			endActivity()
			return {text = text}
		else:
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('try', 'tries')} to bite {dom.you} but {dom.youHe} {dom.youVerb('avoid')} it!",
			])
			domInfo.addAnger(0.4)
			state = ""
			return {text = text}

func sex_domActions():
	var actions:= []
	
	if(domFocus == BodypartSlot.Vagina && getDom().hasEffect(StatusEffect.HasCumInsideMouth) && getSub().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) == null && !getDom().isOralBlocked() && OPTIONS.isContentEnabled(ContentType.CumStealing)):
		actions.append({
			"id": "spitcumintosubspussy",
			"score": 0.01 + domInfo.fetishScore({Fetish.Breeding: 0.1}),
			"name": "Spit cum into pussy",
			"desc": "Force some cum into their slit",
		})
	
	if(domInfo.isReadyToCum() && isHandlingDomOrgasms()):
		if(subInfo.isReadyToCum() && isHandlingSubOrgasms()):
			actions.append({
				"id": "cum",
				"score": 1.0,
				"name": "Double cum!",
				"desc": "Both of you are about to cum!",
				"priority": 1001,
			})
		else:
			actions.append({
				"id": "cum",
				"score": 1.0,
				"name": "Cum!",
				"desc": "You're about to cum.",
				"priority": 1001,
			})
	
	return actions

func sex_doDomAction(_id, _info):
	if(_id == "spitcumintosubspussy"):
		return doSpitCumIntoHoleDom(BodypartSlot.Vagina)
		
	if(_id == "cum"):
		subInfo.addArousalSex(0.05)
		if(subInfo.isReadyToCum() && isHandlingSubOrgasms()):
			satisfyGoals()
			return combineData({text="Two orgasms happen at the same time!"}, combineData(
				doCumBJDom() if subFocus == BodypartSlot.Penis else doCumPussyLickDom(),
				doCumBJSub(false) if domFocus == BodypartSlot.Penis else doCumPussyLickSub(false)
				))
		else:
			cumAmount += 1
			if(cumAmount >= 2):
				satisfyGoals()
		#sendSexEvent(SexEvent.UniqueOrgasm, subID, domID, {orgasmType="feet"})
		#var text = RNG.pick([
		#	"{dom.You} {dom.youVerb('cum')} hard!",
		#])
		return (doCumBJDom() if subFocus == BodypartSlot.Penis else doCumPussyLickDom())

func sex_subActions():
	var actions:= []
	
	if(subInfo.isReadyToCum() && isHandlingSubOrgasms()):
		actions.append({
			"id": "cum",
			"score": 1.0,
			"name": "Cum!",
			"desc": "You're about to cum.",
			"priority": 1001,
		})
	
	return actions

func sex_doSubAction(_id, _info):
	if(_id == "cum"):
		cumAmount += 1
		if(cumAmount >= 2):
			satisfyGoals()
		domInfo.addArousalSex(0.05)
		#getSub().cumOnFloor()
		#subInfo.cum()
		#sendSexEvent(SexEvent.UniqueOrgasm, subID, domID, {orgasmType="feet"})
		#var text = RNG.pick([
		#	"{sub.You} {sub.youVerb('cum')} hard!",
		#])
		return (doCumBJSub(false) if domFocus == BodypartSlot.Penis else doCumPussyLickSub(false))

func getSubActions():
	var actions = []

	actions.append({
		"id": "pullaway",
		"score": subInfo.getResistScore(),
		"name": "Pull away",
		"desc": "Try to pull away",
		"chance": getSubResistChance(30.0, 25.0),
	})

	return actions

func doSubAction(_id, _actionInfo):
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
				failGoals()
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
	if(state in ["sex"]):
		var aName:String = ""
		if(subFocus == BodypartSlot.Penis):
			aName += "M"
		else:
			aName += "F"
		if(domFocus == BodypartSlot.Penis):
			aName += "M"
		else:
			aName += "F"
		
		return [StageScene.Sex69, aName, {npc=domID, pc=subID, bodyState={hard=true}, npcBodyState={hard=true}}]
	return [StageScene.Sex69, "tease", {npc=domID, pc=subID}]
	
func getDomOrgasmHandlePriority():
	return 10

func getSubOrgasmHandlePriority():
	return 10

func getDomForceChance():
	if(getSub().isBitingBlocked()):
		return 100.0
	var theChance:float= 100.0 - subInfo.getResistScoreSmooth()*80.0
	if(getSub().hasBlockedHands()):
		theChance *= 1.2
	if(getSub().hasBoundArms()):
		theChance *= 1.2
	
	return clamp(theChance, 0.0, 100.0)

func getSubResistChance(baseChance, domAngerRemoval):
	var theChance = baseChance - domInfo.getAngerScore()*domAngerRemoval
	if(getSub().hasBlockedHands()):
		theChance *= 0.7
	if(getSub().hasBoundArms()):
		theChance *= 0.5
	if(getSub().isBlindfolded()):
		theChance *= 0.9
	if(getSub().hasBoundLegs()):
		theChance *= 0.8
	
	return max(theChance, 5.0)

func getSubBiteChance(baseChance, domAngerRemoval):
	#if(state in ["blowjob", "licking"]):
	#	return 100.0
	var theChance = baseChance - domInfo.getAngerScore()*domAngerRemoval
	if(getSub().hasBlockedHands()):
		theChance *= 0.9
	if(getSub().hasBoundArms()):
		theChance *= 0.9
	if(getSub().isBlindfolded()):
		theChance *= 0.5
	
	return max(theChance, 5.0)

func saveData():
	var data = .saveData()
	
	data["cumAmount"] = cumAmount
	data["domFocus"] = domFocus
	data["subFocus"] = subFocus

	return data
	
func loadData(data):
	.loadData(data)
	
	cumAmount = SAVE.loadVar(data, "cumAmount", 0)
	domFocus = SAVE.loadVar(data, "domFocus", BodypartSlot.Vagina)
	subFocus = SAVE.loadVar(data, "subFocus", BodypartSlot.Vagina)
