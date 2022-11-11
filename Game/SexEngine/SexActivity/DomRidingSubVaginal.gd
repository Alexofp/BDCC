extends SexActivityBase
var waitTimer = 0

var usedBodypart = BodypartSlot.Vagina
var usedTag = SexActivityTag.VaginaUsed
var usedTagInside = SexActivityTag.VaginaPenetrated
var fetishGiving = Fetish.VaginalSexGiving
var fetishReceiving = Fetish.VaginalSexReceiving
var aboutToPenetrateReaction = SexReaction.AboutToPenetratePussy
var usedBodypartNames = ["pussy", "pussy", "slit", "cunt", "kitty"]
var switchHoleActivity = "DomRidingSubAnal"
var otherHoleNames = ["anus"]
var otherHoleBodypart = BodypartSlot.Anus
var otherHoleTag = SexActivityTag.AnusUsed
var otherHoleFetishGiving = Fetish.AnalSexGiving
var otherHoleFetishReceiving = Fetish.AnalSexReceiving

func _init():
	id = "DomRidingSubVaginal"

func getGoals():
	return {
		SexGoal.FuckVaginal: 1.0,
	}

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(!_subInfo.getChar().hasReachablePenis()):
		return false
	if(usedBodypart == BodypartSlot.Vagina && !_domInfo.getChar().hasReachableVagina()):
		return false
	if(usedBodypart == BodypartSlot.Anus && !_domInfo.getChar().hasReachableAnus()):
		return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getVisibleName():
	return "Cowgirl Vaginal"

func getCategory():
	return ["Fuck"]

func getDomTags():
	var thetags = [usedTag, SexActivityTag.PreventsSubViolence, SexActivityTag.PreventsSubTeasing]
	if(state in ["fucking", "aftercumminginside"]):
		thetags.append(usedTagInside)
	return thetags

func getSubTags():
	if(state in ["fucking", "aftercumminginside"]):
		return [SexActivityTag.PenisUsed, SexActivityTag.PenisInside]
	return [SexActivityTag.PenisUsed]

func getDomTagsCheck():
	return [SexActivityTag.OrderedToDoSomething, usedTag]

func getSubTagsCheck():
	return [SexActivityTag.OrderedToDoSomething, SexActivityTag.PenisUsed]

func startActivity(_args):
	state = ""
	
	var text = RNG.pick([
		"{dom.You} {dom.youVerb('stradle')} {sub.you} and {dom.youVerb('rub')} {dom.yourHis} "+RNG.pick(usedBodypartNames)+" against {sub.yourHis} "+RNG.pick(["dick", "penis", "cock", "member"])+".",
	])
	
	return {
		text = text,
	}

func onSwitchFrom(_otherActivity, _args):
	return

func processTurn():
	if(state == "fucking"):
		affectSub(subInfo.fetishScore({fetishGiving: 1.0})+0.5, 0.1, -0.1, -0.01)
		affectDom(domInfo.fetishScore({fetishReceiving: 1.0})+0.3, 0.1, 0.0)
		subInfo.addArousalSex(0.2)
		domInfo.addArousalSex(0.2)
		
		var text = RNG.pick([
			"{dom.You} {dom.youAre} riding {sub.yourHis} "+RNG.pick(["dick", "cock", "member"])+".",
			"{dom.You} {dom.youAre} bouncing on {sub.yourHis} "+RNG.pick(["dick", "cock", "member"])+" with {dom.yourHis} "+RNG.pick(usedBodypartNames)+".",
			"{dom.You} {dom.youAre} going up and down on {sub.yourHis} "+RNG.pick(["dick", "cock", "member"])+" with {dom.yourHis} "+RNG.pick(usedBodypartNames)+".",
			"{dom.You} {dom.youAre} fucking {sub.yourHis} "+RNG.pick(["dick", "cock", "member"])+" with {dom.yourHis} "+RNG.pick(usedBodypartNames)+".",
		])
		
		if(RNG.chance(20)):
			var freeRoom = getDom().getPenetrationFreeRoomBy(usedBodypart, subID)
			
			getDom().gotOrificeStretchedBy(usedBodypart, subID, 0.1)
			
			if(usedBodypart == BodypartSlot.Vagina):
				if(freeRoom <= 5.0):
					text += RNG.pick([
						" The tip of {sub.yourHis} "+RNG.pick(["cock", "dick", "member"])+" easily "+RNG.pick(["hits", "smashes", "reaches", "finds"])+" {dom.yourHis} "+RNG.pick(["cervix", "natural barricade"])+".",
					])
				elif(freeRoom >= 10):
					text += RNG.pick([
						" The tip of {sub.yourHis} "+RNG.pick(["cock", "dick", "member"])+" can barely reach anywhere deep.",
						" The tip of {sub.yourHis} "+RNG.pick(["cock", "dick", "member"])+" is struggling to reach {dom.yourHis} "+RNG.pick(["cervix", "natural barricade"])+".",
					])
			if(usedBodypart == BodypartSlot.Anus):
				if(freeRoom <= 5.0):
					text += RNG.pick([
						" The tip of {sub.yourHis} "+RNG.pick(["cock", "dick", "member"])+" easily "+RNG.pick(["hits", "smashes", "reaches", "finds"])+" {dom.yourHis} "+RNG.pick(["pleasure spot"])+".",
					])
				elif(freeRoom >= 10):
					text += RNG.pick([
						" The tip of {sub.yourHis} "+RNG.pick(["cock", "dick", "member"])+" can barely reach anywhere deep.",
						" The tip of {sub.yourHis} "+RNG.pick(["cock", "dick", "member"])+" is struggling to reach {dom.yourHis} "+RNG.pick(["pleasure spot"])+".",
					])
		
		if(subInfo.isReadyToCum()):
			text += RNG.pick([
				" {sub.You} {sub.youAre} being edged by {dom.you}.",
				" {sub.You} {sub.youAre} about to cum!",
				" {sub.You} {sub.youAre} keeping {dom.yourself} on edge.",
				" {sub.Your} "+RNG.pick(["cock", "dick", "member"])+" is moments from cumming.",
				" {sub.Your} "+RNG.pick(["cock", "dick", "member"])+" reached its peak."
			])
		elif(subInfo.isCloseToCumming()):
			text += RNG.pick([
				" {sub.You} pants eagerly.",
				" {sub.You} closes in on {sub.yourHis} orgasm.",
				" {sub.You} {sub.youAre} gonna cum soon.",
				" {sub.Your} "+RNG.pick(["cock", "dick", "member"])+" is throbbing.",
				" {sub.Your} "+RNG.pick(["cock", "dick", "member"])+" is twitching and leaking a lot."
			])
		
		return {text=text}


