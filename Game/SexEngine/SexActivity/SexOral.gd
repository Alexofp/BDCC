extends SexActivityBase
var waitTimer = 0
var straponHumps = 0

func _init():
	id = "SexOral"

func getGoals():
	return {
		SexGoal.FuckOral: 1.0,
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		SexType.StocksSex: true,
	}

func isStocksSex():
	return getSexEngine().getSexTypeID() == SexType.StocksSex

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(!_domInfo.getChar().hasReachablePenis() && !_domInfo.getChar().hasReachableVagina() && !_domInfo.getChar().isWearingStrapon()):
		return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getVisibleName():
	return "Oral"

func getCategory():
	return ["Fuck"]

func getDomTags():
	return [SexActivityTag.PenisUsed, SexActivityTag.VaginaUsed, SexActivityTag.HavingSex]

func getSubTags():
	var thetags = [SexActivityTag.PreventsSubViolence, SexActivityTag.PreventsSubTeasing, SexActivityTag.HavingSex]
	if(state in ["blowjob", "deepthroat", "licking", "grinding"]):
		thetags.append(SexActivityTag.MouthUsed)
	return thetags

func getDomTagsCheck():
	return [SexActivityTag.OrderedToDoSomething, SexActivityTag.PenisUsed, SexActivityTag.VaginaUsed, SexActivityTag.HavingSex]

func getSubTagsCheck():
	return [SexActivityTag.OrderedToDoSomething, SexActivityTag.MouthUsed, SexActivityTag.HavingSex]

func isStraponSex():
	return getDom().isWearingStrapon()

func domSensetivity():
	var strapon = getDom().getWornStrapon()
	if(strapon == null):
		return 1.0
	
	return strapon.getStraponPleasureForDom()

func getDickName(dickName = null):
	if(isStraponSex()):
		return "strapon"
	if(dickName == null):
		return RNG.pick(["cock", "dick", "member"])
	return dickName

func startActivity(_args):
	state = ""
	
	var exposedThings = []
	var genitalsText = "crotch"
	if(getDom().hasPenis() && getDom().getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
		exposedThings.append(RNG.pick(["dick", "cock", "member"]))
		if(RNG.chance(50)):
			exposedThings.append("balls")
	if(isStraponSex()):
		exposedThings.append(getDickName())
	if(getDom().hasVagina() && getDom().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) == null):
		exposedThings.append(RNG.pick(["pussy", "pussy", "slit", "kitty"]))
	if(exposedThings.size() > 0):
		genitalsText = "exposed "+Util.humanReadableList(exposedThings)
	
	var text = RNG.pick([
		"{dom.You} {dom.youVerb('make')} {sub.you} kneel and then "+RNG.pick(["{dom.youVerb('pull')}", "{dom.youVerb('bring')}"])+" {sub.yourHis} mouth to {dom.yourHis} "+genitalsText+".",
	])
	if(isStocksSex()):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('walk')} up to {sub.your} face, trapped in stocks, and then "+RNG.pick(["{dom.youVerb('present')}", "{dom.youVerb('show')}"])+" {dom.yourHis} "+genitalsText+".",
		])
	
	return {
		text = text,
	}

func onSwitchFrom(_otherActivity, _args):
	return

func processTurn():
	if(state in ["askingtosuck", "askingtolick"]):
		if(waitTimer > 2):
			domInfo.addAnger(0.3)
			state = ""
			return {text="{dom.You} gave up waiting."}
		elif(waitTimer > 0):
			var text = RNG.pick([
				"{dom.You} {dom.youAre} losing patience.",
			])
			domInfo.addAnger(0.2)
			waitTimer += 1
			return {text = text}
		waitTimer += 1
		return
	if(state == "blowjob"):
		if(isStraponSex()):
			straponHumps += 1
			if(subInfo.isUnconscious() || (RNG.chance(20) && straponHumps > 5)):
				satisfyGoals()
			
		return doBlowjobTurnDom()
		
	if(state == "deepthroat"):
		if(isStraponSex()):
			straponHumps += 1
			if(subInfo.isUnconscious() || (RNG.chance(20) && straponHumps > 5)):
				satisfyGoals()
		
		return doDeepthroatTurnDom()
	
	if(state == "licking"):
		return doPussyLickingTurnDom()
	
	if(state == "grinding"):
		return doPussyGrindingTurnDom()
	
