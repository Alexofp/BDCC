extends SexActivityBase
var times = 0
var gonnaCumOutside = false

func _init():
	id = "SexVaginalOnAllFours"

func getGoals():
	return {
		SexGoal.FuckVaginal: 1.0,
	}

func getVisibleName():
	return "On all fours"

func getCategory():
	return ["Fuck"]

func getDomTags():
	return [SexActivityTag.PenisUsed]

func getSubTags():
	return [SexActivityTag.VaginaUsed]

func startActivity(_args):
	state = ""
	
	return {
		text = "{dom.name} positions {dom.himself} behind {sub.your} butt with {dom.his} dick out.",
		domSay = domReaction(SexReaction.AboutToPenetratePussy, 50),
		subSay = subReaction(SexReaction.AboutToPenetratePussy, 50, {Fetish.VaginalSexReceiving: 1.0}),
	}

func processTurn():
	if(state == "fucking"):
		times += 1
		addDomLust(10, {Fetish.VaginalSexGiving: 1.0})
		addSubLust(10, {Fetish.VaginalSexReceiving: 1.0})
		
		domInfo.addArousalSex(0.2)
		subInfo.addArousalSex(0.2)

		var text = RNG.pick([
			"{dom.You} {dom.youAre} fucking {sub.youHim}.",
			"{dom.You} {dom.youVerb('pound')} {sub.your} pussy.",
			"{dom.You} {dom.youVerb('fuck')} {sub.your} pussy.",
		])
		
		if(subInfo.isReadyToCum()):
			subInfo.cum()
			text += RNG.pick([
				" An orgasm overwhelms {sub.your} body while {sub.you} {sub.youAre} being fucked.",
				" {sub.You} {sub.youVerb('cum')} from being fucked!",
			])
		
		if(domInfo.isCloseToCumming()):
			text += RNG.pick([
				" {dom.You} pants eagerly.",
				" {dom.You} closes in on {dom.yourHis} orgasm.",
				" {dom.You} {dom.youAre} gonna cum soon.",
				" {dom.Your} cock is throbbing.",
				" {dom.Your} cock is twitching and leaking a lot."
			])
		
		return {text=text}

	
func getDomActions():
	var actions = []
	if(state in [""]):
		actions.append({
			"id": "rub",
			"score": 1.0,
			"name": RNG.pick(["Rub", "Tease"]),
			"desc": "Rub your dick against their pussy",
		})
		if(domInfo.isReadyToPenetrate()):
			actions.append({
				"id": "insert",
				"score": 1.0,
				"name": RNG.pick(["Insert", "Penetrate"]),
				"desc": "Try to insert your cock into their pussy",
			})
		actions.append({
			"id": "stop",
			"score": getStopScore(),
			"name": RNG.pick(["Stop rubbing"]),
			"desc": "Stop fucking",
		})
	if(state in ["fucking"]):
		if(domInfo.isReadyToCum()):
			actions.append({
				"id": "cuminside",
				"score": 1.0 - 2.0*float(gonnaCumOutside),
				"name": RNG.pick(["Cum inside"]),
				"desc": "Cum inside their pussy",
			})
			actions.append({
				"id": "cumpullout",
				"score": 1.0,
				"name": RNG.pick(["Pull out"]),
				"desc": "Cum on their butt",
			})
	if(state in ["aftercumminginside"]):
		actions.append({
			"id": "continuefucking",
			"score": 1.0,
			"name": RNG.pick(["Continue fucking"]),
			"desc": "Continue fucking their pussy",
		})
	if(state in ["aftercumminginside", "fucking"]):
		if(!domInfo.isReadyToCum()):
			actions.append({
				"id": "pullout",
				"score": getStopScore(),
				"name": RNG.pick(["Pull out"]),
				"desc": "Pull your cock out and stop fucking them",
			})
	
	return actions

