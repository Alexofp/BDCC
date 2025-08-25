extends SexActivityBase
var cumAmount:int = 0
var domFocus:String = BodypartSlot.Vagina
var subFocus:String = BodypartSlot.Vagina

func _init():
	id = "SixtyNine"
	
	activityName = "69"
	activityDesc = "Pleasure each other at the same time!"
	activityCategory = ["Fuck"]

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

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return [SexActivityTag.HavingSex, SexActivityTag.MouthUsed]
	if(_indx == SUB_0):
		return [SexActivityTag.HavingSex, SexActivityTag.PreventsSubTeasing, SexActivityTag.MouthUsed]
	return []

func getCheckTagsDom() -> Array:
	return [SexActivityTag.HavingSex, SexActivityTag.MouthUsed]

func getCheckTagsSub() -> Array:
	return [SexActivityTag.HavingSex, SexActivityTag.MouthUsed]

func domCanSwitchFocus() -> bool:
	if(getSub().hasReachablePenis() && getSub().hasReachableVagina()):
		return true
	return false

func subCanSwitchFocus() -> bool:
	if(getDom().hasReachablePenis() && getDom().hasReachableVagina()):
		return true
	return false

func startActivity(_args):
	var possibleDomFocus:Array = []
	if(getSub().hasReachablePenis()):
		possibleDomFocus.append(BodypartSlot.Penis)
	if(getSub().hasReachableVagina()):
		possibleDomFocus.append(BodypartSlot.Vagina)
	domFocus = RNG.pick(possibleDomFocus)
	
	var possibleSubFocus:Array = []
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
		
	affectSub(getSubInfo().fetishScore({Fetish.OralSexGiving: 1.0}), 0.1, -0.2, -0.01)
	affectDom(getDomInfo().fetishScore({Fetish.OralSexGiving: 1.0}), 0.1, -0.03)
	
	addText("{dom.You} {dom.youVerb('position')} {dom.yourself} above {sub.you}, {dom.yourHis} "+domPartNameStr+" hovering tantalizingly close to {sub.yourHis} lips while {dom.yourHis} mouth lines up perfectly with {sub.yourHis} "+subPartNameStr+".")
	return

func onSwitchFrom(_otherActivity, _args):
	return

func order_processTurn():
	if(getSubInfo().isUnconscious()):
		state = ""

func sex_processTurn():
	if(domFocus == BodypartSlot.Vagina && !getSub().hasReachableVagina()):
		state = ""
		satisfyGoals()
		addText("{sub.Your} pussy is not reachable anymore so {dom.you} {dom.youVerb('stop')} licking it.")
		return
	if(domFocus == BodypartSlot.Penis && !getSub().hasReachablePenis()):
		state = ""
		satisfyGoals()
		addText("{sub.Your} cock is not reachable anymore so {dom.you} {dom.youVerb('stop')} sucking it.")
		return
	if(subFocus == BodypartSlot.Vagina && !getDom().hasReachableVagina()):
		state = ""
		satisfyGoals()
		addText("{dom.Your} pussy is not reachable anymore so {sub.you} {sub.youAre} unable to continue licking it.")
		return
	if(subFocus == BodypartSlot.Penis && !getDom().hasReachablePenis()):
		state = ""
		satisfyGoals()
		addText("{dom.Your} cock is not reachable anymore so {sub.you} {sub.youAre} unable to continue sucking it.")
		return
		
	if(RNG.chance(50)):
		if(subFocus == BodypartSlot.Penis):
			doBlowjobTurnDom()
		else:
			doPussyLickingTurnDom()
			react(SexReaction.DomsPussyGetsLicked, [10.0, 10.0])
		if(domFocus == BodypartSlot.Penis):
			doBlowjobTurnSub()
		else:
			doPussyLickingTurnSub()
		return
	
	if(domFocus == BodypartSlot.Penis):
		doBlowjobTurnSub()
	else:
		doPussyLickingTurnSub()
	if(subFocus == BodypartSlot.Penis):
		doBlowjobTurnDom()
	else:
		doPussyLickingTurnDom()
		react(SexReaction.DomsPussyGetsLicked, [10.0, 10.0])


