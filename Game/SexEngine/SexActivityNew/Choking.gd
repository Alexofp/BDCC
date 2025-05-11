extends SexActivityBase

func _init():
	id = "Choking"
	
	activityName = "Choke"
	activityDesc = "Grab their throat and start choking them!"
	activityCategory = ["Violence"]

func getGoals():
	return {
		SexGoal.Choke: 1.0,
		SexGoal.ChokeSexVaginal: 1.0,
		SexGoal.ChokeSexAnal: 1.0,
		SexGoal.ChokeReceiveVaginal: 1.0,
		SexGoal.ChokeReceiveAnal: 1.0,
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
	if(_sexEngine.hasGoal(_domInfo, SexGoal.SubMakeUnconscious, _subInfo)):
		return 1.5
	return _domInfo.getIsAngryScore() * 1.0 * max(0.1, 0.1 + _domInfo.personalityScore({PersonalityStat.Mean: 1.0})) - _subInfo.getAboutToPassOutScore() * _domInfo.fetishScore({Fetish.UnconsciousSex: -1.0})

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return [SexActivityTag.HandsUsed, SexActivityTag.MouthUsed, SexActivityTag.HavingSex]
	if(_indx == SUB_0):
		return [SexActivityTag.PreventsSubTeasing, SexActivityTag.MouthUsed, SexActivityTag.HavingSex]
	return []

func startActivity(_args):
	addText("{dom.You} {dom.youVerb('put')} {dom.yourHis} hand on {sub.your} neck!")
	talk(DOM_0, SUB_0, SexReaction.AboutToBeatUp)
	if(RNG.chance(20)):
		talk(SUB_0, DOM_0, SexReaction.AboutToBeatUp)

func getExtraChokeText() -> String:
	var result:Array = []
	
	if(getSubInfo().isUnconscious()):
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
		if(getSubInfo().getConsciousness() < 0.4 && RNG.chance(50)):
			result.append(RNG.pick([
				"{sub.You} {sub.youAre} about to pass out!",
				"{sub.Your} gaze shakes from panic.",
				"{sub.You} {sub.youVerb('shiver')}, about to black out.",
				"{sub.You} {sub.youVerb('struggle')} to stay conscious.",
			]))
	
	if(result.size() > 0):
		return " "+Util.join(result, " ")
	return ""

func init_processTurn():
	addText("{dom.You} {dom.youVerb('hold')} {dom.yourHis} hand on {sub.your} neck.")

func choking_processTurn():
	choke(DOM_0, SUB_0, CHOKE_NORMAL)
	
	var texts = [
		"{dom.You} {dom.youVerb('choke')} {sub.youHim}.",
		"{dom.You} {dom.youVerb('choke')} {sub.youHim} violently.",
		"{dom.You} {dom.youVerb('choke')} {sub.yourHis} neck.",
		"{dom.You} {dom.youVerb('choke')} {sub.yourHis} throat.",
		"{dom.You} {dom.youVerb('choke')} {sub.youHim} helpless.",
		"{dom.You} {dom.youVerb('strangle')} {sub.yourHis} neck.",
		"{dom.You} {dom.youVerb('put')} pressure on {sub.yourHis} neck with {dom.yourHis} hands.",
	]

	var text:String = RNG.pick(texts)+getExtraChokeText()
	addText(text)
	if(RNG.chance(30)):
		talk(DOM_0, SUB_0, SexReaction.Choking)
	if(RNG.chance(30)):
		talk(SUB_0, DOM_0, SexReaction.Choking)
	
func hardchoking_processTurn():
	choke(DOM_0, SUB_0, CHOKE_HARD)
	
	var texts = [
		"{dom.You} {dom.youVerb('choke')} {sub.youHim} [b]hard[/b].",
		"{dom.You} {dom.youVerb('strangle')} {sub.youHim} [b]hard[/b].",
		"{dom.You} {dom.youVerb('put')} a lot of pressure on {sub.yourHis} throat.",
	]

	var text:String = RNG.pick(texts)+getExtraChokeText()
	addText(text)
	if(RNG.chance(30)):
		talk(DOM_0, SUB_0, SexReaction.ChokingHard)
	if(RNG.chance(30)):
		talk(SUB_0, DOM_0, SexReaction.ChokingHard)

func getActions(_indx:int):
	if(_indx == DOM_0):
		if(getState() in ["", "choking"]):
			addAction("startchoke", 1.0, "Choke harder", "Start choking them")
			
		var stopChokeScore:float = getStopChokeScore()
		if(getState() in ["choking", "hardchoking"] && !getSubInfo().isUnconscious()):
			addAction("lesschoke", stopChokeScore, "Choke less", "Loosen the grip")
		if(getState() == "" || getSubInfo().isUnconscious()):
			addAction("stop", getStopChokeScore(), "Stop choking", "Enough choking")

		if(getSub().hasReachableVagina() && (getDom().hasReachablePenis() || getDom().isWearingStrapon())):
			addAction("startvag", getDomInfo().goalsScore({SexGoal.ChokeSexVaginal: 0.3}, getSubID()), "+ Fuck Vaginal", "Start fucking their pussy at the same time", {A_CATEGORY: ["Fuck"]})
		if(getSub().hasReachableAnus() && (getDom().hasReachablePenis() || getDom().isWearingStrapon())):
			addAction("startanal", getDomInfo().goalsScore({SexGoal.ChokeSexAnal: 0.3}, getSubID()), "+ Fuck Anal", "Start fucking their ass at the same time", {A_CATEGORY: ["Fuck"]})

		if(getDom().hasReachableVagina() && (getSub().hasReachablePenis() || getSub().isWearingStrapon())):
			addAction("startridevag", getDomInfo().goalsScore({SexGoal.ChokeReceiveVaginal: 0.3}, getSubID()), "+ Ride Vaginal", "Ride their cock with your pussy at the same time", {A_CATEGORY: ["Fuck"]})
		if(getDom().hasReachableAnus() && (getSub().hasReachablePenis() || getSub().isWearingStrapon())):
			addAction("startrideanal", getDomInfo().goalsScore({SexGoal.ChokeReceiveAnal: 0.3}, getSubID()), "+ Ride Anal", "Ride their cock with your ass at the same time", {A_CATEGORY: ["Fuck"]})
	
	if(_indx == SUB_0):
		var escapeScore:float = 0.3 + getSubInfo().getResistScore() * 2.0 - getSubInfo().fetishScore({Fetish.Choking: 0.5})
		addAction("escape", escapeScore, "Escape choking", "Try to escape the choking", {A_CHANCE: getResistChance(SUB_0, DOM_0, RESIST_NECK_FOCUS, 20.0, 0.0)})


func doAction(_indx:int, _actionID:String, _action:Dictionary):
	if(_actionID == "startchoke"):
		if(state == ""):
			setState("choking")
			addText("{dom.You} {dom.youVerb('begin')} to actively choke {sub.you} out.")
		else:
			setState("hardchoking")
			addText("{dom.You} [b]{dom.youVerb('tighten')}[/b] {dom.yourHis} grip around {sub.your} throat.")
	if(_actionID == "lesschoke"):
		if(getState() == "hardchoking"):
			setState("choking")
			addText("{dom.You} {dom.youVerb('lessen')} {dom.yourHis} grip on {sub.your} neck.")
		else:
			setState("")
			addText("{dom.You} {dom.youVerb('stop')} actively choking {sub.you}.")
	if(_actionID == "stop"):
		satisfyGoal(SexGoal.Choke)
		endActivity()
		addText("{dom.You} {dom.youVerb('have', 'has')} stopped choking {sub.you} out.")
	
	if(_actionID == "startvag"):
		switchCurrentActivityTo("SexVaginalOnAllFours", ["choke"])
		addText("{dom.You} {dom.youVerb('raise')} {sub.yourHis} leg, preparing to fuck {sub.yourHis} {pussy}.")
	if(_actionID == "startanal"):
		switchCurrentActivityTo("SexAnalOnAllFours", ["choke"])
		addText("{dom.You} {dom.youVerb('raise')} {sub.yourHis} leg, preparing to fuck {sub.yourHis} {anus}.")
	if(_actionID == "startridevag"):
		switchCurrentActivityTo("DomRidingSubVaginal", ["choke"])
		addText("{dom.You} {dom.youVerb('pin')} {sub.you} to the floor, about to ride {sub.yourHis} {cock} with {dom.yourHis} {pussy}.")
	if(_actionID == "startrideanal"):
		switchCurrentActivityTo("DomRidingSubAnal", ["choke"])
		addText("{dom.You} {dom.youVerb('pin')} {sub.you} to the floor, about to ride {sub.yourHis} {cock} with {dom.yourHis} {ass}.")
		
	if(_actionID == "escape"):
		if(RNG.chance(getResistChance(SUB_0, DOM_0, RESIST_NECK_FOCUS, 20.0, 0.0))):
			if(getState() == ""):
				endActivity()
				failGoal(SexGoal.Choke)
			elif(getState() == "choking"):
				setState("")
			elif(getState() == "hardchoking"):
				setState("choking")
			
			addText("{sub.You} {sub.youVerb('manage')} to make {dom.youHim} relax {dom.yourHis} grasp on your neck!")
			talk(SUB_0, DOM_0, SexReaction.ActivelyResisting)
		else:
			addTextPick([
				"{sub.You} {sub.youVerb('try', 'tries')} to escape {dom.yourHis} grasp.",
				"{sub.You} desperately {sub.youVerb('try', 'tries')} to escape {dom.yourHis} grasp.",
				"{sub.You} desperately {sub.youVerb('try', 'tries')} to escape {dom.yourHis} choking.",
			])
			if(RNG.chance(30)):
				talk(SUB_0, DOM_0, SexReaction.ChokingHard)
		
func getStopChokeScore() -> float:
	var stopChokeScore:float = 1.0 - getDomInfo().getIsAngryScore() + getSubInfo().getAboutToPassOutScore() * getDomInfo().fetishScore({Fetish.UnconsciousSex: 1.0}, 0.5)
	if(getDomInfo().goalsScoreMax({SexGoal.Choke: 1.0}, getSubID()) > 0.0):
		stopChokeScore = getSubInfo().getAboutToPassOutScore() * getDomInfo().fetishScore({Fetish.UnconsciousSex: 1.0}, 0.5)
		if(getSubInfo().isUnconscious()):
			stopChokeScore = 0.5
	
	if(getDomInfo().goalsScoreMax({SexGoal.ChokeSexVaginal: 1.0, SexGoal.ChokeSexAnal: 1.0}, getSubID()) > 0.0):
		if(getDom().hasReachablePenis() || getDom().isWearingStrapon()):
			stopChokeScore = 0.0
	
	if(getDomInfo().goalsScoreMax({SexGoal.ChokeReceiveVaginal: 1.0, SexGoal.ChokeReceiveAnal: 1.0}, getSubID()) > 0.0):
		if(getSub().hasReachablePenis() || getSub().isWearingStrapon()):
			stopChokeScore = 0.0
	
	if(getSexEngine().hasGoal(getDomInfo(), SexGoal.SubMakeUnconscious, getSubInfo())):
		if(getSubInfo().isUnconscious()):
			stopChokeScore = 0.5
		else:
			stopChokeScore = 0.0
	return stopChokeScore

func getAnimationPriority():
	return 2

func getAnimation():
	if(getSexType() != SexType.DefaultSex):
		return null
	if(getState() == "hardchoking" || getSubInfo().isUnconscious()):
		return [StageScene.Choking, "hard", {pc=DOM_0, npc=SUB_0}]
	if(getState() == "choking"):
		return [StageScene.Choking, "choke", {pc=DOM_0, npc=SUB_0}]
	return [StageScene.Choking, "idle", {pc=DOM_0, npc=SUB_0}]
