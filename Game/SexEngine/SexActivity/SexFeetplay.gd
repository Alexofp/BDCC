extends SexActivityBase

var teasingTimes = 0
var didTeasing = false
var waitTimer = 0

func _init():
	id = "SexFeetplay"

func getGoals():
	return {
		SexGoal.DoFeetplay: 1.0,
	}

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getVisibleName():
	return "Feetplay"

func getCategory():
	return ["Humiliate"]

func getDomTags():
	return [SexActivityTag.HavingSex]

func getSubTags():
	return [SexActivityTag.PreventsSubTeasing, SexActivityTag.PreventsSubViolence, SexActivityTag.HavingSex, SexActivityTag.MouthUsed]

func startActivity(_args):
	state = ""
	var text = ""
	return {
		text = text,
	}

func onSwitchFrom(_otherActivity, _args):
	return .onSwitchFrom(_otherActivity, _args)

func processTurn():
	if(state == ""):
		var text = ""
		text += "{dom.You} {dom.youVerb('hold')} {sub.you} pinned to the floor with {dom.yourHis} foot."
		return {
			text = text,
		}
	if(state == "onhead"):
		var text = ""
		text += "{dom.You} {dom.youVerb('hold')} {dom.yourHis} foot on {sub.your} head."
		if(RNG.chance(50)):
			teasingTimes += 1
		affectSub(subInfo.fetishScore({Fetish.FeetplayReceiving: 1.0})+0.0, 0.02, -0.01, -0.005)
		return {
			text = text,
		}
	if(state == "kissingfeet"):
		var text = ""
		text += RNG.pick([
			"{sub.You} {sub.youAre} sucking on {dom.your} foot!",
			"{sub.You} {sub.youAre} licking {dom.your} foot.",
			"{sub.You} {sub.youAre} licking {dom.your} foot while it is in {sub.yourHis} mouth.",
			"{sub.You} {sub.youAre} idly sucking on {dom.your} toes while they are in {sub.yourHis} mouth.",
			"{sub.You} {sub.youAre} thrusting {sub.yourHis} tongue between {dom.your} toes."
		])
		affectDom(domInfo.fetishScore({Fetish.FeetplayGiving: 1.0})+0.3, 0.05, -0.01)
		affectSub(subInfo.fetishScore({Fetish.FeetplayReceiving: 1.0})+0.0, 0.05, -0.05, -0.02)
		domInfo.addArousalForeplay(0.05)
		teasingTimes += 1
		return {
			text = text,
		}
	if(state == "rubpussy"):
		var text = ""
		text += RNG.pick([
			"{dom.You} {dom.youVerb('use')} {dom.yourHis} toes to pleasure {sub.your} pussy.",
			"{dom.You} {dom.youVerb('rub')} {dom.yourHis} foot against {sub.your} pussy.",
			"{dom.You} {dom.youVerb('rub')} {sub.yourHis} pussy with {dom.yourHis} foot."
		])
		subInfo.addArousalSex(0.07)
		affectSub(subInfo.fetishScore({Fetish.FeetplayReceiving: 1.0})+0.3, 0.1, -0.005, -0.002)
		if(subInfo.isCloseToCumming() || RNG.chance(20)):
			text += RNG.pick([
				" {sub.YourHis} slit is making wet noises as it being pleasured.",
				" {sub.YourHis} wet pussy is twitching from being rubbed so much.",
				" {sub.YourHis} slit is dripping from being rubbed so much.",
				" {sub.YourHis} slit is coating {dom.your} toes with its juices."
			])
		if(subInfo.isCloseToCumming() && RNG.chance(50)):
			text += RNG.pick([
				" {sub.You} {sub.youAre} about to cum!",
				" {sub.You} can't hold back much longer!"
			])
		if(subInfo.isReadyToCum() && subInfo.isUnconscious()):
			satisfyGoals()
			getSub().cummedOnBy(subID, FluidSource.Vagina)
			if(getSub().hasReachablePenis() || getSub().isWearingChastityCage()):
				getSub().cummedOnBy(subID, FluidSource.Penis, 0.3)
			subInfo.cum()
			state = ""
			text += " {sub.Your} pussy is squirting all over {sub.yourHis} thighs as {sub.youHe} {sub.youVerb('orgasm')} in such a humiliating way!"
		return {
			text = text,
		}
	if(state == "rubpenis"):
		var text = ""
		text += RNG.pick([
			"{dom.You} {dom.youVerb('use')} {dom.yourHis} toes to pleasure {sub.your} cock.",
			"{dom.You} {dom.youVerb('rub')} {dom.yourHis} foot against {sub.your} shaft.",
			"{dom.You} {dom.youVerb('rub')} {sub.yourHis} dick with {dom.yourHis} foot.",
			"{dom.You} {dom.youVerb('pleasure')} {sub.yourHis} dick with {dom.yourHis} toes.",
			"{dom.You} {dom.youVerb('stroke')} {sub.yourHis} member with {dom.yourHis} foot."
		])
		subInfo.addArousalSex(0.07)
		affectSub(subInfo.fetishScore({Fetish.FeetplayReceiving: 1.0})+0.3, 0.1, -0.005, -0.002)
		if(subInfo.isCloseToCumming() || RNG.chance(20)):
			text += RNG.pick([
				" {sub.YourHis} cock is twitching as it being pleasured.",
				" {sub.YourHis} hard dick is throbbing from being rubbed so much.",
				" {sub.YourHis} member is dripping pre from being rubbed so much.",
				" {sub.YourHis} cock is coating {dom.your} toes with its precum."
			])
		if(subInfo.isCloseToCumming() && RNG.chance(50)):
			text += RNG.pick([
				" {sub.You} {sub.youAre} about to cum!",
				" {sub.You} can't hold back much longer!"
			])
		if(subInfo.isReadyToCum() && subInfo.isUnconscious()):
			satisfyGoals()
			getSub().cummedOnBy(subID, FluidSource.Penis)
			if(getSub().hasReachableVagina()):
				getSub().cummedOnBy(subID, FluidSource.Vagina, 0.3)
			subInfo.cum()
			state = ""
			text += " {sub.Your} cock is shooting {sub.cum} all over {sub.yourHis} belly as {sub.youHe} {sub.youVerb('orgasm')} in such a humiliating way!"
		return {
			text = text,
		}
	if(state == "onheadwaitingforanswer"):
		var text = ""
		text += "{dom.You} {dom.youVerb('hold')} {sub.you} pinned to the floor with {dom.yourHis} foot while waiting for {sub.youHim}."
		waitTimer += 1
		if(waitTimer > 4):
			state = "onhead"
			text += " {dom.You} gave up waiting."
		elif(waitTimer > 2):
			text += " {dom.You} {dom.youAre} losing patience."
			domInfo.addAnger(0.1)
		
		if(RNG.chance(50)):
			teasingTimes += 1
		return {
			text = text,
		}