func getDomActions():
	var actions = []

	if(state in [""]):
		if(getDom().hasReachablePenis() || isStraponSex()):
			actions.append({
				"id": "cocktease",
				"score": 1.0,
				"name": "Cock teasing",
				"desc": "Make them tease your cock so you can get hard",
			})
			
			if(domInfo.isReadyToPenetrate() && getDom().getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null && !getSub().isOralBlocked()):
				if(!getSub().isBitingBlocked()):
					actions.append({
						"id": "asktosuck",
						"score": 1.0 - domInfo.getAngerScore(),
						"name": "Order to open mouth",
						"desc": "Ask the sub to open their mouth so you can shove your cock in",
					})
				actions.append({
					"id": "forcetosuck",
					"score": 0.1 + domInfo.getAngerScore() + 0.3*float(getSub().isBitingBlocked()),
					"name": "Force to suck cock",
					"desc": "Make that bitch suck your cock",
				})
		if(getDom().hasReachableVagina()):
			var lustyEnough = 1.0
			if(getDom().hasReachablePenis() && !domInfo.isReadyToPenetrate()):
				lustyEnough = 0.1 # If dom is a herm, give them a chance to force bj too
			
			if(!getSub().isOralBlocked()):
				actions.append({
					"id": "asktolick",
					"score": lustyEnough*(1.0 - domInfo.getAngerScore() - 0.9 * float(getDom().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) != null)),
					"name": "Order to lick",
					"desc": "Ask the sub to lick your pussy",
				})
			actions.append({
				"id": "startgrindface",
				"score": lustyEnough * (0.1 + domInfo.getAngerScore() - 0.9 * float(getDom().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) != null)),
				"name": "Grind face",
				"desc": "Grind their face with your pussy",
			})
	if(state in ["blowjob"]):
		actions.append({
			"id": "forcedeepthroat",
			"score": domInfo.fetishScore({Fetish.OralSexReceiving: 1.0}, -0.4) / 6.0,
			"name": "Force to deepthroat",
			"desc": "Make that slut deepthroat you",
		})
	if(state in ["blowjob", "deepthroat"]):
		if(domInfo.isReadyToCum() && isHandlingDomOrgasms() && isStraponSex()):
			actions.append({
				"id": "domstraponcum",
				"score": 1.0,
				"name": "Cum!",
				"desc": "You're about to cum..",
				"priority": 1001,
			})
		
		if(domInfo.isReadyToCum() && isHandlingDomOrgasms() && !isStraponSex()):
			actions.append({
				"id": "bjcuminside",
				"score": 1.0,
				"name": "Cum inside",
				"desc": "Stuff that mouth",
				"priority": 1001,
			})
			actions.append({
				"id": "bjpullout",
				"score": 1.0,
				"name": "Pull out",
				"desc": "Cum all over their face instead",
				"priority": 1001,
			})
	if(state in ["deepthroat"]):
		actions.append({
			"id": "stopdeepthroat",
			"score": subInfo.getAboutToPassOutScore() * 0.2 * (1.0 - domInfo.personalityScore({PersonalityStat.Mean: 0.5}) - domInfo.fetishScore({Fetish.UnconsciousSex: 1.0})),
			"name": "Stop deepthroat",
			"desc": "Enough deepthroating for now",
		})
	if(state in ["licking", "grinding"]):
		if(domInfo.isReadyToCum() && isHandlingDomOrgasms()):
			actions.append({
				"id": "pussycum",
				"score": 1.0,
				"name": "Cum!",
				"desc": "Cum all over the sub",
				"priority": 1001,
			})
		
	actions.append({
		"id": "stop",
		"score": getStopScore(),
		"name": "Stop oral",
		"desc": "Stop the oral sex activity",
	})

	return actions

