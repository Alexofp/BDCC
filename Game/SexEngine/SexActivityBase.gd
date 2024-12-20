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

func failGoals():
	var goalData = getGoals()
	var sexEngine = getSexEngine()
	
	for goalID in goalData:
		sexEngine.failGoal(domInfo, goalID, subInfo)

func failGoal(goalID):
	var sexEngine = getSexEngine()
	sexEngine.failGoal(domInfo, goalID, subInfo)

func replaceGoalsTo(newgoalID, replaceAll = true):
	var goalData = getGoals()
	var sexEngine = getSexEngine()
	
	for goalID in goalData:
		sexEngine.replaceGoal(domInfo, goalID, subInfo, newgoalID, replaceAll)

func progressGoal(goalid, args = []):
	return getSexEngine().progressGoal(domInfo, goalid, subInfo, args)

func progressGoalFailed(goalid, args = []):
	return getSexEngine().progressGoalFailed(domInfo, goalid, subInfo, args)

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

func processTurnFinal():
	if(has_method(state+"_processTurn")):
		return call(state+"_processTurn")
	return processTurn()

func processTurn():
	return {
		text = str(id)+" IS STILL HAPPENING.",
	}

func reactActivityEnd(_otheractivity):
	return null

func getDomActionsFinal():
	var result:Array = getDomActions()
	if(has_method(state+"_domActions")):
		result.append_array(call(state+"_domActions"))
	return result

func getDomActions():
	return []

func doDomActionFinal(_id, _actionInfo):
	var result
	if(has_method(state+"_doDomAction")):
		result = call(state+"_doDomAction", _id, _actionInfo)
	if(result == null):
		return doDomAction(_id, _actionInfo)
	return result

func doDomAction(_id, _actionInfo):
	return {
		"text": "Bad stuff happened",
	}
	
func getSubActionsFinal():
	var result:Array = getSubActions()
	if(has_method(state+"_subActions")):
		result.append_array(call(state+"_subActions"))
	return result
	
func getSubActions():
	return []

func doSubActionFinal(_id, _actionInfo):
	var result
	if(has_method(state+"_doSubAction")):
		result = call(state+"_doSubAction", _id, _actionInfo)
	if(result == null):
		return doSubAction(_id, _actionInfo)
	return result

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
	if(character.getWornPenisPump() != null):
		var penisPump:ItemBase = character.getWornPenisPump()
		var howMuchFluids = penisPump.getFluids().getFluidAmount()
		var isFull = penisPump.getFluids().isFull()
		text += RNG.pick([
			" {<ORGASMER>.YourHis} penis pump collects the load and now holds "+str(Util.roundF(howMuchFluids, 1))+" ml of {<ORGASMER>.cum}!"
		])
		if(isFull):
			text += RNG.pick([
				" The pump is full!"
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

func sendSexEvent(type, source = "", target = "", data = {}):
	if(source == "" || source == null):
		source = domID
	if(target == "" || target == null):
		target = subID
	
	var newSexEvent:SexEvent = SexEvent.new()
	newSexEvent.type = type
	newSexEvent.sourceCharID = source
	newSexEvent.targetCharID = target
	newSexEvent.data = data
	newSexEvent.isSexEngine = true
	newSexEvent.sexEngine = getSexEngine()
	
	getDom().sendSexEvent(newSexEvent)
	if(getSub() != getDom()):
		getSub().sendSexEvent(newSexEvent)
	
func damageSubClothes():
	var damageClothesResult = getSub().damageClothes()
	if(damageClothesResult[0]):
		return "[b]"+damageClothesResult[2].getVisibleName()+" got damaged![/b] "+damageClothesResult[1]
	return ""

func damageDomClothes():
	var damageClothesResult = getDom().damageClothes()
	if(damageClothesResult[0]):
		return "[b]"+damageClothesResult[2].getVisibleName()+" got damaged![/b] "+damageClothesResult[1]
	return ""
	
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




# Building blocks below


func combineData(_data1, _data2):
	return getSexEngine().combineData(_data1, _data2)

func doCumPussyLickDom():
	var text = RNG.pick([
		"{dom.You} {dom.youVerb('shake')} and {dom.youVerb('shiver')} while {dom.yourHis} "+RNG.pick(["pulsating", "twitching"])+" "+RNG.pick(["pussy", "pussy", "slit", "kitty"])+" [b]"+RNG.pick(["cums", "squirts", "orgasms", "climaxes"])+" all over {sub.your} face[/b]!",
	])
	if(getDom().getFirstItemThatCoversBodypart(InventorySlot.Vagina) != null):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('shake')} and {dom.youVerb('shiver')} while {dom.yourHis} "+RNG.pick(["pulsating", "twitching"])+" "+RNG.pick(["pussy", "pussy", "slit", "kitty"])+" [b]"+RNG.pick(["makes", "creates"])+" a wet spot on {dom.yourHis} clothing[/b]!",
		])
	else:
		if(getSub().isOralBlocked()):
			getSub().cummedOnBy(domID, FluidSource.Vagina)
		else:
			getSub().cummedInMouthBy(domID, FluidSource.Vagina, 0.5)
			getSub().cummedOnBy(domID, FluidSource.Vagina, 0.5)
	
	if(getDom().hasReachablePenis()):
		getDom().cumOnFloor()
		text += RNG.pick([
			" {dom.YourHis} "+RNG.pick(["cock", "dick"])+" throbs while shooting strings of "+RNG.pick(["cum", "seed", "semen"])+"!",
		])
	
	domInfo.cum()

	return {text=text}

