extends SexActivityBase

var boredTimer = 0

func _init():
	id = "DomRimSub"

func getGoals():
	return {
		SexGoal.RimSub: 1.0,
	}

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(!(_subInfo.getChar().hasReachableAnus())):
		return false
	if(!(!_domInfo.getChar().isOralBlocked())):
		return false
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getVisibleName():
	return "Rim sub"

func getCategory():
	return ["Fuck"]

func getDomTags():
	return [SexActivityTag.MouthUsed, SexActivityTag.HavingSex]

func getSubTags():
	return [SexActivityTag.PreventsSubTeasing, SexActivityTag.HavingSex, SexActivityTag.AnusUsed]

func startActivity(_args):
	state = ""
	var text = ""
	var domSay = null
	var subSay = null
	text += RNG.pick([
		"{dom.You} {dom.youVerb('kneel')} behind {sub.you} and {dom.youVerb('spread')} {sub.yourHis} buttcheeks.",
		"{dom.You} {dom.youVerb('kneel')} behind {sub.you} and {dom.youVerb('prepare')} to rim {sub.yourHis} ass."
	])
	affectSub(subInfo.fetishScore({Fetish.RimmingReceiving: 1.0})+0.0, 0.1, 0.2, 0.0)
	domSay = domReaction(SexReaction.AboutToRimSub)
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
		return {
			text = text,
		}
	if(state == "rimming"):
		var text = ""
		affectDom(domInfo.fetishScore({Fetish.RimmingGiving: 0.5})+0.1, 0.1, 0.0)
		affectSub(subInfo.fetishScore({Fetish.RimmingReceiving: 1.0})+0.2, 0.1, -0.1, -0.01)
		subInfo.stimulateArousalZone(0.05, BodypartSlot.Anus, 0.5)
		text += RNG.pick([
			"{dom.You} {dom.youVerb('use')} {dom.yourHis} tongue to lap at {sub.yourHis} most intimate spot, delivering a mix of tantalizing licks and arousing kisses.",
			"{dom.Your} tongue laps at {sub.yourHis} "+str(getRandomAnusWord())+", creating a steady rhythm of pleasure.",
			"{dom.You} {dom.youVerb('rim')} {sub.yourHis} "+str(getRandomAnusWord())+".",
			"{dom.You} {dom.youVerb('lick')} and {dom.youVerb('lap')} at {sub.your} "+str(getRandomAnusWord())+", focusing on delivering consistent and pleasurable sensations."
		])
		boredTimer += 1
		if(boredTimer > 10 && RNG.chance(20) && !subInfo.isCloseToCumming()):
			satisfyGoals()
		return {
			text = text,
		}

func getDomActions():
	var actions = []
	if(state in ["", "rimming"]):
		actions.append({
			"id": "stop",
			"score": getStopScore(),
			"name": "Stop rimming",
			"desc": "Stop rimming",
			"priority" : 0,
		})
	if(state in [""]):
		if((getSub().getFirstItemThatCoversBodypart(BodypartSlot.Anus) == null)):
			actions.append({
				"id": "startRim",
				"score": 1.0,
				"name": "Start rimming",
				"desc": "Try to start rimming them",
				"priority" : 0,
			})
	if(state in ["rimming"]):
		actions.append({
			"id": "prod",
			"score": 0.2,
			"name": "Prod",
			"desc": "Try to slip your tongue deeper",
			"priority" : 0,
		})
	if(state in ["rimming"]):
		if((subInfo.isReadyToCum() && !subInfo.canDoActions() && isHandlingSubOrgasms())):
			actions.append({
				"id": "subcum",
				"score": 1.0,
				"name": "Sub orgasm",
				"desc": "Sub is cumming!",
				"priority" : 1001,
			})
	if(state in ["rimming"]):
		if((!getDom().isBitingBlocked())):
			actions.append({
				"id": "bite",
				"score": domInfo.getSadisticActionStore(),
				"name": "Bite",
				"desc": "Bite that asshole softly",
				"priority" : 0,
			})
	if(state in ["rimming"]):
		if((getDom().hasEffect(StatusEffect.HasCumInsideMouth)) && (getSub().getFirstItemThatCoversBodypart(BodypartSlot.Anus) == null) && (!getDom().isOralBlocked()) && (OPTIONS.isContentEnabled(ContentType.CumStealing))):
			actions.append({
				"id": "spitcum",
				"score": 0.05 + domInfo.fetishScore({Fetish.Breeding: 0.05}),
				"name": "Spit into anus",
				"desc": "Force some cum into their ass",
				"priority" : 0,
			})
	return actions