func getDomActions():
	var actions = []
	if(state in [""]):
		actions.append({
			"id": "stompchest",
			"score": domInfo.getSadisticActionStore(),
			"name": "Stomp",
			"desc": "Stomp on their chest!",
			"priority" : 0,
		})
	if(state in [""]):
		actions.append({
			"id": "pinhead",
			"score": 1.0 - (float(didTeasing) * 1.0),
			"name": "Pin head",
			"desc": "Move your feet to their head",
			"priority" : 0,
		})
	if(state in [""]):
		if((getSub().hasReachableVagina())):
			actions.append({
				"id": "rubpussy",
				"score": 0.5,
				"name": "Rub pussy",
				"desc": "Start rubbing their pussy with your feet",
				"priority" : 0,
			})
	if(state in [""]):
		if((getSub().hasReachablePenis() || getSub().isWearingChastityCage())):
			actions.append({
				"id": "rubpenis",
				"score": 0.5,
				"name": "Rub penis",
				"desc": "Start rubbing their dick with your feet",
				"priority" : 0,
			})
	if(state in ["", "onhead", "kissingfeet", "rubpussy", "rubpenis", "onheadwaitingforanswer"]):
		actions.append({
			"id": "stop",
			"score": getStopScore(),
			"name": "Stop feetplay",
			"desc": "Change the description",
			"priority" : 0,
		})
	if(state in ["onhead", "kissingfeet", "rubpussy", "rubpenis", "onheadwaitingforanswer"]):
		actions.append({
			"id": "pinchest",
			"score": (1.0 if (state in ["onhead", "kissingfeet"] && teasingTimes > 5) else 0.0),
			"name": "Pin chest",
			"desc": "Back to pinning their chest",
			"priority" : 0,
		})
	if(state in ["onhead"]):
		if((!getSub().isOralBlocked())):
			actions.append({
				"id": "asktolick",
				"score": 0.3,
				"name": "Order to lick",
				"desc": "Order them to start sucking your feet",
				"priority" : 0,
			})
	if(state in ["rubpussy"]):
		actions.append({
			"id": "stomppussy",
			"score": domInfo.getSadisticActionStore(),
			"name": "Stomp on pussy",
			"desc": "Stomp on that wet pussy",
			"priority" : 0,
		})
	if(state in ["rubpenis"]):
		actions.append({
			"id": "stompcock",
			"score": domInfo.getSadisticActionStore(),
			"name": "Stomp on dick",
			"desc": "Make it really painful!",
			"priority" : 0,
		})
	return actions