func doCumBJDom(isDeepthroat = false):
	var text = RNG.pick([
		"{dom.You} {dom.youVerb('grunt')} while {dom.yourHis} "+RNG.pick(["cock", "dick", "member"])+" throbs and [b]shoots cum directly into {sub.your} mouth[/b].",
	])
	if(isDeepthroat):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('ram')} {dom.yourHis} "+RNG.pick(["cock", "dick"])+" "+RNG.pick(["balls deep", "as deep as {sub.yourHis} throat allows", "deep down {sub.yourHis} throat"])+" before [b]stuffing {sub.yourHis} belly with lots of cum[/b]!",
		])
	
	var condomBroke = false
	var condom:ItemBase = getDom().getWornCondom()
	if(condom != null):
		var breakChance = condom.getCondomBreakChance()
		condomBroke = getDom().shouldCondomBreakWhenFucking(getSub(), breakChance)
		if(condomBroke):
			text = "[b]The condom broke![/b] "+text
			condom.destroyMe()
		else:
			text = RNG.pick([
				"{dom.You} filled the condom inside {sub.your} "+RNG.pick(["mouth"])+"!",
				"{dom.You} stuffed the condom in {sub.your} "+RNG.pick(["mouth"])+" full of {dom.yourHis} "+RNG.pick(["cum", "seed", "jizz", "semen"])+"!",
			])
			getDom().cumInItem(condom)
			domInfo.cum()
			
			condom.destroyMe()
			getSexEngine().saveCondomToLootIfPerk(condom)
			text += RNG.pick([
				" {dom.You} {dom.youVerb('pull')} out and {dom.youVerb('dispose')} of the used condom.",
			])
			
			return {text=text}
	var beingBredScore = subInfo.fetishScore({Fetish.OralSexGiving: 1.0})
	if(beingBredScore < 0.0):
		subInfo.addResistance(1.0)
		subInfo.addFear(0.1)
	getSub().cummedInBodypartByAdvanced(BodypartSlot.Head, domID, {condomBroke=condomBroke})
	domInfo.cum()
	
	if(condom != null):
		condom.destroyMe()
		text += RNG.pick([
			" {dom.You} {dom.youVerb('pull')} out and {dom.youVerb('dispose')} of the used condom.",
		])
	
	#return getSexEngine().combineData({text=text}, applyTallymarkIfNeededData(BodypartSlot.Head))
	return {text=text}


func doCumBJFacialsDom():
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('pull')} {dom.yourHis} cock out and [b]cums all over {sub.your} face[/b]!",
			"{dom.You} {dom.youVerb('pull')} out, [b]cumming all over {sub.your} face[/b]!",
		])
		
		var condom:ItemBase = getDom().getWornCondom()
		if(condom != null):
			var breakChance = condom.getCondomBreakChance()
			
			if(RNG.chance(breakChance)):
				text = "[b]The condom broke![/b] "+text
				condom.destroyMe()
			else:
				text = RNG.pick([
					"{dom.You} {dom.youVerb('pull')} {dom.yourHis} cock out and {dom.youVerb('fill')} {dom.yourHis} condom! {dom.You} {dom.youVerb('dispose')} of it.",
					"{dom.You} {dom.youVerb('pull')} out, stuffing {dom.yourHis} condom! {dom.You} {dom.youVerb('dispose')} of it.",
				])
				condom.destroyMe()
				getDom().cumInItem(condom)
				getSexEngine().saveCondomToLootIfPerk(condom)
				domInfo.cum()
				#satisfyGoals()
				#state = ""
				
				return {text=text}
		
		getSub().cummedOnBy(domID, FluidSource.Penis)
		getDom().cumOnFloor()
		domInfo.cum()
		#satisfyGoals()
		#state = ""

		return {text=text}


func doCumPussyLickSub(supposedToBeAngry = true):
	#satisfyGoals()
	
	var noPermissionText = " {sub.YouHe} [b]came without {dom.yourHis} permission[/b]!" if supposedToBeAngry else ""
	if(getSexType() == SexType.SlutwallSex):
		noPermissionText = ""
		supposedToBeAngry = false
	
	var text = ""
	text = RNG.pick([
		"{sub.You} {sub.youVerb('arch', 'arches')} {sub.yourHis} back while {sub.yourHis} "+RNG.pick(["pussy", "pussy slit", "kitty"])+" twitches and squirts all over {dom.your} face!"+noPermissionText,
	])
	getDom().cummedOnBy(subID, FluidSource.Vagina)
	subInfo.cum()
	if(getSub().hasReachablePenis()):
		if(getSub().isWearingChastityCage()):
			text += RNG.pick([
				" {sub.YourHis} "+RNG.pick(["cock", "dick", "penis"])+" shoots out a weak load through the chastity cage but that one was easy to avoid.",
			])
		else:
			text += RNG.pick([
				" {sub.YourHis} "+RNG.pick(["cock", "dick", "penis"])+" shoots out a load but at least {dom.you} {dom.youVerb('avoid')} that one.",
			])
	
	#endActivity()
	if(supposedToBeAngry):
		domInfo.addAnger(0.5)
		text += RNG.pick([
			" That made {dom.you} very angry.",
		])
	return {text = text}
	
func doCumBJSub(supposedToBeAngry = true):
	#satisfyGoals()
	
	var noPermissionText = " {sub.YouHe} [b]came without {dom.yourHis} permission[/b]!" if supposedToBeAngry else ""
	if(getSexType() == SexType.SlutwallSex):
		noPermissionText = ""
		supposedToBeAngry = false
	
	var text = ""

	text = RNG.pick([
		"{sub.You} {sub.youVerb('grunt')} while {sub.yourHis} "+RNG.pick(["cock", "dick", "shaft"])+" throbs and suddenly shoots strings of "+RNG.pick(["cum", "seed", "semen"])+" directly into {dom.your} mouth!"+noPermissionText,
	])
	
	var condomBroke = false
	var condom:ItemBase = getSub().getWornCondom()
	if(condom != null):
		var breakChance = condom.getCondomBreakChance()
		condomBroke = getSub().shouldCondomBreakWhenFucking(getDom(), breakChance)
		if(condomBroke):
			text = "[b]The condom broke![/b] "+text
			condom.destroyMe()
		else:
			text = RNG.pick([
				"{sub.You} {sub.youVerb('grunt')} while {sub.yourHis} "+RNG.pick(["cock", "dick", "shaft"])+" throbs and suddenly starts to stuff the condom with {sub.yourHis} "+RNG.pick(["cum", "seed", "semen"])+"!"+noPermissionText,
			])
			getSub().cumInItem(condom)
			subInfo.cum()
			#endActivity()
			if(supposedToBeAngry):
				domInfo.addAnger(0.5)
				text += RNG.pick([
					" That made {dom.you} very angry.",
				])
			text += RNG.pick([
				" {dom.You} {dom.youVerb('dispose')} of the used condom.",
			])
			condom.destroyMe()
			getSexEngine().saveCondomToLootIfPerk(condom)
			
			return {text=text}
	
	getDom().cummedInMouthByAdvanced(subID, {condomBroke=condomBroke})
	subInfo.cum()
	
	#endActivity()
	if(supposedToBeAngry):
		domInfo.addAnger(0.5)
		text += RNG.pick([
			" That made {dom.you} very angry.",
		])
	return {text = text}