func getDomActions():
	var actions = []
	if(state == ""):
		actions.append({
				"id": "rub",
				"score": 1.0,
				"name": "Rub",
				"desc": "Rub your "+RNG.pick(usedBodypartNames)+" against their cock",
			})

		if(domInfo.getChar().getFirstItemThatCoversBodypart(usedBodypart) == null && subInfo.isReadyToPenetrate()):
			actions.append({
					"id": "envelop",
					"score": 1.0,
					"name": RNG.pick(["Envelop cock"]),
					"desc": "Try to get this cock inside you",
				})

	if(state in ["fucking"]):
		actions.append({
				"id": "moan",
				"score": max(0.1, domInfo.fetishScore({fetishReceiving: 1.0}) + domInfo.personalityScore({PersonalityStat.Subby: 1.0})),
				"name": "Moan",
				"desc": "Show how much you like it",
			})


		if(domInfo.isReadyToCum() && isHandlingDomOrgasms()):
			actions.append({
				"id": "domcum",
				"score": 1.0,
				"name": "Cum!",
				"desc": "You're about to cum!",
				"priority" : 1001,
			})
			
	actions.append({
		"id": "stop",
		"score": getStopScore(),
		"name": "Stop riding",
		"desc": "Stop the sex activity",
	})
			
	return actions


func doDomAction(_id, _actionInfo):
	if(_id == "stop"):
		endActivity()
		return {text = "{dom.You} {dom.youVerb('pull')} {dom.yourself} away from {sub.your} cock and {dom.youVerb('get')} up."}

	if(_id == "domcum"):
		getDom().cumOnFloor()
		domInfo.cum()
		return getGenericDomOrgasmData()
	
	if(_id == "rub"):
		affectSub(subInfo.fetishScore({fetishGiving: 1.0}), 0.1, 0.0, 0.0)
		affectDom(domInfo.fetishScore({fetishReceiving: 1.0}), 0.1, -0.01)
		subInfo.addArousalForeplay(0.05)
		domInfo.addArousalForeplay(0.05)
		
		return {text = "{dom.You} {dom.youVerb('rub')} {dom.yourHis} "+RNG.pick(usedBodypartNames)+" against {sub.yourHis} "+RNG.pick(["cock", "dick", "member"])+".",}
	if(_id == "envelop"):
		if(!RNG.chance(getDom().getPenetrateChanceBy(usedBodypart, subID))):
			getDom().gotOrificeStretchedBy(usedBodypart, subID, 0.1)
			affectSub(subInfo.fetishScore({fetishGiving: 1.0}), 0.1, 0.0, 0.0)
			affectDom(domInfo.fetishScore({fetishReceiving: 1.0}), 0.2, -0.01)
			return {text="{dom.You} {dom.youVerb('try', 'tries')} to envelop {sub.yourHis} cock but it's too big!"}
		
		affectSub(subInfo.fetishScore({fetishGiving: 1.0}), 0.1, 0.0, 0.0)
		affectDom(domInfo.fetishScore({fetishReceiving: 1.0}), 0.1, -0.01)
		subInfo.addArousalSex(0.1)
		domInfo.addArousalSex(0.1)
		
		#getSub().gotFuckedBy(usedBodypart, domID)
		getDom().gotOrificeStretchedBy(usedBodypart, subID, 0.2)
		#gonnaCumOutside = false
		state = "fucking"
		return {text = "{dom.You} {dom.youVerb('envelop')} {sub.youHis} cock, letting it penetrate {dom.yourHis} "+RNG.pick(usedBodypartNames)+"."}

	if(_id == "moan"):
		var moanText = RNG.pick([
			"{dom.youVerb('moan')}"
		])
		if(getDom().isGagged()):
			moanText = RNG.pick([
				"{dom.youVerb('let')} out muffled moans",
			])
		
		var text = RNG.pick([
			"{dom.You} "+moanText+" while being fucked!",
			"{dom.You} "+moanText+" while having {sub.yourHis} "+RNG.pick(usedBodypartNames)+" used!",
			"{dom.You} "+moanText+" eagerly!",
		])
		affectSub(subInfo.fetishScore({fetishGiving: 1.0}), 0.03, -0.01, -0.0)
		affectDom(domInfo.fetishScore({fetishReceiving: 1.0}), 0.05, -0.03)
		return {text = text}



