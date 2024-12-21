extends Reference
class_name SexInfoBase

var sexEngineRef: WeakRef
var charID = ""
var timesCame: int = 0
var memory:Dictionary = {}
var tick:int = 0
var lustFull: float = 0.0
var hadStim:bool = false # Did we have any stimulation this turn?
var turnsLastStim:int = 0 # How many turns since last stimulation
var satisfaction:float = 0.0
var frustration:float = 0.0

var justCame = false

func getSexEngine():
	if(sexEngineRef == null):
		return null
	return sexEngineRef.get_ref()

func initInfo(theCharID, sexengine):
	charID = theCharID
	sexEngineRef = weakref(sexengine)
	initFromPersonality()
	
func getChar() -> BaseCharacter:
	if(charID == null || charID == ""):
		return null
	
	return GlobalRegistry.getCharacter(charID)

func getInfoString():
	var character = getChar()
	
	var text:String = ""
	if(character != null):
		text += character.getName()
	
	return text

func getInfoStringFinal() -> String:
	var text:String = getInfoString()
	
	var extraInfo:Array = getExtraInfoLines()
	if(!extraInfo.empty()):
		for line in extraInfo:
			text += "\n - "+str(line)
	
	return text

func getExtraInfoLines() -> Array:
	var result:Array = []
	
	var sensitiveZones:Array = getChar().getSensitiveZones()
	for zone in sensitiveZones:
		if(zone.shouldShowOverstimualtedTextInSexEngine(self)):
			var zoneStimulation:float = zone.getStimulationOrOverstimulation()
			var zoneName:String = zone.getName()
			var isOrgasmEffect:bool = zone.hasOrgasmEffect()
			var isBads:bool = (zoneStimulation >= 0.9) || zone.isOverstimulated()
			var isVeryBads:bool = zone.isOverstimulated()
			var colorString:String = ("red" if isVeryBads else "#FF9999")
			var extraTexts:Array = []
			if(isOrgasmEffect):
				extraTexts.append("orgasm")
			if(!zone.canOrgasm()):
				extraTexts.append("not sensitive enough to cum")
			
			result.append(zoneName+" overstimulation: "+("[color="+colorString+"]" if isBads else "")+str(Util.roundF(zoneStimulation*100.0, 1))+"%"+("[/color]" if isBads else "")+(" ("+Util.join(extraTexts, ", ")+")" if extraTexts.size() > 0 else ""))
	
	
	return result

func initFromPersonality():
	pass

func processTurn():
	tick += 1
	lustFull += getChar().getLustLevel()

func resetJustCame():
	justCame = false

func didJustCame():
	return justCame

func getAverageLust():
	return lustFull / float(Util.maxi(1, tick))

func addArousal(howmuch: float):
	getChar().addArousal(howmuch)
	if(howmuch > 0.0):
		hadStim = true
		turnsLastStim = 0
		addSatisfaction(howmuch * 0.1)
	if(howmuch < 0.0 && getChar().isLewdHorny()):
		addFrustration(abs(howmuch) * 0.2)

func getArousal()->float:
	return getChar().getArousal()

func setArousal(howMuch:float):
	getChar().setArousal(howMuch)

func addPain(newpain):
	getChar().addPain(newpain)
	
	if(newpain > 0):
		var masochistScore = fetishScore({Fetish.Masochism: 1.0})
		if(masochistScore > 0.0):
			addLust(round(newpain * masochistScore * 0.5))
			addSatisfaction(newpain * 0.01)
		else:
			addFrustration(newpain * 0.01)

func addLust(newlust):
	getChar().addLust(newlust)

func canDoActions():
	return true

func canTalk():
	if(getChar().getBuffsHolder().hasBuff(Buff.SpacedOutInSexBuff)):
		return false
	return true

func arousalNaturalFade():
	if(!hadStim && getArousal() > 0.0):
		addArousal(-0.01)
		turnsLastStim += 1
		
		if(turnsLastStim > 1):
			onDenyTick()
		if(turnsLastStim > 4):
			addArousal(-0.02)
		if(turnsLastStim > 8):
			addArousal(-0.02)
	#else:
	#	turnsLastStim = 0
	hadStim = false