func doCumBJFacialsSub(supposedToBeAngry = true):
	#satisfyGoals()
	
	var noPermissionText = " {sub.YouHe} [b]came without {dom.yourHis} permission[/b]!" if supposedToBeAngry else ""
	if(getSexType() == SexType.SlutwallSex):
		noPermissionText = ""
		supposedToBeAngry = false
	
	var text = ""

	text = RNG.pick([
		"{sub.You} {sub.youVerb('grunt')} while {sub.yourHis} "+RNG.pick(["cock", "dick", "shaft"])+" throbs and suddenly shoots strings of "+RNG.pick(["cum", "seed", "semen"])+" that land directly on {dom.your} face!"+noPermissionText,
	])
	if(getSub().isWearingChastityCage()):
		text = RNG.pick([
			"{sub.You} {sub.youVerb('grunt')} while {sub.yourHis} locked away "+RNG.pick(["cock", "dick", "shaft"])+" throbs in its tight contains and suddenly shoots a few weak strings of "+RNG.pick(["cum", "seed", "semen"])+" through the chastity cage that land on {dom.your} face!"+noPermissionText,
		])
		
	var condom:ItemBase = getSub().getWornCondom()
	if(condom != null):
		var breakChance = condom.getCondomBreakChance()
		
		if(RNG.chance(breakChance)):
			text = "[b]The condom broke![/b] "+text
			condom.destroyMe()
		else:
			text = RNG.pick([
				"{sub.You} {sub.youVerb('grunt')} while {sub.yourHis} "+RNG.pick(["cock", "dick", "shaft"])+" throbs and suddenly starts to stuff the condom with {sub.yourHis} "+RNG.pick(["cum", "seed", "semen"])+"!"+noPermissionText,
			])
			getSub().cumInItem(condom)
			subInfo.cum()
			#endActivity()
			if(supposedToBeAngry):
				domInfo.addAnger(0.5)
				text += RNG.pick([
					" That made {dom.you} very angry.",
				])
			text += RNG.pick([
				" {dom.You} {dom.youVerb('dispose')} of the used condom.",
			])
			condom.destroyMe()
			getSexEngine().saveCondomToLootIfPerk(condom)
			
			return {text=text}
		
	getDom().cummedOnBy(subID, FluidSource.Penis)
	subInfo.cum()

	#endActivity()
	if(supposedToBeAngry):
		domInfo.addAnger(0.5)
		text += RNG.pick([
			" That made {dom.you} very angry.",
		])
	return {text = text}



func doSpitCumIntoHoleDom(bodypartSlot = BodypartSlot.Vagina):
	var mixtureText = getDom().getBodypartContentsStringList(BodypartSlot.Head)
	var locationName:String = ("{sub.pussyStretch} "+RNG.pick(["pussy", "slit"]) if bodypartSlot == BodypartSlot.Vagina else ("{sub.anusStretch} "+RNG.pick(["anus"])))
	var text = RNG.pick([
		"{dom.You} {dom.youVerb('press')} {dom.yourHis} lips against {sub.yourHis} "+locationName+" and [b]{dom.youVerb('spit')} "+mixtureText+" into it[/b]!",
	])
	var howMuch = getDom().bodypartTransferFluidsToAmount(BodypartSlot.Head, subID, bodypartSlot, 0.2, 20.0)
	if(getSub().hasWombIn(bodypartSlot)):
		affectSub(subInfo.fetishScore({Fetish.BeingBred:1.0}), 0.1, -0.1, -0.05)
	elif(bodypartSlot == BodypartSlot.Vagina):
		affectSub(subInfo.fetishScore({Fetish.OralSexReceiving:1.0}), 0.1, -0.1, -0.05)
	elif(bodypartSlot == BodypartSlot.Anus):
		affectSub(subInfo.fetishScore({Fetish.RimmingReceiving:1.0}), 0.1, -0.1, -0.05)
	sendSexEvent(SexEvent.HoleSpitted, domID, subID, {hole=bodypartSlot, loadSize=howMuch})
	return {text = text}

func doSpitCumIntoHoleSub(bodypartSlot = BodypartSlot.Vagina):
	var mixtureText = getSub().getBodypartContentsStringList(BodypartSlot.Head)
	var locationName:String = ("{dom.pussyStretch} "+RNG.pick(["pussy", "slit"]) if bodypartSlot == BodypartSlot.Vagina else ("{dom.anusStretch} "+RNG.pick(["anus"])))
	var text = RNG.pick([
		"{sub.You} {sub.youVerb('press')} {sub.yourHis} lips against {dom.yourHis} "+locationName+" and [b]{sub.youVerb('spit')} "+mixtureText+" into it[/b]!",
	])
	var howMuch = getSub().bodypartTransferFluidsToAmount(BodypartSlot.Head, domID, bodypartSlot, 0.2, 20.0)
	if(getDom().hasWombIn(bodypartSlot)):
		affectDom(domInfo.fetishScore({Fetish.BeingBred:1.0}), 0.1, -0.1)
	elif(bodypartSlot == BodypartSlot.Vagina):
		affectDom(domInfo.fetishScore({Fetish.OralSexReceiving:1.0}), 0.1, -0.1)
	elif(bodypartSlot == BodypartSlot.Anus):
		affectDom(domInfo.fetishScore({Fetish.RimmingReceiving:1.0}), 0.1, -0.1)
	sendSexEvent(SexEvent.HoleSpitted, subID, domID, {hole=bodypartSlot, loadSize=howMuch})
	return {text = text}