func getSubActions():
	var actions = []
	if(state in [""]):
		actions.append({
			"id": "rub",
			"score": subInfo.getComplyScore()/2.0,
			"name": "Tease",
			"desc": "Rub your dick against their "+RNG.pick(usedBodypartNames),
		})

	if(state in ["fucking"]):
		if(subInfo.isReadyToCum() && isHandlingSubOrgasms()):
			actions.append({
				"id": "warndom",
				"score": 1.0,
				"name": "Warn them",
				"desc": "Let them know that you're about to cum",
				"priority": 1001,
			})
			actions.append({
				"id": "cuminside",
				"score": subInfo.getResistScore() + subInfo.fetishScore({Fetish.Breeding: 0.5}),
				"name": "Cum inside",
				"desc": "Cum inside their "+RNG.pick(usedBodypartNames),
				"priority": 1001,
			})


	
	return actions

func doSubAction(_id, _actionInfo):
	if(_id == "rub"):
		affectSub(subInfo.fetishScore({fetishGiving: 1.0}), 0.05, -0.1, 0.0)
		affectDom(max(0.1, domInfo.fetishScore({fetishReceiving: 1.0})+1.0), 0.05, 0.0)
		
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('rub')} {sub.yourHis} dick against {dom.your} "+RNG.pick(usedBodypartNames)+".",
		])
		return {text=text}

		
	if(_id == "cuminside"):
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('grunt')} as {sub.yourHis} "+RNG.pick(["cock", "dick", "member"])+" throbs and [b]"+RNG.pick(["cums inside {dom.yourHis} "+RNG.pick(usedBodypartNames), "stuffs {dom.yourHis} "+RNG.pick(usedBodypartNames)])+" without asking permission[/b]!",
		])
		if(usedBodypart == BodypartSlot.Vagina):
			text += RNG.pick([
				" Waves after waves of sticky "+RNG.pick(["cum", "seed", "jizz", "semen"])+" flow into {dom.yourHis} "+RNG.pick(["womb", "babymaker", "womb"])+".",
			])
		else:
			text = RNG.pick([
				" Waves after waves of sticky "+RNG.pick(["cum", "seed", "jizz", "semen"])+" get shoved into {dom.yourHis} "+RNG.pick(["ass", "butt"])+".",
			])
		
		var condom:ItemBase = getSub().getWornCondom()
		if(condom != null):
			var breakChance = condom.getCondomBreakChance()
			
			if(RNG.chance(breakChance)):
				text = "[b]The condom broke![/b] "+text
				condom.destroyMe()
			else:
				text = RNG.pick([
					"{sub.You} filled the condom inside {dom.your} "+RNG.pick(usedBodypartNames)+" [b]without asking for permission[/b]!",
					"{sub.You} stuffed the condom in {dom.your} "+RNG.pick(usedBodypartNames)+" full of {sub.yourHis} "+RNG.pick(["cum", "seed", "jizz", "semen"])+" [b]without asking for permission[/b]!",
				])
				getSub().cumOnFloor()
				subInfo.cum()
				domInfo.addArousalSex(0.05)
				satisfyGoals()
				state = ""
				
				return {text=text}
		
		var beingBredScore = domInfo.fetishScore({Fetish.BeingBred: 1.0})
		if(beingBredScore < 0.0):
			domInfo.addAnger(1.0)
			text += RNG.pick([
				" {dom.You} {dom.youAre} furious!",
			])
		else:
			domInfo.addAnger(0.3)
		getDom().cummedInBodypartBy(usedBodypart, subID)
		subInfo.cum()
		domInfo.addArousalSex(0.05)
		satisfyGoals()
		state = ""

		return {text=text}



func getAnimation():
	return [StageScene.Duo, "kneel", {pc=subID, npc=domID, npcAction="stand", flipPc=false}]

func getDomSwitchHoleChance():
	if(domInfo.hasMemory("switchedHoles")):
		return 0.0
	
	var domLikesOtherHoleScore = domInfo.fetishScore({otherHoleFetishGiving:1.0, fetishGiving: -0.5})
	
	return max(5.0, domLikesOtherHoleScore * 100.0 * (1.0 - domInfo.getAngerScore()))

func getDomOrgasmHandlePriority():
	return 5

func getSubOrgasmHandlePriority():
	return 10