func doDomAction(_id, _actionInfo):
	if(_id == "stompchest"):
		var text = ""
		var domSay = null
		var subSay = null
		affectSub(subInfo.fetishScore({Fetish.Masochism: 1.0})-0.5, 0.1, -0.05, 0.0)
		affectDom(domInfo.fetishScore({Fetish.Sadism: 1.0})+0.5, 0.2, 0.0)
		subInfo.addPain(RNG.randi_range(10, 20))
		domInfo.addAnger(-0.1)
		subInfo.addFear(0.2)
		if(RNG.chance(20)):
			getSub().doWound(domID)
		domSay = domReaction(SexReaction.BeatingUpHard)
		subSay = subReaction(SexReaction.BeatingUpHard, 40)
		text += RNG.pick([
			"{dom.You} {dom.youVerb('stomp')} on {sub.yourHis} chest [b]really hard[/b].",
			"{dom.You} {dom.youVerb('kick')} {sub.yourHis} sides [b]really hard[/b]."
		])
		return {
			text = text,
			domSay = domSay,
			subSay = subSay,
		}
	if(_id == "pinhead"):
		var text = ""
		state = "onhead"
		text += "{dom.You} {dom.youVerb('move')} {dom.yourHis} foot to {sub.you} head!"
		affectSub(subInfo.fetishScore({Fetish.FeetplayReceiving: 1.0})-0.1, 0.03, -0.05, -0.02)
		domInfo.addArousalForeplay(0.1)
		affectDom(domInfo.fetishScore({Fetish.FeetplayGiving: 1.0})+0.5, 0.1, 0.0)
		didTeasing = true
		return {
			text = text,
		}
	if(_id == "pinchest"):
		var text = ""
		state = ""
		text += "{dom.You} {dom.youVerb('pin')} {sub.your} chest!"
		return {
			text = text,
		}
	if(_id == "rubpussy"):
		var text = ""
		state = "rubpussy"
		text += "{dom.You} {dom.youVerb('move')} {dom.yourHis} foot to {sub.your} crotch and {dom.youVerb('begin')} rubbing {sub.yourHis} pussy!"
		subInfo.addArousalSex(0.05)
		affectSub(subInfo.fetishScore({Fetish.FeetplayReceiving: 1.0})+0.3, 0.1, -0.02, -0.01)
		return {
			text = text,
		}
	if(_id == "rubpenis"):
		var text = ""
		state = "rubpenis"
		text += "{dom.You} {dom.youVerb('move')} {dom.yourHis} foot down to {sub.your} crotch and {dom.youVerb('start')} rubbing {sub.yourHis} dick!"
		subInfo.addArousalSex(0.05)
		affectSub(subInfo.fetishScore({Fetish.FeetplayReceiving: 1.0})+0.3, 0.1, -0.02, -0.01)
		return {
			text = text,
		}
	if(_id == "asktolick"):
		var text = ""
		text += RNG.pick([
			"{dom.You} {dom.youVerb('order')} {sub.you} to start licking {dom.yourHis} foot!",
			"{dom.You} {dom.youVerb('order')} {sub.you} to start sucking {dom.yourHis} foot!",
			"{dom.You} {dom.youVerb('order')} {sub.you} to start worshipping {dom.yourHis} foot!"
		])
		state = "onheadwaitingforanswer"
		return {
			text = text,
		}
	if(_id == "stomppussy"):
		var text = ""
		affectDom(domInfo.fetishScore({Fetish.Sadism: 1.0})+0.0, 0.1, 0.0)
		affectSub(subInfo.fetishScore({Fetish.Masochism: 1.0})-0.5, 0.1, -0.01, 0.0)
		subInfo.addPain(RNG.randi_range(13, 25))
		domInfo.addAnger(-0.1)
		subInfo.addFear(0.3)
		if(RNG.chance(20)):
			getSub().doWound(domID)
		text += RNG.pick([
			"{dom.You} {dom.youVerb('stomp')} on {sub.yourHis} pussy firmly!",
			"{dom.You} {dom.youVerb('kick')} {sub.yourHis} pussy sadistically!",
			"{dom.You} {dom.youVerb('stomp')} on {sub.yourHis} pussy firmly, bringing an extreme amount of pain!"
		])
		return {
			text = text,
		}
	if(_id == "stompcock"):
		var text = ""
		affectDom(domInfo.fetishScore({Fetish.Sadism: 1.0})+0.0, 0.1, 0.0)
		affectSub(subInfo.fetishScore({Fetish.Masochism: 1.0})-0.5, 0.1, -0.01, 0.0)
		subInfo.addPain(RNG.randi_range(13, 25))
		domInfo.addAnger(-0.1)
		subInfo.addFear(0.3)
		if(RNG.chance(20)):
			getSub().doWound(domID)
		text += RNG.pick([
			"{dom.You} {dom.youVerb('stomp')} on {sub.yourHis} cock firmly!",
			"{dom.You} {dom.youVerb('kick')} {sub.yourHis} cock sadistically!",
			"{dom.You} {dom.youVerb('stomp')} on {sub.yourHis} balls, bringing an extreme amount of pain!"
		])
		return {
			text = text,
		}
	if(_id == "stop"):
		var text = ""
		endActivity()
		text += "{dom.You} {dom.youVerb('stop')} pinning {sub.you} with {dom.yourHis} foot."
		return {
			text = text,
		}