func isDomWearingStrapon():
	return getDom().isWearingStrapon()

func isSubWearingStrapon():
	return getSub().isWearingStrapon()

func getDomPenisSensetivity():
	var strapon = getDom().getWornStrapon()
	if(strapon == null):
		return 1.0
	
	return strapon.getStraponPleasureForDom()

func getSubPenisSensetivity():
	var strapon = getSub().getWornStrapon()
	if(strapon == null):
		return 1.0
	
	return strapon.getStraponPleasureForDom()

func getDomDickName(dickName = null):
	if(isDomWearingStrapon()):
		return "strapon"
	if(dickName == null):
		return RNG.pick(["cock", "dick", "member"])
	return dickName

func getSubDickName(dickName = null):
	if(isSubWearingStrapon()):
		return "strapon"
	if(dickName == null):
		return RNG.pick(["cock", "dick", "member"])
	return dickName

	
func doBlowjobTurnDom():
	affectSub(subInfo.fetishScore({Fetish.OralSexGiving: 1.0})+0.1, 0.1, -0.1, -0.01)
	affectDom(domInfo.fetishScore({Fetish.OralSexReceiving: 0.5})+0.6, 0.1*getDomPenisSensetivity(), 0.0)
	subInfo.addArousalForeplay(0.03)
	domInfo.stimulateArousalZone(0.2, BodypartSlot.Penis, 1.0)
	getSub().gotOrificeStretchedBy(BodypartSlot.Head, domID, 0.05)
	
	var text = RNG.pick([
		"{dom.Your} "+getDomDickName()+" is being sucked by {sub.youHim}.",
		"{sub.You} {sub.youAre} "+RNG.pick(["sucking", "blowing"])+" {dom.yourHis} "+getDomDickName()+".",
		"{sub.You} {sub.youAre} wrapping {sub.yourHis} lips tightly around {dom.your} "+getDomDickName(RNG.pick(["cock", "dick", "member"]))+".",  
		"{sub.You} {sub.youAre} teasing the tip of {dom.your} "+getDomDickName(RNG.pick(["cock", "dick", "length", "shaft"]))+ " with {sub.yourHis} tongue.",  
		"{sub.You} {sub.youVerb('bob')} {sub.yourHis} head along {dom.your} "+getDomDickName(RNG.pick(["dick", "cock", "shaft", "member"]))+", taking it deeper.",  
		"{sub.You} {sub.youAre} running {sub.yourHis} tongue along the underside of {dom.your} "+getDomDickName(RNG.pick(["cock", "length", "member"]))+".",  
		"{sub.You} {sub.youAre} sucking eagerly on {dom.your} "+getDomDickName(RNG.pick(["dick", "member", "shaft"]))+", drawing a moan from {dom.youHim}.",  
		"{sub.You} {sub.youVerb('swirl')} {sub.yourHis} tongue around the head of {dom.your} "+getDomDickName(RNG.pick(["cock", "dick", "member"]))+".",  
		"{sub.You} {sub.youVerb('take')} {dom.your} "+getDomDickName(RNG.pick(["length", "shaft", "cock"]))+ " further into {sub.yourHis} mouth, sucking hard.",  
		"{sub.You} {sub.youVerb('press')} {sub.yourHis} tongue firmly against {dom.your} "+getDomDickName(RNG.pick(["cock", "dick", "member"]))+", sliding it slowly along its length.",  
	])
	
	if(!subInfo.isUnconscious()):
		if(RNG.chance(30)):
			text += RNG.pick([
				" Wet slurping noises can be heard from {sub.you}.",
				" {sub.You} {sub.youAre} making wet noises with {sub.yourHis} mouth.",
				" {sub.You} {sub.youVerb('try', 'tries')} to work that tongue.",
			])
	else:
		text = RNG.pick([
			"{dom.You} {dom.youVerb('use')} {sub.yourHis} "+RNG.pick(["mouth", "lips", "tongue"])+" for {dom.yourHis} pleasure.",
			"{dom.You} "+RNG.pick(["forcefully {dom.youVerb('move')}", "{dom.youVerb('move')}"])+" {sub.yourHis} head back and forth over {dom.yourHis} "+getDomDickName(RNG.pick(["cock", "dick", "member", "length"]))+"."
		])
		
		if(RNG.chance(30)):
			text += RNG.pick([
				" Wet slurping noises can be heard from {sub.you}.",
				" {sub.You} {sub.youAre} making wet noises with {sub.yourHis} mouth.",
			])
	
	if(isDomWearingStrapon()):
		if(domInfo.isReadyToCum()):
			text += RNG.pick([
				" {dom.YouHe} {dom.youAre} about to cum!",
				" {dom.YouHe} {dom.youAre} edging {dom.yourself}.",
				" {dom.YouHe} {dom.youAre} barely keeping {dom.yourself} from cumming.",
				" {dom.YouHe} reached {dom.yourHis} peak!",
			])
		elif(domInfo.isCloseToCumming()):
			text += RNG.pick([
				" {dom.YouHe} {dom.youAre} gonna cum soon!",
			])
	else:
		if(domInfo.isReadyToCum()):
			text += RNG.pick([
				" {dom.YouHe} {dom.youAre} about to cum!",
				" {dom.YouHe} {dom.youAre} edging {dom.yourself}.",
				" {dom.YourHis} "+RNG.pick(["cock", "dick", "member"])+" is twitching a lot.",
				" {dom.YouHe} {dom.youAre} barely keeping {dom.yourself} from cumming.",
				" {dom.YouHe} reached {dom.yourHis} peak!",
			])
		elif(domInfo.isCloseToCumming()):
			text += RNG.pick([
				" {dom.YouHe} {dom.youAre} leaking "+RNG.pick(["pre", "precum"])+" directly into that mouth.",
				" {dom.YouHe} {dom.youAre} gonna cum soon!",
				" {dom.YourHis} "+RNG.pick(["cock", "dick", "member"])+" is twitching slightly.",
			])
	return {text = text}


