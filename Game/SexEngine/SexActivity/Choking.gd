extends SexActivityBase

func _init():
	id = "Choking"

func getGoals():
	return {
		SexGoal.Choke: 1.0,
		SexGoal.ChokeSexVaginal: 1.0,
		SexGoal.ChokeSexAnal: 1.0,
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
	}

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(_sexEngine.hasGoal(_domInfo, SexGoal.SubChoking, _subInfo)):
		return 0.5
	if(_sexEngine.hasGoal(_domInfo, SexGoal.Choke, _subInfo)):
		return 0.0
	if(_subInfo.isUnconscious()):
		return -1.0
	return _domInfo.getIsAngryScore() * 1.0 * max(0.1, 0.1 + _domInfo.personalityScore({PersonalityStat.Mean: 1.0})) - _subInfo.getAboutToPassOutScore() * _domInfo.fetishScore({Fetish.UnconsciousSex: -1.0})

func getVisibleName():
	return "Choke"

func getCategory():
	return ["Violence"]

func getDomTags():
	return [SexActivityTag.HandsUsed, SexActivityTag.MouthUsed]

func getSubTags():
	return [SexActivityTag.PreventsSubTeasing, SexActivityTag.MouthUsed, SexActivityTag.HavingSex]

func startActivity(_args):
	state = ""
	
	return {
		text = "{dom.You} {dom.youVerb('put')} {dom.yourHis} hand on {sub.your} neck!",
		domSay = domReaction(SexReaction.AboutToBeatUp, 100),
		subSay = subReaction(SexReaction.AboutToBeatUp, 20),
	}

func getExtraChokeText():
	var result = []
	
	if(subInfo.isUnconscious()):
		result.append(RNG.pick([
			"{sub.Your} eyes are unresponsive.",
			"{sub.You} {sub.youAre} unresponsive.",
			"{sub.You} {sub.youVerb('do', 'does')} not respond much to the choking.",
			"{sub.You} {sub.youVerb('do', 'does')} not struggle at all.",
		]))
	else:
		if(RNG.chance(20)):
			result.append(RNG.pick([
				"{sub.You} {sub.youVerb('gasp')} for air.",
				"{sub.You} {sub.youVerb('gasp')} desperately for air.",
				"{sub.You} {sub.youVerb('try', 'tries')} to grab any air {sub.youHe} can.",
				"{sub.You} {sub.youVerb('struggle')} to breathe.",
			]))
		if(subInfo.getConsciousness() < 0.4 && RNG.chance(50)):
			result.append(RNG.pick([
				"{sub.You} {sub.youAre} about to pass out!",
				"{sub.Your} gaze shakes from panic.",
				"{sub.You} {sub.youVerb('shiver')}, about to black out.",
				"{sub.You} {sub.youVerb('struggle')} to stay conscious.",
			]))
	
	if(result.size() > 0):
		return " "+Util.join(result, " ")
	return ""

