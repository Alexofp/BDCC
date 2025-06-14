extends SexActivityBase

var teasingTimes:int = 0
var didTeasing:bool = false
var waitTimer:int = 0

func _init():
	id = "SexFeetplay"
	
	activityName = "Feetplay"
	activityDesc = "Use your feet to pleasure them"
	activityCategory = ["Humiliate"]

func getGoals():
	return {
		SexGoal.DoFeetplay: 1.0,
	}

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return [SexActivityTag.HavingSex]
	if(_indx == SUB_0):
		return [SexActivityTag.PreventsSubTeasing, SexActivityTag.PreventsSubViolence, SexActivityTag.HavingSex, SexActivityTag.MouthUsed]
	return []

func startActivity(_args):
	pass

func init_processTurn():
	addText("{dom.You} {dom.youVerb('hold')} {sub.you} pinned to the floor with {dom.yourHis} foot.")

func onhead_processTurn():
	if(RNG.chance(50)):
		teasingTimes += 1
	stimulate(DOM_0, S_LEGS, SUB_0, S_MOUTH, I_TEASE, Fetish.FeetplayGiving, SPEED_SLOW)
	#affectSub(getSubInfo().fetishScore({Fetish.FeetplayReceiving: 1.0})+0.0, 0.02, -0.01, -0.005)
	addText("{dom.You} {dom.youVerb('hold')} {dom.yourHis} foot on {sub.your} head.")

func kissingfeet_processTurn():
	addTextPick([
		"{sub.You} {sub.youAre} sucking on {dom.your} foot!",
		"{sub.You} {sub.youAre} licking {dom.your} foot.",
		"{sub.You} {sub.youAre} licking {dom.your} foot while it is in {sub.yourHis} mouth.",
		"{sub.You} {sub.youAre} idly sucking on {dom.your} toes while they are in {sub.yourHis} mouth.",
		"{sub.You} {sub.youAre} thrusting {sub.yourHis} tongue between {dom.your} toes."
	])
	stimulate(DOM_0, S_LEGS, SUB_0, S_MOUTH, I_TEASE, Fetish.FeetplayGiving)
	#affectDom(getDomInfo().fetishScore({Fetish.FeetplayGiving: 1.0})+0.3, 0.05, -0.01)
	#affectSub(getSubInfo().fetishScore({Fetish.FeetplayReceiving: 1.0})+0.0, 0.05, -0.05, -0.02)
	#getDomInfo().addArousalForeplay(0.05)
	teasingTimes += 1
	react(SexReaction.FeetplayKissingFeet, [20, 10])

func rubpussy_processTurn():
	getSubInfo().stimulateArousalZone(0.1, BodypartSlot.Vagina, 0.5)
	affectSub(getSubInfo().fetishScore({Fetish.FeetplayReceiving: 1.0})+0.3, 0.1, -0.005, -0.002)
	rubWithFeet(DOM_0, SUB_0, S_VAGINA)
	
	if(isReadyToCum(SUB_0) && !getSubInfo().canDoActions()):
		satisfyGoals()
		getSub().cummedOnBy(getSubID(), FluidSource.Vagina)
		if(getSub().hasReachablePenis() || getSub().isWearingChastityCage()):
			getSub().cummedOnBy(getSubID(), FluidSource.Penis, 0.3)
		getSubInfo().cum()
		state = ""
		addText("{sub.Your} pussy is squirting all over {sub.yourHis} thighs as {sub.youHe} {sub.youVerb('orgasm')} in such a humiliating way!")
		sendSexEvent(SexEvent.UniqueOrgasm, DOM_0, SUB_0, {orgasmType=UniqueOrgasm.Feet})
	else:
		react(SexReaction.FeetplayRubbingPussy, [20, 10])

