extends Reference
class_name SexInfoBase

var sexEngineRef: WeakRef
var charID:String = ""
var timesCame: int = 0
var memory:Dictionary = {}
var tick:int = 0
var lustFull: float = 0.0
var hadStim:bool = false # Did we have any stimulation this turn?
var turnsLastStim:int = 0 # How many turns since last stimulation
var satisfaction:float = 0.0
var frustration:float = 0.0
var fetishGain:Dictionary = {}

var justCame:bool = false

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

func getCharID() -> String:
	return charID

func getInfoString(_isSelected:bool = false) -> String:
	var character = getChar()
	
	var text:String = ""
	if(character != null):
		if(_isSelected):
			text += "\\["+character.getName()+"\\]"
		else:
			text += character.getName()
	
	return text

func getInfoStringFinal(_isSelected:bool = false) -> String:
	var text:String = getInfoString(_isSelected)
	
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
	
	#Remove this before ship
	# Debug fetish gain info
	#for fetishID in fetishGain:
	#	result.append(fetishID+": "+str(Util.roundF(fetishGain[fetishID][0], 2))+" "+str(Util.roundF(fetishGain[fetishID][1], 2)))
	
	return result

func initFromPersonality():
	pass

func processTurn():
	tick += 1
	lustFull += getChar().getLustLevel()
	
	var revealAmount:int = getSexEngine().getRevealedPartsAmount(getCharID())
	if(revealAmount > 0):
		fetishAffect(Fetish.Exhibitionism, 0.05*revealAmount)

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

func canDoActions() -> bool:
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
	if(getArousal() < 0.33):
		addArousal(howmuch)

func addArousalSex(howmuch: float):
	var lustLevel = getChar().getLustLevel()
	addArousal(howmuch * (0.6 + lustLevel*0.4))

# First argument is basically 'speed'. Last argument is how 'stimulating' it is
func stimulateArousalZone(howmuch: float, bodypartSlot, stimulation:float = 1.0):
	if(bodypartSlot == BodypartSlot.Penis && getChar().isWearingStrapon()):
		var strapon = getChar().getWornStrapon()
		var pleasureMod:float = strapon.getStraponPleasureForDom()
		
		addArousalSex(howmuch * pleasureMod)
		return
	
	if(!getChar().hasBodypart(bodypartSlot)):
		return
	var sensitiveZone:SensitiveZone = getChar().getBodypart(bodypartSlot).getSensitiveZone()
	if(sensitiveZone == null):
		addArousalForeplay(howmuch)
		return
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
	
	#else:
	#	addArousalSex(howmuch)

func isCloseToCumming() -> bool:
	return getArousal() >= 0.7

func isReadyToCum() -> bool:
	return getArousal() >= 1.0
	
func getOpponentInfo():
	return null

func isDom() -> bool:
	return false

func cum(infoCaused = null):
	if(infoCaused == null):
		infoCaused = getOpponentInfo()
	if(infoCaused == null):
		infoCaused = self
	
	var theChar := getChar()
	
	addSatisfaction(1.0)
	justCame = true
	setArousal(0.0)
	theChar.addLust(-int(theChar.getLust()/2.0))
	timesCame += 1
	theChar.afterOrgasm(true)
	
	var restraintAmount:int = theChar.getInventory().getRemovableRestraintsAmount()
	if(restraintAmount > 0): # Cumming with restraints makes you like bondage more
		fetishAffect(Fetish.Bondage, min(0.5 * restraintAmount, 4.0))
	
	var drugsInfluenceAmount:int = theChar.getDrugsInfluenceAmount()
	if(drugsInfluenceAmount > 0): # Cumming while under drugs inflience makes you like drugs more
		fetishAffect(Fetish.DrugUse, min(0.5 * drugsInfluenceAmount, 4.0))
	
	if(true):
		var event = SexEventHelper.create(SexEvent.Orgasmed, infoCaused.charID, charID, {
		})
		theChar.sendSexEvent(event)
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

func combineData(_data1, _data2):
	return getSexEngine().combineData(_data1, _data2)

func getExtraOutputData(_isDom:bool, _sexEngine):
	var tfHolder:TFHolder = getChar().getTFHolder()
	if(tfHolder != null && tfHolder.hasPendingTransformations()):
		var tfResult:Dictionary = tfHolder.doFirstPendingTransformation({}, true)
		if(tfResult.has("text") && tfResult["text"] != ""):
			fetishAffect(Fetish.TFReceiving, 5.0)
			_sexEngine.addTextRaw(getChar().getName()+"'s body is suddenly [b]changing[/b]! "+tfResult["text"])

			if(tfResult.has("say") && tfResult["say"] != ""):
				_sexEngine.talkText(charID, tfResult["say"])

func fetishUp(_fetishID:String, _amount:float = 1.0):
	if(isUnconscious()):
		if(!(_fetishID in [Fetish.Masochism, Fetish.Choking, Fetish.UnconsciousSex])):
			return
	if(!fetishGain.has(_fetishID)):
		fetishGain[_fetishID] = [0.0, _amount]
	else:
		fetishGain[_fetishID][1] += _amount

func fetishAffect(_fetishID:String, _amount:float = 1.0):
	if(_amount < 0.0):
		fetishUp(_fetishID, _amount)
		return
	if(isUnconscious()):
		if(!(_fetishID in [Fetish.Masochism, Fetish.Choking, Fetish.UnconsciousSex])):
			return
	if(!fetishGain.has(_fetishID)):
		fetishGain[_fetishID] = [_amount, 0.0]
	else:
		fetishGain[_fetishID][0] += _amount