func doDomAction(_id, _actionInfo):
	if(_id == "rub"):
		addDomLust(10, {Fetish.VaginalSexGiving: 0.5})
		addSubLust(10, {Fetish.VaginalSexReceiving: 0.5})
		
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('rub')} {dom.yourHis} dick against {sub.your} pussy.",
		])
		return {text=text}
	if(_id == "insert"):
		if(RNG.chance(30)):
			var text = RNG.pick([
				"{dom.You} {dom.youVerb('attempt')} to sink {dom.yourHis} dick into {sub.your} pussy.",
				"{dom.You} {dom.youVerb('try','tries')} to penetrate {sub.your} pussy with {dom.yourHis} dick.",
				"{dom.You} {dom.youVerb('rub')} {dom.yourHis} dick against {sub.your} pussy, trying to sink it in.",
			])
			return {text = text}
		else:
			# Cock len vs Vagina depth check here
			if(!RNG.chance(getSub().getPenetrateChanceBy(BodypartSlot.Vagina, domID))):
				getSub().gotOrificeStretchedBy(BodypartSlot.Vagina, domID)
				var text = RNG.pick([
					"{dom.You} {dom.youVerb('try','tries')} cock stretches {sub.your} pussy out while trying to fit inside",
				])
				addDomLust(5, {Fetish.VaginalSexGiving: 0.3})
				addSubLust(5, {Fetish.VaginalSexReceiving: 0.3})
				return {text = text}
			else:
				gonnaCumOutside = false
				getSub().gotFuckedBy(BodypartSlot.Vagina, domID)
				state = "fucking"
				addDomLust(10, {Fetish.VaginalSexGiving: 1.0})
				addSubLust(10, {Fetish.VaginalSexReceiving: 1.0})
				domInfo.addArousalSex(0.1)
				subInfo.addArousalSex(0.1)
				var text = RNG.pick([
					"{dom.You} {dom.youVerb('manage','manages')} to penetrate {sub.your} pussy!",
					"{dom.You} {dom.youVerb('shove','shoves')} {dom.yourHis} cock inside {sub.your} pussy!",
				])
				return {text = text}
	if(_id == "cuminside"):
		getSub().cummedInVaginaBy(domID)
		domInfo.cum()
		subInfo.addArousalSex(0.2)
		satisfyGoals()
		state = "aftercumminginside"
		var text = RNG.pick([
			"{dom.You} came inside {sub.your} pussy!",
			"{dom.You} stuffed {sub.your} pussy full of {dom.your} seed!",
		])
		return {text=text}
	if(_id == "cumpullout"):
		getSub().cummedOnBy(domID)
		domInfo.cum()
		satisfyGoals()
		state = ""
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('pull')} {dom.your} cock out and cums all over {sub.your} butt!",
			"{dom.You} {dom.youVerb('pull')} out, cumming all over {sub.your} ass!",
		])
		return {text=text}
	if(_id == "continuefucking"):
		gonnaCumOutside = false
		state = "fucking"
		var text = RNG.pick([
			"{dom.You} began moving {dom.your} hips again, fucking {sub.your} pussy!",
			"{dom.You} went for a second round, fucking {sub.your} pussy again!",
		])
		return {text = text}
	if(_id == "pullout"):
		endActivity()
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('pull')} {dom.yourHis} cock out",
		])
		return {text = text}
	
	if(_id == "stop"):
		endActivity()
		return {text = "{dom.You} {dom.youVerb('stop')} the fuck"}
	

func getSubActions():
	var actions = []
	if(state == ""):
		actions.append({
				"id": "rub",
				"score": subFetishScore({Fetish.VaginalSexReceiving: 1.0}),
				"name": "Rub",
				"desc": "Rub your pussy against their cock",
			})
		actions.append({
				"id": "resist",
				"score": subInfo.getResistScore(),
				"name": RNG.pick(["Resist", "Struggle", "Kick"]),
				"desc": "Resist the attempts",
			})
		actions.append({
				"id": "envelop",
				"score": subFetishScore({Fetish.VaginalSexReceiving: 1.0}),
				"name": RNG.pick(["Envelop cock"]),
				"desc": "Try to get this cock inside you",
			})
	if(state in ["fucking"]):
		actions.append({
				"id": "moan",
				"score": subFetishScore({Fetish.VaginalSexReceiving: 1.0}) + subPersonalityScore({PersonalityStat.Subby: 1.0}),
				"name": "Moan",
				"desc": "Show how much you like it",
			})
		actions.append({
				"id": "resistduringfuck",
				"score": subFetishScore({Fetish.VaginalSexReceiving: -1.0}),
				"name": "Resist",
				"desc": "Try to stop them!",
			})
		if(domInfo.isCloseToCumming()):
			actions.append({
					"id": "begtopullout",
					"score": subFetishScore({Fetish.VaginalSexReceiving: -1.0}),
					"name": "Beg to pull out",
					"desc": "Ask them not to cum inside you",
				})
	return actions

