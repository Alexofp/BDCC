extends Reference
class_name PawnInteractionBase

var id:String = "error"


var location:String = "main_punishment_spot"

var involvedPawns:Dictionary = {} # Role = ID
var currentPawn:String = "" # Role
var directedToPawn:String = "" # Role
var state:String = ""

var charIDToRole:Dictionary = {} # ID = Role

var currentActionID:String = ""
var currentActionArgs:Dictionary = {}

var busyActionSeconds:int = 0
var currentActionText:String = ""
var isWaitingScene:bool = false

var cachedTarget:String = ""
var cachedPath:Array = []

var cachedLastDir:int = -1

var wasDeleted:bool = false

var textBuffer:Array = []
var actionBuffer:Array = []

func start(_pawns:Dictionary, _args:Dictionary):
	pass

func shouldRunOnMeet(_pawn1, _pawn2, _pawn2Moved:bool):
	return [false]

func getOutputText() -> String:
	return "Something something"

func getOutputTextFinal() -> String:
	textBuffer.clear()
	var methodName:String = (state if state != "" else "init")+"_text"
	if(has_method(methodName)):
		var theText = call(methodName)
		if(textBuffer.size() > 0):
			return Util.join(textBuffer, "\n\n")
		return str(theText)
	
	var theText = getOutputText()
	if(textBuffer.size() > 0):
		return Util.join(textBuffer, "\n\n")
	return str(theText)

func saynn(theText:String):
	textBuffer.append(theText)

func getAnimData() -> Array:
	return []

func getAnimDataFinal() -> Array:
	var methodName:String = (state if state != "" else "init")+"_anim"
	if(has_method(methodName)):
		return call(methodName)
	return getAnimData()

func getCharIDByRole(role:String) -> String:
	if(involvedPawns.has(role)):
		return involvedPawns[role]
	return ""

func getCharByRole(role:String):
	return GlobalRegistry.getCharacter(getCharIDByRole(role))

func getRoleChar(role:String):
	return getCharByRole(role)

func playAnimation():
	var animData = getAnimDataFinal()
	
	if(animData.size() <= 2):
		return
	
	if(animData.size() > 2):
		var extraData:Dictionary = animData[2]
		for theID in ["pc", "npc", "npc2", "npc3"]:
			if(extraData.has(theID)):
				extraData[theID] = getCharIDByRole(extraData[theID])
		for theID in ["bodyState", "npcBodyState", "npc2BodyState", "npc3BodyState"]:
			if(extraData.has(theID)):
				if(extraData[theID].has("leashedBy")):
					extraData[theID]["leashedBy"] = getCharIDByRole(extraData[theID]["leashedBy"])
	
	GM.main.playAnimation(animData[0], animData[1], animData[2] if animData.size() > 2 else {})

func calcFinalActionScore(actionEntry:Dictionary) -> float:
	var score:float = actionEntry["score"] if actionEntry.has("score") else 0.0
	var scoreType = actionEntry["scoreType"] if actionEntry.has("scoreType") else "default"
	
	return score * getScoreTypeValue(scoreType)

func addAction(theid:String, name:String, desc:String, _scoreType:String, score, time:int, extraFields:Dictionary = {}):
	var finalDic:Dictionary = {
		id = theid,
		name = name,
		desc = desc,
		score = score,#*getScoreTypeValue(_scoreType),
		scoreType = _scoreType,
		time = time,
	}
	for extraKey in extraFields:
		finalDic[extraKey] = extraFields[extraKey]
	if(!finalDic.has("args")):
		finalDic["args"] = {}
	actionBuffer.append(finalDic)

func addDisabledAction(name:String, desc:String):
	var finalDic:Dictionary = {
		id = "",
		name = name,
		desc = desc,
		score = 0,
		time = 0,
		args = {},
		disabled=true,
	}
	actionBuffer.append(finalDic)

func getActions() -> Array:
	return []

func getActionsFinal() -> Array:
	return getTextAndActions()[1]

