extends Reference
class_name SexActivityBase

var id = "error"
var uniqueID = 0
var domID = null
var subID = null
var domInfo: SexDomInfo
var subInfo: SexSubInfo

var hasEnded = false
var sexEngineRef: WeakRef
var startedByDom = true
var startedBySub = false

var state:String = ""

func getVisibleName():
	return id

func getCategory():
	return []

func getSexEngine() -> SexEngine:
	if(sexEngineRef == null):
		return null
	return sexEngineRef.get_ref()

func getSub() -> BaseCharacter:
	return GlobalRegistry.getCharacter(subID)

func getDom() -> BaseCharacter:
	return GlobalRegistry.getCharacter(domID)

func initParticipants(theDomID, theSubID):
	domID = theDomID
	subID = theSubID
	
	domInfo = getSexEngine().getDomInfo(domID)
	subInfo = getSexEngine().getSubInfo(subID)

func clearSexEngineRefAndParticipants():
	sexEngineRef = null
	domID = null
	subID = null
	domInfo = null
	subInfo = null

func endActivity():
	if(!hasEnded):
		hasEnded = true
		onActivityEnd()
	
	hasEnded = true

func onActivityEnd():
	pass

func getGoals():
	return {}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
	}

func getSexType():
	return getSexEngine().getSexTypeID()

func satisfyGoals():
	var goalData = getGoals()
	var sexEngine = getSexEngine()
	
	for goalID in goalData:
		sexEngine.satisfyGoal(domInfo, goalID, subInfo)

func satisfyGoal(goalID):
	var sexEngine = getSexEngine()
	sexEngine.satisfyGoal(domInfo, goalID, subInfo)

func replaceGoalsTo(newgoalID, replaceAll = true):
	var goalData = getGoals()
	var sexEngine = getSexEngine()
	
	for goalID in goalData:
		sexEngine.replaceGoal(domInfo, goalID, subInfo, newgoalID, replaceAll)

func progressGoal(goalid, args = []):
	return getSexEngine().progressGoal(domInfo, goalid, subInfo, args)

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return tagsNotBusy(_sexEngine, _domInfo, _subInfo) && !hasActivity(_sexEngine, id, _domInfo, _subInfo)