func doDeepthroatTurnDom():
	getSub().gotOrificeStretchedBy(BodypartSlot.Head, domID, 0.1)
	affectSub(subInfo.fetishScore({Fetish.OralSexGiving: 1.0})-0.3, 0.1, -0.1, -0.01)
	affectDom(domInfo.fetishScore({Fetish.OralSexReceiving: 0.5})+0.6, 0.1*getDomPenisSensetivity(), 0.0)
	subInfo.addArousalForeplay(0.06)
	domInfo.stimulateArousalZone(0.25, BodypartSlot.Penis, 1.0)
	
	var text = RNG.pick([
		"{sub.You} {sub.youVerb('deepthroat')} that "+getDomDickName()+".",
	])
	if(subInfo.isUnconscious()):
		text = RNG.pick([
			"{sub.You} {sub.youAre} being forced to deepthroat that "+getDomDickName()+".",
			"{dom.You} {dom.youAre} forcing {sub.yourHis} head deep onto {dom.yourHis} "+getDomDickName(RNG.pick(["cock", "dick", "length", "prick"]))+".",
		])
	
	var freeRoom = getSub().getPenetrationFreeRoomBy(BodypartSlot.Head, domID)
	if(freeRoom > 3.0):
		text += RNG.pick([
			" {sub.Your} throat is deep enough for {sub.youHim} not to suffocate.",
			" {sub.You} {sub.youVerb('allow')} {dom.youHim} to fuck {sub.yourHis} throat easily.",
			" {sub.Your} throat stretches easily to accommodate for that length.",
			" There is a small "+RNG.pick(["bulge", "bump"])+" on {sub.yourHis} throat.",
		])
	else:
		subInfo.addConsciousness(-RNG.randf_range(0.05, 0.15))
		text += RNG.pick([
			" {sub.You} {sub.youVerb('choke')} and {sub.youVerb('gag')} because "+RNG.pick(["it's too big", "of its length", "of its size", "{sub.yourHis} throat is not stretched enough"])+".",
			" {sub.You} "+RNG.pick(["{sub.youVerb('choke')}", "{sub.youVerb('suffocate')}", "can't get enough air"])+"!",
			" "+RNG.pick(["A few tears stream", "A single tear streams"])+" down {sub.yourHis} cheeks while {sub.yourHis} throat is being "+RNG.pick(["fucked", "used", "stretched"])+".",
			" There is a noticable "+RNG.pick(["bulge", "bump"])+" on {sub.yourHis} throat.",
		])
	
	if(isDomWearingStrapon()):
		if(domInfo.isReadyToCum()):
			text += RNG.pick([
				" {dom.YouHe} {dom.youAre} about to cum!",
				" {dom.YouHe} {dom.youAre} edging {dom.yourself}.",
				" {dom.YouHe} {dom.youAre} barely keeping {dom.yourself} from cumming.",
				" {dom.YouHe} reached {dom.yourHis} peak!",
			])
		elif(domInfo.isCloseToCumming()):
			text += RNG.pick([
				" {dom.YouHe} {dom.youAre} gonna cum soon!",
			])
	else:
		if(domInfo.isReadyToCum()):
			text += RNG.pick([
				" {dom.YouHe} {dom.youAre} about to cum!",
				" {dom.YouHe} {dom.youAre} edging {dom.yourself}.",
				" {dom.YourHis} "+RNG.pick(["cock", "dick", "member"])+" is twitching a lot.",
				" {dom.YouHe} {dom.youAre} barely keeping {dom.yourself} from cumming.",
				" {dom.YouHe} reached {dom.yourHis} peak!",
			])
		elif(domInfo.isCloseToCumming()):
			text += RNG.pick([
				" {dom.YouHe} {dom.youAre} leaking "+RNG.pick(["pre", "precum"])+" directly into that mouth.",
				" {dom.YouHe} {dom.youAre} gonna cum soon!",
				" {dom.YourHis} "+RNG.pick(["cock", "dick", "member"])+" is twitching slightly.",
			])
	
	if(isDomWearingStrapon()):
		var strapon = getDom().getWornStrapon()
		if(strapon.getFluids() != null && RNG.chance(33) && !strapon.getFluids().isEmpty()):
			var extraMessages = []
			var fluidByAmount = strapon.getFluids().getFluidAmountByType()
			for fluidID in fluidByAmount:
				var fluidObject = GlobalRegistry.getFluid(fluidID)
				if(fluidObject == null):
					continue
				
				var resultMessage = fluidObject.onSwallow(getSub(), fluidByAmount[fluidID])
				if(resultMessage != null && resultMessage != ""):
					extraMessages.append(resultMessage)
			
			getSub().cummedInBodypartByAdvanced(BodypartSlot.Head, domID)
			text += " {dom.Your} strapon gets squeezed by {sub.your} "+RNG.pick(["throat"])+" enough for it to suddenly [b]release its contents inside {sub.yourHis} mouth[/b]!"
			if(extraMessages.size() > 0):
				text += " "+Util.join(extraMessages, " ")
	
	return {text = text}

