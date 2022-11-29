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
var otherGoal = SexGoal.ReceiveAnal

func _init():
	id = "DomRidingSubVaginal"

func getGoals():
	return {
		SexGoal.ReceiveVaginal: 1.0,
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
	var thetags = [usedTag, SexActivityTag.HavingSex]
	if(state in ["fucking", "aftercumminginside", "knotting"]):
		thetags.append(usedTagInside)
	return thetags

func getSubTags():
	if(state in ["fucking", "aftercumminginside", "knotting"]):
		return [SexActivityTag.PenisUsed, SexActivityTag.PenisInside, SexActivityTag.HavingSex, SexActivityTag.PreventsSubViolence, SexActivityTag.PreventsSubTeasing]
	return [SexActivityTag.PenisUsed, SexActivityTag.HavingSex, SexActivityTag.PreventsSubViolence, SexActivityTag.PreventsSubTeasing]

func getDomTagsCheck():
	return [SexActivityTag.OrderedToDoSomething, usedTag, SexActivityTag.HavingSex]

func getSubTagsCheck():
	return [SexActivityTag.OrderedToDoSomething, SexActivityTag.PenisUsed, SexActivityTag.HavingSex]

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
	if(state == "knotting"):
		var freeRoom = getDom().getPenetrationFreeRoomBy(usedBodypart, subID)
		if(freeRoom > 0.0):
			var text = RNG.pick([
				"{dom.You} {dom.youAre} being a "+RNG.pick(["great", "good"])+" cock warmer for {sub.you}. There is enough room inside {dom.yourHis} "+RNG.pick(usedBodypartNames)+" for {dom.youHim} not to feel any pain.",
			])
			
			return {text = text}
		else:
			var text = RNG.pick([
				"{dom.You} {dom.youAre} trying to be a cock warmer for {sub.you} but {dom.yourHis} "+RNG.pick(usedBodypartNames)+" is too tight, it's very painful! But it sure feels good for {sub.you}.",
			])
			domInfo.addPain(RNG.randi_range(1, 2))
			subInfo.addLust(10)
			subInfo.addArousalForeplay(0.1)
			getDom().gotOrificeStretchedBy(usedBodypart, subID, 0.1)
			return {text = text}
	
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
		
		if(RNG.chance(20) && getSub().bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisBarbs)):
			text += RNG.pick([
				" Barbs on {sub.yourHis} "+RNG.pick(["cock", "dick", "shaft"])+" provide extra stimulation.",
				" Barbs on {sub.yourHis} "+RNG.pick(["cock", "dick", "shaft"])+" "+RNG.pick(["rake against", "scratch"])+" the "+RNG.pick(["soft insides", "soft inner walls"])+".",
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

		if(getDom().getFirstItemThatCoversBodypart(usedBodypart) == null && getSub().getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null && subInfo.isReadyToPenetrate()):
			actions.append({
					"id": "envelop",
					"score": 1.0,
					"name": RNG.pick(["Envelop cock"]),
					"desc": "Try to get this cock inside you",
				})
				
		if(domInfo.getChar().hasBodypart(otherHoleBodypart) && !getSexEngine().hasTag(domID, otherHoleTag)):
			actions.append({
				"id": "switchhole",
				"score": 5.0 * (-domInfo.goalsScore(getGoals(), subID) + domInfo.goalsScore({otherGoal: 1.0}, subID)),
				"name": RNG.pick(["Switch hole"]),
				"desc": "Switch to riding with your "+RNG.pick(otherHoleNames),
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
			
	if(state in ["subabouttocum"] || (state == "fucking" && subInfo.isReadyToCum() && subInfo.isUnconscious())):
		var scoreToCumInside = 1.0
		var hasKnot = getSub().bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisKnot)
		if(hasKnot):
			scoreToCumInside *= 0.5
			
			actions.append({
				"id": "letsubknotinside",
				"score": scoreToCumInside,
				"name": "Knot!",
				"desc": "Try to force the knot into your "+RNG.pick(usedBodypartNames),
				"priority": 1001,
			})
			
		actions.append({
			"id": "letsubcuminside",
			"score": scoreToCumInside,
			"name": "Cum inside",
			"desc": "Let the sub cum inside you",
			"priority" : 1001,
		})
		actions.append({
			"id": "makesubcumoutside",
			"score": 1.0,
			"name": "Pull out",
			"desc": "Stop riding the sub",
			"priority" : 1001,
		})
	
	if(!(state in ["knotting"])):
		actions.append({
			"id": "stop",
			"score": getStopScore(),
			"name": "Stop riding",
			"desc": "Stop the sex activity",
		})
	if(state in ["knotting"]):
		actions.append({
			"id": "pullknotout",
			"score": 1.0,
			"name": "Pull out",
			"desc": "Try to yank their knot out",
		})
			
	return actions


func doDomAction(_id, _actionInfo):
	if(_id == "switchhole"):
		switchCurrentActivityTo(switchHoleActivity)
		
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('switch', 'switches')} holes, now rubbing {dom.yourHis} "+RNG.pick(otherHoleNames)+" agaisnt {sub.yourHis} cock..",
		])
		
		return {text = text}
		
	
	if(_id == "stop"):
		endActivity()
		
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('pull')} {dom.yourself} away from {sub.your} cock and {dom.youVerb('get')} up.",
		])
		
		var condom:ItemBase = getSub().getWornCondom()
		if(condom != null):
			text += " {dom.You} {dom.youVerb('dispose')} of {sub.yourHis} condom."
			condom.destroyMe()
		
		return {text = text}

	if(_id == "domcum"):
		getDom().cumOnFloor()
		domInfo.cum()
		return getGenericDomOrgasmData()
	
	if(_id in ["letsubcuminside", "letsubknotinside"]):
		var wombText = RNG.pick([
			"womb", "womb",
			"babymaker",
		])
		if(usedBodypart == BodypartSlot.Anus):
			wombText = RNG.pick([
				"ass",
				"butt",
			])
		var text = ""
		
		var knotSuccess = false
		#var isTryingToKnot = false
		if(_id == "letsubknotinside"):
			#isTryingToKnot = true
			getDom().gotOrificeStretchedBy(usedBodypart, subID, 0.5)
			if(RNG.chance(getDom().getPenetrateChanceBy(usedBodypart, subID))):
				knotSuccess = true
			else:
				text += RNG.pick([
					"{dom.You} {dom.youVerb('try', 'tries')} to "+RNG.pick(["force {sub.yourHis} knot inside {dom.youHim}", "get knotted by {dom.you}"])+" but {dom.yourHis} hole is just too tight. "
				])
		
		if(knotSuccess):
			text = RNG.pick([
				"{dom.You} "+RNG.pick(["{dom.youVerb('nod')} and", "just"])+" {dom.youVerb('keep')} riding {sub.your} "+RNG.pick(["cock", "dick", "member"])+" hard until {sub.yourHis} knot suddenly slips inside! [b]{sub.You} {sub.youVerb('moan')} as {sub.youHe} {sub.youVerb('cum')} inside {dom.yourHis} "+RNG.pick(usedBodypartNames)+"[/b]!",
			])
		else:
			text = RNG.pick([
				"{dom.You} "+RNG.pick(["{dom.youVerb('nod')} and", "just"])+" {dom.youVerb('keep')} riding {sub.your} "+RNG.pick(["cock", "dick", "member"])+" until [b]{sub.youHe} {sub.youVerb('cum')} inside {dom.yourHis} "+RNG.pick(usedBodypartNames)+"[/b]!",
			])
		text += RNG.pick([
			" Waves after waves of sticky "+RNG.pick(["cum", "seed", "jizz", "semen"])+" flow into {dom.yourHis} "+wombText+".",
		])
		
		var condom:ItemBase = getSub().getWornCondom()
		if(condom != null):
			var breakChance = condom.getCondomBreakChance()
			
			if(RNG.chance(breakChance)):
				text = "[b]The condom broke![/b] "+text
				condom.destroyMe()
			else:
				if(knotSuccess):
					text = RNG.pick([
						"{dom.You} "+RNG.pick(["{dom.youVerb('nod')} and", "just"])+" {dom.youVerb('keep')} riding {sub.your} "+RNG.pick(["cock", "dick", "member"])+" hard until {sub.yourHis} knot suddenly slips inside!",
					])
				else:
					text = RNG.pick([
						"{dom.You} "+RNG.pick(["{dom.youVerb('nod')} and", "just"])+" {dom.youVerb('keep')} riding {sub.your} "+RNG.pick(["cock", "dick", "member"])+".",
					])
				text += RNG.pick([
					" {sub.You} {sub.youVerb('moan')} as {sub.youHe} {sub.youVerb('fill')} the condom inside {dom.your} "+RNG.pick(usedBodypartNames)+"!",
					" {sub.You} {sub.youVerb('moan')} as {sub.youHe} {sub.youVerb('stuff')} the condom in {dom.your} "+RNG.pick(usedBodypartNames)+" full of {sub.yourHis} "+RNG.pick(["cum", "seed", "jizz", "semen"])+"!",
				])
				getSub().cumOnFloor()
				subInfo.cum()
				domInfo.addArousalSex(0.05)
				satisfyGoals()
				if(knotSuccess):
					state = "knotting"
				else:
					state = ""
				
				if(!knotSuccess):
					condom.destroyMe()
					text += RNG.pick([
						" {dom.You} {dom.youVerb('dispose')} of the used condom.",
					])
				
				return {text=text}
		
		getDom().cummedInBodypartBy(usedBodypart, subID)
		subInfo.cum()
		domInfo.addArousalSex(0.05)
		satisfyGoals()
		if(knotSuccess):
			state = "knotting"
		else:
			state = ""

		return {text=text}
	if(_id == "makesubcumoutside"):
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('ride')} {sub.yourHis} "+RNG.pick(["dick", "cock", "member"])+" until {sub.youHe} {sub.youAre} ready to cum. But {dom.you} {dom.youVerb('stop')} riding {sub.youHim} just in time!",
		])
		state = ""
		
		var condom:ItemBase = getSub().getWornCondom()
		if(condom != null):
			var breakChance = condom.getCondomBreakChance()
			
			if(RNG.chance(breakChance)):
				text = "[b]The condom broke![/b] "+text
				condom.destroyMe()
			else:
				text += RNG.pick([
					" {sub.You} "+RNG.pick(["{sub.youVerb('fill')}", "{sub.youVerb('stuff')}"])+" {sub.yourHis} condom! {dom.You} {dom.youVerb('dispose')} of it.",
				])
				condom.destroyMe()
				getSub().cumOnFloor()
				subInfo.cum()
				satisfyGoals()
				
				return {text=text}
		
		text += RNG.pick([
			" {sub.You} [b]{sub.youVerb('cum')} all over {sub.yourself}[/b]! Strings of {sub.yourHis} own "+RNG.pick(["cum", "seed", "semen"])+" land on {sub.yourHis} chest, leaving a mess.",
		])
		
		getSub().cummedOnBy(subID, BodilyFluids.FluidSource.Penis)
		subInfo.cum()
		satisfyGoals()

		return {text=text}
	if(_id == "pullknotout"):
		if(RNG.chance(30)):
			state = ""
			var text = RNG.pick([
				"{dom.You} {dom.youVerb('manage')} to raise {dom.yourself}. The knot "+RNG.pick(["falls out", "gets pulled out"])+" with a satisfying plop noise.",
			])
			
			if((getDom().hasEffect(StatusEffect.HasCumInsideVagina) && usedBodypart == BodypartSlot.Vagina) || (getDom().hasEffect(StatusEffect.HasCumInsideAnus) && usedBodypart == BodypartSlot.Anus)):
				if((getDom().getBuffsHolder().hasBuff(Buff.BlocksVaginaLeakingBuff) && usedBodypart == BodypartSlot.Vagina) || (getDom().getBuffsHolder().hasBuff(Buff.BlocksAnusLeakingBuff) && usedBodypart == BodypartSlot.Anus)):
					text += RNG.pick([
						" Some "+RNG.pick(["cum", "seed", "semen"])+" tries to leak out but {dom.you} quickly {dom.youVerb('plug')} {dom.yourHis} "+RNG.pick(usedBodypartNames)+" back.",
					])
				else:	
					text += RNG.pick([
						" Some "+RNG.pick(["cum", "seed", "semen"])+" leaks out of {dom.yourHis} used "+RNG.pick(usedBodypartNames)+".",
					])
			return {text = text}
		else:
			var text = RNG.pick([
				"{dom.You} {dom.youVerb('try', 'tries')} to "+RNG.pick(["pull", "yank"])+" {sub.yourHis} "+RNG.pick(["cock", "dick"])+" out but {dom.youVerb('fail')}. The knot inside {dom.youHim} slowly deflates.",
			])
			getDom().gotOrificeStretchedBy(usedBodypart, subID, 0.1)
			affectSub(subInfo.fetishScore({fetishGiving: 1.0}), 0.1, -0.3, 0.0)
			affectDom(domInfo.fetishScore({fetishReceiving: 1.0}), 0.1, -0.05)
			subInfo.addArousalForeplay(0.1)
			domInfo.addArousalForeplay(0.1)
			return {text = text}
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
		actions.append({
				"id": "moan",
				"score": max(0.1, subInfo.fetishScore({fetishGiving: 0.5}) + subInfo.personalityScore({PersonalityStat.Subby: 0.5})),
				"name": "Moan",
				"desc": "Show how much you like it",
			})
		
	if(state in ["fucking", ""]):
		actions.append({
			"id": "throwoff",
			"score": subInfo.getResistScore(),
			"name": "Throw them off",
			"desc": "Resist their attempts to ride you",
			"chance": getSubResistChance(30.0, 25.0),
		})

	
	return actions