func convertFetishChangeToPlusString(_change:float) -> String:
	if(_change >= 0.15):
		return "+++"
	if(_change >= 0.05):
		return "++"
	if(_change > 0.0):
		return "+"
	if(_change <= -0.15):
		return "---"
	if(_change <= -0.05):
		return "--"
	if(_change < 0.0):
		return "-"
	
	return ""

func doFetishChangeCalculation() -> Dictionary:
	var theChar := getChar()

	var messages:Array = []
	var upFetishes:Array = []
	var downFetishes:Array = []
	
	var fetishHolder:FetishHolder = theChar.getFetishHolder()
	var personality:Personality = theChar.getPersonality()
	var buffHolder:BuffsHolder = theChar.getBuffsHolder()
	
	var globalScoreMult:float = 1.0
	if(isDom()): # Doms gain fetishes slower
		globalScoreMult = 0.6
	
	var theSatisfaction: float = calculateFinalSatisfaction()
	var satisfactionMod:float = 0.0
	if(theSatisfaction > 0.6):
		satisfactionMod = theSatisfaction
	elif(theSatisfaction < 0.4):
		satisfactionMod = -1.0+theSatisfaction
	
	for fetishID in fetishGain:
		var theFetish:FetishBase = GlobalRegistry.getFetish(fetishID)
		if(!theFetish):
			continue
		
		var currentFetishValue:float = fetishHolder.getFetish(fetishID)
		
		var minThreasholdForChange:float = lerp(theFetish.getDynamicChangeThreshold(), theFetish.getDynamicChangeThresholdMax(), abs(currentFetishValue))
		
		var fetishGained:float = (fetishGain[fetishID][1] + fetishGain[fetishID][0]*satisfactionMod) * globalScoreMult * (1.0+buffHolder.getFetishGain(fetishID))
		if(fetishGained >= 0.0):
			fetishGained *= theFetish.getFetishChangePersonalityMod(personality)
		else:
			fetishGained /= theFetish.getFetishChangePersonalityMod(personality)
		
		if(abs(fetishGained) < minThreasholdForChange):
			continue
		
		var fetishGainedAdjusted:float = fetishGained# - sign(fetishGained)*minThreasholdForChange
		
		var fetishChange:float = pow(abs(fetishGainedAdjusted), 0.9)*0.01*sign(fetishGained)
		if(abs(fetishChange) <= 0.0):
			continue
		fetishChange = clamp(fetishChange, -0.3, 0.3)
		
		#var currentFetishValue:float = fetishHolder.getFetish(fetishID)
		fetishHolder.addFetish(fetishID, fetishChange)
		var newFetishValue:float = fetishHolder.getFetish(fetishID)
		
		#var changeText:String = ""
		if(fetishChange > 0.0):
			#changeText = " now likes "+theFetish.getVisibleName()+" more."+" ("+str(Util.roundF(fetishChange*100.0, 1))+"%)"
			#upFetishes.append(theFetish.getVisibleName()  +" ("+str(Util.roundF(fetishChange*100.0, 1))+"%)" )
			upFetishes.append(theFetish.getVisibleName() + convertFetishChangeToPlusString(fetishChange))
		else:
			#changeText = " now dislikes "+theFetish.getVisibleName()+" more."+" ("+str(Util.roundF(fetishChange*100.0, 1))+"%)"
			downFetishes.append(theFetish.getVisibleName() + convertFetishChangeToPlusString(fetishChange))
			#downFetishes.append(theFetish.getVisibleName()  +" ("+str(Util.roundF(fetishChange*100.0, 1))+"%)" )
		#messages.append(theChar.getName()+changeText)
		
		var wasEnumVal:int = FetishInterest.getEnumListValue(currentFetishValue)
		var newEnumVal:int = FetishInterest.getEnumListValue(newFetishValue)
		if(newEnumVal > wasEnumVal):
			var theChangeDesc:String = FetishInterest.getChangeDesc(newFetishValue)
			messages.append(theChar.getName()+"'s interest towards '"+theFetish.getVisibleName()+"' fetish has [color=#FFC9FE]increased[/color], "+theChar.heShe()+" "+theChangeDesc+" it")
			#messages.append(theChar.getName()+" "+theChangeDesc+" "+theFetish.getVisibleName())
		if(newEnumVal < wasEnumVal):
			var theChangeDesc:String = FetishInterest.getChangeDesc(newFetishValue)
			messages.append(theChar.getName()+"'s interest towards '"+theFetish.getVisibleName()+"' fetish has [color=#FFCED2]decreased[/color], "+theChar.heShe()+" "+theChangeDesc+" it")
			#messages.append(theChar.getName()+" "+theChangeDesc+" "+theFetish.getVisibleName())
	
	if(!downFetishes.empty()):
		messages = [theChar.getName()+" [color=#FFB0A0]dislikes[/color] these fetishes more: "+Util.join(downFetishes," ")] + messages
	
	if(!upFetishes.empty()):
		messages = [theChar.getName()+" [color=#FFBAF8]likes[/color] these fetishes more: "+Util.join(upFetishes," ")] + messages
	
	return {messages=messages}
		

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
		"fetishGain": fetishGain,
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
	fetishGain = SAVE.loadVar(data, "fetishGain", {})