func getScoreTypeValueGeneric(_scoreType:String, curPawn:CharacterPawn, dirToPawn:CharacterPawn):
	if(curPawn == null || dirToPawn == null):
		return 1.0
	var curID:String = curPawn.charID
	var dirToID:String = dirToPawn.charID
	
	if(_scoreType == "default"):
		return 1.0
	if(_scoreType == "fight"):
		var ourPowerLevel:float = curPawn.calculatePowerScore()
		var theirPowerLevel:float = dirToPawn.calculatePowerScore()
		var diff:float = ourPowerLevel - theirPowerLevel
		diff = clamp(diff, -5.0, 5.0)
		
		var cowardness = curPawn.scorePersonalityMax({PersonalityStat.Coward: 1.0})
		var meanness = curPawn.scorePersonalityMax({PersonalityStat.Mean: 1.0})
		
		var affection:float = GM.main.RS.getAffection(curID, dirToID)
		
		var finalScore:float = 0.4 + 0.8 * ((diff + 5.0) / 10.0)
		finalScore -= affection * 0.2 # Less likely to fight if like each other
		finalScore -= cowardness * 0.4 # Less likely to fight if coward
		finalScore += meanness * 0.2 # Mean characters are more likely to fight
		finalScore = clamp(finalScore, 0.2, 2.0)
		return finalScore
	if(_scoreType == "surrender"):
		var ourPowerLevel:float = curPawn.calculatePowerScore()
		var theirPowerLevel:float = dirToPawn.calculatePowerScore()
		var lust:float = GM.main.RS.getLust(curID, dirToID)
		
		var diff:float = ourPowerLevel - theirPowerLevel
		diff = clamp(diff, -5.0, 5.0)
		var finalScore:float = 0.0
		if(diff > 0.0):
			var cowardness = curPawn.scorePersonalityMax({PersonalityStat.Coward: 1.0}, true)
			
			finalScore = max(0.5 - diff, cowardness*0.3)
		else:
			var braveness = curPawn.scorePersonalityMax({PersonalityStat.Coward: -1.0}, true)
			
			finalScore = max(abs(diff)*0.2, 0.3 * (1.0-braveness))
		finalScore += lust * 0.2
		return finalScore
	if(_scoreType == "punish"):
		var affection:float = GM.main.RS.getAffection(curID, dirToID)
		var meanness = curPawn.scorePersonalityMax({PersonalityStat.Mean: 1.0})
		meanness = clamp(meanness, -0.5, 0.5)
		var subbyness = curPawn.scorePersonalityMax({PersonalityStat.Subby: 1.0})
		
		var finalScore:float = 0.6
		
		finalScore -= affection * 0.5
		finalScore += meanness * 0.4
		finalScore -= subbyness * 0.1
		if(RNG.chance(meanness*100.0)):
			finalScore += 0.5
		
		finalScore = clamp(finalScore, 0.3, 2.0)
		return finalScore
	if(_scoreType == "punishMean"):
		var anger:float = curPawn.getAnger()
		var affection:float = GM.main.RS.getAffection(curID, dirToID)
		var meanness = curPawn.scorePersonalityMax({PersonalityStat.Mean: 1.0})
		#meanness = clamp(meanness, -0.5, 0.5)
		var subbyness = curPawn.scorePersonalityMax({PersonalityStat.Subby: 1.0})
		
		var finalScore:float = 0.3
		
		finalScore -= affection * 0.3
		finalScore += meanness * 0.4
		if(meanness > 0.05):
			finalScore += 0.1
		if(meanness > 0.2):
			finalScore += 0.2
		if(meanness > 0.5):
			finalScore += 0.3
		if(RNG.chance(meanness*100.0)):
			finalScore += 1.0
		finalScore += anger
		finalScore -= subbyness * 0.1
		
		finalScore = clamp(finalScore, 0.1, 2.0)
		return finalScore
	if(_scoreType == "sexDom"):
		var affection:float = GM.main.RS.getAffection(curID, dirToID)
		var lust:float = GM.main.RS.getLust(curID, dirToID)
		var dommyness:float = curPawn.scorePersonalityMax({PersonalityStat.Subby: -1.0})
		var meanness = curPawn.scorePersonalityMax({PersonalityStat.Mean: 1.0})
		var isInHeat = GlobalRegistry.getCharacter(dirToID).isInHeat()
		
		var finalScore:float = 0.1
		
		if(meanness > 0.0 && affection <= 0.1):
			finalScore += meanness
		if(meanness < 0.0 && affection >= 0.1):
			finalScore -= meanness
		
		finalScore += lust
		finalScore += max(dommyness, 0.0)
		
		if(dommyness > 0.0):
			if(isInHeat):
				finalScore += 0.5
		
		finalScore *= (max(dommyness, 0.0) + 0.7)
		if(RNG.chance(dommyness*100.0)):
			finalScore += 0.5
		
		finalScore = clamp(finalScore, 0.05, 2.0)
		return finalScore
	if(_scoreType == "sexSub"):
		var affection:float = GM.main.RS.getAffection(curID, dirToID)
		var lust:float = GM.main.RS.getLust(curID, dirToID)
		var subbyness:float = curPawn.scorePersonalityMax({PersonalityStat.Subby: 1.0})
		var naiveness = curPawn.scorePersonalityMax({PersonalityStat.Naive: 1.0})
		var isInHeat = GlobalRegistry.getCharacter(curID).isInHeat()
		
		var finalScore:float = 0.1
		if(isInHeat):
			finalScore += 0.3
		finalScore += subbyness
		finalScore += naiveness * 0.2
		finalScore += lust * max(subbyness, 0.0) * 2.0
		finalScore += max(affection, 0.0) * max(subbyness, 0.0)
		if(isInHeat):
			finalScore = max(0.3, finalScore)
		if(RNG.chance(subbyness*100.0)):
			finalScore += 0.5

		finalScore = clamp(finalScore, 0.05, 2.0)
		return finalScore
	if(_scoreType == "hatefuck"):
		#var social:float = curPawn.getSocialClamped()
		var anger:float = curPawn.getAngerClamped()
		var affection:float = GM.main.RS.getAffection(curID, dirToID)
		var lust:float = GM.main.RS.getLust(curID, dirToID)
		var meanness = curPawn.scorePersonalityMax({PersonalityStat.Mean: 1.0})
		var isInHeat = GlobalRegistry.getCharacter(curID).isInHeat()
		
		var finalScore:float = 0.1
		if(isInHeat):
			finalScore += 0.5
		
		finalScore += lust
		finalScore -= affection
		finalScore += meanness * 0.2
		finalScore += anger
		if(RNG.chance(meanness*lust*100.0*(1.0-max(affection, 0.0)))):
			finalScore += 1.0

		finalScore = clamp(finalScore, 0.05, 2.0)
		return finalScore
	if(_scoreType == "resist"):
		var affection:float = GM.main.RS.getAffection(curID, dirToID)
		var braveness = curPawn.scorePersonalityMax({PersonalityStat.Coward: -1.0})
		var bratiness = curPawn.scorePersonalityMax({PersonalityStat.Brat: 1.0})
		var naiveness = curPawn.scorePersonalityMax({PersonalityStat.Naive: 1.0})
		
		var finalScore:float = 0.05
		
		finalScore += clamp(braveness, 0.0, 0.2)
		finalScore -= clamp(affection/5.0, 0.0, 0.1)
		finalScore -= clamp(naiveness/5.0, 0.0, 0.1)
		
		if(RNG.chance(bratiness * 50.0)):
			finalScore += 1.0

		finalScore = clamp(finalScore, 0.05, 2.0)
		return finalScore
	if(_scoreType == "help"):
		var social:float = curPawn.getSocialClamped()
		var anger:float = curPawn.getAngerClamped()
		var affection:float = GM.main.RS.getAffection(curID, dirToID)
		var kindness = curPawn.scorePersonalityMax({PersonalityStat.Mean: -1.0})
		
		var finalScore:float = 0.0
		if(kindness > 0.0):
			finalScore += kindness * 0.5
		finalScore += affection
		
		finalScore -= anger
		finalScore += social / 2.0
		
		if(RNG.chance(kindness*30.0)):
			finalScore += 1.0

		finalScore = clamp(finalScore, 0.05, 2.0)
		return finalScore
	if(_scoreType == "justleave"):
		return 0.01
	if(_scoreType == "talk"):
		var affection:float = GM.main.RS.getAffection(curID, dirToID)
		var kindness = curPawn.scorePersonalityMax({PersonalityStat.Mean: -1.0})
		
		var mult:float = 1.0
		if(affection > 0.95):
			mult = 0.1
		elif(affection > 0.8):
			mult = 0.4
		elif(affection < -0.2):
			mult = 0.1
		
		return (0.1 + max(kindness, 0.0)) * mult
	if(_scoreType == "approach"):
		var social:float = curPawn.getSocialClamped()
		var anger:float = curPawn.getAngerClamped()
		var exposure:float = dirToPawn.scoreExposed()
		var canGrabAndFuck:bool = dirToPawn.canGrabAndFuck()
		var ourCanGrabAndFuck:bool = curPawn.canGrabAndFuck()
		if(ourCanGrabAndFuck):
			return 0.0
		
		if(canGrabAndFuck):
			return 3.0*getScoreTypeValueGeneric("sexUse", curPawn, dirToPawn) * (1.0 + exposure) * (1.0 if max(social, anger) > 0.2 else 0.0)
			
		if(social < 0.2 || anger < 0.2):
			return min(exposure, 0.05)
		return max(social, anger) * (1.0 + exposure)
	if(_scoreType == "flirt"):
		var likeness:float = curPawn.getHowMuchLikesPawn(dirToPawn, true)
		var anger:float = curPawn.getAngerClamped()
		var angerTheir:float = dirToPawn.getAngerClamped()
		var bratiness = curPawn.scorePersonalityMax({PersonalityStat.Brat: 1.0})
		var braveness = curPawn.scorePersonalityMax({PersonalityStat.Coward: -1.0})
		var naiveness = curPawn.scorePersonalityMax({PersonalityStat.Naive: 1.0})
		
		var finalScore:float = 0.1 + likeness + bratiness * 0.1 + naiveness * 0.1 + braveness * 0.1
		finalScore *= (1.0 - anger)
		finalScore *= (1.0 - angerTheir)
		
		return clamp(finalScore, 0.02, 2.0)
	if(_scoreType == "acceptFlirt"):
		var likeness:float = curPawn.getHowMuchLikesPawn(dirToPawn, true)
		var affection:float = GM.main.RS.getAffection(curID, dirToID)
		var lust:float = GM.main.RS.getLust(curID, dirToID)
		var naiveness = curPawn.scorePersonalityMax({PersonalityStat.Naive: 1.0})
		var subbyness = curPawn.scorePersonalityMax({PersonalityStat.Subby: 1.0})
		
		var finalScore:float = 0.1
		
		finalScore += likeness
		finalScore += affection
		finalScore += lust
		finalScore += max(naiveness, 0.0) * 0.5
		finalScore += max(subbyness, 0.0) * 0.5
		
		finalScore *= dirToPawn.getWhoreRepMult()
		finalScore *= dirToPawn.getAlphaRepMult()
		
		return clamp(finalScore, 0.02, 2.0)
	if(_scoreType == "sexUse"):
		var likeness:float = curPawn.getHowMuchLikesPawn(dirToPawn, true)
		var social:float = curPawn.getSocialClamped()
		var anger:float = curPawn.getAnger()
		
		var affection:float = GM.main.RS.getAffection(curID, dirToID)
		var lust:float = GM.main.RS.getLust(curID, dirToID)
		var dommyness:float = curPawn.scorePersonalityMax({PersonalityStat.Subby: -1.0})
		var meanness = curPawn.scorePersonalityMax({PersonalityStat.Mean: 1.0})
		
		var finalScore:float = 0.1
		
		finalScore += likeness
		finalScore += anger
		
		finalScore += lust
		finalScore += max(dommyness, 0.0)
		
		finalScore *= (max(dommyness, 0.0) + 0.7)
		if(RNG.chance(dommyness*100.0)):
			finalScore += 0.5
		
		if(meanness > 0.7):
			finalScore += meanness
		else:
			if(affection > 0.0):
				finalScore *= (1.0 - affection)
			else:
				finalScore += max(abs(affection), 0.1)
		
		if(social < 0.2):
			finalScore *= 0.05
		else:
			finalScore *= social
		
		finalScore *= dirToPawn.getWhoreRepMult()
		
		finalScore = clamp(finalScore, 0.01, 2.0)
		return finalScore
	if(_scoreType == "attack"):
		var meanness = curPawn.scorePersonalityMax({PersonalityStat.Mean: 1.0})
		var affection:float = GM.main.RS.getAffection(curID, dirToID)
		var anger:float = curPawn.getAnger()
		
		var finalScore:float = 0.0
		finalScore -= affection
		finalScore += meanness
		finalScore = max(anger, finalScore)
		return finalScore
	if(_scoreType == "agreeSexAsSub"):
		var affection:float = GM.main.RS.getAffection(curID, dirToID)
		var lust:float = GM.main.RS.getLust(curID, dirToID)
		var subbyness:float = curPawn.scorePersonalityMax({PersonalityStat.Subby: 1.0})
		var naiveness = curPawn.scorePersonalityMax({PersonalityStat.Naive: 1.0})
		var meanness = curPawn.scorePersonalityMax({PersonalityStat.Mean: 1.0})
		var isInHeat = GlobalRegistry.getCharacter(curID).isInHeat()
		var anger:float = curPawn.getAnger()
		
		var finalScore:float = 0.0
		if(lust >= 0.4):
			finalScore += lust
		if(isInHeat):
			finalScore += 1.0
		if(affection <= -0.5 && anger >= 0.5): # Hatefuck simulation
			finalScore += anger * (1.0 + meanness)
		if(affection >= 0.9 && naiveness >= 0.6): # Naive sub simulation
			finalScore += affection * (1.0 + naiveness) * 2.0
		if(subbyness >= 0.3): # Subby sub simulation
			finalScore += subbyness
			
		finalScore *= (1.0+subbyness)
		finalScore *= (1.0 + naiveness * 0.3)
		
		finalScore *= dirToPawn.getAlphaRepMult()
		
		return finalScore
	if(_scoreType == "agreeSexAsDom"):
		var affection:float = GM.main.RS.getAffection(curID, dirToID)
		var lust:float = GM.main.RS.getLust(curID, dirToID)
		var dommyness:float = curPawn.scorePersonalityMax({PersonalityStat.Subby: -1.0})
		#var naiveness = curPawn.scorePersonalityMax({PersonalityStat.Naive: 1.0})
		var meanness = curPawn.scorePersonalityMax({PersonalityStat.Mean: 1.0})
		var isInHeat = GlobalRegistry.getCharacter(curID).isInHeat()
		var anger:float = curPawn.getAnger()
		
		var finalScore:float = 0.0
		if(lust >= 0.4):
			finalScore += lust
		if(isInHeat):
			finalScore += 1.0
		if(affection <= -0.5 && anger >= 0.5): # Hatefuck simulation
			finalScore += anger * (1.0 + meanness)
		if(dommyness >= 0.5 && affection >= -meanness): # Eager dom simulation
			finalScore += dommyness
		finalScore *= (1.0+dommyness)
		finalScore *= (1.0+meanness*0.2)
		
		finalScore *= dirToPawn.getWhoreRepMult()
		
		return finalScore
	if(_scoreType == "agreeSexWithSlut"):
		var affection:float = GM.main.RS.getAffection(curID, dirToID)
		var lust:float = GM.main.RS.getLust(curID, dirToID)
		var dommyness:float = curPawn.scorePersonalityMax({PersonalityStat.Subby: -1.0})
		var theirDommyness:float = dirToPawn.scorePersonalityMax({PersonalityStat.Subby: -1.0})
		#var naiveness = curPawn.scorePersonalityMax({PersonalityStat.Naive: 1.0})
		var meanness = curPawn.scorePersonalityMax({PersonalityStat.Mean: 1.0})
		var isInHeat = GlobalRegistry.getCharacter(curID).isInHeat()
		var anger:float = curPawn.getAngerClamped()
		var theirSlutScore:float = dirToPawn.calculateSlutScore()
		#var slutScore:float = curPawn.calculateSlutScore()
		var isDomSlut:bool = (call("isSlutDom") if has_method("isSlutDom") else false)
		
		var finalScore:float = 0.2
		
		finalScore += theirSlutScore
		
		if(isDomSlut):
			finalScore *= (1.0 + theirDommyness)
			finalScore *= (1.0 - anger*0.5)
		else:
			finalScore *= (1.0 + dommyness)
			finalScore *= (1.0 + abs(meanness)*0.2)
			finalScore *= (1.0 + anger*0.3)
		
		finalScore *= (1.0 + lust*lust*0.5)
		finalScore *= (1.0 + affection*affection*0.3)
		
		if(isInHeat):
			finalScore *= 1.5
		
		finalScore *= dirToPawn.getSlutSkillMod()
		if(!isDomSlut):
			finalScore *= dirToPawn.getWhoreRepMult()
		else:
			finalScore *= dirToPawn.getAlphaRepMult()
		
		return finalScore
		
	return 1.0

