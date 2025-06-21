extends SexActivityBase
var waitTimer:int = 0
var straponHumps:int = 0
var isForce:bool = false
var isFacesit:bool = false

func _init():
	id = "SexOral"
	
	activityName = "Oral"
	activityDesc = "Fuck their mouth!"
	activityCategory = ["Fuck"]

func getGoals():
	return {
		SexGoal.FuckOral: 1.0,
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		SexType.StocksSex: true,
	}

func isStocksSex() -> bool:
	return getSexEngine().getSexTypeID() == SexType.StocksSex

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(!_domInfo.getChar().hasReachablePenis() && !_domInfo.getChar().hasReachableVagina() && !_domInfo.getChar().isWearingStrapon()):
		return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return [SexActivityTag.PenisUsed, SexActivityTag.VaginaUsed, SexActivityTag.HavingSex]
	if(_indx == SUB_0):
		var thetags:Array = [SexActivityTag.PreventsSubViolence, SexActivityTag.PreventsSubTeasing, SexActivityTag.HavingSex]
		if(state in ["blowjob", "deepthroat", "licking", "grinding"]):
			thetags.append(SexActivityTag.MouthUsed)
		return thetags
	return []

func getCheckTagsDom() -> Array:
	return [SexActivityTag.OrderedToDoSomething, SexActivityTag.PenisUsed, SexActivityTag.VaginaUsed, SexActivityTag.HavingSex]

func getCheckTagsSub() -> Array:
	return [SexActivityTag.OrderedToDoSomething, SexActivityTag.MouthUsed, SexActivityTag.HavingSex]

func isStraponSex() -> bool:
	return getDom().isWearingStrapon()

func domSensitivity():
	var strapon = getDom().getWornStrapon()
	if(strapon == null):
		return 1.0
	
	return strapon.getStraponPleasureForDom()

func getDickName(dickName = null) -> String:
	if(isStraponSex()):
		return "strapon"
	if(dickName == null):
		return RNG.pick(["cock", "dick", "member"])
	return dickName

func startActivity(_args):
	var exposedThings:Array = []
	var genitalsText = "crotch"
	if(getDom().hasPenis() && hasBodypartUncovered(DOM_0, BodypartSlot.Penis)):
		exposedThings.append(RNG.pick(["dick", "cock", "member"]))
		if(RNG.chance(50)):
			exposedThings.append("balls")
	if(isStraponSex()):
		exposedThings.append(getDickName())
	if(getDom().hasVagina() && hasBodypartUncovered(DOM_0, BodypartSlot.Vagina)):
		exposedThings.append(RNG.pick(["pussy", "pussy", "slit", "kitty"]))
	if(exposedThings.size() > 0):
		genitalsText = "exposed "+Util.humanReadableList(exposedThings)
	
	if(!isStocksSex()):
		addText("{dom.You} {dom.youVerb('make')} {sub.you} kneel and then "+RNG.pick(["{dom.youVerb('pull')}", "{dom.youVerb('bring')}"])+" {sub.yourHis} mouth to {dom.yourHis} "+genitalsText+".")
	else:
		addText("{dom.You} {dom.youVerb('walk')} up to {sub.your} face, trapped in stocks, and then "+RNG.pick(["{dom.youVerb('present')}", "{dom.youVerb('show')}"])+" {dom.yourHis} "+genitalsText+".")

func processTurn():
	if(state in ["askingtosuck", "askingtolick"]):
		if(waitTimer > 2):
			getDomInfo().addAnger(0.3)
			state = ""
			return {text="{dom.You} gave up waiting."}
		elif(waitTimer > 0):
			var text = RNG.pick([
				"{dom.You} {dom.youAre} losing patience.",
			])
			getDomInfo().addAnger(0.2)
			waitTimer += 1
			return {text = text}
		waitTimer += 1
		return

	if(state in ["blowjob", "deepthroat"]):
		if(!isForce && getSubInfo().isUnconscious()):
			isForce = true
	if(state == "licking"):
		if(!isForce && getSubInfo().isUnconscious()):
			state = "grinding"
			isForce = true

func blowjob_processTurn():
	if(isStraponSex()):
		straponHumps += 1
		if(getSubInfo().isUnconscious() || (RNG.chance(20) && straponHumps > 5)):
			satisfyGoals()
	
	doBlowjobTurnDom()
		
func deepthroat_processTurn():
	if(isStraponSex()):
		straponHumps += 1
		if(getSubInfo().isUnconscious() || (RNG.chance(20) && straponHumps > 5)):
			satisfyGoals()
	
	doDeepthroatTurnDom()

func licking_processTurn():
	doPussyLickingTurnDom()
	react(SexReaction.DomsPussyGetsLicked, [10.0, 10.0])
	
