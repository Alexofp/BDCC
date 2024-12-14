extends SexActivityBase

var boredTimer = 0
var waitTimer = 0

func _init():
	id = "SexRimming"

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

func getVisibleName():
	return "Rimming"

func getCategory():
	return ["Fuck"]

func getDomTags():
	return [SexActivityTag.AnusUsed, SexActivityTag.HavingSex]

func getSubTags():
	return [SexActivityTag.MouthUsed, SexActivityTag.HavingSex, SexActivityTag.PreventsSubTeasing]

func startActivity(_args):
	state = ""
	var text = ""
	var domSay = null
	var subSay = null
	affectSub(subInfo.fetishScore({Fetish.RimmingGiving: 1.0})+0.0, 0.1, -0.1, -0.01)
	text += "{dom.You} {dom.youVerb('force')} {sub.you} onto {sub.yourHis} knees and {dom.youVerb('position')} {dom.yourself} in front of {sub.youHim}, inviting to start licking {dom.yourHis} butt."
	domSay = domReaction(SexReaction.OrderRimming)
	subSay = subReaction(SexReaction.OrderRimming)
	return {
		text = text,
		domSay = domSay,
		subSay = subSay,
	}

func onSwitchFrom(_otherActivity, _args):
	return .onSwitchFrom(_otherActivity, _args)

func processTurn():
	if(state == ""):
		var text = ""
		if(getDom().getFirstItemThatCoversBodypart(BodypartSlot.Anus) == null):
			waitTimer += 1
		
		if(waitTimer > 2):
			domInfo.addAnger(0.05)
			text += "{dom.You} {dom.youVerb('lose')} {dom.yourHis} patience."
		return {
			text = text,
		}
	if(state == "rimming"):
		var text = ""
		affectDom(domInfo.fetishScore({Fetish.RimmingReceiving: 1.0})+0.3, 0.1, 0.0)
		affectSub(subInfo.fetishScore({Fetish.RimmingGiving: 1.0})+0.0, 0.1, -0.1, -0.01)
		
		text += RNG.pick([
			"{sub.You} {sub.youVerb('rim')} {dom.yourHis} "+str(getRandomAnusWord())+".",
			"{sub.You} {sub.youVerb('drag')} {sub.yourHis} tongue over {dom.yourHis} "+str(getRandomAnusWord())+" in circular patterns.",
			"{sub.You} {sub.youVerb('lick')} {dom.yourHis} "+str(getRandomAnusWord())+".",
			"{sub.You} {sub.youVerb('prod')} {dom.yourHis} "+str(getRandomAnusWord())+" with {sub.yourHis} tongue."
		])
		boredTimer += 1
		if(boredTimer > 10 && RNG.chance(20) && !domInfo.isCloseToCumming()):
			satisfyGoals()
		if(getDom().hasPenis() && RNG.chance(50)):
			text += RNG.pick([
				" The tongue massages {dom.yourHis} prostate so well!",
				" {sub.YourHis} tongue is reaching {dom.yourHis} prostate and prods it!",
				" {sub.YourHis} tongue stimulates {dom.yourHis} prostate!"
			])
			domInfo.stimulateArousalZone(0.1, BodypartSlot.Anus, 1.0)
		else:
			domInfo.stimulateArousalZone(0.05, BodypartSlot.Anus, 1.0)
			
		if(getDom().hasVagina() && RNG.chance(20)):
			text += RNG.pick([
				" {sub.YourHis} tongue manages to massage {dom.yourHis} g-spot through the inner wall!",
				" {dom.YourHis} pussy becomes more wet, receiving some stimulation through the inner wall!"
			])
		if(getDom().hasEffect(StatusEffect.HasCumInsideAnus) && OPTIONS.isContentEnabled(ContentType.CumStealing)):
			if(RNG.chance(20)):
				if(getDom().bodypartTransferFluidsTo(BodypartSlot.Anus, subID, BodypartSlot.Head, 0.1, 20.0)):
					text += RNG.pick([ 
						" "+Util.capitalizeFirstLetter(getDom().getBodypartContentsStringList(BodypartSlot.Anus))+" lands on {sub.yourHis} tongue, leaking out of {dom.yourHis} "+RNG.pick(["", "used ", "stuffed "])+RNG.pick(["ass", "anus", "tailhole"])+" and [b]{sub.you} {sub.youVerb('swallow')} it[/b].",
					])
		return {
			text = text,
		}