func doDomAction(_id, _actionInfo):
	if(_id == "domstraponcum"):
		getDom().cumOnFloor()
		domInfo.cum()
		return getGenericDomOrgasmData()
	
	if(_id == "cocktease"):
		var clothingItem = getDom().getFirstItemThatCoversBodypart(BodypartSlot.Penis)
		var throughTheClothing = ""
		if(clothingItem != null):
			throughTheClothing = " through the "+clothingItem.getCasualName()
		
		var text = RNG.pick([
			"{dom.You} "+RNG.pick(["{dom.youVerb('pull')}", "{dom.youVerb('bring')}", "{dom.youVerb('move')}"])+" {sub.yourHis} head to {dom.yourHis} "+getDickName()+" and {dom.youVerb('make')} {sub.youHim} "+RNG.pick(["rub", "grind"])+" {sub.youHis} face against it"+throughTheClothing+"."
		])
		if(isStocksSex()):
			text = RNG.pick([
				"{dom.You} "+RNG.pick(["{dom.youVerb('move')}", "{dom.youVerb('bring')}", "{dom.youVerb('move')}"])+" {dom.yourHis} "+getDickName()+" to {sub.yourHis} head and {dom.youVerb('make')} {sub.youHim} "+RNG.pick(["rub", "grind"])+" {sub.youHis} face against it"+throughTheClothing+"."
			])
		
		if(domInfo.isAngry()):
			text = RNG.pick([
				text,
				"{dom.You} "+RNG.pick(["{dom.youVerb('cocksmack')}", "{dom.youVerb('cockslap')}", "{dom.youVerb('cockwhip')}"])+" {sub.yourHis} cheek with {dom.yourHis} "+getDickName(RNG.pick(["dick", "member", "prick"]))+".",
			])
		
		domInfo.addLust(10.0 + domInfo.fetishScore({Fetish.OralSexReceiving: 5.0}))
		domInfo.addArousalForeplay(0.05)
		affectSub(subInfo.fetishScore({Fetish.OralSexGiving: 1.0}), 0.1, -0.3, -0.01)
		
		if(domInfo.isReadyToPenetrate() && clothingItem == null && !isStraponSex()):
			text += RNG.pick([
				" {dom.Your} hard cock is leaking "+RNG.pick(["pre", "precum", "arousal"])+".",
				" {dom.Your} cock is "+RNG.pick(["ready", "hard enough"])+" to be shoved into {sub.yourHis} mouth.",
			])
		
		return {text = text}
	if(_id == "asktosuck"):
		state = "askingtosuck"
		waitTimer = 0
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('order')} {sub.youHim} to "+RNG.pick(["open {sub.yourHis} mouth", "part {sub.yourHis} lips"])+".",
		])
		
		affectSub(subInfo.fetishScore({Fetish.OralSexGiving: 1.0}), 0.05, -0.4, 0.0)
		
		return {text=text, domSay=domReaction(SexReaction.OrderBlowjob)}
	if(_id == "asktolick"):
		state = "askingtolick"
		waitTimer = 0
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('order')} {sub.youHim} to "+RNG.pick(["start licking {dom.yourHis} pussy", "stick {sub.yourHis} tongue out and start working on {dom.yourHis} pussy"])+".",
		])
		
		affectSub(subInfo.fetishScore({Fetish.OralSexGiving: 1.0}), 0.05, -0.4, 0.0)
		
		return {text=text,domSay=domReaction(SexReaction.OrderLickPussy)}
		
	if(_id == "startgrindface"):
		state = "grinding"
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('press', 'presses')} {dom.yourHis} "+RNG.pick(["pussy", "slit", "kitty"])+" to {sub.yourHis} face and {dom.youVerb('proceed')} to grind it!",
		])
		if(getSub().bodypartHasTrait(BodypartSlot.Horns, PartTrait.HornsGraspable)):
			text = RNG.pick([
				"{dom.You} {dom.youVerb('reach', 'reaches')} for {sub.yourHis} horns and use them as handlebars. ",
			]) + text
		
		affectSub(subInfo.fetishScore({Fetish.OralSexGiving: 1.0}), 0.1, -0.3, -0.02)
		domInfo.addAnger(-0.05)
		return {text = text}
		
	if(_id == "forcetosuck"):
		var successChance = 30
		if(getSub().isBitingBlocked()):
			successChance = 100
		
		if(RNG.chance(successChance)):
			state = "blowjob"
			var text = RNG.pick([
				"{dom.You} {dom.youVerb('force')} {dom.yourHis} "+getDickName()+" "+RNG.pick(["past {sub.yourHis} lips", "inside {sub.yourHis} mouth", "past {sub.yourHis} teeth"])+" and {dom.youVerb('make')} {sub.you} "+RNG.pick(["suck", "blow"])+" {dom.youHim}!",
			])
			affectSub(subInfo.fetishScore({Fetish.OralSexGiving: 1.0}), 0.05, -0.2, -0.05)
			domInfo.addAnger(-0.1)
			sendSexEvent(SexEvent.HolePenetrated, domID, subID, {hole=BodypartSlot.Head,engulfed=false,strapon=isStraponSex()})
			return {text = text}
		else:
			var text = RNG.pick([
				"{dom.You} {dom.youVerb('try', 'tries')} to "+RNG.pick(["force", "push", "shove", "forcefully shove"])+" {dom.yourHis} "+getDickName()+" "+RNG.pick(["into {sub.yourHis} mouth", "past {sub.yourHis} lips", "past {sub.yourHis} teeth"])+"."
			])
			affectSub(subInfo.fetishScore({Fetish.OralSexGiving: 1.0}), 0.05, -0.2, -0.01)
			domInfo.addAnger(0.05)
			return {text = text}
	
	if(_id == "bjcuminside"):
		state = ""
		satisfyGoals()
		return getSexEngine().combineData(doCumBJDom(state == "deepthroat"), applyTallymarkIfNeededData(BodypartSlot.Head))
	
	if(_id == "bjpullout"):
		satisfyGoals()
		state = ""
		return getSexEngine().combineData(doCumBJFacialsDom(), applyTallymarkIfNeededData(BodypartSlot.Head))

	if(_id == "pussycum"):
		satisfyGoals()
		state = ""
		return doCumPussyLickDom()
	
	if(_id == "forcedeepthroat"):
		if(!RNG.chance(getSub().getPenetrateChanceBy(BodypartSlot.Head, domID))):
			var text = RNG.pick([
				"{dom.You} {dom.youVerb('try', 'tries')} to force {sub.you} deeper onto {dom.yourHis} "+getDickName()+" but {sub.yourHis} throat is just too tight.",
				"{dom.You} {dom.youVerb('try', 'tries')} to make {sub.you} deepthroat {dom.yourHis} "+getDickName()+" but {sub.youHe} {sub.youAre} just too tight.",
			])
			if(isStocksSex()):
				text = RNG.pick([
				"{dom.You} {dom.youVerb('try', 'tries')} to force {dom.yourHis} "+getDickName()+" deeper but {sub.yourHis} throat is just too tight.",
				"{dom.You} {dom.youVerb('try', 'tries')} to make {sub.you} deepthroat {dom.yourHis} "+getDickName()+" but {sub.youHe} {sub.youAre} just too tight.",
				])
			getSub().gotOrificeStretchedBy(BodypartSlot.Head, domID, 0.1)
			affectSub(domInfo.fetishScore({Fetish.OralSexGiving: 1.0}), 0.1, -0.1, -0.05)
			domInfo.addLust(0.1)
			domInfo.addArousalSex(0.03)
			return {text = text}
		else:
			state = "deepthroat"
			var text = RNG.pick([
				"{dom.You} {dom.youVerb('shove')} {dom.yourHis} "+getDickName()+" deeper and {dom.youVerb('force')} {sub.you} to deepthroat {dom.youHim}!",
			])
			if(getSub().bodypartHasTrait(BodypartSlot.Horns, PartTrait.HornsGraspable)):
				text = RNG.pick([
					"{dom.You} {dom.youVerb('reach', 'reaches')} for {sub.yourHis} horns and use them as handlebars. ",
				]) + text
			getSub().gotOrificeStretchedBy(BodypartSlot.Head, domID, 0.2)
			affectSub(domInfo.fetishScore({Fetish.OralSexGiving: 1.0}), 0.1, -0.2, -0.05)
			domInfo.addArousalSex(0.05 * domSensetivity())
			return {text=text}
	if(_id == "stopdeepthroat"):
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('let')} {sub.you} to stop deepthroating {dom.yourHis} "+getDickName()+".",
		])
		if(!subInfo.isUnconscious() && subInfo.getConsciousness() < 1.0):
			text += RNG.pick([
				"{sub.You} {sub.youVerb('cough')} a lot before returning to sucking.",
			])
		state = "blowjob"
		return {text=text}
	
	if(_id == "stop"):
		endActivity()
		
	var exposedThings = []
	var genitalsText = "crotch"
	if(getDom().hasPenis() && getDom().getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
		exposedThings.append(RNG.pick(["dick", "cock", "member"]))
		if(RNG.chance(50)):
			exposedThings.append("balls")
	if(isStraponSex()):
		exposedThings.append(getDickName())
	if(getDom().hasVagina() && getDom().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) == null):
		exposedThings.append(RNG.pick(["pussy", "pussy", "slit", "kitty"]))
	if(exposedThings.size() > 0):
		genitalsText = "exposed "+Util.humanReadableList(exposedThings)
		
		return {text = "{dom.You} {dom.youVerb('pull')} {dom.yourHis} "+genitalsText+" away from {sub.yourHis} lips."}