func getStartActions(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return [{
		name = getVisibleName(),
		args = [],
		score = getActivityScore(_sexEngine, _domInfo, _subInfo),
		category = getCategory(),
	}]

func canBeStartedByDom():
	return startedByDom
	
func canBeStartedBySub():
	return startedBySub

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return 0.0

func getActivityScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	#print(id," ",getActivityScoreCustomGoals(getGoals(), _sexEngine, _domInfo, _subInfo))
	return getActivityScoreCustomGoals(getGoals(), _sexEngine, _domInfo, _subInfo)

func getActivityScoreCustomGoals(goalData, _sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var resultScore = getActivityBaseScore(_sexEngine, _domInfo, _subInfo)
	var addToScore = 0.0
	
	for goalID in goalData:
		#if(_sexEngine.hasGoal(_domInfo, goalID, _subInfo)):
		addToScore = max(addToScore, goalData[goalID] * _sexEngine.hasGoalScore(_domInfo, goalID, _subInfo))

	return (resultScore + addToScore) * getActivityScoreMult(_sexEngine, _domInfo, _subInfo)

func getActivityScoreMult(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return 1.0

func getActivityScoreSub(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return getActivityBaseScore(_sexEngine, _domInfo, _subInfo)

func getStopScore(stopscore = 2.0, alwaysstopscore = 0.0):
	var sexEngine = getSexEngine()
	
	var activityScore = getActivityScore(sexEngine, sexEngine.getDomInfo(domID), sexEngine.getSubInfo(subID))
	
	if(activityScore > 0.0):
		return alwaysstopscore
	return stopscore

func hasActivity(_sexEngine: SexEngine, theid, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return _sexEngine.hasActivity(theid, _domInfo.charID, _subInfo.charID)

func tagsNotBusy(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var domTags = getDomTagsCheck()
	for tag in domTags:
		if(_sexEngine.hasTag(_domInfo.charID, tag)):
			return false
			
	var subTags = getSubTagsCheck()
	for tag in subTags:
		if(_sexEngine.hasTag(_subInfo.charID, tag)):
			return false
	
	return true

func startActivity(_args):
	return {
		text = str(id)+" HAS STARTED",
	}

func onSwitchFrom(_otherActivity, _args):
	return {
		text = str(id)+" HAS STARTED BY BEING SWITCHED FROM "+str(_otherActivity.id)
	}

func switchCurrentActivityTo(newactivityID, _args = []):
	getSexEngine().switchActivity(self, newactivityID, _args)

func getDomTags():
	return []

func getSubTags():
	return []

func getDomTagsCheck():
	return getDomTags()

func getSubTagsCheck():
	return getSubTags()

func processTurn():
	return {
		text = str(id)+" IS STILL HAPPENING.",
	}

func reactActivityEnd(_otheractivity):
	return null

func getDomActions():
	return []

func doDomAction(_id, _actionInfo):
	return {
		"text": "Bad stuff happened",
	}
	
func getSubActions():
	return []

func doSubAction(_id, _actionInfo):
	return {
		"text": "Sub bad stuff happened",
	}

func domFetishScore(fetishes = {}):
	var fetishHolder: FetishHolder = getDom().getFetishHolder()
	
	var result = 0.0
	for fetishID in fetishes:
		var fetishValue = fetishHolder.getFetishValue(fetishID)
		result += fetishValue * fetishes[fetishID]
	
	return result
	
func subFetishScore(fetishes = {}):
	var fetishHolder: FetishHolder = getSub().getFetishHolder()
	
	var result = 0.0
	for fetishID in fetishes:
		var fetishValue = fetishHolder.getFetishValue(fetishID)
		result += fetishValue * fetishes[fetishID]
	
	return result

func domPersonalityScore(personalityStats = {}):
	var personality: Personality = getDom().getPersonality()
	
	var result = 0.0
	for personalityStatID in personalityStats:
		var personalityValue = personality.getStat(personalityStatID)
		result += personalityValue * personalityStats[personalityStatID]
	
	return result

func subPersonalityScore(personalityStats = {}):
	var personality: Personality = getSub().getPersonality()
	
	var result = 0.0
	for personalityStatID in personalityStats:
		var personalityValue = personality.getStat(personalityStatID)
		result += personalityValue * personalityStats[personalityStatID]
	
	return result

func addDomLust(howmuch, fetishes = {}):
	getDom().addLust(howmuch * (1.0 + domFetishScore(fetishes)))
		
func addSubLust(howmuch, fetishes = {}):
	getSub().addLust(howmuch * (1.0 + subFetishScore(fetishes)))
		
func getSubLikingItScore():
	return getSub().getLustLevel()

func getSubHatingItScore():
	return 1.0 - getSub().getLustLevel()

func subReaction(reactionID, chance = 100):
	if(subInfo.isUnconscious()):
		return null
	
	if(chance >= 100 || RNG.chance(chance)):
		return getSub().getVoice().getSubReaction(reactionID, getSexEngine(), domInfo, subInfo)

func domReaction(reactionID, chance = 100):
	if(subInfo.isUnconscious()):
		return null
	
	if(chance >= 100 || RNG.chance(chance)):
		return getDom().getVoice().getDomReaction(reactionID, getSexEngine(), domInfo, subInfo)

func getAnimationPriority():
	return 10

func getAnimation():
	return null

func affectSub(howmuch:float, lustMod, resistanceMod, fearMod):
	if(lustMod != 0.0):
		getSub().addLust(int(round(howmuch * lustMod * 100.0)))
	if(resistanceMod != 0.0):
		subInfo.addResistance(howmuch * resistanceMod)
	if(fearMod != 0.0):
		subInfo.addFear(max(howmuch * fearMod, 0.01))

func affectDom(howmuch:float, lustMod, angerMod):
	if(lustMod != 0.0):
		getDom().addLust(int(round(howmuch * lustMod * 100.0)))
	if(angerMod != 0.0):
		domInfo.addAnger(howmuch * angerMod)

func getDomOrgasmHandlePriority():
	return -1

func getSubOrgasmHandlePriority():
	return -1

func isHandlingSubOrgasms():
	return getSubOrgasmHandlePriority() >= getSexEngine().getCurrentActivitiesMaxSubOrgasmHandlePriority(domID, subID)

func isHandlingDomOrgasms():
	return getDomOrgasmHandlePriority() >= getSexEngine().getCurrentActivitiesMaxDomOrgasmHandlePriority(domID, subID)

func getGenericOrgasmData(isSub, extraText = ""):
	var character
	if(isSub):
		character = getSub()
	else:
		character = getDom()
	var text = RNG.pick([
		"A [b]powerful orgasm[/b] overwhelms {<ORGASMER>.your} body"+str(extraText)+".",
		"[b]{<ORGASMER>.You} {<ORGASMER>.youVerb('cum')}[/b] hard"+str(extraText)+"!",
	])
	
	if(character.hasPenis()):
		if(character.isWearingChastityCage()):
			text += RNG.pick([
				" {<ORGASMER>.YourHis} "+RNG.pick(["cock", "dick", "member"])+" wastes its load through the tight chastity cage!",
				" {<ORGASMER>.YourHis} "+RNG.pick(["cock", "dick", "member"])+" shoots out a weak load through the hole in the chastity cage!",
				" {<ORGASMER>.YourHis} "+RNG.pick(["cock", "dick", "member"])+" throbs inside the locked chastity cage and wastes its seed!",
			])
		else:
			text += RNG.pick([
				" {<ORGASMER>.YourHis} "+RNG.pick(["cock", "dick", "member"])+" wastes its load!",
				" {<ORGASMER>.YourHis} "+RNG.pick(["cock", "dick", "member"])+" shoots out a load!",
				" {<ORGASMER>.YourHis} "+RNG.pick(["cock", "dick", "member"])+" throbs while wasting its seed!",
			])
	if(character.hasVagina()):
		text += RNG.pick([
			" {<ORGASMER>.YourHis} "+RNG.pick(["pussy", "slit"])+" gets tight!",
			" {<ORGASMER>.YourHis} "+RNG.pick(["pussy", "slit"])+" clenches and twitches!",
			" {<ORGASMER>.YourHis} "+RNG.pick(["pussy", "slit"])+" pulsates irregularly!",
			" {<ORGASMER>.YourHis} "+RNG.pick(["pussy", "slit"])+" squirts!",
		])
	
	if(isSub):
		text = text.replace("<ORGASMER>", "sub")
	else:
		text = text.replace("<ORGASMER>", "dom")
	
	return {
		text = text,
	}

func getGenericSubOrgasmData(extraText = ""):
	return getGenericOrgasmData(true, extraText)

func getGenericDomOrgasmData(extraText = ""):
	return getGenericOrgasmData(false, extraText)

func applyTallymarkIfNeededData(bodypartSlot):
	#if(getDom().isPlayer()):
	#	return null
	
	var chanceToAdd = 0.0
	if(getSub().hasTallymarks() || getSexType() in [SexType.SlutwallSex, SexType.StocksSex]):
		chanceToAdd = 100.0
	else:
		chanceToAdd = (max(0.0, domInfo.fetishScore({Fetish.Bodywritings: 1.0})) + domInfo.personalityScore({PersonalityStat.Mean: 0.3})) * 100.0
		if(!domInfo.isAngry()):
			chanceToAdd *= 0.5
	
	if(!RNG.chance(chanceToAdd)):
		return null
	
	var theZone = null
	if(bodypartSlot == BodypartSlot.Head):
		theZone = getSub().addTallymarkFace()
	elif(bodypartSlot == BodypartSlot.Vagina):
		theZone = getSub().addTallymarkCrotch()
	else:
		theZone = getSub().addTallymarkButt()
	var zoneText = "body"
	if(theZone != null && theZone is int):
		zoneText = BodyWritingsZone.getZoneVisibleName(theZone)
	
	var text = RNG.pick([
		"{dom.You} "+RNG.pick(["{dom.youVerb('draw')}"])+" a [b]tallymark[/b] on {sub.your} "+zoneText+".",
		"{dom.You} "+RNG.pick(["{dom.youVerb('add')}"])+" a [b]tallymark[/b] to {sub.your} "+zoneText+".",
	])
	
	return {
		text = text,
	}

func saveData():
	var data = {
		"uniqueID": uniqueID,
		"domID": domID,
		"subID": subID,
		"hasEnded": hasEnded,
		"state": state,
	}

	return data
	
func loadData(data):
	uniqueID = SAVE.loadVar(data, "uniqueID", 0)
	domID = SAVE.loadVar(data, "domID", "")
	subID = SAVE.loadVar(data, "subID", "")
	hasEnded = SAVE.loadVar(data, "hasEnded", false)
	state = SAVE.loadVar(data, "state", "")
	
	domInfo = getSexEngine().getDomInfo(domID)
	subInfo = getSexEngine().getSubInfo(subID)