func getDomActions():
	var actions = []
	if(state in ["", "rimming"]):
		actions.append({
			"id": "stop",
			"score": getStopScore(),
			"name": "Stop",
			"desc": "Stop making them rim you",
			"priority" : 0,
		})
	if(state in [""]):
		if((getDom().getFirstItemThatCoversBodypart(BodypartSlot.Anus) == null)):
			actions.append({
				"id": "forcerim",
				"score": domInfo.getAngerScore(),
				"name": "Force to rim",
				"desc": "Make them lick your butt",
				"priority" : 0,
				"chance" : 30,
			})
	if(state in ["rimming"]):
		actions.append({
			"id": "moan",
			"score": 0.5,
			"name": "Moan",
			"desc": "Show how much you enjoy it",
			"priority" : 0,
		})
	if(state in ["rimming"]):
		if((domInfo.isReadyToCum() && isHandlingDomOrgasms())):
			actions.append({
				"id": "cum",
				"score": 1.0,
				"name": "Cum!",
				"desc": "You're about to cum and there is nothing you can do about it",
				"priority" : 1001,
			})
	return actions

func doDomAction(_id, _actionInfo):
	if(_id == "stop"):
		var text = ""
		text += "{dom.You} {dom.youVerb('stop')} making {sub.you} rim you."
		endActivity()
		return {
			text = text,
		}
	if(_id == "forcerim"):
		var text = ""
		if(RNG.chance(30)):
			text += "{dom.You} {dom.youVerb('force')} {sub.you} to start rimming {dom.youHim}!"
			state = "rimming"
		else:
			domInfo.addAnger(0.05)
			text += "{dom.You} {dom.youVerb('try', 'tries')} to make {sub.you} rim {dom.youHim}."
		affectSub(subInfo.fetishScore({Fetish.RimmingGiving: 1.0})+0.0, 0.05, -0.1, -0.01)
		return {
			text = text,
		}
	if(_id == "moan"):
		var text = ""
		text = RNG.pick([
			"{dom.You} "+RNG.pick(["{dom.youVerb('let')} out a moan", "{dom.youVerb('moan')}", "{dom.youVerb('produce')} a moan", "{dom.youVerb('make')} a noise of pleasure"])+" while ",
		])
		if(getDom().isGagged()):
			text = RNG.pick([
				"{dom.You} "+RNG.pick(["{dom.youVerb('let')} out a muffled moan", "{dom.youVerb('try', 'tries')} to moan", "{dom.youVerb('produce')} a muffled moan", "{dom.youVerb('make')} a muffled noise of pleasure"])+" while ",
			])
		text += RNG.pick([
			"{sub.your} tongue is licking {dom.yourHis} "+getRandomAnusWord()+"!",
		])
		domInfo.addAnger(-0.02)
		subInfo.addLust(5)
		return {
			text = text,
		}
	if(_id == "cum"):
		var text = ""
		satisfyGoals()
		getDom().cumOnFloor()
		domInfo.cum()
		state = ""
		sendSexEvent(SexEvent.UniqueOrgasm, subID, domID, {orgasmType="rim"})
		if(true):
			return getGenericDomOrgasmData()
		return {
			text = text,
		}

func getSubActions():
	var actions = []
	if(state in ["", "rimming"]):
		actions.append({
			"id": "pullaway",
			"score": subInfo.getResistScore(),
			"name": "Pull away",
			"desc": "Try to pull away",
			"priority" : 0,
			"chance" : getSubResistChance(30.0, 25.0),
		})
	if(state in [""]):
		if((getDom().getFirstItemThatCoversBodypart(BodypartSlot.Anus) == null)):
			actions.append({
				"id": "startrim",
				"score": subInfo.getComplyScore() * subInfo.fetishScore({Fetish.RimmingGiving: 1.0}),
				"name": "Start rimming",
				"desc": "Start licking their butt",
				"priority" : 0,
			})
	if(state in ["", "rimming"]):
		if((!getSub().isBitingBlocked())):
			actions.append({
				"id": "bite",
				"score": subInfo.getResistScore() / 4.0,
				"name": "Bite!",
				"desc": "Bite their ass!",
				"priority" : 0,
				"chance" : getSubResistChance(60.0, 45.0),
			})
	if(state in ["rimming"]):
		actions.append({
			"id": "prod",
			"score": subInfo.getComplyScore() * subInfo.fetishScore({Fetish.RimmingGiving: 1.0}),
			"name": "Prod",
			"desc": "Try to slip your tongue deeper",
			"priority" : 0,
		})
	return actions