func grinding_processTurn():
	doPussyGrindingTurnDom()
	react(SexReaction.GrindingFaceWithPussy, [10.0, 10.0])
	
func getActions(_indx:int):
	if(_indx == DOM_0):
		if(state in [""]):
			if(getDom().hasReachablePenis() || isStraponSex()):
				addAction("cocktease", 1.0, "Cock teasing", "Make them tease your cock so you can get hard")
				
				if(getDomInfo().isReadyToPenetrate() && getDom().getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null && !getSub().isOralBlocked()):
					if(!getSub().isBitingBlocked()):
						addAction("asktosuck", 1.0 - getDomInfo().getAngerScore(), "Order to open mouth", "Ask the sub to open their mouth so you can shove your cock in")
					var forcetosuckScore:float = 0.1 + getDomInfo().getAngerScore() + 0.3*float(getSub().isBitingBlocked())
					addAction("forcetosuck", forcetosuckScore, "Force to suck cock", "Make that bitch suck your cock")
			if(getDom().hasReachableVagina()):
				var lustyEnough:float = 1.0
				if(getDom().hasReachablePenis() && !getDomInfo().isReadyToPenetrate()):
					lustyEnough = 0.1 # If dom is a herm, give them a chance to force bj too
				
				if(!getSub().isOralBlocked()):
					var asktolickScore:float = lustyEnough*(1.0 - getDomInfo().getAngerScore() - 0.9 * float(getDom().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) != null))
					addAction("asktolick", asktolickScore, "Order to lick", "Ask the sub to lick your pussy")
				var startgrindfaceScore:float = lustyEnough * (0.1 + getDomInfo().getAngerScore() - 0.9 * float(getDom().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) != null))
				addAction("startgrindface", startgrindfaceScore, "Grind face", "Grind their face with your pussy")
		if(state in ["blowjob"]):
			var forcedeepthroatScore:float = fetish(DOM_0, Fetish.OralSexReceiving, -0.4) / 6.0
			addAction("forcedeepthroat", forcedeepthroatScore, "Force to deepthroat", "Make that slut deepthroat you")
		if(state in ["blowjob", "deepthroat"]):
			if(isReadyToCumHandled(DOM_0) && isStraponSex()):
				addAction("domstraponcum", 1.0, "Cum!", "You're about to cum..", {A_PRIORITY: 1001})
			
			if(isReadyToCumHandled(DOM_0) && !isStraponSex()):
				addAction("bjcuminside", 1.0, "Cum inside", "Stuff that mouth", {A_PRIORITY: 1001})
				addAction("bjpullout", 1.0, "Pull out", "Cum all over their face instead", {A_PRIORITY: 1001})
		if(state in ["deepthroat"]):
			var stopdeepthroatScore:float = getSubInfo().getAboutToPassOutScore() * 0.2 * (1.0 - personality(DOM_0, PersonalityStat.Mean)*0.5 - fetish(DOM_0, Fetish.UnconsciousSex))
			addAction("stopdeepthroat", stopdeepthroatScore, "Stop deepthroat", "Enough deepthroating for now")
		if(state == "licking"):
			if(!isFacesit && (getSexType() == SexType.DefaultSex)):
				addAction("startFacesit", 0.07-personality(DOM_0, PersonalityStat.Subby)*0.05, "Sit on face!", "Sit on their face while they are licking you out!")
		if(state in ["licking", "grinding"]):
			if(isReadyToCumHandled(DOM_0)):
				addAction("pussycum", 1.0, "Cum!", "Cum all over the sub", {A_PRIORITY: 1001})
			
		addAction("stop", getStopScore(), "Stop oral", "Stop the oral sex activity")

	if(_indx == SUB_0):
		if(state in ["askingtosuck"]):
			if((isStraponSex() || getDom().hasReachablePenis()) && getDomInfo().isReadyToPenetrate() && getDom().getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
				var openmouthScore:float = getSubInfo().getComplyScore() * fetish(SUB_0, Fetish.OralSexGiving, 0.5)
				addAction("openmouth", openmouthScore, "Open mouth", "Let that "+getDickName()+" into your mouth")
				addAction("notopenmouth", getResistScore(SUB_0), "Shake head", "You're not gonna suck their "+getDickName())
		if(state in ["askingtolick"]):
			var startlickingScore:float = getSubInfo().getComplyScore() * fetish(SUB_0, Fetish.OralSexGiving, 0.5)
			addAction("startlicking", startlickingScore, "Lick pussy", "Obey their orders and start licking them out")
			addAction("refusetolick", getResistScore(SUB_0), "Refuse to lick", "You're not gonna lick their pussy")

		if(state in ["", "blowjob", "askingtosuck", "licking", "askingtolick", "grinding"]):
			if(!getSub().isBitingBlocked()):
				addAction("bite", getResistScore(SUB_0)/4.0, "Bite", "Bite them! Will be very painful", {A_CHANCE: getSubBiteChance(50.0, 30.0)})
			addAction("pullaway", getResistScore(SUB_0), "Pull away", "Try to pull away", {A_CHANCE: getSubResistChance(30.0, 25.0)})
		if(state in ["licking"]):
			addAction("prodpussy", getComplyScore(SUB_0)/2.0, "Prod with tongue", "Use your tongue more")
		if(state in ["grinding"]):
			addAction("grindtongue", getComplyScore(SUB_0)/2.0, "Use tongue", "Use your tongue more")
		if(state in [""]):
			if(getDom().hasReachablePenis() || isStraponSex()):
				var teasecockScore:float = getComplyScore(SUB_0) * 0.5 + fetish(SUB_0, Fetish.OralSexGiving, 0.5)
				addAction("teasecock", teasecockScore, "Tease "+getDickName("cock"), "Show their "+getDickName()+" some love")
			if(getDom().hasReachableVagina()):
				var teasevaginaScore:float = getComplyScore(SUB_0) * 0.5 + fetish(SUB_0, Fetish.OralSexGiving, 0.5)
				addAction("teasevagina", teasevaginaScore, "Tease pussy", "Show their pussy some love")
		if(state in ["blowjob"]):
			var startdeepthroatingScore:float = getComplyScore(SUB_0) * fetish(SUB_0, Fetish.OralSexGiving, -0.5) * 0.1 
			addAction("startdeepthroating", startdeepthroatingScore, "Deepthroat", "Let that "+getDickName()+" stretch your throat")
		if(state in ["deepthroat"]):
			var stopdeepthroatingScore:float = getComplyScore(SUB_0) * fetish(SUB_0, Fetish.OralSexGiving, -0.5) * 0.1 
			addAction("stopdeepthroating", stopdeepthroatingScore, "Stop deepthroating", "Enough throat stretching!", {A_CHANCE: getSubStopDeepthroatChance()})


func doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "domstraponcum"):
		getDom().cumOnFloor()
		getDomInfo().cum()
		addGenericOrgasmText(DOM_0)
		return
	if(_id == "cocktease"):
		var throughTheClothing:String = getThroughClothingText(DOM_0, BodypartSlot.Penis)
		var text:String = RNG.pick([
			"{dom.You} "+RNG.pick(["{dom.youVerb('pull')}", "{dom.youVerb('bring')}", "{dom.youVerb('move')}"])+" {sub.yourHis} head to {dom.yourHis} "+getDickName()+" and {dom.youVerb('make')} {sub.youHim} "+RNG.pick(["rub", "grind"])+" {sub.youHis} face against it"+throughTheClothing+"."
		])
		if(isStocksSex()):
			text = RNG.pick([
				"{dom.You} "+RNG.pick(["{dom.youVerb('move')}", "{dom.youVerb('bring')}", "{dom.youVerb('move')}"])+" {dom.yourHis} "+getDickName()+" to {sub.yourHis} head and {dom.youVerb('make')} {sub.youHim} "+RNG.pick(["rub", "grind"])+" {sub.youHis} face against it"+throughTheClothing+"."
			])
		if(getDomInfo().isAngry()):
			text = RNG.pick([
				text,
				"{dom.You} "+RNG.pick(["{dom.youVerb('cocksmack')}", "{dom.youVerb('cockslap')}", "{dom.youVerb('cockwhip')}"])+" {sub.yourHis} cheek with {dom.yourHis} "+getDickName(RNG.pick(["dick", "member", "prick"]))+".",
			])
		getDomInfo().addLust(10.0 + getDomInfo().fetishScore({Fetish.OralSexReceiving: 5.0}))
		getDomInfo().addArousalForeplay(0.05)
		affectSub(getSubInfo().fetishScore({Fetish.OralSexGiving: 1.0}), 0.1, -0.3, -0.01)
		
		if(getDomInfo().isReadyToPenetrate() && hasBodypartUncovered(DOM_0, BodypartSlot.Penis) && !isStraponSex()):
			text += RNG.pick([
				" {dom.Your} hard cock is leaking "+RNG.pick(["pre", "precum", "arousal"])+".",
				" {dom.Your} cock is "+RNG.pick(["ready", "hard enough"])+" to be shoved into {sub.yourHis} mouth.",
			])
		addText(text)
		return
	if(_id == "asktosuck"):
		state = "askingtosuck"
		waitTimer = 0
		affectSub(getSubInfo().fetishScore({Fetish.OralSexGiving: 1.0}), 0.05, -0.4, 0.0)
		addText("{dom.You} {dom.youVerb('order')} {sub.youHim} to "+RNG.pick(["open {sub.yourHis} mouth", "part {sub.yourHis} lips"])+".")
		react(SexReaction.OrderBlowjob)
		return
	if(_id == "asktolick"):
		state = "askingtolick"
		waitTimer = 0
		affectSub(getSubInfo().fetishScore({Fetish.OralSexGiving: 1.0}), 0.05, -0.4, 0.0)
		addText("{dom.You} {dom.youVerb('order')} {sub.youHim} to "+RNG.pick(["start licking {dom.yourHis} pussy", "stick {sub.yourHis} tongue out and start working on {dom.yourHis} pussy"])+".")
		react(SexReaction.OrderLickPussy)
		return
	if(_id == "startgrindface"):
		isForce = true
		state = "grinding"
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('press', 'presses')} {dom.yourHis} "+RNG.pick(["pussy", "slit", "kitty"])+" to {sub.yourHis} face and {dom.youVerb('proceed')} to grind it!",
		])
		if(getSub().bodypartHasTrait(BodypartSlot.Horns, PartTrait.HornsGraspable)):
			text = RNG.pick([
				"{dom.You} {dom.youVerb('reach', 'reaches')} for {sub.yourHis} horns and use them as handlebars. ",
			]) + text
		
		stimulate(DOM_0, S_VAGINA, SUB_0, S_MOUTH, I_LOW, Fetish.OralSexReceiving)
		#affectSub(getSubInfo().fetishScore({Fetish.OralSexGiving: 1.0}), 0.1, -0.3, -0.02)
		getDomInfo().addAnger(-0.05)
		addText(text)
		return
	if(_id == "forcetosuck"):
		var successChance:float = 30
		if(getSub().isBitingBlocked()):
			successChance = 100
		
		if(RNG.chance(successChance)):
			isForce = true
			state = "blowjob"
			stimulate(DOM_0, S_PENIS, SUB_0, S_MOUTH, I_LOW, Fetish.OralSexReceiving)
			#affectSub(getSubInfo().fetishScore({Fetish.OralSexGiving: 1.0}), 0.05, -0.2, -0.05)
			getDomInfo().addAnger(-0.1)
			sendSexEvent(SexEvent.HolePenetrated, DOM_0, SUB_0, {hole=BodypartSlot.Head,engulfed=false,strapon=isStraponSex()})
			addText("{dom.You} {dom.youVerb('force')} {dom.yourHis} "+getDickName()+" "+RNG.pick(["past {sub.yourHis} lips", "inside {sub.yourHis} mouth", "past {sub.yourHis} teeth"])+" and {dom.youVerb('make')} {sub.you} "+RNG.pick(["suck", "blow"])+" {dom.youHim}!")
			return
		else:
			stimulate(DOM_0, S_PENIS, SUB_0, S_MOUTH, I_TEASE, Fetish.OralSexReceiving)
			#affectSub(getSubInfo().fetishScore({Fetish.OralSexGiving: 1.0}), 0.05, -0.2, -0.01)
			getDomInfo().addAnger(0.05)
			addText("{dom.You} {dom.youVerb('try', 'tries')} to "+RNG.pick(["force", "push", "shove", "forcefully shove"])+" {dom.yourHis} "+getDickName()+" "+RNG.pick(["into {sub.yourHis} mouth", "past {sub.yourHis} lips", "past {sub.yourHis} teeth"])+".")
			react(SexReaction.TryForceSuckPenis)
			return
	if(_id == "bjcuminside"):
		state = ""
		satisfyGoals()
		doCumBJDom(state == "deepthroat")
		applyTallymarkIfNeeded(BodypartSlot.Head)
		return
	if(_id == "bjpullout"):
		satisfyGoals()
		state = ""
		doCumBJFacialsDom()
		applyTallymarkIfNeeded(BodypartSlot.Head)
		return
	if(_id == "pussycum"):
		satisfyGoals()
		state = ""
		doCumPussyLickDom()
		return 
	if(_id == "forcedeepthroat"):
		if(!RNG.chance(getSub().getPenetrateChanceBy(BodypartSlot.Head, getDomID()))):
			var text:String = RNG.pick([
				"{dom.You} {dom.youVerb('try', 'tries')} to force {sub.you} deeper onto {dom.yourHis} "+getDickName()+" but {sub.yourHis} throat is just too tight.",
				"{dom.You} {dom.youVerb('try', 'tries')} to make {sub.you} deepthroat {dom.yourHis} "+getDickName()+" but {sub.youHe} {sub.youAre} just too tight.",
			])
			if(isStocksSex()):
				text = RNG.pick([
				"{dom.You} {dom.youVerb('try', 'tries')} to force {dom.yourHis} "+getDickName()+" deeper but {sub.yourHis} throat is just too tight.",
				"{dom.You} {dom.youVerb('try', 'tries')} to make {sub.you} deepthroat {dom.yourHis} "+getDickName()+" but {sub.youHe} {sub.youAre} just too tight.",
				])
			getSub().gotOrificeStretchedBy(BodypartSlot.Head, getDomID(), true, 0.1)
			stimulate(DOM_0, S_PENIS, SUB_0, S_MOUTH, I_TEASE, Fetish.OralSexReceiving)
			#affectSub(getDomInfo().fetishScore({Fetish.OralSexGiving: 1.0}), 0.1, -0.1, -0.05)
			#getDomInfo().addLust(0.1)
			#getDomInfo().addArousalSex(0.03)
			addText(text)
			return
		else:
			state = "deepthroat"
			var text:String = RNG.pick([
				"{dom.You} {dom.youVerb('shove')} {dom.yourHis} "+getDickName()+" deeper and {dom.youVerb('force')} {sub.you} to deepthroat {dom.youHim}!",
			])
			if(getSub().bodypartHasTrait(BodypartSlot.Horns, PartTrait.HornsGraspable)):
				text = RNG.pick([
					"{dom.You} {dom.youVerb('reach', 'reaches')} for {sub.yourHis} horns and use them as handlebars. ",
				]) + text
			getSub().gotOrificeStretchedBy(BodypartSlot.Head, getDomID(), true, 0.2)
			stimulate(DOM_0, S_PENIS, SUB_0, S_MOUTH, I_NORMAL, Fetish.OralSexReceiving)
			#affectSub(getDomInfo().fetishScore({Fetish.OralSexGiving: 1.0}), 0.1, -0.2, -0.05)
			#getDomInfo().addArousalSex(0.05 * domSensitivity())
			addText(text)
			return
	if(_id == "stopdeepthroat"):
		var text:String = RNG.pick([
			"{dom.You} {dom.youVerb('let')} {sub.you} to stop deepthroating {dom.yourHis} "+getDickName()+".",
		])
		if(!getSubInfo().isUnconscious() && getSubInfo().getConsciousness() < 1.0):
			text += RNG.pick([
				"{sub.You} {sub.youVerb('cough')} a lot before returning to sucking.",
			])
		state = "blowjob"
		addText(text)
		return
	if(_id == "stop"):
		endActivity()
		var exposedThings:Array = []
		var genitalsText:String = "crotch"
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
		
		addText("{dom.You} {dom.youVerb('pull')} {dom.yourHis} "+genitalsText+" away from {sub.yourHis} lips.")
		return
	if(_id == "startFacesit"):
		isFacesit = true
		addText("{dom.You} {dom.youVerb('bring')} {sub.you} down onto the floor and {dom.youVerb('sit')} on {sub.yourHis} face!")
		return

	if(_id == "teasecock"):
		var throughTheClothing:String = getThroughClothingText(DOM_0, BodypartSlot.Penis)
		
		var text:String = ""
		if(getSub().isOralBlocked()):
			text = RNG.pick([
				"{sub.You} {sub.youVerb('nuzzle')} {dom.your} "+getDickName()+throughTheClothing+".",
			])
		else:
			text = RNG.pick([
				"{sub.You} "+RNG.pick(["{sub.youVerb('nuzzle')}", "{sub.youVerb('lick')}"])+" {dom.your} "+getDickName()+throughTheClothing+".",
			])
		
		stimulate(SUB_0, S_MOUTH, DOM_0, S_PENIS, I_TEASE, Fetish.OralSexGiving)
		#getDomInfo().addLust(10.0 + getDomInfo().fetishScore({Fetish.OralSexReceiving: 5.0}))
		#getDomInfo().addArousalForeplay(0.05*domSensitivity())
		
		if(getDomInfo().isReadyToPenetrate() && hasBodypartUncovered(DOM_0, BodypartSlot.Penis) && !isStraponSex()):
			text += RNG.pick([
				" {dom.Your} hard cock is leaking "+RNG.pick(["pre", "precum", "arousal"])+".",
				" {dom.Your} cock is "+RNG.pick(["ready", "hard enough"])+" to be shoved into {sub.yourHis} mouth.",
			])
		
		addText(text)
		return
	if(_id == "teasevagina"):
		var throughTheClothing:String = getThroughClothingText(DOM_0, BodypartSlot.Vagina)
		var text:String = ""
		if(getSub().isOralBlocked()):
			text = RNG.pick([
				"{sub.You} {sub.youVerb('nuzzle')} {dom.your} "+RNG.pick(["pussy", "slit", "petals", "pussy folds"])+throughTheClothing+".",
			])
		else:
			text = RNG.pick([
				"{sub.You} "+RNG.pick(["{sub.youVerb('nuzzle')}", "{sub.youVerb('lick')}"])+" {dom.your} "+RNG.pick(["pussy", "slit", "petals", "pussy folds"])+throughTheClothing+".",
			])
		stimulate(SUB_0, S_MOUTH, DOM_0, S_VAGINA, I_TEASE, Fetish.OralSexGiving)
		#getDomInfo().addLust(10.0 + getDomInfo().fetishScore({Fetish.OralSexReceiving: 5.0}))
		#getDomInfo().addArousalForeplay(0.05)
		if(getDomInfo().isReadyToPenetrate() && hasBodypartUncovered(DOM_0, BodypartSlot.Vagina)):
			text += RNG.pick([
				" {dom.Your} pussy is looking "+RNG.pick(["wet", "moist", "needy", "very wet"])+".",
			])
		addText(text)
		return
	if(_id == "openmouth"):
		isForce = false
		state = "blowjob"
		sendSexEvent(SexEvent.HolePenetrated, DOM_0, SUB_0, {hole=BodypartSlot.Head,engulfed=true,strapon=isStraponSex()})
		addText("{sub.You} {sub.youVerb('open')} {sub.yourHis} mouth and {sub.youVerb('let')} {dom.your} "+getDickName()+" in before wrapping {sub.yourHis} lips around it.")
		return
	if(_id == "notopenmouth"):
		state = ""
		getDomInfo().addAnger(0.2)
		addText("{sub.You} {sub.youVerb('refuse')} to open {sub.yourHis} mouth.")
		return
	if(_id == "startlicking"):
		isForce = false
		isFacesit = false
		state = "licking"
		addText("{sub.You} {sub.youVerb('stick')} {sub.yourHis} tongue out and {sub.youVerb('press', 'presses')} it against {dom.your} "+RNG.pick(["pussy", "slit", "petals", "folds"])+" before proceeding to lick them.")
		return
	if(_id == "refusetolick"):
		state = ""
		addText("{sub.You} {sub.youVerb('refuse')} to lick {dom.yourHis} pussy.")
		getDomInfo().addAnger(0.2)
		return
	if(_id == "prodpussy"):
		var text:String = RNG.pick([
			"{sub.You} {sub.youVerb('use')} {sub.yourHis} tongue to "+RNG.pick(["prod {dom.yourHis} pussy entrance and lap up all the juices", "prod at the wet pussy entrance", "lap at the wet pussy hole"])+".",
		])
		
		if(getDom().hasEffect(StatusEffect.HasCumInsideVagina) && OPTIONS.isContentEnabled(ContentType.CumStealing)):
			if(RNG.chance(40)):
				if(getDom().bodypartTransferFluidsTo(BodypartSlot.Vagina, getSubID(), BodypartSlot.Head, 0.1, 20.0)):
					text += RNG.pick([ 
						" {sub.YouHe} {sub.youVerb('get')} "+Util.capitalizeFirstLetter(getDom().getBodypartContentsStringList(BodypartSlot.Vagina))+" onto {sub.yourHis} tongue while eating {dom.yourHis} "+RNG.pick(["", "used ", "stuffed "])+RNG.pick(["pussy", "slit", "kitty"])+" out. [b]{sub.You} {sub.youVerb('swallow')} it all[/b].",
					])
		
		#getDomInfo().stimulateArousalZone(0.05, BodypartSlot.Vagina, 0.25)
		stimulate(SUB_0, S_MOUTH, DOM_0, S_VAGINA, I_LOW, Fetish.OralSexGiving, SPEED_SLOW)
		addText(text)
		return
	if(_id == "grindtongue"):
		var text:String = RNG.pick([
			"{sub.You} {sub.youVerb('stick')} {sub.yourHis} tongue out and {sub.youVerb('catch', 'catches')} some "+RNG.pick(["arousal", "juices"])+RNG.pick([" from that wet pussy","", " onto it"," while {sub.yourHis} face is being grinded"])+".",
		])
		
		if(getDom().hasEffect(StatusEffect.HasCumInsideVagina) && OPTIONS.isContentEnabled(ContentType.CumStealing)):
			if(RNG.chance(50)):
				if(getDom().bodypartTransferFluidsTo(BodypartSlot.Vagina, getSubID(), BodypartSlot.Head, 0.1, 20.0)):
					text += RNG.pick([ 
						" "+Util.capitalizeFirstLetter(getDom().getBodypartContentsStringList(BodypartSlot.Vagina))+" "+RNG.pick(["leaks", "oozes"])+" onto {sub.yourHis} tongue out of {dom.yourHis} "+RNG.pick(["", "used ", "stuffed "])+RNG.pick(["pussy", "slit", "kitty"])+". [b]{sub.You} {sub.youVerb('swallow')} it all[/b].",
					])
		
		stimulate(SUB_0, S_MOUTH, DOM_0, S_VAGINA, I_LOW, Fetish.OralSexGiving, SPEED_SLOW)
		#getDomInfo().stimulateArousalZone(0.05, BodypartSlot.Vagina, 0.25)
		addText(text)
		return
	if(_id == "bite"):
		if(isStraponSex() && (state in ["blowjob", "deepthroat"])):
			addText("{sub.You} {sub.youVerb('bite')} down on {dom.your} strapon. It doesn't have much effect on it..")
			return
		
		var successChance:float = getSubBiteChance(50.0, 30.0)
		if(RNG.chance(successChance)):
			getDomInfo().addPain(10)
			sendSexEvent(SexEvent.PainInflicted, SUB_0, DOM_0, {pain=10,isDefense=true,intentional=true})
			getDomInfo().addAnger(1.0 - getDomInfo().fetishScore({Fetish.Masochism: 0.5}))
			getDomInfo().addLust(-5 + 10 * getDomInfo().fetishScore({Fetish.Masochism: 1.0}))
			endActivity()
			addText("{sub.You} {sub.youVerb('bite')} {dom.your} genitals! {dom.YouHe} {dom.youVerb('cry', 'cries')} from pain and {dom.youVerb('pull')} away.")
			return
		else:
			getDomInfo().addAnger(0.4)
			addText("{sub.You} {sub.youVerb('try', 'tries')} to bite {dom.you} but {dom.youHe} {dom.youVerb('avoid')} it!")
			return
	if(_id == "pullaway"):
		var successChance:float = getSubResistChance(30.0, 25.0)
		if(RNG.chance(successChance)):
			getDomInfo().addAnger(0.3)
			if(state in ["blowjob", "licking", "deepthroat"]):
				state = ""
			else:
				endActivity()
			addText("{sub.You} {sub.youVerb('pull')} away from {dom.you}.")
			return
		else:
			getDomInfo().addAnger(0.1)
			addText("{sub.You} {sub.youVerb('try', 'tries')} to pull away from {dom.you} but {sub.youVerb('fail')}.")
			reactSub(SexReaction.ActivelyResisting, [50])
			return
	if(_id == "startdeepthroating"):
		if(!RNG.chance(getSub().getPenetrateChanceBy(BodypartSlot.Head, getDomID()))):
			getSub().gotOrificeStretchedBy(BodypartSlot.Head, getDomID(), true, 0.1)
			stimulate(SUB_0, S_MOUTH, DOM_0, S_PENIS, I_TEASE, Fetish.OralSexGiving, SPEED_SLOW)
			#affectDom(getDomInfo().fetishScore({Fetish.OralSexReceiving: 1.0}), 0.2*domSensitivity(), -0.03)
			addText("{sub.You} {sub.youVerb('try', 'tries')} to get {dom.yourHis} "+getDickName()+" into {sub.yourHis} throat but "+RNG.pick(["it's too big", "{sub.youHe} {sub.youVerb('struggle')}", "{sub.youVerb('fail')}"])+".")
			return
		else:
			state = "deepthroat"
			stimulate(SUB_0, S_MOUTH, DOM_0, S_PENIS, I_NORMAL, Fetish.OralSexGiving, SPEED_SLOW)
			getSub().gotOrificeStretchedBy(BodypartSlot.Head, getDomID(), true, 0.2)
			#affectDom(getDomInfo().fetishScore({Fetish.OralSexReceiving: 1.0}), 0.2*domSensitivity(), -0.03)
			#getDomInfo().addArousalForeplay(0.05*domSensitivity())
			addText("{sub.You} willingly {sub.youVerb('let')} {dom.yourHis} "+getDickName()+" deep down {sub.yourHis} throat and {sub.youVerb('start')} deepthroating it!")
			return
	if(_id == "stopdeepthroating"):
		if(RNG.chance(getSubStopDeepthroatChance())):
			state = "blowjob"
			addText("{sub.You} {sub.youVerb('stop')} deepthroating that "+getDickName()+", instead just sucking it off normally.")
			return
		else:
			getDomInfo().addAnger(0.05)
			var text:String = RNG.pick([
				"{sub.You} {sub.youVerb('try', 'tries')} to pull away but {sub.youVerb('fail')}. {dom.You} {dom.youVerb('keep')} forcing {sub.youHim} to deepthroat {dom.youHim}!",
			])
			if(getDomInfo().isAngry() && RNG.chance(50)):
				getSubInfo().addPain(5)
				sendSexEvent(SexEvent.PainInflicted, DOM_0, SUB_0, {pain=5,isDefense=false,intentional=true})
				text += RNG.pick([
					" {sub.You} {sub.youVerb('receive')} a painful slap on the cheek from {dom.youHim}.",
				])
			addText(text)
			return