func processTurn():
	if(state == ""):
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('hold')} {dom.yourHis} hand on {sub.your} neck.",
		])
		
		return {
			text=text,
			#domSay = domReaction(SexReaction.Choking, 30),
			#subSay = subReaction(SexReaction.Choking, 30),
			}
	
	if(state == "choking"):
		subInfo.addFear(0.05)
		affectSub(subInfo.fetishScore({Fetish.Masochism: 1.0}, -0.5), 0.1, -0.2, 0.0)
		affectDom(domInfo.fetishScore({Fetish.Sadism: 0.5}, 0.5), 0.1, 0.0)
		subInfo.addConsciousness(-RNG.randf_range(0.01, 0.05))
		domInfo.addAnger(-0.05)
		
		var texts = [
			"{dom.You} {dom.youVerb('choke')} {sub.youHim}.",
			"{dom.You} {dom.youVerb('choke')} {sub.youHim} violently.",
			"{dom.You} {dom.youVerb('choke')} {sub.yourHis} neck.",
			"{dom.You} {dom.youVerb('choke')} {sub.yourHis} throat.",
			"{dom.You} {dom.youVerb('choke')} {sub.youHim} helpless.",
			"{dom.You} {dom.youVerb('strangle')} {sub.yourHis} neck.",
			"{dom.You} {dom.youVerb('put')} pressure on {sub.yourHis} neck with {dom.yourHis} hands.",
		]

		var text = RNG.pick(texts)+getExtraChokeText()
		
		return {
			text=text,
			domSay = domReaction(SexReaction.Choking, 30),
			subSay = subReaction(SexReaction.Choking, 30),
			}
	
	if(state == "hardchoking"):
		subInfo.addFear(0.1)
		affectSub(subInfo.fetishScore({Fetish.Masochism: 1.0}, -0.5), 0.1, -0.2, 0.0)
		affectDom(domInfo.fetishScore({Fetish.Sadism: 0.5}, 0.5), 0.1, 0.0)
		subInfo.addConsciousness(-RNG.randf_range(0.05, 0.2))
		domInfo.addAnger(-0.05)
		
		var texts = [
			"{dom.You} {dom.youVerb('choke')} {sub.youHim} [b]hard[/b].",
			"{dom.You} {dom.youVerb('strangle')} {sub.youHim} [b]hard[/b].",
			"{dom.You} {dom.youVerb('put')} a lot of pressure on {sub.yourHis} throat.",
		]

		var text = RNG.pick(texts)+getExtraChokeText()
		
		return {
			text=text,
			domSay = domReaction(SexReaction.ChokingHard, 30),
			subSay = subReaction(SexReaction.ChokingHard, 30),
			}
	
func getDomActions():
	var actions = []
	if(state in ["", "choking"]):
		actions.append({
				"id": "startchoke",
				"score": 1.0,
				"name": "Choke harder",
				"desc": "Start choking them",
			})
			
	var stopChokeScore = 1.0 - domInfo.getIsAngryScore() + subInfo.getAboutToPassOutScore() * domInfo.fetishScore({Fetish.UnconsciousSex: 1.0}, 0.5)
	if(domInfo.goalsScoreMax({SexGoal.Choke: 1.0}, subID)):
		stopChokeScore = subInfo.getAboutToPassOutScore() * domInfo.fetishScore({Fetish.UnconsciousSex: 1.0}, 0.5)
		if(subInfo.isUnconscious()):
			stopChokeScore = 0.5
	
	if(domInfo.goalsScoreMax({SexGoal.ChokeSexVaginal: 1.0, SexGoal.ChokeSexAnal: 1.0}, subID)):
		if(getDom().hasReachablePenis() || getDom().isWearingStrapon()):
			stopChokeScore = 0.0
	
	if(state in ["choking", "hardchoking"] && !subInfo.isUnconscious()):
		actions.append({
				"id": "lesschoke",
				"score": stopChokeScore,
				"name": "Choke less",
				"desc": "Loosen the grip",
			})
	if((state in [""]) || subInfo.isUnconscious()):
		actions.append({
				"id": "stop",
				"score": stopChokeScore,
				"name": "Stop choking",
				"desc": "Enough choking",
			})
	
	if(getSub().hasReachableVagina() && (getDom().hasReachablePenis() || getDom().isWearingStrapon())):
		actions.append({
				"id": "startvag",
				"score": domInfo.goalsScore({SexGoal.ChokeSexVaginal: 0.3}, subID),
				"name": "Choke + Vaginal",
				"desc": "Start fucking their pussy at the same time",
				"category": ["Fuck"],
			})
	if(getSub().hasReachableAnus() && (getDom().hasReachablePenis() || getDom().isWearingStrapon())):
		actions.append({
				"id": "startanal",
				"score": domInfo.goalsScore({SexGoal.ChokeSexAnal: 0.3}, subID),
				"name": "Choke + Anal",
				"desc": "Start fucking their ass at the same time",
				"category": ["Fuck"],
			})
			
	return actions