func getSubActions():
	var actions = []
	if(state in ["", "onhead", "kissingfeet", "rubpussy", "rubpenis", "onheadwaitingforanswer"]):
		actions.append({
			"id": "breakfree",
			"score": subInfo.getResistScore(),
			"name": "Break free",
			"desc": "You don't wanna be under their feet",
			"priority" : 0,
			"chance" : getSubResistChance(30.0, 25.0),
		})
	if(state in ["onhead"]):
		if((!getSub().isOralBlocked())):
			actions.append({
				"id": "licksoles",
				"score": subInfo.getComplyScore()/3.0,
				"name": "Lick soles",
				"desc": "Lick their soles",
				"priority" : 0,
			})
	if(state in ["kissingfeet"]):
		if((!getSub().isBitingBlocked())):
			actions.append({
				"id": "bitefeet",
				"score": subInfo.getResistScore(),
				"name": "Bite foot",
				"desc": "Bite the foot that is in your mouth",
				"priority" : 0,
				"chance" : getSubResistChance(50.0, 25.0),
			})
	if(state in ["rubpussy"]):
		if((subInfo.isReadyToCum() && isHandlingSubOrgasms())):
			actions.append({
				"id": "cumpussy",
				"score": 1.0,
				"name": "Cum!",
				"desc": "You are about to cum",
				"priority" : 1001,
			})
	if(state in ["rubpenis"]):
		if((subInfo.isReadyToCum() && isHandlingSubOrgasms())):
			actions.append({
				"id": "cumpenis",
				"score": 1.0,
				"name": "Cum!",
				"desc": "You are about to cum",
				"priority" : 1001,
			})
	if(state in ["onheadwaitingforanswer"]):
		actions.append({
			"id": "startsuck",
			"score": subInfo.getComplyScore(),
			"name": "Suck feet",
			"desc": "Let them shove their feet in your mouth",
			"priority" : 0,
		})
	return actions

