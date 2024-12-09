extends SexActivityBase
var cumAmount:int = 0
var domFocus = BodypartSlot.Vagina
var subFocus = BodypartSlot.Vagina

func _init():
	id = "SixtyNine"

func getGoals():
	return {
		#SexGoal.Tribadism: 1.0,
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
	var thetags = [SexActivityTag.HavingSex]
	return thetags

func getSubTags():
	var thetags = [SexActivityTag.HavingSex, SexActivityTag.PreventsSubTeasing]
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
		
		return {text = text}
	
	return
	
func _domActions():
	var actions = []
	actions.append({
		"id": "tease",
		"score": 1.0,
		"name": "Tease "+BodypartSlot.getVisibleName(domFocus),
		"desc": "Tease them!",
	})

	actions.append({
		"id": "start",
		"score": 1.0,
		"name": "Start "+("sucking" if domFocus == BodypartSlot.Penis else "licking"),
		"desc": "Begin the fun",
	})
	
	return actions
	
func _doDomAction(_id, _actionInfo):
	if(_id == "start"):
		state = "sex"
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('begin', 'began')} THE FUN.",
		])
		
		return {text = text}
	
func getDomActions():
	var actions = []

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