func getScoreTypeValue(_scoreType:String):
	return getScoreTypeValueGeneric(_scoreType, getRolePawn(currentPawn), getRolePawn(directedToPawn))

func getTextAndActions() -> Array:
	actionBuffer = []
	var resultText:String = getOutputTextFinal()
	
	var methodName:String = (state if state != "" else "init")+"_actions"
	if(has_method(methodName)):
		actionBuffer.append_array(call(methodName))
	else:
		actionBuffer.append_array(getActions())
	
	return [resultText, actionBuffer]

func doAction(_id:String, _args:Dictionary, _context:Dictionary):
	pass

func doActionFinal(_id:String, _args:Dictionary, _context:Dictionary = {}):
	if(_id == "builtin_inv"):
		runScene("InventoryScene")
		return
	elif(_id == "builtin_struggle"):
		runScene("StrugglingScene")
		return
	
	var methodName:String = (state if state != "" else "init")+"_do"
	if(has_method(methodName)):
		return call(methodName, _id, _args, _context)
	return doAction(_id, _args, _context)

func getInterruptActions(_pawn:CharacterPawn) -> Array:
	return [
#		{
#			id = "test",
#			name = "INTERRUPT!",
#			desc = "Do something",
#			score = 1.0,
#			args = {},
#		},
	]

func getInterruptActionsFinal(_pawn:CharacterPawn) -> Array:
	var methodName:String = (state if state != "" else "init")+"_interruptActions"
	if(has_method(methodName)):
		return call(methodName, _pawn)
	return getInterruptActions(_pawn)

func doInterruptAction(_pawn:CharacterPawn, _id:String, _args:Dictionary, _context:Dictionary):
	pass

func doInterruptActionFinal(_pawn:CharacterPawn, _id:String, _args:Dictionary, _context:Dictionary = {}):
	var methodName:String = (state if state != "" else "init")+"_doInterrupt"
	if(has_method(methodName)):
		return call(methodName, _pawn, _id, _args, _context)
	return doInterruptAction(_pawn, _id, _args, _context)

func isPawnInvolved(pawn) -> bool:
	if(pawn is String):
		pawn = getPawn(pawn)
	if(charIDToRole.has(pawn.charID)):
		return true
	#for role in involvedPawns:
	#	if(getRolePawn(role) == pawn):
	#		return true
	return false

func doRemoveRole(role:String):
	if(!involvedPawns.has(role)):
		return false
	var pawn = getRolePawn(role)
	var _ok = involvedPawns.erase(role)
	var _ok2 = charIDToRole.erase(pawn.charID)
	if(!isPawnInvolved(pawn)):
		pawn.setInteraction(null)

func doInvolvePawn(role:String, pawn, tpPawn:bool = true):
	if(pawn is String):
		pawn = getPawn(pawn)
	if(involvedPawns.has(role)):
		doRemoveRole(role)
	assert(!isPawnInvolved(pawn))
	
	if(!isPawnInvolved(pawn)):
		GM.main.IS.stopInteractionsForPawnID(pawn.charID)
	involvedPawns[role] = pawn.charID
	charIDToRole[pawn.charID] = role
	pawn.setInteraction(self)
	if(tpPawn):
		pawn.setLocation(getLocation())