func doSubAction(_id, _actionInfo):
	if(_id == "startsuck"):
		var text = ""
		text += "{sub.You} {sub.youVerb('open')} {sub.yourHis} mouth and start sucking on {dom.your} foot!"
		state = "kissingfeet"
		affectDom(domInfo.fetishScore({Fetish.FeetplayReceiving: 1.0})+0.1, 0.1, -0.05)
		return {
			text = text,
		}
	if(_id == "breakfree"):
		var text = ""
		var domSay = null
		var subSay = null
		if(RNG.chance(getSubResistChance(30.0, 25.0))):
			text += RNG.pick([
				"{sub.You} {sub.youVerb('escape')} {dom.your} pin!",
				"{sub.You} {sub.youVerb('manage')} to escape {dom.your} pin!",
				"{sub.You} {sub.youVerb('manage')} to break free from {dom.your} pin!"
			])
			domInfo.addAnger(0.3)
			if(state != ""):
				state = ""
			else:
				endActivity()
		else:
			text += "{sub.You} {sub.youVerb('try', 'tries')} to pull away from {dom.you} but {sub.youVerb('fail')}."
			domInfo.addAnger(0.1)
		subSay = subReaction(SexReaction.ActivelyResisting, 50)
		return {
			text = text,
			domSay = domSay,
			subSay = subSay,
		}
	if(_id == "bitefeet"):
		var text = ""
		var domSay = null
		var subSay = null
		if(RNG.chance(getSubResistChance(50.0, 25.0))):
			state = ""
			text += "{sub.You} {sub.youVerb('manage')} to bite {dom.your} foot hard!"
			domInfo.addPain(5)
			domInfo.addAnger(0.3)
		else:
			text += "{sub.You} {sub.youVerb('try', 'tries')} to bite {dom.yourHis} foot."
			domInfo.addAnger(0.1)
		subSay = subReaction(SexReaction.ActivelyResisting, 30)
		return {
			text = text,
			domSay = domSay,
			subSay = subSay,
		}
	if(_id == "licksoles"):
		var text = ""
		text += RNG.pick([
			"{sub.You} {sub.youVerb('lick')} {dom.yourHis} soles!",
			"{sub.You} {sub.youVerb('drag')} {sub.yourHis} tongue over {dom.yourHis} soles!",
			"{sub.You} {sub.youVerb('use')} {sub.yourHis} tongue to worship {dom.yourHis} soles!"
		])
		affectDom(domInfo.fetishScore({Fetish.FeetplayGiving: 1.0})+0.3, 0.1, -0.03)
		domInfo.addArousalForeplay(0.04)
		return {
			text = text,
		}
	if(_id == "cumpussy"):
		var text = ""
		satisfyGoals()
		getSub().cummedOnBy(subID, FluidSource.Vagina)
		if(getSub().hasReachablePenis() || getSub().isWearingChastityCage()):
			getSub().cummedOnBy(subID, FluidSource.Penis, 0.3)
		subInfo.cum()
		state = ""
		text += "{sub.Your} pussy is squirting all over {sub.yourHis} thighs as {sub.youHe} {sub.youVerb('orgasm')} in such a humiliating way!"
		return {
			text = text,
		}
	if(_id == "cumpenis"):
		var text = ""
		satisfyGoals()
		getSub().cummedOnBy(subID, FluidSource.Penis)
		if(getSub().hasReachableVagina()):
			getSub().cummedOnBy(subID, FluidSource.Vagina, 0.3)
		subInfo.cum()
		state = ""
		text += "{sub.Your} cock is shooting {sub.cum} all over {sub.yourHis} belly as {sub.youHe} {sub.youVerb('orgasm')} in such a humiliating way!"
		return {
			text = text,
		}

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
	return -1

func getSubOrgasmHandlePriority():
	return 10

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
		return [StageScene.SexFeetPlay, "pin", {pc=domID, npc=subID}]
	if(state == "onhead"):
		return [StageScene.SexFeetPlay, "head", {pc=domID, npc=subID}]
	if(state == "kissingfeet"):
		return [StageScene.SexFeetPlay, "head", {pc=domID, npc=subID}]
	if(state == "rubpussy"):
		return [StageScene.SexFeetPlay, "crotch", {pc=domID, npc=subID}]
	if(state == "rubpenis"):
		return [StageScene.SexFeetPlay, "crotch", {pc=domID, npc=subID}]
	if(state == "onheadwaitingforanswer"):
		return [StageScene.SexFeetPlay, "head", {pc=domID, npc=subID}]
