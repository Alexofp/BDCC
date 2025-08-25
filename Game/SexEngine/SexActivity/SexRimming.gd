extends SexActivityBase

var boredTimer:int = 0
var waitTimer:int = 0

func _init():
	id = "SexRimming"
	
	activityName = "Rimming"
	activityDesc = "Make them eat your ass!"
	activityCategory = ["Fuck"]

func getGoals():
	return {
		SexGoal.RimmingReceive: 1.0,
	}

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(!(_domInfo.getChar().hasReachableAnus())):
		return false
	if(!(!_subInfo.getChar().isOralBlocked())):
		return false
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return [SexActivityTag.AnusUsed, SexActivityTag.HavingSex]
	if(_indx == SUB_0):
		return [SexActivityTag.MouthUsed, SexActivityTag.HavingSex, SexActivityTag.PreventsSubTeasing]
	return []

func getCheckTagsSub() -> Array:
	return [SexActivityTag.MouthUsed, SexActivityTag.HavingSex]

func startActivity(_args):
	affectSub(getSubInfo().fetishScore({Fetish.RimmingGiving: 1.0})+0.0, 0.1, -0.1, -0.01)
	addText("{dom.You} {dom.youVerb('force')} {sub.you} onto {sub.yourHis} knees and {dom.youVerb('position')} {dom.yourself} in front of {sub.youHim}, inviting to start licking {dom.yourHis} butt.")
	react(SexReaction.OrderRimming)
	return

func init_processTurn():
	if(hasBodypartUncovered(DOM_0, BodypartSlot.Anus)):
		waitTimer += 1
	
	if(waitTimer > 2):
		getDomInfo().addAnger(0.05)
		addText("{dom.You} {dom.youVerb('lose')} {dom.yourHis} patience.")

func rimming_processTurn():
	#affectDom(getDomInfo().fetishScore({Fetish.RimmingReceiving: 1.0})+0.3, 0.1, 0.0)
	#affectSub(getSubInfo().fetishScore({Fetish.RimmingGiving: 1.0})+0.0, 0.1, -0.1, -0.01)
	
	addTextPick([
		"{sub.You} {sub.youVerb('rim')} {dom.yourHis} "+str(getRandomAnusWord())+".",
		"{sub.You} {sub.youVerb('drag')} {sub.yourHis} tongue over {dom.yourHis} "+str(getRandomAnusWord())+" in circular patterns.",
		"{sub.You} {sub.youVerb('lick')} {dom.yourHis} "+str(getRandomAnusWord())+".",
		"{sub.You} {sub.youVerb('prod')} {dom.yourHis} "+str(getRandomAnusWord())+" with {sub.yourHis} tongue."
	])
	boredTimer += 1
	if(boredTimer > 10 && RNG.chance(20) && !getDomInfo().isCloseToCumming()):
		satisfyGoals()
	if(getDom().hasPenis() && RNG.chance(50)):
		addTextPick([
			"The tongue massages {dom.yourHis} prostate so well!",
			"{sub.YourHis} tongue is reaching {dom.yourHis} prostate and prods it!",
			"{sub.YourHis} tongue stimulates {dom.yourHis} prostate!"
		])
	#	getDomInfo().stimulateArousalZone(0.1, BodypartSlot.Anus, 1.0)
	#else:
	#	getDomInfo().stimulateArousalZone(0.05, BodypartSlot.Anus, 1.0)
	stimulateLick(SUB_0, DOM_0, S_ANUS, I_NORMAL)
	
	if(getDom().hasVagina() && RNG.chance(20)):
		addTextPick([
			"{sub.YourHis} tongue manages to massage {dom.yourHis} g-spot through the inner wall!",
			"{dom.YourHis} pussy becomes more wet, receiving some stimulation through the inner wall!"
		])
	if(getDom().hasEffect(StatusEffect.HasCumInsideAnus) && OPTIONS.isContentEnabled(ContentType.CumStealing)):
		if(RNG.chance(20)):
			if(getDom().bodypartTransferFluidsTo(BodypartSlot.Anus, getSubID(), BodypartSlot.Head, 0.1, 20.0)):
				addText(Util.capitalizeFirstLetter(getDom().getBodypartContentsStringList(BodypartSlot.Anus))+" lands on {sub.yourHis} tongue, leaking out of {dom.yourHis} "+RNG.pick(["", "used ", "stuffed "])+RNG.pick(["ass", "anus", "tailhole"])+" and [b]{sub.you} {sub.youVerb('swallow')} it[/b].")