func doInvolveRole(role:String, pawn, tpPawn:bool = true):
	return doInvolvePawn(role, pawn, tpPawn)

func rebuildCharIDToRole():
	charIDToRole.clear()
	for role in involvedPawns:
		charIDToRole[involvedPawns[role]] = role

func setState(newState:String, newRole:String, dirToRole:String = ""):
	setCurrentPawn(newRole)
	setDirectedToPawn(dirToRole)
	state = newState
	currentActionID = ""
	currentActionArgs = {}

func getState() -> String:
	return state

func setCurrentPawn(therole:String):
	currentPawn = therole

func setDirectedToPawn(theRole:String):
	if(theRole == ""):
		for role in involvedPawns:
			if(role == currentPawn):
				continue
			directedToPawn = role
			return
		directedToPawn = ""
		return
	directedToPawn = theRole

func getDirectedToPawn() -> CharacterPawn:
	if(!involvedPawns.has(directedToPawn)):
		return null
	return getRolePawn(directedToPawn)

func setCurrentRole(therole:String):
	setCurrentPawn(therole)

func getCurrentPawn() -> CharacterPawn:
	return getRolePawn(currentPawn)

func isPlayersTurn() -> bool:
	var curPawn := getCurrentPawn()
	if(curPawn == null):
		return false
	return curPawn.isPlayer()

func setPickedAction(_actionEntry, _context:Dictionary = {}):
	currentActionID = _actionEntry["id"]
	currentActionArgs = (_actionEntry["args"] if _actionEntry.has("args") else {})

	var theTime:int = 0
	if(_actionEntry.has("time")):
		theTime = _actionEntry["time"]
	busyActionSeconds = theTime
	
	if(_actionEntry.has("actionText")):
		currentActionText = _actionEntry["actionText"]
	else:
		currentActionText = ""
	
	if(_actionEntry.has("start_fight")):
		var fightersData = _actionEntry["start_fight"]
		currentActionArgs["fight"] = _actionEntry["start_fight"]
		
		var whoID:String = involvedPawns[fightersData[0]]
		var withWhomID:String = involvedPawns[fightersData[1]]
		
		if((whoID == "pc" || withWhomID == "pc") && _context.has("scene")):
			if(_context["scene"].has_method("startInteractionFight")):
				isWaitingScene = true
				_context["scene"].startInteractionFight(whoID, withWhomID)

	if(_actionEntry.has("start_sex")):
		var fightersData = _actionEntry["start_sex"]
		currentActionArgs["sex"] = _actionEntry["start_sex"]
		
		var whoID:String = involvedPawns[fightersData[0]]
		var withWhomID:String = involvedPawns[fightersData[1]]
		var sexType = SexType.DefaultSex
		var extraParams:Dictionary = {}
		if(fightersData.size() > 2):
			sexType = fightersData[2]
		if(fightersData.size() > 3):
			extraParams = fightersData[3]
		
		if(_context.has("scene")):
			if(_context["scene"].has_method("startInteractionSex")):
				isWaitingScene = true
				_context["scene"].startInteractionSex(whoID, withWhomID, sexType, extraParams)

func getSexResult(_args:Dictionary, checkForUncon=false):
	if(_args.has("scene_result")):
		if(checkForUncon):
			checkUncon(_args["scene_result"])
		return _args["scene_result"]
	
	var _fightersData = currentActionArgs["sex"]
	
	#print("SEEEEEEEEEEEX")
	# Do sex stuff here
	var domID:String = getRoleID(_fightersData[0])
	var subID:String = getRoleID(_fightersData[1])
	var sexType = (_fightersData[2] if _fightersData.size() > 2 else SexType.DefaultSex)
	
	var sexEngine = SexEngine.new()
	sexEngine.initPeople([domID], [subID])
	sexEngine.initSexType(sexType)
	sexEngine.generateGoals()
	
	var newResult:Dictionary = sexEngine.doFastSex()
	
	_args["scene_result"] = newResult

	doSexAftermath(_fightersData, newResult)

	if(checkForUncon):
		checkUncon(newResult)
	
	return newResult

func getFightResult(_args:Dictionary):
	if(_args.has("scene_result")):
		return _args["scene_result"]
	
	var _fightersData = currentActionArgs["fight"]
	
	#print("FIIIIIIIIIIGHT")
	# Simulate fight here
	var pawn1 = getRolePawn(_fightersData[0])
	var pawn2 = getRolePawn(_fightersData[1])
	var pawn1FightScore = pawn1.calculatePowerScore()
	var pawn2FightScore = pawn2.calculatePowerScore()
	
	var randTable:Array = [
		[true, pawn1FightScore*pawn1FightScore],
		[false, pawn2FightScore*pawn2FightScore],
	]
	var didWin:bool = RNG.pickWeightedPairs(randTable)
	
	pawn1.getChar().addFightExperienceAuto(pawn2.charID, didWin)
	pawn2.getChar().addFightExperienceAuto(pawn1.charID, !didWin)
	
	var newResult:Dictionary = {won=didWin}
	_args["scene_result"] = newResult
	
	doFightAftermath(_fightersData, newResult)
	
	return newResult

func doFightAftermath(_fightersData, newResult):
	var wonPawn = getRolePawn(_fightersData[0 if newResult["won"] else 1])
	var lostPawn = getRolePawn(_fightersData[1 if newResult["won"] else 0])
	if(wonPawn != null):
		wonPawn.afterWonFight()
		
		GM.main.WHS.addEvent(WHEvent.WonFight, wonPawn.charID, lostPawn.charID)
		
		if(wonPawn.isPlayer() && lostPawn != null):
			var pawnWonPower:float = wonPawn.calculatePowerScore()
			var pawnLostPower:float = lostPawn.calculatePowerScore()
			var powerScale:float = sqrt(pawnLostPower / max(0.1, pawnWonPower + pawnLostPower))
			if(lostPawn.isInmate()):
				wonPawn.addRepScore(RepStat.Inmates, powerScale)
			else:
				wonPawn.addRepScore(RepStat.Staff, powerScale)
	if(lostPawn != null):
		lostPawn.afterLostFight()
		
		#GM.main.WHS.addEvent(WHEvent.LostFight, lostPawn.charID, wonPawn.charID)
		
		if(lostPawn.isPlayer() && wonPawn != null):
			var pawnWonPower:float = wonPawn.calculatePowerScore()
			var pawnLostPower:float = lostPawn.calculatePowerScore()
			var powerScale:float = sqrt(pawnWonPower / max(0.1, pawnWonPower + pawnLostPower))
			if(wonPawn.isInmate()):
				lostPawn.addRepScore(RepStat.Inmates, -powerScale)
			else:
				lostPawn.addRepScore(RepStat.Staff, -powerScale)

func doSexAftermath(_sexData, _newResult):
	var domPawn = getRolePawn(_sexData[0])
	var subPawn = getRolePawn(_sexData[1])
	var sexType = (_sexData[2] if _sexData.size() > 2 else SexType.DefaultSex)
	
	if(domPawn != null):
		domPawn.afterSex(true)
		
		GM.main.WHS.addEvent(WHEvent.Fucked, domPawn.charID, subPawn.charID)
	if(subPawn != null):
		subPawn.afterSex(false)
		
		#GM.main.WHS.addEvent(WHEvent.GotFucked, subPawn.charID, domPawn.charID)
	
	var domSatisfaction:float = 0.0
	var subSatisfaction:float = 0.0
	if(_newResult.has("doms")):
		for domID in _newResult["doms"]:
			domSatisfaction += _newResult["doms"][domID]["satisfaction"]
		domSatisfaction /= _newResult["doms"].size()
	if(_newResult.has("subs")):
		for subID in _newResult["subs"]:
			subSatisfaction += _newResult["subs"][subID]["satisfaction"]
		subSatisfaction /= _newResult["subs"].size()
	_newResult["domSatisfaction"] = domSatisfaction
	_newResult["subSatisfaction"] = subSatisfaction
	var averageSatisfaction:float = (subSatisfaction + domSatisfaction) / 2.0
	_newResult["averageSatisfaction"] = averageSatisfaction
	
	if(domPawn != null && subPawn != null):
		affectAffection(_sexData[0], _sexData[1], (min(domSatisfaction, subSatisfaction) - 0.5)*0.4)
		affectLust(_sexData[0], _sexData[1], (averageSatisfaction - 0.5)*0.5)
		
		#if(sexType in [SexType.StocksSex, SexType.SlutwallSex]):
		#	subPawn.addRepScore(RepStat.Alpha, -domSatisfaction * 0.5)
		
		if(domSatisfaction > 0.7 || (sexType != SexType.DefaultSex)):
			subPawn.addRepScore(RepStat.Whore, domSatisfaction * 0.3)
		elif(domSatisfaction < 0.2):
			subPawn.addRepScore(RepStat.Whore, -(1.0-domSatisfaction) * 3.0)
		elif(domSatisfaction < 0.4):
			subPawn.addRepScore(RepStat.Whore, -(1.0-domSatisfaction) * 1.0)
		
		if(subSatisfaction > 0.8):
			domPawn.addRepScore(RepStat.Alpha, subSatisfaction * 0.4)