func getActions(_indx:int):
	if(_indx == DOM_0):
		if(domCanSwitchFocus()):
			addAction("switch", 0.05, "Switch focus", "Switch focus to their other bits")
		addAction("stop", getStopScore(), "Stop 69", "Enough licking and sucking")
	if(_indx == SUB_0):
		addAction("pullaway", getSubInfo().getResistScore(), "Pull away", "Try to pull away", {A_CHANCE: getSubResistChance(30.0, 25.0)})

func doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "switch"):
		if(domFocus == BodypartSlot.Penis):
			domFocus = BodypartSlot.Vagina
		else:
			domFocus = BodypartSlot.Penis
		addText("{dom.You} {dom.youVerb('switch', 'switches')} {dom.yourHis} focus to {sub.your} "+("{sub.penis}" if domFocus == BodypartSlot.Penis else "{sub.pussyStretch} pussy")+".")
		return
	if(_id == "stop"):
		endActivity()
		addText("{dom.You} {dom.youVerb('pull')} {dom.yourHis} crotch away from {sub.your} face, ending the fun.")
		return

	if(_id == "pullaway"):
		var successChance:float = getSubResistChance(30.0, 25.0)
		if(RNG.chance(successChance)):
			getDomInfo().addAnger(0.3)
			if(state != ""):
				state = ""
			else:
				failGoals()
				endActivity()
			addText("{sub.You} {sub.youVerb('pull')} away from {dom.you}.")
			return
		else:
			getDomInfo().addAnger(0.1)
			addText("{sub.You} {sub.youVerb('try', 'tries')} to pull away from {dom.you} but {sub.youVerb('fail')}.")
			reactSub(SexReaction.ActivelyResisting, [50])
			return

	
