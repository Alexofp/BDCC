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

func isActivityImpossibleShouldStop() -> bool:
	if(domFocus == BodypartSlot.Vagina && !getSub().hasReachableVagina()):
		return true
	if(domFocus == BodypartSlot.Penis && !getSub().hasReachablePenis()):
		return true
	if(subFocus == BodypartSlot.Vagina && !getDom().hasReachableVagina()):
		return true
	if(subFocus == BodypartSlot.Penis && !getDom().hasReachablePenis()):
		return true
	return false

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
	return [SexActivityTag.HavingSex, SexActivityTag.MouthUsed]

func getSubTagsCheck():
	return [SexActivityTag.HavingSex, SexActivityTag.MouthUsed]

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
	
	var domPartNameStr:String = "{dom.pussyStretch} pussy" if subFocus == BodypartSlot.Vagina else "{dom.penis}"
	if(getDom().getFirstItemThatCoversBodypart(subFocus) != null):
		domPartNameStr = "covered up "+domPartNameStr
	
	var subPartNameStr:String = "{sub.pussyStretch} pussy" if domFocus == BodypartSlot.Vagina else "{sub.penis}"
	if(getSub().getFirstItemThatCoversBodypart(domFocus) != null):
		subPartNameStr = "clothed "+subPartNameStr
		
	var text = RNG.pick([
		"{dom.You} {dom.youVerb('position')} {dom.yourself} above {sub.you}, {dom.yourHis} "+domPartNameStr+" hovering tantalizingly close to {sub.yourHis} lips while {dom.yourHis} mouth lines up perfectly with a "+subPartNameStr+".",
	])
	
	affectSub(subInfo.fetishScore({Fetish.OralSexGiving: 1.0}), 0.1, -0.2, -0.01)
	affectDom(domInfo.fetishScore({Fetish.OralSexGiving: 1.0}), 0.1, -0.03)
	
	return {
		text = text,
	}

func onSwitchFrom(_otherActivity, _args):
	return

func processTurn():
	if(state == "order"):
		if(subInfo.isUnconscious()):
			state = ""
	
	if(state == "sex"):
		if(domFocus == BodypartSlot.Vagina && !getSub().hasReachableVagina()):
			state = ""
			satisfyGoals()
			return {text = "{sub.Your} pussy is not reachable anymore so {dom.you} {dom.youVerb('stop')} licking it."}
		if(domFocus == BodypartSlot.Penis && !getSub().hasReachablePenis()):
			state = ""
			satisfyGoals()
			return {text = "{sub.Your} cock is not reachable anymore so {dom.you} {dom.youVerb('stop')} sucking it."}
		if(subFocus == BodypartSlot.Vagina && !getDom().hasReachableVagina()):
			state = ""
			satisfyGoals()
			return {text = "{dom.Your} pussy is not reachable anymore so {sub.you} {sub.youAre} unable to continue licking it."}
		if(subFocus == BodypartSlot.Penis && !getDom().hasReachablePenis()):
			state = ""
			satisfyGoals()
			return {text = "{dom.Your} cock is not reachable anymore so {sub.you} {sub.youAre} unable to continue sucking it."}
			
		if(RNG.chance(50)):
			return combineData(
				doBlowjobTurnDom() if subFocus == BodypartSlot.Penis else doPussyLickingTurnDom(),
				doBlowjobTurnSub() if domFocus == BodypartSlot.Penis else doPussyLickingTurnSub()
			)
		return combineData(
			doBlowjobTurnSub() if domFocus == BodypartSlot.Penis else doPussyLickingTurnSub(),
			doBlowjobTurnDom() if subFocus == BodypartSlot.Penis else doPussyLickingTurnDom()
		)
	
	return
	