func doCurrentAction(_context:Dictionary = {}):
	if(currentActionID == "" || wasDeleted):
		return
	
	doActionFinal(currentActionID, currentActionArgs, _context)
	currentActionID = ""
	currentActionArgs = {}
	busyActionSeconds = 0

#func getNextInteractionTime() -> int:
#	return 30

func getLocation() -> String:
	return location

func isPlayerInvolved() -> bool:
	if(charIDToRole.has("pc")):
		return true
	#for role in involvedPawns:
	#	if(involvedPawns[role] == "pc"):
	#		return true
	return false

#func markAsUpdated():
#	lastUpdatedSeconds = GM.main.getTime()

func getPawn(pawnID:String) -> CharacterPawn:
	return GM.main.IS.getPawn(pawnID)

func getRolePawn(role:String) -> CharacterPawn:
	if(involvedPawns.has(role)):
		return getPawn(involvedPawns[role])
	return null

func getRoleID(role:String) -> String:
	if(involvedPawns.has(role)):
		return (involvedPawns[role])
	return ""

func setLocation(newLoc:String):
	location = newLoc
	
	for role in involvedPawns:
		var thePawn = getPawn(involvedPawns[role])
		if(thePawn == null):
			continue
		thePawn.setLocation(location)

func goTowards(theTarget:String):
	if(getLocation() == theTarget):
		cachedTarget = ""
		cachedPath = []
		return true
	
	if(cachedTarget != theTarget):
		cachedTarget = theTarget
		cachedPath = GM.world.calculatePath(getLocation(), cachedTarget)
		if(cachedPath.size() > 0):
			cachedPath.remove(0)
		#print(getLocation(), " ", cachedTarget, " ", cachedPath)
		if(cachedPath.size() <= 0):
			cachedTarget = ""
			return false
	
	if(cachedTarget == theTarget):
		if(cachedPath.size() > 0):
			setLocation(cachedPath[0])
			cachedPath.remove(0)
	
	if(getLocation() == theTarget):
		cachedTarget = ""
		cachedPath = []
		return true
	return false

func doWander() -> bool:
	var randomDir = RNG.pick(GameWorld.getAllDirections())
	
	if(GM.world.canGoID(location, randomDir)):
		setLocation(GM.world.applyDirectionID(location, randomDir))
		return true
	return false

func doWanderGurantee() -> bool:
	var canGoDirs = []
	for theDir in GameWorld.getAllDirections():
		if(GM.world.canGoID(location, theDir)):
			canGoDirs.append(theDir)
	
	if(canGoDirs.size() <= 0):
		return false
	if(canGoDirs.size() > 1):
		canGoDirs.erase(GameWorld.getOppositeDir(cachedLastDir))
	var randomDir = RNG.pick(canGoDirs)
	cachedLastDir = randomDir
	setLocation(GM.world.applyDirectionID(location, randomDir))
	return true

func getCurrentAction() -> String:
	return currentActionID

func processTime(_howMuch:int):
	pass

func stopMe():
	GM.main.IS.stopInteraction(self)

func getDebugInfo():
	return [
		#"ID: "+str(id),
		#"Location: "+str(location),
		#"currentPawn: "+str(currentPawn),
		"currentActionID: "+str(currentActionID),
		"state: "+str(getState()),
		"busyActionSeconds: "+str(busyActionSeconds),
		"currentPawn: "+str(currentPawn),
		#"involvedPawns: "+str(involvedPawns),
	]

func receiveSceneStatusFinal(_result:Dictionary):
	isWaitingScene = false
	
	currentActionArgs["scene_result"] = _result
	
	if(currentActionArgs.has("fight")):
		doFightAftermath(currentActionArgs["fight"], currentActionArgs["scene_result"])
	if(currentActionArgs.has("sex")):
		doSexAftermath(currentActionArgs["sex"], currentActionArgs["scene_result"])
	
	doCurrentAction()

func isWaitingForScene() -> bool:
	return isWaitingScene

func startInteraction(interactionID:String, _involvedPawns:Dictionary, args:Dictionary = {}):
	GM.main.IS.startInteraction(interactionID, _involvedPawns, args)

func getCurrentActionText() -> String:
	return currentActionText

func isBeingSpied() -> bool:
	for role in involvedPawns:
		if(GM.main.isPawnIDBeingSpied(involvedPawns[role])):
			return true
	return false

#	currentActionID = _actionEntry["id"]
#	currentActionArgs = (_actionEntry["args"] if _actionEntry.has("args") else {})
#
#	var theTime:int = 0
#	if(_actionEntry.has("time")):
#		theTime = _actionEntry["time"]
#	busyActionSeconds = theTime

func getKeepInteractionScoreFor(_role:String):
	return 1.0

func getKeepInteractionScoreForCharID(_charID:String):
	if(charIDToRole.has(_charID)):
		return getKeepInteractionScoreFor(charIDToRole[_charID])
	#for role in involvedPawns:
	#	if(involvedPawns[role] == _charID):
	#		return getKeepInteractionScoreFor(role)
	return 0.0

func doLookAround(role:String, keepScoreMult:float = 1.0):
	if(wasDeleted):
		return false
	if(GM.main.IS.areInteractionsDisabled()):
		return false
	var pawn = getRolePawn(role)
	if(!pawn.canInterrupt()):
		return false
	var loc:String = pawn.getLocation()
	
	var allPawns:Array = GM.main.IS.getPawnsAt(loc)
	
	return pawn.tryInterruptPawns(allPawns, keepScoreMult)

func shoutForInterruptions(role:String, searchDepth:int, maxDist:float = -1.0, keepScoreMult:float = 1.0, pcMessage:String = ""):
	var pawn = getRolePawn(role)
	var allPawnIDs = GM.main.IS.getPawnIDsNear(pawn.getLocation(), searchDepth, maxDist)
	allPawnIDs.shuffle()
	for otherPawnID in allPawnIDs:
		var otherPawn = getPawn(otherPawnID)
		if(otherPawn == self):
			continue
		if(otherPawn.isPlayer() && !pawn.isPlayer()):
			if(pcMessage != ""):
				addMessage(pcMessage)
			continue

		if(!otherPawn.canInterrupt()):
			continue
		
		if(otherPawn.tryInterruptPawns([pawn], keepScoreMult)):
			return true
	return false

func doesStealControlFromPC() -> bool:
	return true

func getAllInvolvedCharIDs() -> Array:
	var result := []
	
	for role in involvedPawns:
		var pawn = getRolePawn(role)
		if(pawn != null):
			if(!result.has(pawn.charID)):
				result.append(pawn.charID)
	return result




func scoreFetish(role:String, fetishes:Dictionary, onlyPositive:bool = false) -> float:
	if(!involvedPawns.has(role)):
		Log.printerr("Bad role found: "+role)
		return 0.0
	return getRolePawn(role).scoreFetish(fetishes, onlyPositive)

func scoreFetishMax(role:String, fetishes:Dictionary, minValue:float = -999.9) -> float:
	if(!involvedPawns.has(role)):
		Log.printerr("Bad role found: "+role)
		return 0.0
	return getRolePawn(role).scoreFetishMax(fetishes, minValue)