func getSubActions():
	var actions = []
	if(state in ["askingtosuck"]):
		if((isStraponSex() || getDom().hasReachablePenis()) && domInfo.isReadyToPenetrate() && getDom().getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
			actions.append({
				"id": "openmouth",
				"score": subInfo.getComplyScore() * subInfo.fetishScore({Fetish.OralSexGiving: 1.0}, 0.5),
				"name": "Open mouth",
				"desc": "Let that "+getDickName()+" into your mouth",
			})
			actions.append({
				"id": "notopenmouth",
				"score": subInfo.getResistScore(),
				"name": "Shake head",
				"desc": "You're not gonna suck their "+getDickName(),
			})
	if(state in ["askingtolick"]):
		actions.append({
			"id": "startlicking",
			"score": subInfo.getComplyScore() * subInfo.fetishScore({Fetish.OralSexGiving: 1.0}, 0.5),
			"name": "Lick pussy",
			"desc": "Obey their orders and start licking them out",
		})
		actions.append({
			"id": "refusetolick",
			"score": subInfo.getResistScore(),
			"name": "Refuse to lick",
			"desc": "You're not gonna lick their pussy",
		})

	if(state in ["", "blowjob", "askingtosuck", "licking", "askingtolick", "grinding"]):
		if(!getSub().isBitingBlocked()):
			actions.append({
				"id": "bite",
				"score": subInfo.getResistScore()/4.0,
				"name": "Bite",
				"desc": "Bite them! Will be very painful",
				"chance": getSubBiteChance(50.0, 30.0),
			})
		actions.append({
			"id": "pullaway",
			"score": subInfo.getResistScore(),
			"name": "Pull away",
			"desc": "Try to pull away",
			"chance": getSubResistChance(30.0, 25.0),
		})
	if(state in ["licking"]):
		actions.append({
			"id": "prodpussy",
			"score": subInfo.getComplyScore()/2.0,
			"name": "Prod with tongue",
			"desc": "Use your tongue more",
		})
	if(state in ["grinding"]):
		actions.append({
			"id": "grindtongue",
			"score": subInfo.getComplyScore()/2.0,
			"name": "Use tongue",
			"desc": "Use your tongue more",
		})
	if(state in [""]):
		if(getDom().hasReachablePenis() || isStraponSex()):
			actions.append({
				"id": "teasecock",
				"score": subInfo.getComplyScore() * 0.5 + subInfo.fetishScore({Fetish.OralSexGiving: 0.5}),
				"name": "Tease "+getDickName("cock"),
				"desc": "Show their "+getDickName()+" some love",
			})
		if(getDom().hasReachableVagina()):
			actions.append({
				"id": "teasevagina",
				"score": subInfo.getComplyScore() * 0.5 + subInfo.fetishScore({Fetish.OralSexGiving: 0.5}),
				"name": "Tease pussy",
				"desc": "Show their pussy some love",
			})
	if(state in ["blowjob"]):
		actions.append({
			"id": "startdeepthroating",
			"score": subInfo.getComplyScore() * subInfo.fetishScore({Fetish.OralSexGiving: 1.0}, -0.5) * 0.1 ,
			"name": "Deepthroat",
			"desc": "Let that "+getDickName()+" stretch your throat",
		})
	if(state in ["deepthroat"]):
		actions.append({
			"id": "stopdeepthroating",
			"score": subInfo.getComplyScore() * subInfo.fetishScore({Fetish.OralSexGiving: 1.0}, -0.5) * 0.1 ,
			"name": "Stop deepthroating",
			"desc": "Enough throat stretching!",
			"chance": getSubStopDeepthroatChance(),
		})
	
	return actions

func getSubStopDeepthroatChance():
	if(!domInfo.isAngry()):
		return 100.0
	var theChance = 40.0 - domInfo.getAngerScore()*20.0
	if(getSub().hasBlockedHands()):
		theChance *= 0.8
	if(getSub().hasBoundArms()):
		theChance *= 0.8
	if(getSub().isBitingBlocked()):
		theChance *= 0.5
	return max(theChance, 5.0)

func getSubResistChance(baseChance, domAngerRemoval):
	var theChance = baseChance - domInfo.getAngerScore()*domAngerRemoval
	if(getSub().hasBlockedHands()):
		theChance *= 0.5
	if(getSub().hasBoundArms()):
		theChance *= 0.5
	if(getSub().isBlindfolded()):
		theChance *= 0.8
	
	return max(theChance, 5.0)

func getSubBiteChance(baseChance, domAngerRemoval):
	if(state in ["blowjob", "licking"]):
		return 100.0
	var theChance = baseChance - domInfo.getAngerScore()*domAngerRemoval
	if(getSub().hasBlockedHands()):
		theChance *= 0.9
	if(getSub().hasBoundArms()):
		theChance *= 0.9
	if(getSub().isBlindfolded()):
		theChance *= 0.5
	
	return max(theChance, 5.0)

func doSubAction(_id, _actionInfo):
	if(_id == "teasecock"):
		var clothingItem = getDom().getFirstItemThatCoversBodypart(BodypartSlot.Penis)
		var throughTheClothing = ""
		if(clothingItem != null):
			throughTheClothing = " through the "+clothingItem.getCasualName()
		
		var text
		if(getSub().isOralBlocked()):
			text = RNG.pick([
				"{sub.You} {sub.youVerb('nuzzle')} {dom.your} "+getDickName()+throughTheClothing+".",
			])
		else:
			text = RNG.pick([
				"{sub.You} "+RNG.pick(["{sub.youVerb('nuzzle')}", "{sub.youVerb('lick')}"])+" {dom.your} "+getDickName()+throughTheClothing+".",
			])
			
		domInfo.addLust(10.0 + domInfo.fetishScore({Fetish.OralSexReceiving: 5.0}))
		domInfo.addArousalForeplay(0.05*domSensetivity())
		
		if(domInfo.isReadyToPenetrate() && clothingItem == null && !isStraponSex()):
			text += RNG.pick([
				" {dom.Your} hard cock is leaking "+RNG.pick(["pre", "precum", "arousal"])+".",
				" {dom.Your} cock is "+RNG.pick(["ready", "hard enough"])+" to be shoved into {sub.yourHis} mouth.",
			])
			
		return {text = text}
	if(_id == "teasevagina"):
		var clothingItem = getDom().getFirstItemThatCoversBodypart(BodypartSlot.Penis)
		var throughTheClothing = ""
		if(clothingItem != null):
			throughTheClothing = " through the "+clothingItem.getCasualName()
		
		var text
		if(getSub().isOralBlocked()):
			text = RNG.pick([
				"{sub.You} {sub.youVerb('nuzzle')} {dom.your} "+RNG.pick(["pussy", "slit", "petals", "pussy folds"])+throughTheClothing+".",
			])
		else:
			text = RNG.pick([
				"{sub.You} "+RNG.pick(["{sub.youVerb('nuzzle')}", "{sub.youVerb('lick')}"])+" {dom.your} "+RNG.pick(["pussy", "slit", "petals", "pussy folds"])+throughTheClothing+".",
			])
			
		domInfo.addLust(10.0 + domInfo.fetishScore({Fetish.OralSexReceiving: 5.0}))
		domInfo.addArousalForeplay(0.05)
		
		if(domInfo.isReadyToPenetrate() && clothingItem == null):
			text += RNG.pick([
				" {dom.Your} pussy is looking "+RNG.pick(["wet", "moist", "needy", "very wet"])+".",
			])
			
		return {text = text}
		
	if(_id == "openmouth"):
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('open')} {sub.yourHis} mouth and {sub.youVerb('let')} {dom.your} "+getDickName()+" in before wrapping {sub.yourHis} lips around it.",
		])
		state = "blowjob"
		sendSexEvent(SexEvent.HolePenetrated, domID, subID, {hole=BodypartSlot.Head,engulfed=true,strapon=isStraponSex()})
		return {text = text}
	if(_id == "notopenmouth"):
		state = ""
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('refuse')} to open {sub.yourHis} mouth.",
		])
		domInfo.addAnger(0.2)
		return {text = text}
	if(_id == "startlicking"):
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('stick')} {sub.yourHis} tongue out and {sub.youVerb('press', 'presses')} it against {dom.your} "+RNG.pick(["pussy", "slit", "petals", "folds"])+" before proceeding to lick them.",
		])
		state = "licking"
		return {text = text}
	if(_id == "refusetolick"):
		state = ""
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('refuse')} to lick {dom.yourHis} pussy.",
		])
		domInfo.addAnger(0.2)
		return {text = text}
	if(_id == "prodpussy"):
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('use')} {sub.yourHis} tongue to "+RNG.pick(["prod {dom.yourHis} pussy entrance and lap up all the juices", "prod at the wet pussy entrance", "lap at the wet pussy hole"])+".",
		])
		
		if(getDom().hasEffect(StatusEffect.HasCumInsideVagina) && OPTIONS.isContentEnabled(ContentType.CumStealing)):
			if(RNG.chance(40)):
				if(getDom().bodypartTransferFluidsTo(BodypartSlot.Vagina, subID, BodypartSlot.Head, 0.1, 20.0)):
					text += RNG.pick([ 
						" {sub.YouHe} {sub.youVerb('get')} "+Util.capitalizeFirstLetter(getDom().getBodypartContentsStringList(BodypartSlot.Vagina))+" onto {sub.yourHis} tongue while eating {dom.yourHis} "+RNG.pick(["", "used ", "stuffed "])+RNG.pick(["pussy", "slit", "kitty"])+" out. [b]{sub.You} {sub.youVerb('swallow')} it all[/b].",
					])
		
		domInfo.stimulateArousalZone(0.05, BodypartSlot.Vagina, 0.25)
		return {text = text}
	if(_id == "grindtongue"):
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('stick')} {sub.yourHis} tongue out and {sub.youVerb('catch', 'catches')} some "+RNG.pick(["arousal", "juices"])+RNG.pick([" from that wet pussy","", " onto it"," while {sub.yourHis} face is being grinded"])+".",
		])
		
		if(getDom().hasEffect(StatusEffect.HasCumInsideVagina) && OPTIONS.isContentEnabled(ContentType.CumStealing)):
			if(RNG.chance(50)):
				if(getDom().bodypartTransferFluidsTo(BodypartSlot.Vagina, subID, BodypartSlot.Head, 0.1, 20.0)):
					text += RNG.pick([ 
						" "+Util.capitalizeFirstLetter(getDom().getBodypartContentsStringList(BodypartSlot.Vagina))+" "+RNG.pick(["leaks", "oozes"])+" onto {sub.yourHis} tongue out of {dom.yourHis} "+RNG.pick(["", "used ", "stuffed "])+RNG.pick(["pussy", "slit", "kitty"])+". [b]{sub.You} {sub.youVerb('swallow')} it all[/b].",
					])
		
		domInfo.stimulateArousalZone(0.05, BodypartSlot.Vagina, 0.25)
		return {text = text}
	if(_id == "bite"):
		if(isStraponSex() && (state in ["blowjob", "deepthroat"])):
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('bite')} down on {dom.your} strapon. It doesn't have much effect on it..",
			])
			return {text=text}
		
		var successChance = getSubBiteChance(50.0, 30.0)
		if(RNG.chance(successChance)):
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('bite')} {dom.your} genitals! {dom.YouHe} {dom.youVerb('cry', 'cries')} from pain and {dom.youVerb('pull')} away.",
			])
			domInfo.addPain(10)
			sendSexEvent(SexEvent.PainInflicted, subID, domID, {pain=10,isDefense=true,intentional=true})
			domInfo.addAnger(1.0 - domInfo.fetishScore({Fetish.Masochism: 0.5}))
			domInfo.addLust(-5 + 10 * domInfo.fetishScore({Fetish.Masochism: 1.0}))
			endActivity()
			return {text = text}
		else:
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('try', 'tries')} to bite {dom.you} but {dom.youHe} {dom.youVerb('avoid')} it!",
			])
			domInfo.addAnger(0.4)
			return {text = text}
	if(_id == "pullaway"):
		var successChance = getSubResistChance(30.0, 25.0)
		if(RNG.chance(successChance)):
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('pull')} away from {dom.you}.",
			])
			domInfo.addAnger(0.3)
			if(state in ["blowjob", "licking", "deepthroat"]):
				state = ""
			else:
				endActivity()
			return {text = text}
		else:
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('try', 'tries')} to pull away from {dom.you} but {sub.youVerb('fail')}.",
			])
			domInfo.addAnger(0.1)
			return {text = text, subSay=subReaction(SexReaction.ActivelyResisting, 50)}
	if(_id == "startdeepthroating"):
		if(!RNG.chance(getSub().getPenetrateChanceBy(BodypartSlot.Head, domID))):
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('try', 'tries')} to get {dom.yourHis} "+getDickName()+" into {sub.yourHis} throat but "+RNG.pick(["it's too big", "{sub.youHe} {sub.youVerb('struggle')}", "{sub.youVerb('fail')}"])+".",
			])
			getSub().gotOrificeStretchedBy(BodypartSlot.Head, domID, 0.1)
			affectDom(domInfo.fetishScore({Fetish.OralSexReceiving: 1.0}), 0.2*domSensetivity(), -0.03)
			return {text = text}
		else:
			state = "deepthroat"
			var text = RNG.pick([
				"{sub.You} willingly {sub.youVerb('let')} {dom.yourHis} "+getDickName()+" deep down {sub.yourHis} throat and {sub.youVerb('start')} deepthroating it!",
			])
			getSub().gotOrificeStretchedBy(BodypartSlot.Head, domID, 0.2)
			affectDom(domInfo.fetishScore({Fetish.OralSexReceiving: 1.0}), 0.2*domSensetivity(), -0.03)
			domInfo.addArousalForeplay(0.05*domSensetivity())
			return {text=text}
	if(_id == "stopdeepthroating"):
		if(RNG.chance(getSubStopDeepthroatChance())):
			state = "blowjob"
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('stop')} deepthroating that "+getDickName()+", instead just sucking it off normally.",
			])
			return {text = text}
		else:
			domInfo.addAnger(0.05)
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('try', 'tries')} to pull away but {sub.youVerb('fail')}. {dom.You} {dom.youVerb('keep')} forcing {sub.youHim} to deepthroat {dom.youHim}!",
			])
			if(domInfo.isAngry() && RNG.chance(50)):
				subInfo.addPain(5)
				sendSexEvent(SexEvent.PainInflicted, domID, subID, {pain=5,isDefense=false,intentional=true})
				text += RNG.pick([
					" {sub.You} {sub.youVerb('receive')} a painful slap on the cheek from {dom.youHim}.",
				])
			return {text = text}
	return