func doSubAction(_id, _actionInfo):
	if(_id == "rub"):
		#switchCurrentActivityTo("SexFuckTest2")
		domInfo.addAnger(-0.05)
		addDomLust(10, {Fetish.VaginalSexGiving: 1.0})
		addSubLust(10, {Fetish.VaginalSexReceiving: 1.0})
		domInfo.addArousalForeplay(0.05)
		subInfo.addArousalForeplay(0.05)
		
		return {text = "{sub.You} {sub.youVerb('rub')} against {dom.youHim}.",}
	if(_id == "envelop"):
		if(!RNG.chance(getSub().getPenetrateChanceBy(BodypartSlot.Vagina, domID))):
			getSub().gotOrificeStretchedBy(BodypartSlot.Vagina, domID)
			domInfo.addAnger(-0.05)
			addDomLust(20, {Fetish.VaginalSexGiving: 1.0})
			addSubLust(20, {Fetish.VaginalSexReceiving: 1.0})
			domInfo.addArousalForeplay(0.05)
			subInfo.addArousalForeplay(0.05)
			return {text="{sub.You} {sub.youVerb('try', 'tries')} to engulf {dom.yourHis} cock but it's too big!"}
		
		domInfo.addAnger(-0.05)
		addDomLust(20, {Fetish.VaginalSexGiving: 1.0})
		addSubLust(20, {Fetish.VaginalSexReceiving: 1.0})
		domInfo.addArousalForeplay(0.05)
		subInfo.addArousalForeplay(0.05)
		
		getSub().gotFuckedBy(BodypartSlot.Vagina, domID)
		gonnaCumOutside = false
		state = "fucking"
		return {text = "{sub.You} {sub.youVerb('engulf')} {dom.youHis} cock, letting it penetrate {sub.yourHis} pussy."}
	if(_id == "resist"):
		domInfo.addAnger(0.2)
		domInfo.addPain(40)
		if(RNG.chance(20)):
			endActivity()
			return {text = "{sub.You} {sub.youVerb('manage')} to kick {dom.you} off of {sub.youHim}."}
		else:
			return {text = "{sub.You} {sub.youVerb('resist')} attempts to penetrate {sub.youHis} pussy."}
	if(_id == "moan"):
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('moan')} while being fucked!",
			"{sub.You} {sub.youVerb('moan')} while having {dom.yourHis} pussy used!",
			"{sub.You} {sub.youVerb('moan')} eagerly!",
		])
		
		return {text = text}
	if(_id == "resistduringfuck"):
		
		if(RNG.chance(20)):
			domInfo.addAnger(0.2)
			
			state = ""
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('strugle')} enough for {dom.youHim} to pull out!",
			])
			return {text = text}
		else:
			domInfo.addAnger(0.1)
			
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('try', 'tries')} to resist while being fucked!",
				"{sub.You} {sub.youVerb('try', 'tries')} to resist while having {dom.yourHis} pussy used!",
				"{sub.You} {sub.youVerb('try', 'tries')} to make {dom.youHim} pull out!",
			])
			
			return {text = text}
		
	if(_id == "begtopullout"):
		domInfo.addAnger(-0.02)
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('beg')} {dom.youHim} not to cum inside.",
			"{sub.You} {sub.youVerb('beg')} {dom.youHim} to pull out.",
		])
		
		if(RNG.chance(10) && !getDom().isPlayer()):
			gonnaCumOutside = true
			text += " {dom.you} listened!"
		
		return {text = text}

func getAnimation():
	return [StageScene.Duo, "allfours", {pc=subID, npc=domID, npcAction="kneel", flipPc=true}]