func doPussyLickingTurnDom():
	affectSub(subInfo.fetishScore({Fetish.OralSexGiving: 1.0})+0.1, 0.1, -0.1, -0.01)
	affectDom(domInfo.fetishScore({Fetish.OralSexReceiving: 0.5})+0.6, 0.1, 0.0)
	domInfo.stimulateArousalZone(0.1, BodypartSlot.Vagina, 0.5)
	
	var clothingItem = getDom().getFirstItemThatCoversBodypart(BodypartSlot.Vagina)
	var throughTheClothing = ""
	if(clothingItem != null):
		throughTheClothing = " through the "+clothingItem.getCasualName()
	var text = RNG.pick([
		"{sub.You} {sub.youAre} licking {dom.yourHis} "+RNG.pick(["pussy", "pussy slit", "kitty", "petals", "slit", "folds"])+ throughTheClothing +".",
		"{sub.You} {sub.youAre} dragging {sub.yourHis} tongue over {dom.yourHis} "+RNG.pick(["pussy lips", "kitty", "slit", "petals", "folds", "clit and pussy"])+ throughTheClothing +".",
		"{sub.You} {sub.youAre} licking {dom.yourHis} "+RNG.pick(["pussy", "pussy slit", "kitty", "petals", "slit", "folds"])+ throughTheClothing+".",  
		"{sub.You} {sub.youAre} dragging {sub.yourHis} tongue over {dom.yourHis} "+RNG.pick(["pussy lips", "kitty", "slit", "petals", "folds", "clit and pussy"])+ throughTheClothing+".",  
		"{sub.You} {sub.youAre} exploring {dom.yourHis} "+RNG.pick(["pussy", "folds", "slit", "delicate petals", "heat", "sweetness"])+" with slow, teasing licks"+throughTheClothing+".",  
		"{sub.You} {sub.youAre} pressing {sub.yourHis} tongue against {dom.yourHis} "+RNG.pick(["pussy", "folds", "petals", "sensitive slit", "wetness", "delicate lips"])+ throughTheClothing+".",  
		"{sub.You} {sub.youAre} swirling {sub.yourHis} tongue over {dom.yourHis} "+RNG.pick(["clit and slit", "soft folds", "pussy lips", "petals", "sensitive areas"])+ throughTheClothing+".",  
		"{sub.You} {sub.youAre} savoring the taste of {dom.yourHis} "+RNG.pick(["pussy", "sweet petals", "intimate folds", "slit", "wetness", "sensitive clit and lips"])+ throughTheClothing+".",  
		"{sub.You} {sub.youAre} teasing {dom.yourHis} "+RNG.pick(["pussy", "delicate folds", "petals", "clit and lips", "slit", "soft wetness"])+" with deliberate, sensual licks"+throughTheClothing+".",  
		"{sub.You} {sub.youAre} running {sub.yourHis} tongue along {dom.yourHis} "+RNG.pick(["folds", "clit and pussy", "pussy lips", "slit", "heat", "delicate petals"])+ throughTheClothing+".",  
		"{sub.You} {sub.youAre} drawing slow, tantalizing circles with {sub.yourHis} tongue on {dom.yourHis} "+RNG.pick(["pussy", "soft folds", "slit", "intimate lips", "petals", "delicate skin"])+ throughTheClothing+".",  
		"{sub.You} {sub.youAre} gently flicking {sub.yourHis} tongue over {dom.yourHis} "+RNG.pick(["pussy lips", "soft slit", "folds", "petals", "clit", "intimate heat"])+ throughTheClothing+".",  
		"{sub.You} {sub.youAre} firmly dragging {sub.yourHis} tongue across {dom.yourHis} "+RNG.pick(["wet lips", "folds", "pussy", "slit", "petals", "clit and folds"])+ throughTheClothing+".",  
		"{sub.You} {sub.youAre} spreading {dom.yourHis} "+RNG.pick(["folds", "soft lips", "pussy", "delicate petals", "slit", "wetness"])+" with {sub.yourHis} tongue"+throughTheClothing+".",  

	])
	if(subInfo.isUnconscious()):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('rub')} {dom.yourHis} "+RNG.pick(["pussy", "slit", "kitty"])+" over {sub.yourHis} tongue"+throughTheClothing+".",
			"{dom.You} {dom.youVerb('use')} {sub.yourHis} tongue on {dom.yourHis} "+RNG.pick(["pussy", "slit", "kitty"])+" for {dom.yourHis} pleasure.",
		])
	
	if(clothingItem == null):
		if(getDom().hasEffect(StatusEffect.HasCumInsideVagina)):
			if(RNG.chance(30) && OPTIONS.isContentEnabled(ContentType.CumStealing)):
				var _howMuch = getDom().bodypartTransferFluidsToAmount(BodypartSlot.Vagina, subID, BodypartSlot.Head, 0.2, 20.0)
				text += RNG.pick([ 
					" "+Util.capitalizeFirstLetter(getDom().getBodypartContentsStringList(BodypartSlot.Vagina))+" [b]"+RNG.pick(["oozes", "leaks"])+" out[/b] of {dom.yourHis} "+RNG.pick(["", "used ", "stuffed "])+RNG.pick(["pussy", "slit", "kitty"])+".",
				])
	
	if(domInfo.isReadyToCum()):
		text += RNG.pick([
			" {dom.YouHe} {dom.youAre} about to cum!",
			" {dom.YouHe} {dom.youAre} edging {dom.yourself}.",
			" {dom.YourHis} "+RNG.pick(["pussy", "pussy slit"])+" is twitching a lot.",
			" {dom.YourHis} "+RNG.pick(["pussy", "pussy slit"])+" is leaking arousal a lot.",
			" {dom.YouHe} {dom.youAre} barely keeping {dom.yourself} from cumming.",
			" {dom.YouHe} reached {dom.yourHis} peak!",
		])
	elif(domInfo.isCloseToCumming()):
		text += RNG.pick([
			" {dom.You} "+RNG.pick(["{dom.youVerb('let')} out some moans", "{dom.youVerb('let')} out a moan", "{dom.youVerb('bite')} {dom.yourHis} lip", "{dom.youVerb('breathe')} deeply"])+" while {dom.yourHis} pussy "+RNG.pick(["gets more wet", "leaks arousal", "becomes more aroused", "drips arousal", "lets out an aroused scent"])+"."
		])
	
	return {text = text, domSay=domReaction(SexReaction.DomsPussyGetsLicked, 10)}