func scorePersonality(role:String, personalityStats:Dictionary, onlyPositive:bool = false) -> float:
	if(!involvedPawns.has(role)):
		Log.printerr("Bad role found: "+role)
		return 0.0
	return getRolePawn(role).scorePersonality(personalityStats, onlyPositive)

func scorePersonalityMax(role:String, personalityStats:Dictionary, minValue:float = -999.9) -> float:
	if(!involvedPawns.has(role)):
		Log.printerr("Bad role found: "+role)
		return 0.0
	return getRolePawn(role).scorePersonalityMax(personalityStats, minValue)

func scoreExposed(role:String) -> float:
	if(!involvedPawns.has(role)):
		Log.printerr("Bad role found: "+role)
		return 0.0
	return getRolePawn(role).scoreExposed()

func scoreLike(role1:String, role2:String) -> float:
	if(!involvedPawns.has(role1) || !involvedPawns.has(role2)):
		Log.printerr("Bad roles found")
		return 0.0
	return getRolePawn(role1).scoreLike(getRoleID(role2))

func scoreHate(role1:String, role2:String) -> float:
	if(!involvedPawns.has(role1) || !involvedPawns.has(role2)):
		Log.printerr("Bad roles found")
		return 0.0
	return getRolePawn(role1).scoreHate(getRoleID(role2))

func scoreAffection(role1:String, role2:String) -> float:
	if(!involvedPawns.has(role1) || !involvedPawns.has(role2)):
		Log.printerr("Bad roles found")
		return 0.0
	return getRolePawn(role1).scoreAffection(getRoleID(role2))

func scoreLust(role1:String, role2:String) -> float:
	if(!involvedPawns.has(role1) || !involvedPawns.has(role2)):
		Log.printerr("Bad roles found")
		return 0.0
	return getRolePawn(role1).scoreLust(getRoleID(role2))

func affectAffection(role1:String, role2:String, howMuch:float):
	if(!involvedPawns.has(role1) || !involvedPawns.has(role2)):
		Log.printerr("Bad roles found")
		return
	getRolePawn(role1).affectAffection(getRoleID(role2), howMuch)

func affectLust(role1:String, role2:String, howMuch:float):
	if(!involvedPawns.has(role1) || !involvedPawns.has(role2)):
		Log.printerr("Bad roles found")
		return
	getRolePawn(role1).affectLust(getRoleID(role2), howMuch)

func isDoingTask(_taskID:String) -> bool:
	return false

func getInvolvedPawnIDs() -> Array:
	var result := []
	
	for role in involvedPawns:
		result.append(involvedPawns[role])
	
	return result

func makeRoleExhausted(role:String):
	var pawn = getRolePawn(role)
	if(pawn == null):
		return
	pawn.makeExhausted()

func addMessage(text: String):
	GM.main.addMessage(text)

func runScene(sceneid: String, args = [], tag = ""):
	var scene = GM.main.runScene(sceneid, args)
	scene.sceneTag = tag

func sayLine(role:String, lineID:String, args:Dictionary, actualArgs:Dictionary = {}):
	if(!isBeingSpied() && !isPlayerInvolved()): # Optimisation
		return ""
	var processedArgs = {}
	for argID in args: # Assumes all the args are characters
		processedArgs[argID] = getRoleID(args[argID])
	if(!actualArgs.empty()):
		for argID in actualArgs:
			processedArgs[argID] = actualArgs[argID]
	
	saynn("[say="+role+"]"+ModularDialogue.generate(lineID, processedArgs)+"[/say]")

func doDexterityCheck(_roleActs:String, _roleReacts:String) -> bool:
	return RNG.chance(50)

func addDefeatButtons(rolePC:String, _roleNPC:String):
	if(involvedPawns.has(rolePC) && getRolePawn(rolePC).isPlayer()):
		addAction("builtin_inv", "Inventory", "Open the inventory", "default", 0.0, 0, {})
		if(GM.pc.getInventory().hasRemovableRestraints()):
			addAction("builtin_struggle", "Struggle", "Try to remove some of your restraints", "default", 0.0, 0, {})
		
		if(involvedPawns.has(_roleNPC)):
			GM.ES.triggerRun(Trigger.DefeatedDynamicNPC, [getRoleID(_roleNPC)])

func triggerTalkRunEvents(role:String):
	if(isPlayersTurn()):
		GM.ES.triggerRun(Trigger.TalkingToDynamicNPC, [getRoleID(role)])

func triggerTalkReactEvents(role:String):
	if(GM.ES.triggerReact(Trigger.TalkingToDynamicNPC, [getRoleID(role)])):
		return true
	return false

func getPawnAmount() -> int:
	return involvedPawns.size()
func getPawnCount() -> int:
	return involvedPawns.size()

func addChatTopics(startRole:String, reactRole:String, actionID:String, topicsAmount:int = 7):
	#var startPawn = getRolePawn(startRole)
	#var reactPawn = getRolePawn(reactRole)
	
	var picked:Array = []
	var tryCount:int = 0
	while(picked.size() < topicsAmount):
		tryCount += 1
		if(tryCount >= 1000):
			break
		var randomTopicObj:TopicBase = RNG.pick(GlobalRegistry.getLustTopicObjects())
		var randomTopicID:String = RNG.pick(randomTopicObj.handles_ids)
		
		if(!randomTopicObj.canUseInChat(randomTopicID)):
			continue
		if(picked.has(randomTopicID)):
			continue
		picked.append(randomTopicID)
	
	var possibleEnds:Array = [
		["nice", 1.0],
		["cool", 1.0],
		["hot", 1.0],
		["awful", -1.0],
		["meh", -1.0],
		["yikes", -1.0],
	]
	
	for pickedID in picked:
		var topic: TopicBase = GlobalRegistry.getLustTopic(pickedID)
		
		var chatName:String = topic.getChatName(pickedID)
		var shouldUseAre:bool = topic.shouldUseAre(pickedID)
		var randomEndInfo:Array = RNG.pick(possibleEnds)
		
		var buttonName:String = Util.capitalizeFirstLetter(chatName)
		if(shouldUseAre):
			buttonName += " are "
		else:
			buttonName += " is "
		buttonName += randomEndInfo[0]
		
		addAction(actionID, buttonName, "Say this: "+buttonName, "default", 1.0, 60, {
			args = {
				chat = {
					startRole = startRole,
					reactRole = reactRole,
					topicID = pickedID,
					topicEndName = randomEndInfo[0],
					topicFull = buttonName,
					topicEndValue = randomEndInfo[1],
				},
			}
		})

func addReactToChatButtons(chatEntry:Dictionary, actionID:String):
	#var startRole:String = chatEntry["startRole"]
	var reactRole:String = chatEntry["reactRole"]
	var topicID:String = chatEntry["topicID"]
	var topicEndValue:float = chatEntry["topicEndValue"]
	
	var reactChar:BaseCharacter = getRoleChar(reactRole)
	var lust:LustInterests = reactChar.getLustInterests()

	var interestValue:float = lust.getInterestValue(topicID)
	
	var agreeScore:float = 0.0
	var disagreeScore:float = 0.0
	var whateverScore:float = 0.0
	
	if(abs(interestValue) < 0.01):
		whateverScore = 1.0
	elif(sign(interestValue) == sign(topicEndValue)):
		agreeScore = 1.0
	else:
		disagreeScore = 1.0
	
	addAction(actionID, "Agree", "Agree with what they said", "default", agreeScore, 60,{
		args = {answer="agree",chat=chatEntry,},
	})
	addAction(actionID, "Disagree", "Disagree with what they said", "default", disagreeScore, 60,{
		args = {answer="disagree",chat=chatEntry,},
	})
	addAction(actionID, "Whatever", "You don't know how you feel about their words", "default", whateverScore, 60,{
		args = {answer="whatever",chat=chatEntry,},
	})