func rubpenis_processTurn():
	getSubInfo().stimulateArousalZone(0.1, BodypartSlot.Penis, 0.5)
	affectSub(getSubInfo().fetishScore({Fetish.FeetplayReceiving: 1.0})+0.3, 0.1, -0.005, -0.002)
	rubWithFeet(DOM_0, SUB_0, S_PENIS)
	
	if(getSubInfo().isReadyToCum() && !getSubInfo().canDoActions()):
		satisfyGoals()
		getSub().cummedOnBy(getSubID(), FluidSource.Penis)
		if(getSub().hasReachableVagina()):
			getSub().cummedOnBy(getSubID(), FluidSource.Vagina, 0.3)
		getSubInfo().cum()
		state = ""
		var howCumText = "is shooting {sub.cum} all over {sub.yourHis} belly"
		if(getSub().isWearingCondom()):
			howCumText = "is filling {sub.yourHis} condom full"
		if(getSub().getWornPenisPump() != null):
			howCumText = "is filling {sub.yourHis} penis pump full"
		addText("{sub.Your} cock "+howCumText+" as {sub.youHe} {sub.youVerb('orgasm')} in such a humiliating way!")
		sendSexEvent(SexEvent.UniqueOrgasm, DOM_0, SUB_0, {orgasmType=UniqueOrgasm.Feet})
	else:
		react(SexReaction.FeetplayRubbingPenis, [20, 10])

func onheadwaitingforanswer_processTurn():
	var text:String = "{dom.You} {dom.youVerb('hold')} {sub.you} pinned to the floor with {dom.yourHis} foot while waiting for {sub.youHim}."
	waitTimer += 1
	if(waitTimer > 4):
		state = "onhead"
		text += " {dom.You} gave up waiting."
	elif(waitTimer > 2):
		text += " {dom.You} {dom.youAre} losing patience."
		getDomInfo().addAnger(0.1)
	
	if(RNG.chance(50)):
		teasingTimes += 1
	addText(text)

func getActions(_indx:int):
	if(_indx == DOM_0):
		if(state in [""]):
			addAction("stompchest", getDomInfo().getSadisticActionStore(), "Stomp", "Stomp on their chest!")
		if(state in [""]):
			addAction("pinhead", 1.0 - (float(didTeasing) * 1.0), "Pin head", "Move your feet to their head")
		if(state in [""]):
			if(getSub().hasReachableVagina()):
				addAction("rubpussy", 0.5, "Rub pussy", "Start rubbing their pussy with your feet")
		if(state in [""]):
			if(getSub().hasReachablePenis() || getSub().isWearingChastityCage()):
				addAction("rubpenis", 0.5, "Rub penis", "Start rubbing their dick with your feet")
		if(state in ["", "onhead", "kissingfeet", "rubpussy", "rubpenis", "onheadwaitingforanswer"]):
			addAction("stop", getStopScore(), "Stop feetplay", "Enough humiliation")
		if(state in ["onhead", "kissingfeet", "rubpussy", "rubpenis", "onheadwaitingforanswer"]):
			var pinchestScore:float = (1.0 if (state in ["onhead", "kissingfeet"] && teasingTimes > 5) else 0.0)
			addAction("pinchest", pinchestScore, "Pin chest", "Back to pinning their chest")
		if(state in ["onhead"]):
			if(!getSub().isOralBlocked()):
				addAction("asktolick", 0.3, "Order to lick", "Order them to start sucking your feet")
		if(state in ["rubpussy"]):
			addAction("stomppussy", getDomInfo().getSadisticActionStore(), "Stomp on pussy", "Stomp on that wet pussy")
		if(state in ["rubpenis"]):
			addAction("stompcock", getDomInfo().getSadisticActionStore(), "Stomp on dick", "Make it really painful!")

	if(_indx == SUB_0):
		if(state in ["", "onhead", "kissingfeet", "rubpussy", "rubpenis", "onheadwaitingforanswer"]):
			addAction("breakfree", getResistScore(SUB_0), "Break free", "You don't wanna be under their feet", {A_CHANCE: getSubResistChance(30.0, 25.0)})
		if(state in ["onhead"]):
			if((!getSub().isOralBlocked())):
				addAction("licksoles", getComplyScore(SUB_0)/3.0, "Lick soles", "Lick their soles")
		if(state in ["kissingfeet"]):
			if((!getSub().isBitingBlocked())):
				addAction("bitefeet", getResistScore(SUB_0), "Bite foot", "Bite the foot that is in your mouth", {A_CHANCE: getSubResistChance(50.0, 25.0)})
		if(state in ["rubpussy"]):
			if(isReadyToCumHandled(SUB_0)):
				addAction("cumpussy", 1.0, "Cum!", "You are about to cum", {A_PRIORITY: 1001})
		if(state in ["rubpenis"]):
			if(isReadyToCumHandled(SUB_0)):
				addAction("cumpenis", 1.0, "Cum!", "You are about to cum", {A_PRIORITY: 1001})
		if(state in ["onheadwaitingforanswer"]):
			addAction("startsuck", getComplyScore(SUB_0), "Suck feet", "Let them shove their feet in your mouth")

func doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "stompchest"):
		affectSub(getSubInfo().fetishScore({Fetish.Masochism: 1.0})-0.5, 0.1, -0.05, 0.0)
		affectDom(getDomInfo().fetishScore({Fetish.Sadism: 1.0})+0.5, 0.2, 0.0)
		var howMuchAddPain = RNG.randi_range(10, 20)
		getSubInfo().addPain(howMuchAddPain)
		sendSexEvent(SexEvent.PainInflicted, DOM_0, SUB_0, {pain=howMuchAddPain,isDefense=false,intentional=true})
		getDomInfo().addAnger(-0.1)
		getSubInfo().addFear(0.2)
		if(RNG.chance(20)):
			getSub().doWound(getDomID())
		addTextPick([
			"{dom.You} {dom.youVerb('stomp')} on {sub.yourHis} chest [b]really hard[/b].",
			"{dom.You} {dom.youVerb('kick')} {sub.yourHis} sides [b]really hard[/b]."
		])
		react(SexReaction.FeetplayStompChest, [100.0, 40.0])
		return
	if(_id == "pinhead"):
		state = "onhead"
		addText("{dom.You} {dom.youVerb('move')} {dom.yourHis} foot to {sub.you} head!")
		affectSub(getSubInfo().fetishScore({Fetish.FeetplayReceiving: 1.0})-0.1, 0.03, -0.05, -0.02)
		getDomInfo().addArousalForeplay(0.1)
		affectDom(getDomInfo().fetishScore({Fetish.FeetplayGiving: 1.0})+0.5, 0.1, 0.0)
		didTeasing = true
		return
	if(_id == "pinchest"):
		state = ""
		addText("{dom.You} {dom.youVerb('pin')} {sub.your} chest!")
		return
	if(_id == "rubpussy"):
		state = "rubpussy"
		addText("{dom.You} {dom.youVerb('move')} {dom.yourHis} foot to {sub.your} crotch and {dom.youVerb('begin')} rubbing {sub.yourHis} pussy!")
		getSubInfo().addArousalForeplay(0.05)
		affectSub(getSubInfo().fetishScore({Fetish.FeetplayReceiving: 1.0})+0.3, 0.1, -0.02, -0.01)
		return
	if(_id == "rubpenis"):
		state = "rubpenis"
		addText("{dom.You} {dom.youVerb('move')} {dom.yourHis} foot down to {sub.your} crotch and {dom.youVerb('start')} rubbing {sub.yourHis} dick!")
		getSubInfo().addArousalForeplay(0.05)
		affectSub(getSubInfo().fetishScore({Fetish.FeetplayReceiving: 1.0})+0.3, 0.1, -0.02, -0.01)
		return
	if(_id == "asktolick"):
		addTextPick([
			"{dom.You} {dom.youVerb('order')} {sub.you} to start licking {dom.yourHis} foot!",
			"{dom.You} {dom.youVerb('order')} {sub.you} to start sucking {dom.yourHis} foot!",
			"{dom.You} {dom.youVerb('order')} {sub.you} to start worshipping {dom.yourHis} foot!"
		])
		state = "onheadwaitingforanswer"
		react(SexReaction.FeetplayAskToKiss, [100.0, 40.0])
		return
	if(_id == "stomppussy"):
		affectDom(getDomInfo().fetishScore({Fetish.Sadism: 1.0})+0.0, 0.1, 0.0)
		affectSub(getSubInfo().fetishScore({Fetish.Masochism: 1.0})-0.5, 0.1, -0.01, 0.0)
		var howMuchAddPain = RNG.randi_range(13, 25)
		getSubInfo().addPain(howMuchAddPain)
		sendSexEvent(SexEvent.PainInflicted, DOM_0, SUB_0, {pain=howMuchAddPain,isDefense=false,intentional=true})
		getDomInfo().addAnger(-0.1)
		getSubInfo().addFear(0.3)
		if(RNG.chance(20)):
			getSub().doWound(getDomID())
		addTextPick([
			"{dom.You} {dom.youVerb('stomp')} on {sub.yourHis} pussy firmly!",
			"{dom.You} {dom.youVerb('kick')} {sub.yourHis} pussy sadistically!",
			"{dom.You} {dom.youVerb('stomp')} on {sub.yourHis} pussy firmly, bringing an extreme amount of pain!"
		])
		react(SexReaction.FeetplayStompPussy, [100.0, 40.0])
		return
	if(_id == "stompcock"):
		affectDom(getDomInfo().fetishScore({Fetish.Sadism: 1.0})+0.0, 0.1, 0.0)
		affectSub(getSubInfo().fetishScore({Fetish.Masochism: 1.0})-0.5, 0.1, -0.01, 0.0)
		var howMuchAddPain = RNG.randi_range(13, 25)
		getSubInfo().addPain(howMuchAddPain)
		sendSexEvent(SexEvent.PainInflicted, DOM_0, SUB_0, {pain=howMuchAddPain,isDefense=false,intentional=true})
		getDomInfo().addAnger(-0.1)
		getSubInfo().addFear(0.3)
		if(RNG.chance(20)):
			getSub().doWound(getDomID())
		addTextPick([
			"{dom.You} {dom.youVerb('stomp')} on {sub.yourHis} cock firmly!",
			"{dom.You} {dom.youVerb('kick')} {sub.yourHis} cock sadistically!",
			"{dom.You} {dom.youVerb('stomp')} on {sub.yourHis} balls, bringing an extreme amount of pain!"
		])
		react(SexReaction.FeetplayStompPenis, [100.0, 40.0])
		return
	if(_id == "stop"):
		endActivity()
		addText("{dom.You} {dom.youVerb('stop')} pinning {sub.you} with {dom.yourHis} foot.")
		return

	if(_id == "startsuck"):
		addText("{sub.You} {sub.youVerb('open')} {sub.yourHis} mouth and start sucking on {dom.your} foot!")
		state = "kissingfeet"
		affectDom(getDomInfo().fetishScore({Fetish.FeetplayReceiving: 1.0})+0.1, 0.1, -0.05)
		reactSub(SexReaction.AgreeGeneric)
		return
	if(_id == "breakfree"):
		var text:String = ""
		if(RNG.chance(getSubResistChance(30.0, 25.0))):
			text += RNG.pick([
				"{sub.You} {sub.youVerb('escape')} {dom.your} pin!",
				"{sub.You} {sub.youVerb('manage')} to escape {dom.your} pin!",
				"{sub.You} {sub.youVerb('manage')} to break free from {dom.your} pin!"
			])
			getDomInfo().addAnger(0.3)
			if(state != ""):
				state = ""
			else:
				endActivity()
		else:
			text += "{sub.You} {sub.youVerb('try', 'tries')} to pull away from {dom.you} but {sub.youVerb('fail')}."
			getDomInfo().addAnger(0.1)
		addText(text)
		reactSub(SexReaction.ActivelyResisting, [50])
		return
	if(_id == "bitefeet"):
		var text:String = ""
		if(RNG.chance(getSubResistChance(50.0, 25.0))):
			state = ""
			text += "{sub.You} {sub.youVerb('manage')} to bite {dom.your} foot hard!"
			getDomInfo().addPain(5)
			sendSexEvent(SexEvent.PainInflicted, SUB_0, DOM_0, {pain=5,isDefense=true,intentional=true})
			getDomInfo().addAnger(0.3)
			react(SexReaction.PainGeneric)
		else:
			text += "{sub.You} {sub.youVerb('try', 'tries')} to bite {dom.yourHis} foot."
			getDomInfo().addAnger(0.1)
		addText(text)
		reactSub(SexReaction.ActivelyResisting, [50])
		return
	if(_id == "licksoles"):
		addTextPick([
			"{sub.You} {sub.youVerb('lick')} {dom.yourHis} soles!",
			"{sub.You} {sub.youVerb('drag')} {sub.yourHis} tongue over {dom.yourHis} soles!",
			"{sub.You} {sub.youVerb('use')} {sub.yourHis} tongue to worship {dom.yourHis} soles!"
		])
		affectDom(getDomInfo().fetishScore({Fetish.FeetplayGiving: 1.0})+0.3, 0.1, -0.03)
		getDomInfo().addArousalForeplay(0.04)
		return
	if(_id == "cumpussy"):
		satisfyGoals()
		getSub().cummedOnBy(getSubID(), FluidSource.Vagina)
		if(getSub().hasReachablePenis() || getSub().isWearingChastityCage()):
			getSub().cummedOnBy(getSubID(), FluidSource.Penis, 0.3)
		getSubInfo().cum()
		state = ""
		addText("{sub.Your} pussy is squirting all over {sub.yourHis} thighs as {sub.youHe} {sub.youVerb('orgasm')} in such a humiliating way!")
		sendSexEvent(SexEvent.UniqueOrgasm, DOM_0, SUB_0, {orgasmType=UniqueOrgasm.Feet})
		react(SexReaction.FeetplayCumPussy)
		return
	if(_id == "cumpenis"):
		satisfyGoals()
		getSub().cummedOnBy(getSubID(), FluidSource.Penis)
		if(getSub().hasReachableVagina()):
			getSub().cummedOnBy(getSubID(), FluidSource.Vagina, 0.3)
		getSubInfo().cum()
		state = ""
		var howCumText = "is shooting {sub.cum} all over {sub.yourHis} belly"
		if(getSub().isWearingCondom()):
			howCumText = "is filling {sub.yourHis} condom full"
		if(getSub().getWornPenisPump() != null):
			howCumText = "is filling {sub.yourHis} penis pump full"
		addText("{sub.Your} cock "+howCumText+" as {sub.youHe} {sub.youVerb('orgasm')} in such a humiliating way!")
		sendSexEvent(SexEvent.UniqueOrgasm, DOM_0, SUB_0, {orgasmType=UniqueOrgasm.Feet})
		react(SexReaction.FeetplayCumPenis)
		return

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
	if(_indx == SUB_0):
		return 10
	return -1