func doSubAction(_id, _actionInfo):
	if(_id == "pullaway"):
		var text = ""
		var domSay = null
		var subSay = null
		var successChance = getSubResistChance(30.0, 25.0)
		if(RNG.chance(successChance)):
			text = RNG.pick([
				"{sub.You} {sub.youVerb('pull')} away from {dom.you}.",
			])
			domInfo.addAnger(0.3)
			if(state != ""):
				state = ""
			else:
				endActivity()
		else:
			text = RNG.pick([
				"{sub.You} desperately {sub.youVerb('try', 'tries')} to pull away from {dom.your} butt.",
				"{sub.You} desperately {sub.youVerb('try', 'tries')} to pull away from {dom.your} ass.",
			])
			domInfo.addAnger(0.03)
		subSay = subReaction(SexReaction.Resisting, 50)
		return {
			text = text,
			domSay = domSay,
			subSay = subSay,
		}
	if(_id == "startrim"):
		var text = ""
		state = "rimming"
		affectDom(domInfo.fetishScore({Fetish.RimmingReceiving: 1.0})+0.0, 0.1, -0.1)
		affectSub(subInfo.fetishScore({Fetish.RimmingGiving: 1.0})+0.0, 0.1, -0.05, -0.01)
		text += RNG.pick([
			"{sub.You} {sub.youVerb('begin')} to eagerly rim {dom.yourHis} "+str(getRandomAnusWord())+".",
			"{sub.You} {sub.youVerb('lean')} in closer and {sub.youVerb('begin')} to lick {dom.yourHis} "+str(getRandomAnusWord())+".",
			"{sub.You} {sub.youVerb('begin')} to willingly rim {dom.yourHis} "+str(getRandomAnusWord())+"."
		])
		return {
			text = text,
		}
	if(_id == "prod"):
		var text = ""
		domInfo.stimulateArousalZone(0.04, BodypartSlot.Anus, 0.25)
		domInfo.addAnger(-0.03)
		text += RNG.pick([
			"{sub.You} willingly {sub.youVerb('thrust')} {sub.yourHis} tongue deeper into {dom.yourHis} "+str(getRandomAnusWord())+".",
			"{sub.You} willingly {sub.youVerb('slide')} {sub.yourHis} past {dom.yourHis} anal ring and {sub.youVerb('lap')} at the inner walls.",
			"{sub.You} eagerly {sub.youVerb('eat')} {dom.yourHis} "+str(getRandomAnusWord())+" out."
		])
		return {
			text = text,
		}
	if(_id == "bite"):
		var text = ""
		if(getSubResistChance(60.0, 45.0)):
			text = RNG.pick([
				"{sub.You} {sub.youVerb('bite')} {dom.your} ass! {dom.YouHe} {dom.youVerb('grunt')} painfully and {dom.youVerb('pull')} away.",
			])
			domInfo.addPain(5)
			sendSexEvent(SexEvent.PainInflicted, subID, domID, {pain=10,isDefense=true,intentional=true})
			domInfo.addAnger(1.0 - domInfo.fetishScore({Fetish.Masochism: 0.5}))
			domInfo.addLust(-5 + 10 * domInfo.fetishScore({Fetish.Masochism: 1.0}))
			if(state == ""):
				endActivity()
			state = ""
		else:
			text = RNG.pick([
				"{sub.You} {sub.youVerb('try', 'tries')} to bite {dom.you} but {dom.youHe} {dom.youVerb('avoid')} it!",
			])
			domInfo.addAnger(0.4)
		return {
			text = text,
		}

func getRandomAnusWord():
	return RNG.pick(["back entrance", "anus", "tailhole"])
	
func getSubResistChance(baseChance, domAngerRemoval):
	var theChance = baseChance - domInfo.getAngerScore()*domAngerRemoval
	if(getSub().hasBlockedHands()):
		theChance *= 0.5
	if(getSub().hasBoundArms()):
		theChance *= 0.5
	if(getSub().isBlindfolded()):
		theChance *= 0.8
	
	return max(theChance, 5.0)
	
func getDomOrgasmHandlePriority():
	return 10

func getSubOrgasmHandlePriority():
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
		return [StageScene.SexRimming, "tease", {pc=domID, npc=subID}]
	if(state == "rimming"):
		if(domInfo.isCloseToCumming()):
			return [StageScene.SexRimming, "fast", {pc=domID, npc=subID}]
		return [StageScene.SexRimming, "sex", {pc=domID, npc=subID}]