func init_getActions(_indx:int):
	if(_indx == DOM_0):
		var isSubUncon:bool = getSubInfo().isUnconscious()
		
		if(getSub().getFirstItemThatCoversBodypart(domFocus) == null):
			if(getDom().hasReachableVagina() && getDom().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) == null):
				if(!isSubUncon):
					addAction("orderlick", 1.0 - getDomInfo().getAngerScore(), "Order to lick", "Order them to start licking your pussy!")
				var forcelickScore:float = getDomInfo().getAngerScore() if !isSubUncon else 1.0
				addAction("forcelick", forcelickScore, "Force to lick", "Force the sub to start licking you off!", {A_CHANCE: getDomForceChance()})

			if(getDom().hasReachablePenis() && getDom().getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
				if(!isSubUncon):
					addAction("ordersuck", 1.0 - getDomInfo().getAngerScore(), "Order to suck", "Order them to start sucking your cock!")
				var forcesuckScore:float = getDomInfo().getAngerScore() if !isSubUncon else 1.0
				addAction("forcesuck", forcesuckScore, "Force to suck", "Force the sub to start sucking you off!", {A_CHANCE: getDomForceChance()})

func init_doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "orderlick"):
		state = "order"
		subFocus = BodypartSlot.Vagina
		affectSub(getSubInfo().fetishScore({Fetish.OralSexGiving: 1.0}), 0.05, -0.4, 0.0)
		addText("{dom.You} {dom.youVerb('order')} {sub.youHim} to "+RNG.pick(["start licking {dom.yourHis} pussy", "stick {sub.yourHis} tongue out and start working on {dom.yourHis} pussy"])+".")
		react(SexReaction.OrderLickPussy)
		return
	if(_id == "ordersuck"):
		state = "order"
		subFocus = BodypartSlot.Penis
		affectSub(getSubInfo().fetishScore({Fetish.OralSexGiving: 1.0}), 0.05, -0.4, 0.0)
		addText("{dom.You} {dom.youVerb('order')} {sub.youHim} to "+RNG.pick(["open {sub.yourHis} mouth", "part {sub.yourHis} lips"])+".")
		react(SexReaction.OrderBlowjob)
		return
	if(_id in ["forcelick", "forcesuck"]):
		var succChance:float = getDomForceChance()
		if(_id == "forcelick"):
			subFocus = BodypartSlot.Vagina
		if(_id == "forcesuck"):
			subFocus = BodypartSlot.Penis
		
		if(!RNG.chance(succChance)):
			getDomInfo().addAnger(0.05)
			affectSub(getSubInfo().fetishScore({Fetish.OralSexGiving: 1.0}), 0.05, -0.2, 0.0)
			addText("{dom.You} {dom.youVerb('try', 'tries')} to force {sub.you} to "+("start licking {dom.yourHis} pussy" if subFocus == BodypartSlot.Vagina else "start sucking {dom.yourHis} cock")+" but {dom.youVerb('fail')}.")
			if(domFocus == BodypartSlot.Penis):
				react(SexReaction.TryForceSuckPenis, [40.0, 20.0])
			else:
				react(SexReaction.TryForceLickPussy, [40.0, 20.0])
			return
		
		state = "sex"
		var text:String = ""
		
		if(domFocus == BodypartSlot.Penis):
			sendSexEvent(SexEvent.HolePenetrated, SUB_0, DOM_0, {hole=BodypartSlot.Head,engulfed=true,strapon=isWearingStrapon(SUB_0)})
			
			text += RNG.pick([
				"{dom.You} {dom.youVerb('take')} {sub.yourHis} {penis} into {dom.yourHis} mouth, {dom.yourHis} lips sliding down its length.",
				"{dom.You} {dom.youVerb('wrap')} {dom.yourHis} lips around {sub.yourHis} {penis}, {dom.yourHis} tongue teasing along its sensitive tip as {dom.youHe} {dom.youVerb('bob')} {dom.yourHis} head up and down.",
			])
		else:
			text += RNG.pick([
				"{dom.You} {dom.youVerb('lean')} down, pressing {dom.yourHis} tongue against {sub.yourHis} {pussy} with slow, deliberate strokes.",
				"{dom.You} {dom.youVerb('bury', 'buries')} {dom.yourHis} face between {sub.yourHis} legs, tongue exploring every inch of {sub.yourHis} pussy.",
			])
		
		text += " "
		if(subFocus == BodypartSlot.Penis):
			sendSexEvent(SexEvent.HolePenetrated, DOM_0, SUB_0, {hole=BodypartSlot.Head,engulfed=false,strapon=isWearingStrapon(DOM_0)})
			
			text += RNG.pick([
				"Without warning, {dom.you} {dom.youVerb('shift')} {dom.yourHis} hips, lining up {dom.yourHis} {dom.penis} with {sub.yourHis} lips. With a firm thrust, {dom.youHe} {dom.youVerb('part')} {sub.yourHis} mouth, forcing {sub.youHim} to return the favor by taking {dom.youHim}.",
				"{dom.You} {dom.youVerb('move')} {dom.yourHis} hips forward, guiding {dom.yourHis} {dom.penis} to {sub.yourHis} lips. {dom.YouHe} {dom.youVerb('push', 'pushes')} insistently, leaving {sub.youHim} no choice but to take {dom.youHim} in return.",
			])
		else:
			text += RNG.pick([
				"Without hesitation, {dom.you} {dom.youVerb('shift')} {dom.yourHis} weight and {dom.youVerb('lower')} {dom.yourself} onto {sub.yourHis} face, muffling any protests with {dom.yourHis} {dom.pussyStretch} pussy, forcing {sub.youHim} to start licking.",
				"At the same time, {dom.you} {dom.youVerb('lower')} {dom.yourself}, pressing {dom.yourHis} {dom.pussyStretch} pussy firmly against {sub.yourHis} mouth, forcing {sub.youHim} to start returning the favor.",
			])
		getDomInfo().addAnger(-0.1)
		affectSub(getSubInfo().fetishScore({Fetish.OralSexGiving: 1.0}), 0.05, -0.2, 0.0)
		
		addText(text)
		return