func getSubStopDeepthroatChance() -> float:
	if(!getDomInfo().isAngry()):
		return 100.0
	var theChance = 40.0 - getDomInfo().getAngerScore()*20.0
	if(getSub().hasBlockedHands()):
		theChance *= 0.8
	if(getSub().hasBoundArms()):
		theChance *= 0.8
	if(getSub().isBitingBlocked()):
		theChance *= 0.5
	return max(theChance, 5.0)

func getSubResistChance(baseChance:float, domAngerRemoval:float) -> float:
	var theChance = baseChance - getDomInfo().getAngerScore()*domAngerRemoval
	if(getSub().hasBlockedHands()):
		theChance *= 0.5
	if(getSub().hasBoundArms()):
		theChance *= 0.5
	if(getSub().isBlindfolded()):
		theChance *= 0.8
	
	return max(theChance, 5.0)

func getSubBiteChance(baseChance:float, domAngerRemoval:float) -> float:
	if(state in ["blowjob", "licking"]):
		return 100.0
	var theChance = baseChance - getDomInfo().getAngerScore()*domAngerRemoval
	if(getSub().hasBlockedHands()):
		theChance *= 0.9
	if(getSub().hasBoundArms()):
		theChance *= 0.9
	if(getSub().isBlindfolded()):
		theChance *= 0.5
	
	return max(theChance, 5.0)