func doDomAction(_id, _actionInfo):
	if(_id == "startvag"):
		switchCurrentActivityTo("SexVaginalOnAllFours", ["choke"])
	
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('raise')} {sub.yourHis} leg, preparing to fuck {sub.yourHis} pussy.",
		])
		
		return {text = text}
	if(_id == "startanal"):
		switchCurrentActivityTo("SexAnalOnAllFours", ["choke"])
	
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('raise')} {sub.yourHis} leg, preparing to fuck {sub.yourHis} anus.",
		])
		
		return {text = text}
	
	if(_id == "startchoke"):
		if(state == ""):
			state = "choking"
			
			return {
				text = "{dom.You} {dom.youVerb('begin')} to actively choke {sub.you} out.",
			}
		else:
			state = "hardchoking"
			
			return {
				text = "{dom.You} [b]{dom.youVerb('tighten')}[/b] {dom.yourHis} grip around {sub.your} throat.",
			}
	if(_id == "lesschoke"):
		if(state == "hardchoking"):
			state = "choking"
			
			return {
				text = "{dom.You} {dom.youVerb('lessen')} {dom.yourHis} grip on {sub.your} neck.",
			}
		else:
			state = ""
			
			return {
				text = "{dom.You} {dom.youVerb('stop')} actively choking {sub.you}.",
			}
	
	if(_id == "stop"):
		endActivity()
		satisfyGoal(SexGoal.Choke)
		
		return {
			text = "{dom.You} {dom.youVerb('have', 'has')} stopped choking {sub.you} out.",
		}
	

func getSubResistChance():
	var defaultChance = 20.0
	if(getSub().hasBoundArms()):
		defaultChance *= 0.5
	if(getSub().hasBlockedHands()):
		defaultChance *= 0.5
	if(getSub().isBlindfolded()):
		defaultChance *= 0.8
	if(getSub().hasBoundLegs()):
		defaultChance *= 0.8
	if(state == ""):
		defaultChance *= 0.5
	if(getSexType() in [SexType.SlutwallSex, SexType.StocksSex]):
		defaultChance *= 0.5
	return defaultChance

func getSubActions():
	var actions = []
	
	actions.append({
		"id": "escape",
		"score": 0.3 + subInfo.getResistScore() * 2.0 - subInfo.fetishScore({Fetish.Choking: 0.5}),
		"name": "Escape choking",
		"desc": "Try to escape the choking",
		"chance": getSubResistChance(),
	})
	return actions

func doSubAction(_id, _actionInfo):
	if(_id == "escape"):
		if(RNG.chance(getSubResistChance())):
			if(state == ""):
				endActivity()
				satisfyGoal(SexGoal.Choke)
			elif(state == "choking"):
				state = ""
			elif(state == "hardchoking"):
				state = "choking"
			
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('manage')} to make {dom.youHim} relax {dom.yourHis} grasp on your neck!",
			])
			return {
				text = text,
				subSay=subReaction(SexReaction.ActivelyResisting),
			}
		else:
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('try', 'tries')} to escape {dom.yourHis} grasp.",
				"{sub.You} desperately {sub.youVerb('try', 'tries')} to escape {dom.yourHis} grasp.",
				"{sub.You} desperately {sub.youVerb('try', 'tries')} to escape {dom.yourHis} choking.",
			])
			return {
				text = text,
				subSay=subReaction(SexReaction.ChokingHard, 30),
			}

func getAnimationPriority():
	return 2

func getAnimation():
	if(getSexType() != SexType.DefaultSex):
		return null
	if(state == "hardchoking" || subInfo.isUnconscious()):
		return [StageScene.Choking, "hard", {pc=domID, npc=subID}]
	if(state == "choking"):
		return [StageScene.Choking, "choke", {pc=domID, npc=subID}]
	return [StageScene.Choking, "idle", {pc=domID, npc=subID}]