func saveData():
	var data = .saveData()

	data["teasingTimes"] = teasingTimes
	data["didTeasing"] = didTeasing
	data["waitTimer"] = waitTimer

	return data

func loadData(_data):
	.loadData(_data)

	teasingTimes = SAVE.loadVar(_data, "teasingTimes", 0)
	didTeasing = SAVE.loadVar(_data, "didTeasing", false)
	waitTimer = SAVE.loadVar(_data, "waitTimer", 0)

func getAnimation():
	if(state == ""):
		return [StageScene.SexFeetPlay, "pin", {pc=DOM_0, npc=SUB_0}]
	if(state == "onhead"):
		return [StageScene.SexFeetPlay, "head", {pc=DOM_0, npc=SUB_0}]
	if(state == "kissingfeet"):
		return [StageScene.SexFeetPlay, "head", {pc=DOM_0, npc=SUB_0}]
	if(state == "rubpussy"):
		return [StageScene.SexFeetPlay, "crotch", {pc=DOM_0, npc=SUB_0}]
	if(state == "rubpenis"):
		return [StageScene.SexFeetPlay, "crotch", {pc=DOM_0, npc=SUB_0}]
	if(state == "onheadwaitingforanswer"):
		return [StageScene.SexFeetPlay, "head", {pc=DOM_0, npc=SUB_0}]

func isActivityImpossibleShouldStop() -> bool:
	if(state == "rubpussy"):
		if(!getSub().hasReachableVagina()):
			return true
	if(state == "rubpenis"):
		if(!getSub().hasReachablePenis() && !getSub().isWearingChastityCage()):
			return true
	return false