func doPussyGrindingTurnDom():
	affectSub(subInfo.fetishScore({Fetish.OralSexGiving: 1.0})-0.1, 0.1, -0.1, -0.01)
	affectDom(domInfo.fetishScore({Fetish.OralSexReceiving: 0.5})+0.6, 0.1, 0.0)
	domInfo.stimulateArousalZone(0.1, BodypartSlot.Vagina, 0.5)
	
	var clothingItem = getDom().getFirstItemThatCoversBodypart(BodypartSlot.Vagina)
	var throughTheClothing = ""
	if(clothingItem != null):
		throughTheClothing = " through the "+clothingItem.getCasualName()
	var text = RNG.pick([
		"{dom.You} {dom.youAre} grinding {dom.yourHis} "+RNG.pick(["pussy", "pussy slit", "kitty", "petals", "slit", "folds"])+" over {sub.yourHis} face"+ throughTheClothing +".",
		"{dom.You} {dom.youVerb('use')} {sub.yourHis} face for {dom.yourHis} pleasure by grinding it!",
	])
	
	if(clothingItem == null):
		if(getDom().hasEffect(StatusEffect.HasCumInsideVagina)):
			if(RNG.chance(30)):
				text += RNG.pick([ 
					" "+Util.capitalizeFirstLetter(getDom().getBodypartContentsStringList(BodypartSlot.Vagina))+" gets spread across {sub.yourHis} face.",
				])
	
	if(domInfo.isReadyToCum()):
		text += RNG.pick([
			" {dom.YouHe} {dom.youAre} about to cum!",
			" {dom.YouHe} {dom.youAre} edging {dom.yourself}.",
			" {dom.YourHis} "+RNG.pick(["pussy", "pussy slit"])+" is twitching a lot.",
			" {dom.YourHis} "+RNG.pick(["pussy", "pussy slit"])+" is leaking arousal a lot.",
			" {dom.YouHe} {dom.youAre} barely keeping {dom.yourself} from cumming.",
			" {dom.YouHe} reached {dom.yourHis} peak!",
		])
	elif(domInfo.isCloseToCumming()):
		text += RNG.pick([
			" {dom.You} "+RNG.pick(["{dom.youVerb('let')} out some moans", "{dom.youVerb('let')} out a moan", "{dom.youVerb('bite')} {dom.yourHis} lip", "{dom.youVerb('breathe')} deeply"])+" while {dom.yourHis} pussy "+RNG.pick(["gets more wet", "leaks arousal", "becomes more aroused", "drips arousal", "lets out an aroused scent"])+"."
		])
	
	return {text = text,domSay=domReaction(SexReaction.GrindingFaceWithPussy, 10)}

func doBlowjobTurnSub():
	affectSub(subInfo.fetishScore({Fetish.OralSexReceiving: 1.0})+0.6, 0.1, -0.1, -0.01)
	affectDom(domInfo.fetishScore({Fetish.OralSexGiving: 0.5})+0.1, 0.1, 0.0)
	domInfo.addArousalForeplay(0.03)
	subInfo.stimulateArousalZone(0.2, BodypartSlot.Penis, 1.0)
	getDom().gotOrificeStretchedBy(BodypartSlot.Head, subID, 0.05)
	
	var text = RNG.pick([
		"{dom.You} {dom.youAre} sucking {sub.your} "+RNG.pick(["cock", "dick", "member"])+".",
		"{dom.You} {dom.youVerb('drag')} {dom.yourHis} lips over {sub.your} "+RNG.pick(["cock", "dick", "member", "length"])+", sucking it.",
		"{dom.You} {dom.youAre} wrapping {dom.yourHis} lips tightly around {sub.your} "+RNG.pick(["cock", "dick", "member"])+".",  
		"{dom.You} {dom.youAre} teasing the tip of {sub.your} "+RNG.pick(["cock", "dick", "length", "shaft"])+ " with {dom.yourHis} tongue.",  
		"{dom.You} {dom.youVerb('bob')} {dom.yourHis} head along {sub.your} "+RNG.pick(["dick", "cock", "shaft", "member"])+", taking it deeper.",  
		"{dom.You} {dom.youAre} running {dom.yourHis} tongue along the underside of {sub.your} "+RNG.pick(["cock", "length", "member"])+".",  
		"{dom.You} {dom.youAre} sucking eagerly on {sub.your} "+RNG.pick(["dick", "member", "shaft"])+", drawing a moan from {sub.youHim}.",  
		"{dom.You} {dom.youVerb('swirl')} {dom.yourHis} tongue around the head of {sub.your} "+RNG.pick(["cock", "dick", "member"])+".",  
		"{dom.You} {dom.youVerb('take')} {sub.your} "+RNG.pick(["length", "shaft", "cock"])+ " further into {dom.yourHis} mouth, sucking hard.",  
		"{dom.You} {dom.youVerb('press')} {dom.yourHis} tongue firmly against {sub.your} "+RNG.pick(["cock", "dick", "member"])+", sliding it slowly along its length.",  
	])
	
	if(RNG.chance(30)):
		text += RNG.pick([
			" Wet slurping noises can be heard from {dom.you}.",
			" {dom.You} {dom.youAre} making wet noises with {dom.yourHis} mouth.",
			" {dom.You} {dom.youVerb('work')} that tongue around the length to provide extra stimulation.",
		])
	
	if(subInfo.isReadyToCum()):
		text += RNG.pick([
			" {sub.YouHe} {sub.youAre} about to cum!",
			" {sub.YouHe} {sub.youAre} being edged by {dom.youHim}.",
			" {sub.YourHis} "+RNG.pick(["cock", "dick", "member"])+" is twitching a lot.",
			" {sub.YouHe} {sub.youAre} barely keeping {sub.yourself} from cumming.",
			" {sub.YouHe} reached {sub.yourHis} peak!",
		])
	elif(subInfo.isCloseToCumming()):
		text += RNG.pick([
			" {sub.YouHe} {sub.youAre} leaking "+RNG.pick(["pre", "precum"])+" directly into {dom.yourHis} mouth.",
			" {sub.YouHe} {sub.youAre} gonna cum soon!",
			" {sub.YourHis} "+RNG.pick(["cock", "dick", "member"])+" is twitching slightly.",
		])
	return {text = text}