func doReactToChat(_args:Dictionary, skipPcCheck:bool = true):
	var answer:String = _args["answer"]
	var chatEntry:Dictionary = _args["chat"]
	
	var startRole:String = chatEntry["startRole"]
	var reactRole:String = chatEntry["reactRole"]
	var topicID:String = chatEntry["topicID"]
	
	var reactChar:BaseCharacter = getRoleChar(reactRole)
	var lust:LustInterests = reactChar.getLustInterests()
	var interestValue:float = lust.getInterestValue(topicID)
	if(reactChar.isPlayer()):
		interestValue = 1.0
	
	var startPawn = getRolePawn(startRole)
	var reactPawn = getRolePawn(reactRole)
	
	if(answer == "agree"):
		affectAffection(reactRole, startRole, abs(interestValue) * 0.15)
		startPawn.afterSocialInteraction()
	if(answer == "whatever"):
		affectAffection(reactRole, startRole, 0.03)
		startPawn.afterSocialInteraction()
	if(answer == "disagree"):
		affectAffection(reactRole, startRole, -abs(interestValue) * 0.05)
		startPawn.afterFailedSocialInteraction()
	reactPawn.afterSocialInteraction()
	
	if(skipPcCheck || getRoleChar(startRole).isPlayer()):
		if(reactChar.isPlayer()):
			return
		if(lust.learnRandomInterestFromList([topicID])):
			addMessage("You learned something new about "+reactChar.getName()+"'s likes and dislikes..")
	
func showKnownLikesDislikesFor(role:String):
	var npc = getRoleChar(role)
	var npcName = npc.getName()
	var likesTexts = []
	likesTexts.append("Here is what you know about "+npcName+"'s likes/dislikes:")
	var enemyLustInterests = npc.getLustInterests()
	if(!enemyLustInterests.hasAnyInterests()):
		likesTexts.append("- None")
	else:
		var whatPlayerKnows = enemyLustInterests.getPlayerKnowledge()
		
		if(whatPlayerKnows.size() > 0):
			for topicID in whatPlayerKnows:
				var topic = GlobalRegistry.getLustTopic(topicID)
				likesTexts.append(npcName+" [color="+Interest.getColorString(whatPlayerKnows[topicID])+"]" + Interest.getVisibleName(whatPlayerKnows[topicID])+"[/color] seeing "+str(topic.getVisibleName(topicID)))
		else:
			likesTexts.append("- Nothing yet")
	var finalText = (Util.join(likesTexts, "\n"))
	saynn(finalText)
	
func getAffectionString(role1:String, role2:String) -> String:
	var id1:String = getRoleID(role1)
	var id2:String = getRoleID(role2)
	var affection:float = GM.main.RS.getAffection(id1, id2)
	
	return str(Util.roundF(affection*100.0, 1))+"%"
	
func getLustString(role1:String, role2:String) -> String:
	var id1:String = getRoleID(role1)
	var id2:String = getRoleID(role2)
	var affection:float = GM.main.RS.getLust(id1, id2)
	
	return str(Util.roundF(affection*100.0, 1))+"%"
	
func shouldShowBigButtons() -> bool:
	return false
	
func canRoleBeInterrupted(_role:String) -> bool:
	return false
	
func canCharIDBeInterrupted(_charID:String) -> bool:
	if(charIDToRole.has(_charID)):
		return canRoleBeInterrupted(charIDToRole[_charID])
	#for roleID in involvedPawns:
	#	if(involvedPawns[roleID] == _charID):
	#		return canRoleBeInterrupted(roleID)
	return false
	
func addLustFocusButtons(actionID:String, _role1:String, _role2:String):
	for focus in LustFocus.getAll():
		var buttonName:String = LustFocus.getButtonName(focus)
		var buttonDesc:String = LustFocus.getButtonDesc(focus)
		
		addAction(actionID, buttonName, buttonDesc, "default", 1.0, 120, {
			args = {
				lust = {
					focus = focus,
					role1 = _role1,
					role2 = _role2,
				},
			}
		})
		
func addReactToLustFocusButtons(actionID:String, lustEntry:Dictionary):
	var focus = lustEntry["focus"]
	var _role1:String = lustEntry["role1"]
	var _role2:String = lustEntry["role2"]
	
	var role1pawn = getRolePawn(_role1)
	var role2pawn = getRolePawn(_role2)
	
	var likeness:float = role2pawn.getFocussedLikeness(role1pawn, focus, true)
	
	var affection:float = scoreAffection(_role2, _role1)
	var lust:float = scoreLust(_role2, _role1)
	var naive:float = scorePersonality(_role2, {PersonalityStat.Naive: 1.0})
	if(affection < (0.5 - 0.45 * naive)):
		likeness *= max(affection, lust)
		lustEntry["reason"] = " (affection is too low)"
	else:
		if(likeness <= 0.6):
			lustEntry["reason"] = " (didn't like the sight)"
		else:
			lustEntry["reason"] = ""
	
	if(role2pawn.isPlayer()):
		likeness = 1.0
		lustEntry["reason"] = ""
	
	#print("LIKENESS: ",likeness)
	
	addAction(actionID, "Accept", "Accept the flirt", "default", likeness*likeness, 60, {
		args = {
			#lust = lustEntry,
			answer = "accept",
			likeness = likeness,
		},
	})
	addAction(actionID, "Deny", "Deny their flirt", "default", 1.0 - likeness*likeness, 60, {
		args = {
			#lust = lustEntry,
			answer = "deny",
			likeness = likeness,
		},
	})

func reactToLustFocus(args:Dictionary, lustEntry:Dictionary):
	#var lustEntry:Dictionary = args["lust"]
	var answer:String = args["answer"]
	var likeness:float = args["likeness"]
	lustEntry["answer"] = answer
	lustEntry["likeness"] = likeness

	#var focus = lustEntry["focus"]
	var _role1:String = lustEntry["role1"]
	var _role2:String = lustEntry["role2"]
	
	var role1pawn = getRolePawn(_role1)
	var role2pawn = getRolePawn(_role2)
	role1pawn.afterSocialInteraction()
	role2pawn.afterSocialInteraction()
	
	if(answer == "accept"):
		affectLust(_role2, _role1, max(likeness, 0.1) * 0.3)
	elif(answer == "deny"):
		affectLust(_role2, _role1, -max(1.0-likeness, 0.2) * 0.2)
		affectAffection(_role1, _role2, -max(1.0-likeness, 0.1) * 0.05)
	
	return likeness

func getActivityIconForRole(_role:String):
	if(getPawnCount() > 1):
		return RoomStuff.PawnActivity.Chat
	return RoomStuff.PawnActivity.None

func getActivityIconForRoleFinal(_role:String):
	if(currentActionArgs.has("fight")):
		return RoomStuff.PawnActivity.Fight
	if(currentActionArgs.has("sex")):
		return RoomStuff.PawnActivity.Sex
	return getActivityIconForRole(_role)

func getActivityIconForPawn(pawn):
	if(pawn == null):
		return RoomStuff.PawnActivity.None
	if(charIDToRole.has(pawn.charID)):
		return getActivityIconForRoleFinal(charIDToRole[pawn.charID])
	#for role in involvedPawns:
	#	if(involvedPawns[role] == pawn.charID):
	#		return getActivityIconForRoleFinal(role)
	return RoomStuff.PawnActivity.None

func isPawnBeingFucked(pawn) -> bool:
	if(!currentActionArgs.has("sex")):
		return false
	if(currentActionArgs["sex"][1] == getRoleForPawn(pawn)):
		return true
	return false

func isPawnFuckingSomeone(pawn) -> bool:
	if(!currentActionArgs.has("sex")):
		return false
	if(currentActionArgs["sex"][0] == getRoleForPawn(pawn)):
		return true
	return false

func triggerRandomStocksEvent(_lewdChance, _willingSexChance, _unWillingSexChance, _nothingChance):
	if(!isPlayersTurn()):
		return false
	var eventType = RNG.pickWeighted(["StocksEvent", "StocksWillingSex", "StocksUnWillingSex", ""], [_lewdChance, _willingSexChance, _unWillingSexChance, _nothingChance])
	
	if(eventType == "StocksEvent"):
		if(GM.ES.triggerReact("StocksEvent")):
			return true

	if(eventType == "StocksWillingSex"):
		if(GM.ES.triggerReact("StocksWillingSex")):
			return true
			
	if(eventType == "StocksUnWillingSex"):
		if(GM.ES.triggerReact("StocksUnWillingSex")):
			return true
	
	return false