func getAnimation():
	if(isStocksSex()):
		if(state in ["", "askingtolick"]):
			return [StageScene.StocksSexOral, "tease", {npc=DOM_0, pc=SUB_0}]
		if(state in ["licking", "grinding"]):
			return [StageScene.StocksSexOral, "pussy", {npc=DOM_0, pc=SUB_0}]
		if(state in ["blowjob", "deepthroat"]):
			if(getDomInfo().isCloseToCumming() || (isStraponSex() && getSubInfo().isCloseToCumming())):
				return [StageScene.StocksSexOral, "fast", {npc=DOM_0, pc=SUB_0}]
			return [StageScene.StocksSexOral, "sex", {npc=DOM_0, pc=SUB_0}]
			
		return [StageScene.StocksSexOral, "tease", {npc=DOM_0, pc=SUB_0}]
	
	if(state in ["", "askingtolick"]):
		return [StageScene.SexOral, "start", {pc=DOM_0, npc=SUB_0}]
	
	if(state in ["licking"]):
		if(isFacesit):
			if(isCloseToCumming(DOM_0)):
				return [StageScene.SexFaceSitting, "grind", {pc=DOM_0, npc=SUB_0}]
			return [StageScene.SexFaceSitting, "sit", {pc=DOM_0, npc=SUB_0}]
		if(isCloseToCumming(DOM_0)):
			return [StageScene.SexOral, "grind", {pc=DOM_0, npc=SUB_0}]
		return [StageScene.SexOral, "lick", {pc=DOM_0, npc=SUB_0}]
	if(state in ["grinding"]):
		if(isCloseToCumming(DOM_0)):
			return [StageScene.SexOralForced, "lickfast", {pc=DOM_0, npc=SUB_0}]
		return [StageScene.SexOralForced, "lick", {pc=DOM_0, npc=SUB_0}]
	
	if(state in ["blowjob", "deepthroat"]):
		if(isForce):
			if(getDomInfo().isCloseToCumming() || state == "deepthroat"):
				return [StageScene.SexOralForced, "suckfast", {pc=DOM_0, npc=SUB_0}]
			return [StageScene.SexOralForced, "suck", {pc=DOM_0, npc=SUB_0}]
		if(getDomInfo().isCloseToCumming() || state == "deepthroat"):
			return [StageScene.SexOral, "fast", {pc=DOM_0, npc=SUB_0}]
		return [StageScene.SexOral, "sex", {pc=DOM_0, npc=SUB_0}]
	
	if(state in ["askingtosuck"]):
		return [StageScene.SexOral, "tease", {pc=DOM_0, npc=SUB_0}]

func isActivityImpossibleShouldStop() -> bool:
	if(state in ["askingtolick", "licking", "grinding"]):
		if(!getDom().hasReachableVagina()):
			return true
	if(state in ["askingtosuck", "blowjob", "deepthroat"]):
		if(!getDom().hasReachablePenis() && !getDom().isWearingStrapon()):
			return true
	
	return false

func getOrgasmHandlePriority(_indx:int) -> int:
	if(_indx == DOM_0):
		if(isStraponSex()):
			return 5
		return 10
	return -1

func saveData():
	var data = .saveData()
	
	data["waitTimer"] = waitTimer
	data["straponHumps"] = straponHumps
	data["isForce"] = isForce
	data["isFacesit"] = isFacesit

	return data
	
func loadData(data):
	.loadData(data)
	
	waitTimer = SAVE.loadVar(data, "waitTimer", 0)
	straponHumps = SAVE.loadVar(data, "straponHumps", 0)
	isForce = SAVE.loadVar(data, "isForce", false)
	isFacesit = SAVE.loadVar(data, "isFacesit", false)