func getSubResistChance(baseChance, domAngerRemoval):
	var theChance = baseChance - domInfo.getAngerScore()*domAngerRemoval
	if(getSub().hasBlockedHands()):
		theChance *= 0.6
	if(getSub().hasBoundArms()):
		theChance *= 0.6
	if(getSub().hasBoundLegs()):
		theChance *= 0.5
	if(getSub().isBlindfolded()):
		theChance *= 0.8
	
	return max(theChance, 5.0)

func doSubAction(_id, _actionInfo):
	if(_id == "moan"):
		var moanText = RNG.pick([
			"{sub.youVerb('moan')}"
		])
		if(getSub().isGagged()):
			moanText = RNG.pick([
				"{sub.youVerb('let')} out muffled moans",
				"{sub.youVerb('let')} out a muffled moan",
				"{sub.youVerb('let')} out a muffled noise of pleasure",
			])
		
		var text = RNG.pick([
			"{sub.You} "+moanText+" while {dom.you} {dom.youVerb('ride')} {sub.youHim}!",
			"{sub.You} "+moanText+" while {sub.yourHis} "+RNG.pick(["dick", "cock"])+" is used by {dom.you}!",
			"{sub.You} "+moanText+" eagerly!",
		])
		domInfo.addAnger(-0.02)
		domInfo.addLust(5)
		return {text = text}
	if(_id == "throwoff"):
		if(getSubResistChance(30.0, 25.0)):
			if(state == "fucking"):
				state = ""
			else:
				endActivity()
			
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('manage')} to throw {dom.youHim} away from {sub.yourHis} "+RNG.pick(["cock", "dick", "member"])+".",
			])
			domInfo.addAnger(0.3)
			return {text = text}
		else:
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('try', 'tries')} to resist and "+RNG.pick(["shove", "push", "throw"])+" {dom.you} off but {sub.youVerb('fail')}.",
			])
			domInfo.addAnger(0.1)
			return {text = text}
	
	if(_id == "rub"):
		affectSub(subInfo.fetishScore({fetishGiving: 1.0}), 0.05, -0.1, 0.0)
		affectDom(max(0.1, domInfo.fetishScore({fetishReceiving: 1.0})+1.0), 0.05, 0.0)
		
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('rub')} {sub.yourHis} dick against {dom.your} "+RNG.pick(usedBodypartNames)+".",
		])
		return {text=text}

	if(_id == "warndom"):
		state = "subabouttocum"
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('warn')} {dom.youHim} that {sub.youHe} {sub.youAre} "+RNG.pick(["about to cum", "close", "very close"])+".",
		])
		domInfo.addAnger(-0.05)
		return {
			text = text,
			domSay = domReaction(SexReaction.WarnAboutToCum, 100),
			subSay = subReaction(SexReaction.WarnAboutToCum, 100),
			}
		
	if(_id == "cuminside"):
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('grunt')} as {sub.yourHis} "+RNG.pick(["cock", "dick", "member"])+" throbs and [b]"+RNG.pick(["cums inside {dom.yourHis} "+RNG.pick(usedBodypartNames), "stuffs {dom.yourHis} "+RNG.pick(usedBodypartNames)])+" without asking permission[/b]!",
		])
		if(usedBodypart == BodypartSlot.Vagina):
			text += RNG.pick([
				" Waves after waves of sticky "+RNG.pick(["cum", "seed", "jizz", "semen"])+" flow into {dom.yourHis} "+RNG.pick(["womb", "babymaker", "womb"])+".",
			])
		else:
			text += RNG.pick([
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
					"{sub.You} {sub.youVerb('fill')} the condom inside {dom.your} "+RNG.pick(usedBodypartNames)+" [b]without asking for permission[/b]!",
					"{sub.You} {sub.youVerb('stuff')} the condom in {dom.your} "+RNG.pick(usedBodypartNames)+" full of {sub.yourHis} "+RNG.pick(["cum", "seed", "jizz", "semen"])+" [b]without asking for permission[/b]!",
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
	return [StageScene.Duo, "stand", {pc=subID, npc=domID, npcAction="kneel", flipPc=false}]

func getDomSwitchHoleChance():
	if(domInfo.hasMemory("switchedHoles")):
		return 0.0
	
	var domLikesOtherHoleScore = domInfo.fetishScore({otherHoleFetishGiving:1.0, fetishGiving: -0.5})
	
	return max(5.0, domLikesOtherHoleScore * 100.0 * (1.0 - domInfo.getAngerScore()))

func getDomOrgasmHandlePriority():
	return 5

func getSubOrgasmHandlePriority():
	return 10

func saveData():
	var data = .saveData()
	
	data["waitTimer"] = waitTimer

	return data
	
func loadData(data):
	.loadData(data)
	
	waitTimer = SAVE.loadVar(data, "waitTimer", 0)