func getAnimation():
	if(isStocksSex()):
		if(state in ["", "askingtolick"]):
			return [StageScene.StocksSexOral, "tease", {npc=domID, pc=subID}]
		if(state in ["licking", "grinding"]):
			return [StageScene.StocksSexOral, "pussy", {npc=domID, pc=subID}]
		if(state in ["blowjob", "deepthroat"]):
			if(domInfo.isCloseToCumming() || (isStraponSex() && subInfo.isCloseToCumming())):
				return [StageScene.StocksSexOral, "sex", {npc=domID, pc=subID}]
			return [StageScene.StocksSexOral, "fast", {npc=domID, pc=subID}]
			
		return [StageScene.StocksSexOral, "tease", {npc=domID, pc=subID}]
	
	if(state in ["", "askingtolick"]):
		return [StageScene.SexOral, "start", {pc=domID, npc=subID}]
	
	if(state in ["licking"]):
		return [StageScene.SexOral, "lick", {pc=domID, npc=subID}]
	if(state in ["grinding"]):
		return [StageScene.SexOral, "grind", {pc=domID, npc=subID}]
	
	if(state in ["blowjob", "deepthroat"]):
		if(domInfo.isCloseToCumming() || state == "deepthroat"):
			return [StageScene.SexOral, "fast", {pc=domID, npc=subID}]
		return [StageScene.SexOral, "sex", {pc=domID, npc=subID}]
	
	if(state in ["askingtosuck"]):
		return [StageScene.SexOral, "tease", {pc=domID, npc=subID}]
	

func getDomOrgasmHandlePriority():
	if(isStraponSex()):
		return 5
	return 10

func getSubOrgasmHandlePriority():
	return -1

func saveData():
	var data = .saveData()
	
	data["waitTimer"] = waitTimer
	data["straponHumps"] = straponHumps

	return data
	
func loadData(data):
	.loadData(data)
	
	waitTimer = SAVE.loadVar(data, "waitTimer", 0)
	straponHumps = SAVE.loadVar(data, "straponHumps", 0)