func onDenyTick():
	for zone in getChar().getSensitiveZones():
		zone.onDenyTick()

func isBeingDenied() -> bool:
	if(!hadStim && getArousal() > 0.2 && turnsLastStim > 2):
		return true
	return false

func isBeingDeniedHard() -> bool:
	if(!hadStim && getArousal() > 0.7 && turnsLastStim > 1):
		return true
	return false

func addArousalForeplay(howmuch: float):
	#var lustLevel = getChar().getLustLevel()
	# should be less efficient at high lust. or not
	if(getArousal() < 0.5):
		addArousal(howmuch)

func addArousalSex(howmuch: float):
	var lustLevel = getChar().getLustLevel()
	if(lustLevel < 0.6):
		# should be less efficient at low lust
		addArousal(howmuch * max(lustLevel+0.3, 0.6))
	else:
		addArousal(howmuch)

func stimulateArousalZone(howmuch: float, bodypartSlot, stimulation:float = 1.0):
	if(bodypartSlot == BodypartSlot.Penis && getChar().isWearingStrapon()):
		var strapon = getChar().getWornStrapon()
		var pleasureMod = strapon.getStraponPleasureForDom()
		
		addArousalSex(howmuch * pleasureMod)
		return
	
	var sensitiveZone:SensitiveZone = getChar().getBodypart(bodypartSlot).getSensitiveZone()
	if(sensitiveZone != null):
		turnsLastStim = 0
		hadStim = true
		sensitiveZone.stimulate(stimulation)
		
		var howMuchActually:float = sensitiveZone.getArousalGainModifier()
		
		var theArousal:float = getArousal()
		
		howMuchActually *= max((1.0 - min(theArousal, 0.5)*0.1 - theArousal*0.25), 0.01)
		#if(howMuchActually <= 0.08 && RNG.chance(50)):
		#	addArousalSex(-0.01)
		#	return
		if(howMuchActually*0.2 <= 0.07):
			addArousalSex(-0.02)
			return
		#if(howMuchActually <= 0.09):
		#	howMuchActually *= 0.2
		
		addArousalSex(howmuch * howMuchActually)
	else:
		addArousalSex(howmuch)

func isCloseToCumming() -> bool:
	return getArousal() >= 0.7

func isReadyToCum() -> bool:
	return getArousal() >= 1.0
	
func getOpponentInfo():
	return null
	
func cum(infoCaused = null):
	if(infoCaused == null):
		infoCaused = getOpponentInfo()
	if(infoCaused == null):
		infoCaused = self
	
	addSatisfaction(1.0)
	justCame = true
	setArousal(0.0)
	getChar().addLust(-int(getChar().getLust()/2.0))
	timesCame += 1
	getChar().afterOrgasm(true)
	
	if(true):
		var event = SexEventHelper.create(SexEvent.Orgasmed, infoCaused.charID, charID, {
		})
		getChar().sendSexEvent(event)
		if(infoCaused != null && infoCaused != self):
			infoCaused.getChar().sendSexEvent(event)

func getTimesCame():
	return timesCame

func isReadyToPenetrate() -> bool:
	return getChar().isReadyToPenetrate()

func fetishScore(fetishes = {}, addscore = 0.0):
	var fetishHolder: FetishHolder = getChar().getFetishHolder()
	
	var maxPossibleValue = 0.0
	var result = addscore
	for fetishID in fetishes:
		var fetishValue = fetishHolder.getFetishValue(fetishID)
		result += fetishValue * fetishes[fetishID]
		maxPossibleValue += 1.0
	
	var forcedObedience = clamp(getChar().getForcedObedienceLevel(), 0.0, 1.0)
	if(forcedObedience > 0.0):
		result = result * (1.0 - forcedObedience) + maxPossibleValue * forcedObedience
	
	return result

func personalityScore(personalityStats = {}, addscore = 0.0):
	var personality: Personality = getChar().getPersonality()
	
	var result = addscore
	for personalityStatID in personalityStats:
		var personalityValue = personality.getStat(personalityStatID)
		result += personalityValue * personalityStats[personalityStatID]
	
	return result