func doPussyLickingTurnSub():
	affectSub(subInfo.fetishScore({Fetish.OralSexReceiving: 1.0})+0.3, 0.1, -0.1, -0.01)
	affectDom(domInfo.fetishScore({Fetish.OralSexGiving: 0.5})+0.6, 0.1, 0.0)
	subInfo.stimulateArousalZone(0.1, BodypartSlot.Vagina, 0.5)
	
	var clothingItem = getSub().getFirstItemThatCoversBodypart(BodypartSlot.Vagina)
	var throughTheClothing = ""
	if(clothingItem != null):
		throughTheClothing = " through the "+clothingItem.getCasualName()
	var text = RNG.pick([
		"{dom.You} {dom.youAre} licking {sub.yourHis} "+RNG.pick(["pussy", "pussy slit", "kitty", "petals", "slit", "folds"])+ throughTheClothing +".",
		"{dom.You} {dom.youAre} dragging {dom.yourHis} tongue over {sub.yourHis} "+RNG.pick(["pussy lips", "kitty", "slit", "petals", "folds", "clit and pussy"])+ throughTheClothing +".",
		"{dom.You} {dom.youAre} exploring {sub.yourHis} "+RNG.pick(["pussy", "folds", "slit", "delicate petals", "heat", "sweetness"])+" with slow, teasing licks"+throughTheClothing+".",  
		"{dom.You} {dom.youAre} pressing {dom.yourHis} tongue against {sub.yourHis} "+RNG.pick(["pussy", "folds", "petals", "sensitive slit", "wetness", "delicate lips"])+ throughTheClothing+".",  
		"{dom.You} {dom.youAre} swirling {dom.yourHis} tongue over {sub.yourHis} "+RNG.pick(["clit and slit", "soft folds", "pussy lips", "petals", "sensitive areas"])+ throughTheClothing+".",  
		"{dom.You} {dom.youAre} savoring the taste of {sub.yourHis} "+RNG.pick(["pussy", "sweet petals", "intimate folds", "slit", "wetness", "sensitive clit and lips"])+ throughTheClothing+".",  
		"{dom.You} {dom.youAre} teasing {sub.yourHis} "+RNG.pick(["pussy", "delicate folds", "petals", "clit and lips", "slit", "soft wetness"])+" with deliberate, sensual licks"+throughTheClothing+".",  
		"{dom.You} {dom.youAre} running {dom.yourHis} tongue along {sub.yourHis} "+RNG.pick(["folds", "clit and pussy", "pussy lips", "slit", "heat", "delicate petals"])+ throughTheClothing+".",  
		"{dom.You} {dom.youAre} drawing slow, tantalizing circles with {dom.yourHis} tongue on {sub.yourHis} "+RNG.pick(["pussy", "soft folds", "slit", "intimate lips", "petals", "delicate skin"])+ throughTheClothing+".",  
		"{dom.You} {dom.youAre} gently flicking {dom.yourHis} tongue over {sub.yourHis} "+RNG.pick(["pussy lips", "soft slit", "folds", "petals", "clit", "intimate heat"])+ throughTheClothing+".",  
		"{dom.You} {dom.youAre} firmly dragging {dom.yourHis} tongue across {sub.yourHis} "+RNG.pick(["wet lips", "folds", "pussy", "slit", "petals", "clit and folds"])+ throughTheClothing+".",  
		"{dom.You} {dom.youAre} spreading {sub.yourHis} "+RNG.pick(["folds", "soft lips", "pussy", "delicate petals", "slit", "wetness"])+" with {dom.yourHis} tongue"+throughTheClothing+".",  
	])
	
	if(clothingItem == null):
		if(getSub().hasEffect(StatusEffect.HasCumInsideVagina)):
			if(RNG.chance(30)):
				text += RNG.pick([ 
					" "+Util.capitalizeFirstLetter(getSub().getBodypartContentsStringList(BodypartSlot.Vagina))+" "+RNG.pick(["oozes", "leaks"])+" out of {sub.yourHis} "+RNG.pick(["", "used ", "stuffed "])+RNG.pick(["pussy", "slit", "kitty"])+".",
				])
	
	if(subInfo.isReadyToCum()):
		text += RNG.pick([
			" {sub.YouHe} {sub.youAre} about to cum!",
			" {sub.YouHe} {sub.youAre} being kept on edge by {dom.youHim}.",
			" {sub.YourHis} "+RNG.pick(["pussy", "pussy slit"])+" is twitching a lot.",
			" {sub.YourHis} "+RNG.pick(["pussy", "pussy slit"])+" is leaking arousal a lot.",
			" {sub.YouHe} {sub.youAre} barely keeping {sub.yourself} from cumming.",
			" {sub.YouHe} reached {sub.yourHis} peak!",
		])
	elif(subInfo.isCloseToCumming()):
		text += RNG.pick([
			" {sub.You} "+RNG.pick(["{sub.youVerb('let')} out some moans", "{sub.youVerb('let')} out a moan", "{sub.youVerb('breathe')} deeply"])+" while {sub.yourHis} pussy "+RNG.pick(["gets more wet", "leaks arousal", "becomes more aroused", "drips arousal", "lets out an aroused scent"])+"."
		])
	
	return {text = text}