func order_getActions(_indx:int):
	if(_indx == SUB_0):
		addAction("obey", getSubInfo().getComplyScore(), "Obey", "Start "+("sucking" if subFocus == BodypartSlot.Penis else "licking"), {A_PRIORITY: 1001})
		var refuseScore:float = getSubInfo().getResistScore()*((1.0+getSubInfo().personalityScore({PersonalityStat.Mean:-1.0})) if !getSub().isBitingBlocked() else 1.0)
		addAction("refuse", refuseScore, "Refuse", "Refuse to do it", {A_PRIORITY: 1001})
		if(!getSub().isBitingBlocked()):
			var biteScore:float = getSubInfo().getResistScore()/2.0*(1.0+getSubInfo().personalityScore({PersonalityStat.Mean:1.0}))
			addAction("bite", biteScore, "Bite!", "Refuse to do it", {A_PRIORITY: 1001, A_CHANCE: getSubBiteChance(50.0, 30.0)})

func order_doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "obey"):
		state = "sex"
		var text:String = ""
		if(subFocus == BodypartSlot.Penis):
			sendSexEvent(SexEvent.HolePenetrated, DOM_0, SUB_0, {hole=BodypartSlot.Head,engulfed=true,strapon=isWearingStrapon(DOM_0)})
			
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
			sendSexEvent(SexEvent.HolePenetrated, SUB_0, DOM_0, {hole=BodypartSlot.Head,engulfed=true,strapon=isWearingStrapon(SUB_0)})
			
			text += RNG.pick([
				"In return, {dom.You} {dom.youVerb('take')} {sub.yourHis} {penis} into {dom.yourHis} mouth, {dom.yourHis} lips sliding down its length.",
				"Feeling that, {dom.You} {dom.youVerb('wrap')} {dom.yourHis} lips around {sub.yourHis} {penis}, {dom.yourHis} tongue teasing along its sensitive tip as {dom.youHe} {dom.youVerb('bob')} {dom.yourHis} head up and down.",
			])
		else:
			text += RNG.pick([
				"In return, {dom.You} {dom.youVerb('lean')} down, pressing {dom.yourHis} tongue against {sub.yourHis} {pussy} with slow, deliberate strokes.",
				"Feeling that, {dom.You} {dom.youVerb('bury', 'buries')} {dom.yourHis} face between {sub.yourHis} legs, tongue exploring every inch of {sub.yourHis} pussy.",
			])
		
		addText(text)
		reactSub(SexReaction.AgreeGeneric)
		return
	if(_id == "refuse"):
		state = ""
		getDomInfo().addAnger(0.3)
		addText("{sub.You} {sub.youVerb('refuse')}.")
		reactSub(SexReaction.RefuseGeneric)
		return
	if(_id == "bite"):
		var successChance:float = getSubBiteChance(50.0, 30.0)
		if(RNG.chance(successChance)):
			getDomInfo().addPain(10)
			sendSexEvent(SexEvent.PainInflicted, SUB_0, DOM_0, {pain=10,isDefense=true,intentional=true})
			getDomInfo().addAnger(1.0 - getDomInfo().fetishScore({Fetish.Masochism: 0.5}))
			getDomInfo().addLust(-5 + 10 * getDomInfo().fetishScore({Fetish.Masochism: 1.0}))
			if(RNG.chance(50)):
				failGoals()
			endActivity()
			addText("{sub.You} {sub.youVerb('bite')} {dom.your} genitals! {dom.YouHe} {dom.youVerb('cry', 'cries')} from pain and {dom.youVerb('pull')} away.")
			react(SexReaction.PainGeneric)
			return
		else:
			getDomInfo().addAnger(0.4)
			state = ""
			addText("{sub.You} {sub.youVerb('try', 'tries')} to bite {dom.you} but {dom.youHe} {dom.youVerb('avoid')} it!")
			return