func remember(keyid, value = true):
	memory[keyid] = value

func hasMemory(keyid):
	if(memory.has(keyid)):
		return true
	return false

func getMemory(keyid, defaultValue = null):
	if(!memory.has(keyid)):
		return defaultValue
	return memory[keyid]

func increaseMemory(keyid):
	if(!memory.has(keyid)):
		memory[keyid] = 0
	
	memory[keyid] += 1

func getSexEndInfo():
	var texts = []
	
	texts.append("Satisfaction: "+str(Util.roundF(calculateFinalSatisfaction()*100.0, 1))+"%") # +" Satis: "+str(satisfaction)+" Frust: "+str(frustration)
	if(timesCame > 0):
		texts.append("Times came: "+str(timesCame))
	texts.append("Average lust: "+str(Util.roundF(getAverageLust()*100.0, 1))+"%")
	
	return texts

func hasTag(thetag):
	return getSexEngine().hasTag(charID, thetag)

func affectPersonality(_personality:Personality, _fetishHolder:FetishHolder):
	return ""

func isUnconscious():
	return false

func addSatisfaction(howMuch:float):
	if(isUnconscious()):
		return
	satisfaction += howMuch

func addFrustration(howMuch:float):
	if(isUnconscious()):
		return
	var forcedObedience = clamp(getChar().getForcedObedienceLevel(), 0.0, 1.0)
	if(howMuch > 0.0 && forcedObedience > 0.0):
		howMuch *= (1.0 - forcedObedience)
	frustration += howMuch

func onGoalSatisfied(_thedominfo, _goalid, _thesubinfo, _mult:float = 1.0):
	pass

func onGoalFailed(_thedominfo, _goalid, _thesubinfo, _mult:float = 1.0):
	pass

func checkIsDown():
	return false

func hasGoalToCum() -> bool:
	return true

func getTotalSatisfaction() -> float:
	if((satisfaction + frustration) == 0.0):
		return 0.0
	return clamp(satisfaction / (satisfaction + frustration), 0.0, 1.0)

func calculateFinalSatisfaction() -> float:
	var total:float = getTotalSatisfaction()
	
	if(checkIsDown()):
		var maso:float = fetishScore({Fetish.Masochism: 1.0})
		total *= max(0.4 + maso * 0.6, 0.0)
	
	if(timesCame < 1 && hasGoalToCum()):
		var patience:float = personalityScore({PersonalityStat.Impatient:-1.0})
		total *= clamp(0.7 + patience * 0.45, 0.0, 1.0)
	
	if(getArousal() >= 0.9 && hasGoalToCum()):
		var arousalMod:float = 1.0 - getArousal() / 2.0
		var patience:float = personalityScore({PersonalityStat.Impatient:-1.0})
		total *= clamp(arousalMod + (patience * getArousal()), 0.0, 1.0)
	
	if((satisfaction + frustration) < 1.0):
		total = 0.5 * (1.0 - (satisfaction + frustration)) + total * (satisfaction + frustration)
	
	return total

func saveData():
	var data = {
		"charID": charID,
		"timesCame": timesCame,
		"memory": memory,
		"tick": tick,
		"lustFull": lustFull,
		"hadStim": hadStim,
		"turnsLastStim": turnsLastStim,
		"satisfaction": satisfaction,
		"frustration": frustration,
	}

	return data
	
func loadData(data):
	charID = SAVE.loadVar(data, "charID", "")
	timesCame = SAVE.loadVar(data, "timesCame", 0)
	memory = SAVE.loadVar(data, "memory", {})
	tick = SAVE.loadVar(data, "tick", 0)
	lustFull = SAVE.loadVar(data, "lustFull", 0.0)
	hadStim = SAVE.loadVar(data, "hadStim", false)
	turnsLastStim = SAVE.loadVar(data, "turnsLastStim", 0)
	satisfaction = SAVE.loadVar(data, "satisfaction", 0.0)
	frustration = SAVE.loadVar(data, "frustration", 0.0)