func getActions(_indx:int):
	if(_indx == DOM_0):
		if(state in ["", "rimming"]):
			addAction("stop", getStopScore(), "Stop", "Stop making them rim you")
		if(state in [""]):
			if((getDom().getFirstItemThatCoversBodypart(BodypartSlot.Anus) == null)):
				addAction("forcerim", getDomInfo().getAngerScore(), "Force to rim", "Make them lick your butt", {A_CHANCE: 30})
		if(state in ["rimming"]):
			addAction("moan", 0.5, "Moan", "Show how much you enjoy it")
		if(state in ["rimming"]):
			if(isReadyToCumHandled(DOM_0)):
				addAction("cum", 1.0, "Cum!", "You're about to cum and there is nothing you can do about it", {A_PRIORITY: 1001})

	if(_indx == SUB_0):
		if(state in ["", "rimming"]):
			addAction("pullaway", getSubInfo().getResistScore(), "Pull away", "Try to pull away", {A_CHANCE: getSubResistChance(30.0, 25.0)})
		if(state in [""]):
			if((getDom().getFirstItemThatCoversBodypart(BodypartSlot.Anus) == null)):
				var startrimScore:float = getSubInfo().getComplyScore() * fetish(SUB_0, Fetish.RimmingGiving)
				addAction("startrim", startrimScore, "Start rimming", "Start licking their butt")
		if(state in ["", "rimming"]):
			if((!getSub().isBitingBlocked())):
				addAction("bite", getResistScore(SUB_0) / 4.0, "Bite!", "Bite their ass!", {A_CHANCE: getSubResistChance(60.0, 45.0)})
		if(state in ["rimming"]):
			var prodScore:float = getSubInfo().getComplyScore() * fetish(SUB_0, Fetish.RimmingGiving)
			addAction("prod", prodScore, "Prod", "Try to slip your tongue deeper")

func doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "stop"):
		addText("{dom.You} {dom.youVerb('stop')} making {sub.you} rim you.")
		endActivity()
		return
	if(_id == "forcerim"):
		if(RNG.chance(30)):
			addText("{dom.You} {dom.youVerb('force')} {sub.you} to start rimming {dom.youHim}!")
			state = "rimming"
		else:
			getDomInfo().addAnger(0.05)
			addText("{dom.You} {dom.youVerb('try', 'tries')} to make {sub.you} rim {dom.youHim}.")
		affectSub(getSubInfo().fetishScore({Fetish.RimmingGiving: 1.0})+0.0, 0.05, -0.1, -0.01)
		return
	if(_id == "moan"):
		var text:String = RNG.pick([
			"{dom.You} "+RNG.pick(["{dom.youVerb('let')} out a moan", "{dom.youVerb('moan')}", "{dom.youVerb('produce')} a moan", "{dom.youVerb('make')} a noise of pleasure"])+" while ",
		])
		if(getDom().isGagged()):
			text = RNG.pick([
				"{dom.You} "+RNG.pick(["{dom.youVerb('let')} out a muffled moan", "{dom.youVerb('try', 'tries')} to moan", "{dom.youVerb('produce')} a muffled moan", "{dom.youVerb('make')} a muffled noise of pleasure"])+" while ",
			])
		text += RNG.pick([
			"{sub.your} tongue is licking {dom.yourHis} "+getRandomAnusWord()+"!",
		])
		addText(text)
		moan(DOM_0)
		return
	if(_id == "cum"):
		satisfyGoals()
		getDom().cumOnFloor()
		getDomInfo().cum()
		state = ""
		sendSexEvent(SexEvent.UniqueOrgasm, SUB_0, DOM_0, {orgasmType=UniqueOrgasm.Rim})
		addGenericOrgasmText(DOM_0)
		fetishAffect(DOM_0, Fetish.RimmingReceiving, 3.0)
		fetishAffect(SUB_0, Fetish.RimmingGiving, 3.0)
		return

	if(_id == "pullaway"):
		var successChance:float = getSubResistChance(30.0, 25.0)
		if(RNG.chance(successChance)):
			addText("{sub.You} {sub.youVerb('pull')} away from {dom.you}.")
			getDomInfo().addAnger(0.3)
			if(state != ""):
				state = ""
			else:
				endActivity()
		else:
			addTextPick([
				"{sub.You} desperately {sub.youVerb('try', 'tries')} to pull away from {dom.your} butt.",
				"{sub.You} desperately {sub.youVerb('try', 'tries')} to pull away from {dom.your} ass.",
			])
			getDomInfo().addAnger(0.03)
		reactSub(SexReaction.Resisting, [50])
		return
	if(_id == "startrim"):
		state = "rimming"
		affectDom(getDomInfo().fetishScore({Fetish.RimmingReceiving: 1.0})+0.0, 0.1, -0.1)
		affectSub(getSubInfo().fetishScore({Fetish.RimmingGiving: 1.0})+0.0, 0.1, -0.05, -0.01)
		addTextPick([
			"{sub.You} {sub.youVerb('begin')} to eagerly rim {dom.yourHis} "+str(getRandomAnusWord())+".",
			"{sub.You} {sub.youVerb('lean')} in closer and {sub.youVerb('begin')} to lick {dom.yourHis} "+str(getRandomAnusWord())+".",
			"{sub.You} {sub.youVerb('begin')} to willingly rim {dom.yourHis} "+str(getRandomAnusWord())+"."
		])
		return
	if(_id == "prod"):
		getDomInfo().stimulateArousalZone(0.04, BodypartSlot.Anus, 0.25)
		getDomInfo().addAnger(-0.03)
		addTextPick([
			"{sub.You} willingly {sub.youVerb('thrust')} {sub.yourHis} tongue deeper into {dom.yourHis} "+str(getRandomAnusWord())+".",
			"{sub.You} willingly {sub.youVerb('slide')} {sub.yourHis} tongue past {dom.yourHis} anal ring and {sub.youVerb('lap')} at the inner walls.",
			"{sub.You} eagerly {sub.youVerb('eat')} {dom.yourHis} "+str(getRandomAnusWord())+" out."
		])
		return
	if(_id == "bite"):
		if(getSubResistChance(60.0, 45.0)):
			addText("{sub.You} {sub.youVerb('bite')} {dom.your} ass! {dom.YouHe} {dom.youVerb('grunt')} painfully and {dom.youVerb('pull')} away.")
			getDomInfo().addPain(5)
			sendSexEvent(SexEvent.PainInflicted, SUB_0, DOM_0, {pain=10,isDefense=true,intentional=true})
			getDomInfo().addAnger(1.0 - getDomInfo().fetishScore({Fetish.Masochism: 0.5}))
			getDomInfo().addLust(-5 + 10 * getDomInfo().fetishScore({Fetish.Masochism: 1.0}))
			if(state == ""):
				endActivity()
			state = ""
		else:
			addText("{sub.You} {sub.youVerb('try', 'tries')} to bite {dom.you} but {dom.youHe} {dom.youVerb('avoid')} it!")
			getDomInfo().addAnger(0.4)
		return

func getRandomAnusWord() -> String:
	return RNG.pick(["back entrance", "anus", "tailhole"])
	
func getSubResistChance(baseChance:float, domAngerRemoval:float) -> float:
	var theChance = baseChance - getDomInfo().getAngerScore()*domAngerRemoval
	if(getSub().hasBlockedHands()):
		theChance *= 0.5
	if(getSub().hasBoundArms()):
		theChance *= 0.5
	if(getSub().isBlindfolded()):
		theChance *= 0.8
	
	return max(theChance, 5.0)
	
func getOrgasmHandlePriority(_indx:int) -> int:
	if(_indx == DOM_0):
		return 10
	return -1

func saveData():
	var data = .saveData()

	data["boredTimer"] = boredTimer
	data["waitTimer"] = waitTimer

	return data

func loadData(_data):
	.loadData(_data)

	boredTimer = SAVE.loadVar(_data, "boredTimer", 0)
	waitTimer = SAVE.loadVar(_data, "waitTimer", 0)

func getAnimation():
	if(state == ""):
		return [StageScene.SexRimming, "tease", {pc=DOM_0, npc=SUB_0}]
	if(state == "rimming"):
		if(getDomInfo().isCloseToCumming()):
			return [StageScene.SexRimming, "fast", {pc=DOM_0, npc=SUB_0}]
		return [StageScene.SexRimming, "sex", {pc=DOM_0, npc=SUB_0}]