func doDomAction(_id, _actionInfo):
	if(_id == "stop"):
		var text = ""
		text += "{dom.You} {dom.youVerb('quit')} rimming {sub.you}."
		endActivity()
		return {
			text = text,
		}
	if(_id == "startRim"):
		var text = ""
		state = "rimming"
		affectSub(subInfo.fetishScore({Fetish.RimmingReceiving: 1.0})+0.0, 0.1, -0.3, -0.01)
		text += RNG.pick([
			"{dom.Your} tongue traces a daring path, teasingly circling the edge of {sub.your} "+str(getRandomAnusWord())+" before proceeding to lick with a hunger.",
			"{dom.You} {dom.youVerb('start')} to lick {sub.your} "+str(getRandomAnusWord())+" eagerly."
		])
		boredTimer = 0
		return {
			text = text,
		}
	if(_id == "prod"):
		var text = ""
		text += RNG.pick([
			"{dom.You} {dom.youVerb('thrust')} {dom.yourHis} tongue deeper into {sub.yourHis} "+str(getRandomAnusWord())+".",
			"{dom.You} {dom.youVerb('use')} {dom.yourHis} tongue to penetrate {sub.yourHis} "+str(getRandomAnusWord())+"."
		])
		if(getSub().hasPenis() && RNG.chance(50)):
			text += RNG.pick([
				" The tongue massages {sub.yourHis} prostate so well!",
				" {dom.YourHis} tongue is reaching {sub.yourHis} prostate and prods it!",
				" {dom.YourHis} tongue stimulates {sub.yourHis} prostate!"
			])
			subInfo.stimulateArousalZone(0.15, BodypartSlot.Anus, 0.5)
		else:
			subInfo.stimulateArousalZone(0.1, BodypartSlot.Anus, 0.5)
		if(getSub().hasVagina() && RNG.chance(20)):
			text += RNG.pick([
				" {dom.YourHis} tongue manages to massage {sub.yourHis} g-spot through the inner wall!",
				" {sub.YourHis} pussy becomes more wet, receiving some stimulation through the inner wall!"
			])
		if(getSub().hasEffect(StatusEffect.HasCumInsideAnus) && OPTIONS.isContentEnabled(ContentType.CumStealing)):
			if(RNG.chance(20)):
				if(getSub().bodypartTransferFluidsTo(BodypartSlot.Anus, domID, BodypartSlot.Head, 0.1, 20.0)):
					text += RNG.pick([ 
						" "+Util.capitalizeFirstLetter(getSub().getBodypartContentsStringList(BodypartSlot.Anus))+" lands on {dom.yourHis} tongue, leaking out of {sub.yourHis} "+RNG.pick(["", "used ", "stuffed "])+RNG.pick(["ass", "anus", "tailhole"])+" and [b]{dom.you} {dom.youVerb('swallow')} it[/b].",
					])
		return {
			text = text,
		}
	if(_id == "subcum"):
		var text = ""
		satisfyGoals()
		getSub().cumOnFloor(domID)
		subInfo.cum()
		state = ""
		sendSexEvent(SexEvent.UniqueOrgasm, domID, subID, {orgasmType="rim"})
		if(true):
			return getGenericSubOrgasmData()
		return {
			text = text,
		}
	if(_id == "bite"):
		var text = ""
		text += RNG.pick([
			"{dom.You} {dom.youVerb('nibble')} on {sub.your} "+str(getRandomAnusWord())+".",
			"{dom.You} softly {dom.youVerb('bite')} {sub.your} "+str(getRandomAnusWord())+".",
			"{dom.You} softly {dom.youVerb('bite')} {sub.your} "+str(getRandomAnusWord())+", sending shivers down {sub.yourHis} spine."
		])
		affectSub(subInfo.fetishScore({Fetish.Masochism: 1.0, Fetish.RimmingReceiving: 0.5})+0.0, 0.1, -0.1, -0.05)
		subInfo.addPain(2)
		sendSexEvent(SexEvent.PainInflicted, domID, subID, {pain=2,isDefense=false,intentional=true})
		return {
			text = text,
		}
	if(_id == "spitcum"):
		var text = ""
		var mixtureText = getDom().getBodypartContentsStringList(BodypartSlot.Head)
		text += "{dom.You} {dom.youVerb('press')} {dom.yourHis} lips against {sub.yourHis} "+str(getRandomAnusWord())+" and [b]{dom.youVerb('spit')} "+mixtureText+" into it[/b]!"
		var howMuch = getDom().bodypartTransferFluidsToAmount(BodypartSlot.Head, subID, BodypartSlot.Anus, 0.2, 20.0)
		affectSub(subInfo.fetishScore({Fetish.BeingBred: 1.0})-0.1, 0.02, -0.1, -0.05)
		sendSexEvent(SexEvent.HoleSpitted, domID, subID, {hole=BodypartSlot.Anus, loadSize=howMuch})
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
	if(state in ["rimming"]):
		actions.append({
			"id": "moan",
			"score": subInfo.getComplyScore()/3.0,
			"name": "Moan",
			"desc": "Show how much you like it",
			"priority" : 0,
		})
	if(state in ["rimming"]):
		if((subInfo.isReadyToCum() && isHandlingSubOrgasms())):
			actions.append({
				"id": "cum",
				"score": 1.0,
				"name": "Cum!",
				"desc": "You're about to cum and there is nothing you can do about it",
				"priority" : 1001,
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
				"{sub.You} desperately {sub.youVerb('try', 'tries')} to pull away from {dom.your} face.",
				"{sub.You} desperately {sub.youVerb('try', 'tries')} to pull {sub.yourHis} ass away from {dom.your} mouth.",
			])
			domInfo.addAnger(0.03)
		subSay = subReaction(SexReaction.Resisting, 50)
		return {
			text = text,
			domSay = domSay,
			subSay = subSay,
		}
	if(_id == "moan"):
		var text = ""
		text = RNG.pick([
			"{sub.You} "+RNG.pick(["{sub.youVerb('let')} out a moan", "{sub.youVerb('moan')}", "{sub.youVerb('produce')} a moan", "{sub.youVerb('make')} a noise of pleasure"])+" while ",
		])
		if(getSub().isGagged()):
			text = RNG.pick([
				"{sub.You} "+RNG.pick(["{sub.youVerb('let')} out a muffled moan", "{sub.youVerb('try', 'tries')} to moan", "{sub.youVerb('produce')} a muffled moan", "{sub.youVerb('make')} a muffled noise of pleasure"])+" while ",
			])
		text += RNG.pick([
			"{dom.your} tongue is licking {sub.yourHis} "+getRandomAnusWord()+"!",
		])
		domInfo.addAnger(-0.02)
		domInfo.addLust(5)
		return {
			text = text,
		}
	if(_id == "cum"):
		var text = ""
		satisfyGoals()
		getSub().cumOnFloor(domID)
		subInfo.cum()
		state = ""
		sendSexEvent(SexEvent.UniqueOrgasm, domID, subID, {orgasmType="rim"})
		if(true):
			return getGenericSubOrgasmData()
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
	if(getSexType() == SexType.SlutwallSex):
		theChance *= 0.5
	
	return max(theChance, 5.0)
	
func getDomOrgasmHandlePriority():
	return -1

func getSubOrgasmHandlePriority():
	return 10
	
func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		SexType.SlutwallSex: true,
	}

func saveData():
	var data = .saveData()

	data["boredTimer"] = boredTimer

	return data

func loadData(_data):
	.loadData(_data)

	boredTimer = SAVE.loadVar(_data, "boredTimer", 0)

func getAnimation():
	if(state == ""):
		if(getSexType() == SexType.SlutwallSex):
			return [StageScene.SlutwallSexOral, "tease", {pc=subID, npc=domID}]
		return [StageScene.SexRimming, "tease", {pc=subID, npc=domID}]
	if(state == "rimming"):
		if(getSexType() == SexType.SlutwallSex):
			return [StageScene.SlutwallSexOral, "lick", {pc=subID, npc=domID}]
		if(subInfo.isCloseToCumming()):
			return [StageScene.SexRimming, "fast", {pc=subID, npc=domID}]
		return [StageScene.SexRimming, "sex", {pc=subID, npc=domID}]