func getDomActions():
	var actions = []

	if(domCanSwitchFocus()):
		actions.append({
			"id": "switch",
			"score": 0.05,
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
#	actions.append({
#		"id": "tease",
#		"score": 1.0,
#		"name": "Tease "+BodypartSlot.getVisibleName(domFocus),
#		"desc": "Tease them!",
#	})
	var isSubUncon:bool = subInfo.isUnconscious()
	
	if(getSub().getFirstItemThatCoversBodypart(domFocus) == null):
		if(getDom().hasReachableVagina() && getDom().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) == null):
			if(!isSubUncon):
				actions.append({
					"id": "orderlick",
					"score": 1.0 - domInfo.getAngerScore(),
					"name": "Order to lick",
					"desc": "Order them to start licking your pussy!",
				})
			actions.append({
				"id": "forcelick",
				"score": domInfo.getAngerScore() if !isSubUncon else 1.0,
				"name": "Force to lick",
				"desc": "Force the sub to start licking you off!",
				"chance": getDomForceChance(),
			})

		if(getDom().hasReachablePenis() && getDom().getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
			if(!isSubUncon):
				actions.append({
					"id": "ordersuck",
					"score": 1.0 - domInfo.getAngerScore(),
					"name": "Order to suck",
					"desc": "Order them to start sucking your cock!",
				})
			actions.append({
				"id": "forcesuck",
				"score": domInfo.getAngerScore() if !isSubUncon else 1.0,
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
			"{dom.You} {dom.youVerb('order')} {sub.youHim} to "+RNG.pick(["start licking {dom.yourHis} pussy", "stick {sub.yourHis} tongue out and start working on {dom.yourHis} pussy"])+".",
		])
		
		affectSub(subInfo.fetishScore({Fetish.OralSexGiving: 1.0}), 0.05, -0.4, 0.0)
		
		return {text=text, domSay=domReaction(SexReaction.OrderLickPussy)}
	if(_id == "ordersuck"):
		state = "order"
		subFocus = BodypartSlot.Penis
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('order')} {sub.youHim} to "+RNG.pick(["open {sub.yourHis} mouth", "part {sub.yourHis} lips"])+".",
		])
		
		affectSub(subInfo.fetishScore({Fetish.OralSexGiving: 1.0}), 0.05, -0.4, 0.0)
		
		return {text=text, domSay=domReaction(SexReaction.OrderBlowjob)}
		
	if(_id in ["forcelick", "forcesuck"]):
		var succChance:float = getDomForceChance()
		if(_id == "forcelick"):
			subFocus = BodypartSlot.Vagina
		if(_id == "forcesuck"):
			subFocus = BodypartSlot.Penis
		
		if(!RNG.chance(succChance)):
			var text = RNG.pick([
				"{dom.You} {dom.youVerb('try', 'tries')} to force {sub.you} to "+("start licking {dom.yourHis} pussy" if subFocus == BodypartSlot.Vagina else "start sucking {dom.yourHis} cock")+" but {dom.youVerb('fail')}.",
			])
			
			domInfo.addAnger(0.05)
			affectSub(subInfo.fetishScore({Fetish.OralSexGiving: 1.0}), 0.05, -0.2, 0.0)
			
			return {text = text}
		
		state = "sex"
		var text = ""
		
		if(domFocus == BodypartSlot.Penis):
			sendSexEvent(SexEvent.HolePenetrated, subID, domID, {hole=BodypartSlot.Head,engulfed=true,strapon=isSubWearingStrapon()})
			
			text += RNG.pick([
				"{dom.You} {dom.youVerb('take')} {sub.yourHis} {penis} into {dom.yourHis} mouth, {dom.yourHis} lips sliding down its length.",
				"{dom.You} {dom.youVerb('wrap')} {dom.yourHis} lips around {sub.yourHis} {penis}, your tongue teasing along its sensitive tip as {dom.youHe} {dom.youVerb('bob')} {dom.yourHis} head up and down.",
			])
		else:
			text += RNG.pick([
				"{dom.You} {dom.youVerb('lean')} down, pressing {dom.yourHis} tongue against {sub.yourHis} {pussy} with slow, deliberate strokes.",
				"{dom.You} {dom.youVerb('bury', 'buries')} {dom.yourHis} face between {sub.yourHis} legs, tongue exploring every inch of {sub.yourHis} pussy.",
			])
		
		text += " "
		if(subFocus == BodypartSlot.Penis):
			sendSexEvent(SexEvent.HolePenetrated, domID, subID, {hole=BodypartSlot.Head,engulfed=false,strapon=isDomWearingStrapon()})
			
			text += RNG.pick([
				"Without warning, {dom.you} {dom.youVerb('shift')} {dom.yourHis} hips, lining up {dom.yourHis} {dom.penis} with {sub.yourHis} lips. With a firm thrust, {dom.youHe} {dom.youVerb('part')} {sub.yourHis} mouth, forcing {sub.youHim} to return the favor by taking {dom.youHim}.",
				"{dom.You} {dom.youVerb('move')} {dom.yourHis} hips forward, guiding {dom.yourHis} {dom.penis} to {sub.yourHis} lips. {dom.YouHe} {dom.youVerb('push', 'pushes')} insistently, leaving {sub.youHim} no choice but to take {dom.youHim} in return.",
			])
		else:
			text += RNG.pick([
				"Without hesitation, {dom.you} {dom.youVerb('shift')} {dom.yourHis} weight and {dom.youVerb('lower')} {dom.yourself} onto {sub.yourHis} face, muffling any protests with {dom.yourHis} {dom.pussyStretch} pussy, forcing {sub.youHim} to start licking.",
				"At the same time, {dom.you} {dom.youVerb('lower')} {dom.yourself}, pressing {dom.yourHis} {dom.pussyStretch} pussy firmly against {sub.yourHis} mouth, forcing {sub.youHim} to start returning the favor.",
			])
		domInfo.addAnger(-0.1)
		affectSub(subInfo.fetishScore({Fetish.OralSexGiving: 1.0}), 0.05, -0.2, 0.0)
		
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
		var text = ""
		if(subFocus == BodypartSlot.Penis):
			sendSexEvent(SexEvent.HolePenetrated, domID, subID, {hole=BodypartSlot.Head,engulfed=true,strapon=isDomWearingStrapon()})
			
			text += RNG.pick([
				"Obediently, {sub.you} {sub.youVerb('part')} {sub.yourHis} lips and {sub.youVerb('take')} {dom.yourHis} {dom.penis} into {sub.yourHis} mouth, sucking eagerly.",
				"{sub.You} {sub.youVerb('open')} {sub.yourHis} mouth wide, letting {dom.yourHis} {dom.penis} slide past {sub.yourHis} lips. With an eager tongue and slow, deliberate movements, {sub.youHe} {sub.youVerb('begin')} sucking {dom.youHim} off.",
			])
		else:
			text += RNG.pick([
				"Obediently, {sub.you} {sub.youVerb('extend')} {sub.yourHis} tongue and {sub.youVerb('begin')} licking {dom.yourHis} {dom.pussyStretch} pussy.",
				"{sub.You} {sub.youVerb('press', 'presses')} {sub.yourHis} tongue to {dom.yourHis} {dom.pussyStretch} pussy, lapping eagerly, obeying {dom.youHis} command without hesitation.",
			])
		text += " "
		if(domFocus == BodypartSlot.Penis):
			sendSexEvent(SexEvent.HolePenetrated, subID, domID, {hole=BodypartSlot.Head,engulfed=true,strapon=isSubWearingStrapon()})
			
			text += RNG.pick([
				"In return, {dom.You} {dom.youVerb('take')} {sub.yourHis} {penis} into {dom.yourHis} mouth, {dom.yourHis} lips sliding down its length.",
				"Feeling that, {dom.You} {dom.youVerb('wrap')} {dom.yourHis} lips around {sub.yourHis} {penis}, your tongue teasing along its sensitive tip as {dom.youHe} {dom.youVerb('bob')} {dom.yourHis} head up and down.",
			])
		else:
			text += RNG.pick([
				"In return, {dom.You} {dom.youVerb('lean')} down, pressing {dom.yourHis} tongue against {sub.yourHis} {pussy} with slow, deliberate strokes.",
				"Feeling that, {dom.You} {dom.youVerb('bury', 'buries')} {dom.yourHis} face between {sub.yourHis} legs, tongue exploring every inch of {sub.yourHis} pussy.",
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
		subInfo.stimulateArousalZone(0.05, domFocus, 0.5)
		if(subInfo.isReadyToCum() && isHandlingSubOrgasms()):
			satisfyGoals()
			return combineData({text="[b]Double orgasm[/b]!"}, combineData(
				doCumBJDom() if subFocus == BodypartSlot.Penis else doCumPussyLickDom(),
				doCumBJSub(false) if domFocus == BodypartSlot.Penis else doCumPussyLickSub(false)
				))
		else:
			cumAmount += 1
			if(cumAmount >= 2):
				satisfyGoals()
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
		domInfo.stimulateArousalZone(0.05, subFocus, 0.5)
		
		if(domInfo.isReadyToCum() && isHandlingDomOrgasms()):
			satisfyGoals()
			return combineData({text="[b]Double orgasm[/b]!"}, combineData(
				doCumBJDom() if subFocus == BodypartSlot.Penis else doCumPussyLickDom(),
				doCumBJSub(false) if domFocus == BodypartSlot.Penis else doCumPussyLickSub(false)
				))
		else:
			cumAmount += 1
			if(cumAmount >= 2):
				satisfyGoals()
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
	if(getSub().isBitingBlocked() || subInfo.isUnconscious()):
		return 100.0
	if(subInfo.resistance <= 0.01):
		return 100.0
	var theChance:float= 50.0 - subInfo.getResistScoreSmooth()*30.0
	if(getSub().hasBlockedHands()):
		theChance *= 1.2
	if(getSub().hasBoundArms()):
		theChance *= 1.2
	
	return clamp(theChance, 5.0, 100.0)

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