func sex_getActions(_indx:int):
	if(_indx == DOM_0):
		if(domFocus == BodypartSlot.Vagina && getDom().hasEffect(StatusEffect.HasCumInsideMouth) && getSub().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) == null && !getDom().isOralBlocked() && OPTIONS.isContentEnabled(ContentType.CumStealing)):
			var spitcumintosubspussyScore:float = 0.01 + getDomInfo().fetishScore({Fetish.Breeding: 0.1})
			addAction("spitcumintosubspussy", spitcumintosubspussyScore, "Spit cum into pussy", "Force some cum into their slit")
		
		if(isReadyToCumHandled(DOM_0)):
			if(isReadyToCumHandled(SUB_0)):
				addAction("cum", 1.0, "Double cum!", "Both of you are about to cum!", {A_PRIORITY: 1001})
			else:
				addAction("cum", 1.0, "Cum!", "You're about to cum.", {A_PRIORITY: 1001})
	if(_indx == SUB_0):
		if(isReadyToCumHandled(SUB_0)):
			addAction("cumSub", 1.0, "Cum!", "You're about to cum.", {A_PRIORITY: 1001})

func sex_doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "spitcumintosubspussy"):
		doSpitCumIntoHoleDom(BodypartSlot.Vagina)
		return
	if(_id == "cum"):
		getSubInfo().stimulateArousalZone(0.05, domFocus, 0.5)
		if(isReadyToCumHandled(SUB_0)):
			satisfyGoals()
			addText("[b]Double orgasm[/b]!")
			var _ok =doCumBJDom() if subFocus == BodypartSlot.Penis else doCumPussyLickDom()
			var _ok2 =doCumBJSub(false) if domFocus == BodypartSlot.Penis else doCumPussyLickSub(false)
			return
		else:
			cumAmount += 1
			if(cumAmount >= 2):
				satisfyGoals()
		var _ok =doCumBJDom() if subFocus == BodypartSlot.Penis else doCumPussyLickDom()
		return
	if(_id == "cumSub"):
		getDomInfo().stimulateArousalZone(0.05, subFocus, 0.5)
		
		if(isReadyToCumHandled(DOM_0)):
			satisfyGoals()
			addText("[b]Double orgasm[/b]!")
			var _ok =doCumBJDom() if subFocus == BodypartSlot.Penis else doCumPussyLickDom()
			var _ok2 =doCumBJSub(false) if domFocus == BodypartSlot.Penis else doCumPussyLickSub(false)
			return
		else:
			cumAmount += 1
			if(cumAmount >= 2):
				satisfyGoals()
		var _ok =doCumBJSub(false) if domFocus == BodypartSlot.Penis else doCumPussyLickSub(false)
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
		
		return [StageScene.Sex69, aName, {npc=DOM_0, pc=SUB_0, bodyState={hard=true}, npcBodyState={hard=true}}]
	return [StageScene.Sex69, "tease", {npc=DOM_0, pc=SUB_0}]
	
func getOrgasmHandlePriority(_indx:int) -> int:
	if(_indx == DOM_0):
		return 10
	if(_indx == SUB_0):
		return 10
	return -1

func getDomForceChance() -> float:
	if(getSub().isBitingBlocked() || getSubInfo().isUnconscious()):
		return 100.0
	if(getSubInfo().resistance <= 0.01):
		return 100.0
	var theChance:float= 50.0 - getSubInfo().getResistScoreSmooth()*30.0
	if(getSub().hasBlockedHands()):
		theChance *= 1.2
	if(getSub().hasBoundArms()):
		theChance *= 1.2
	
	return clamp(theChance, 5.0, 100.0)

func getSubResistChance(baseChance:float, domAngerRemoval:float) -> float:
	var theChance = baseChance - getDomInfo().getAngerScore()*domAngerRemoval
	if(getSub().hasBlockedHands()):
		theChance *= 0.7
	if(getSub().hasBoundArms()):
		theChance *= 0.5
	if(getSub().isBlindfolded()):
		theChance *= 0.9
	if(getSub().hasBoundLegs()):
		theChance *= 0.8
	
	return max(theChance, 5.0)

func getSubBiteChance(baseChance:float, domAngerRemoval:float) -> float:
	#if(state in ["blowjob", "licking"]):
	#	return 100.0
	var theChance = baseChance - getDomInfo().getAngerScore()*domAngerRemoval
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