func roleCanStartSex(role:String) -> bool:
	var character = getRoleChar(role)
	if(character == null):
		return false
	return character.canStartSex()

func getStocksScoreMult() -> float:
	if(isPlayerInvolved()):
		return 1.0
	var stocksAmount:int = GM.main.IS.getInteractionsOfTypeAmount("InStocks")
	
	if(stocksAmount >= 4):
		return 0.01
	if(stocksAmount >= 3):
		return 0.5
	return 1.0

func canGetToStocks() -> bool:
	var room = GM.world.getRoomByID(getLocation())
	if(room == null):
		return false
	var floorID:String = room.getFloorID()
	
	return (floorID in ["Cellblock", "MainHall"])

func canGetToSlutwall() -> bool:
	var room = GM.world.getRoomByID(getLocation())
	if(room == null):
		return false
	var floorID:String = room.getFloorID()
	
	if(!GM.main.getFlag("FightClubModule.BulldogBypassed")):
		return false
	
	return (floorID in ["FightClubFloor", "MainHall"])

func getSlutwallScoreMult() -> float:
	if(isPlayerInvolved()):
		return 1.0
	var stocksAmount:int = GM.main.IS.getInteractionsOfTypeAmount("InSlutwall")
	
	if(stocksAmount >= 3):
		return 0.01
	if(stocksAmount >= 2):
		return 0.2
	return 1.0

func checkUncon(sexResult):
	if(sexResult == null):
		return
	
	if(sexResult.has("subs")):
		for subID in sexResult["subs"]:
			var info = sexResult["subs"][subID]
			
			if(info.has("isUnconscious") && info["isUnconscious"]):
				startInteraction("Unconscious", {main=subID})

func triggerUnconsciousPCGrabEvent(_pawn):
	if(_pawn == null):
		return false
	if(GM.ES.triggerReact(Trigger.UnconsciousPCGrabbed, [_pawn.charID])):
		return true
	
	return false

func getPreviewLineForPawn(_pawn) -> String:
	if(charIDToRole.has(_pawn.charID)):
		return getPreviewLineForRoleFinal(charIDToRole[_pawn.charID])
	#for role in involvedPawns:
	#	if(involvedPawns[role] == _pawn.charID):
	#		return getPreviewLineForRoleFinal(role)
	return ""

func getPreviewLineForRoleFinal(_role:String) -> String:
	if(currentActionArgs.has("sex")):
		var sexData = currentActionArgs["sex"]
		if(sexData.size() >= 2):
			if(sexData[0] == _role):
				return "{pawn.name} is fucking {"+sexData[1]+".name}"
			if(sexData[1] == _role):
				return "{pawn.name} is being fucked by {"+sexData[0]+".name}"
	if(currentActionArgs.has("fight")):
		var fightData = currentActionArgs["fight"]
		if(fightData.size() >= 2):
			if(fightData[0] == _role):
				return "{pawn.name} is fighting with {"+fightData[1]+".name}"
			if(fightData[1] == _role):
				return "{pawn.name} is fighting back from {"+fightData[0]+".name}"
	
	return getPreviewLineForRole(_role)

func getPreviewLineForRole(_role:String) -> String:
	return "{pawn.name} is in a "+id+" interaction"

func findProstitutionTargetsNearby(_ignoreList:Array = []) -> Array:
	var result:Array = []
	
	var pawnIDs = GM.main.IS.getPawnIDsNear(getLocation(), 1)
	for pawnID in pawnIDs:
		if(isPawnInvolved(pawnID)):
			continue
		var thePawn = getPawn(pawnID)
		if(!thePawn.canBeInterrupted() || thePawn.getSocial() <= 0.4 || _ignoreList.has(pawnID)):
			continue
		result.append(pawnID)
	return result

func sendSlaveryActivityEvent(_role:String, _eventID:String, _args:Dictionary):
	var thePawn = getRolePawn(_role)
	if(thePawn != null):
		thePawn.sendSlaveryActivityEvent(_eventID, _args)

func shouldBeStoppedOnNewDay() -> bool:
	for role in involvedPawns:
		var thePawn = getRolePawn(role)
		
		if(thePawn.isPlayer() || thePawn.isSlaveToPlayer()):
			return false
	return true

func getPawnRep(_role:String):
	var thePawn = getRolePawn(_role)
	if(thePawn == null):
		return null
	return thePawn.getCharacter().getReputation()

# Maybe a generic version?
func doReactOnLeash(_leasherRole:String, _leashedRole:String):
	if(!GM.main.shouldExecuteOnceCodeblocksRun()):
		return
	# Only for player because optimization
	if(!getRolePawn(_leashedRole).isPlayer()):
		return
	
	var pawns:Array = GM.main.IS.getPawnsAt(getLocation())
	
	var rep:ReputationPlaceholder = getPawnRep(_leashedRole)
	
	for pawn in pawns:
		if(isPawnInvolved(pawn)):
			continue
		if(!pawn.canInterrupt()):
			continue
		saynn("{"+pawn.charID+".name} walks by and notices {"+_leashedRole+".you} on a leash..")
		saynn("[say="+pawn.charID+"]WHAT A SLUT![/say]")
		rep.addRep(RepStat.Whore, 0.05)

func getRoleForCharID(_charID:String) -> String:
	if(charIDToRole.has(_charID)):
		return charIDToRole[_charID]
	return ""

func getRoleForPawn(_pawn) -> String:
	return getRoleForCharID(_pawn.charID)

func isRoleOnALeash(_role:String) -> bool:
	return false

func isRoleLeashing(_role:String) -> bool:
	return false

func doRepEvent(_role:String, _eventID:String):
	var character = getRoleChar(_role)
	if(character != null):
		var rep:ReputationPlaceholder = character.getReputation()
		rep.handleSpecialEvent(_eventID)

func addRepScore(_role:String, _repID:String, _howMuch:float):
	var pawn = getRolePawn(_role)
	if(pawn != null):
		pawn.addRepScore(_repID, _howMuch)

func getRepLevel(_role:String, _repID:String) -> int:
	var pawn = getRolePawn(_role)
	if(pawn != null):
		return pawn.getRepLevel(_repID)
	return 0

func hasRepLevelPC(_role:String, _repID:String, _reqLevel:int) -> bool:
	var pawn = getRolePawn(_role)
	if(pawn != null && pawn.isPlayer()):
		return (pawn.getRepLevel(_repID) >= _reqLevel)
	return true

func addWHSEvent(_eventID:String, whoRole:String, byRole:String, args:Dictionary = {}):
	GM.main.WHS.addEvent(_eventID, getRoleID(whoRole), getRoleID(byRole), args)

func saveData():
	var data = {
		"loc": location,
		"iPawns": involvedPawns,
		"cPawn": currentPawn,
		"dTPawn": directedToPawn,
		"state": state,
		"cAID": currentActionID,
		"cAArgs": currentActionArgs,
		"busySecs": busyActionSeconds,
		"cAText": currentActionText,
		"ws": isWaitingScene,
		"cLD": cachedLastDir,
		"wD": wasDeleted,
		
	}
	return data

func loadData(_data):
	cachedTarget = ""
	cachedPath = []
	textBuffer = []
	actionBuffer = []

	location = SAVE.loadVar(_data, "loc", "main_punishment_spot")
	involvedPawns = SAVE.loadVar(_data, "iPawns", {})
	currentPawn = SAVE.loadVar(_data, "cPawn", "")
	directedToPawn = SAVE.loadVar(_data, "dTPawn", "")
	state = SAVE.loadVar(_data, "state", "")
	currentActionID = SAVE.loadVar(_data, "cAID", "")
	currentActionArgs = SAVE.loadVar(_data, "cAArgs", {})
	busyActionSeconds = SAVE.loadVar(_data, "busySecs", 0)
	currentActionText = SAVE.loadVar(_data, "cAText", "")
	isWaitingScene = SAVE.loadVar(_data, "ws", false)
	cachedLastDir = SAVE.loadVar(_data, "cLD", -1)
	wasDeleted = SAVE.loadVar(_data, "wD", false)
	rebuildCharIDToRole()
