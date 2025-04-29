extends Reference
class_name CharacterPawn

var location:String = "main_punishment_spot"
var charID:String = ""
var pawnTypeID:String = ""
var isDeleted:bool = false

var currentInteraction

# Needs
var hunger:float = 0.0
var social:float = 0.0
var anger:float = 0.0
var tiredness:float = 0.0

var timeSinceLastWork:int = 0.0
var fightExhaustion:float = 0.0

const hungerPerHour:float = 0.2
const socialPerHour:float = 0.5
const angerPerHour:float = 0.1
const fightExhaustionPerHour:float = 2.0
const tirednessPerHour:float = 0.05

func saveData():
	var data = {
		"loc": location,
		"charID": charID,
		"isD": isDeleted,
		"hunger": hunger,
		"social": social,
		"anger": anger,
		"tslw": timeSinceLastWork,
		"fe": fightExhaustion,
		"t": tiredness,
		"pt": pawnTypeID,
	}
	return data

func loadData(_data):
	location = SAVE.loadVar(_data, "loc", "main_punishment_spot")
	charID = SAVE.loadVar(_data, "charID", "")
	isDeleted = SAVE.loadVar(_data, "isD", false)
	hunger = SAVE.loadVar(_data, "hunger", 0.0)
	social = SAVE.loadVar(_data, "social", 0.0)
	anger = SAVE.loadVar(_data, "anger", 0.0)
	timeSinceLastWork = SAVE.loadVar(_data, "tslw", 0)
	fightExhaustion = SAVE.loadVar(_data, "fe", 0.0)
	tiredness = SAVE.loadVar(_data, "t", 0.0)
	pawnTypeID = SAVE.loadVar(_data, "pt", "")

func onSpawn():
	hunger = RNG.randf_range(0.0, 0.3)
	timeSinceLastWork = RNG.randi_range(0, 6000)
	social = RNG.randf_rangeX2(0.0, 0.6)
	tiredness = RNG.randf_range(0.0, 0.1)
	
	var pawnType = getPawnType()
	if(pawnType != null):
		pawnType.onPawnSpawned(self)

func onDelete():
	if(isSlaveToPlayer()):
		getNpcSlavery().onPawnDeleted(self)

	var pawnType = getPawnType()
	if(pawnType != null):
		pawnType.onPawnDeleted(self)

func getChar() -> BaseCharacter:
	if(charID == ""):
		return null
	return GlobalRegistry.getCharacter(charID)

func getCharacter() -> BaseCharacter:
	return getChar()

func getLocation() -> String:
	if(isPlayer()):
		return GM.pc.getLocation()
	return location

func setLocation(newLoc:String):
	var oldLoc = location
	location = newLoc
	if(isPlayer() && newLoc != GM.pc.getLocation()):
		GM.pc.setLocation(newLoc)
	GM.main.IS.onPawnMoved(charID, oldLoc, getLocation())

func processTime(_howMuch:int):
	var pawnType = getPawnType()
	if(pawnType != null && pawnType.customProcessTimeForPawn(self, _howMuch)):
		return
	
	hunger += float(_howMuch) * hungerPerHour / 3600.0
	social += float(_howMuch) * socialPerHour / 3600.0
	recoverExhaustion(float(_howMuch) * fightExhaustionPerHour / 3600.0)
	tiredness += float(_howMuch) * tirednessPerHour / 3600.0
	
	# anger
	var meanness:float = scorePersonality({PersonalityStat.Mean: 1.0})
	if(meanness > 0.0):
		anger += float(_howMuch) * angerPerHour / 3600.0 * meanness
	else:
		anger -= float(_howMuch) * angerPerHour / 3600.0 * max(abs(meanness), 0.1)
		anger = max(anger, 0.0)
	
	timeSinceLastWork += _howMuch
	checkAloneInteraction()

func setInteraction(newInt):
	currentInteraction = newInt
	if(isSlaveToPlayer()):
		getNpcSlavery().onInteractionChanged(newInt)

func getInteraction():
	if(currentInteraction != null):
		return currentInteraction
	
	checkAloneInteraction()
	return currentInteraction

func checkAloneInteraction():
	var pawnType = getPawnType()
	if(pawnType != null && pawnType.customCheckAlonePawnInteraction(self)):
		return
	
	if(currentInteraction == null):
		if(getExhaustion() > 0.0):
			GM.main.IS.startInteraction("FightExhaustion", {main = charID}, {})
			return
		
		GM.main.IS.startInteraction("AloneInteraction", {main = charID}, {})

func canBeInterrupted() -> bool:
	if(isPlayer() && !GM.main.playerCanBeInterrupted()):
		return false
	if(currentInteraction != null):
		return currentInteraction.canCharIDBeInterrupted(charID)
	return true

func canInterrupt() -> bool:
	return canBeInterrupted()

func tryInterruptPawns(allPawns:Array, keepScoreMult:float = 1.0):
	var pawnType = getPawnType()
	if(pawnType != null && !pawnType.shouldPawnInterruptOtherPawns(self)):
		return false
	
	var allPossible:Array = []
	var keepScore = getInteraction().getKeepInteractionScoreForCharID(charID) if getInteraction() != null else 0.0
	allPossible.append([null, keepScore*keepScoreMult])
	
	for otherPawn in allPawns:
		if(otherPawn == self):
			continue
		
		var interaction = otherPawn.getInteraction()
		if(interaction == null):
			continue
		
		for action in interaction.getInterruptActionsFinal(self):
			var score:float = action["score"]
			var scoreType = action["scoreType"] if action.has("scoreType") else "default"
			var scoreRole = action["scoreRole"] if action.has("scoreRole") else interaction.involvedPawns.keys()[0]
			
			var finalScore:float = score * interaction.getScoreTypeValueGeneric(scoreType, self, interaction.getRolePawn(scoreRole))
			
			if(finalScore > 0):
				allPossible.append([[interaction, action], finalScore])
	
	var pickedEntry = RNG.pickWeightedPairs(allPossible)
	
	if(pickedEntry != null):
		pickedEntry[0].doInterruptActionFinal(self, pickedEntry[1]["id"], pickedEntry[1]["args"])
		return true
	
	return false

func onMeetWith(_otherPawn, _otherPawnMoved:bool) -> bool:
	var pawnType = getPawnType()
	if(pawnType != null):
		return pawnType.onPawnMeetWith(self, _otherPawn, _otherPawnMoved)
	return GM.main.IS.checkOnMeetInteractions(self, _otherPawn, _otherPawnMoved)

func getHunger() -> float:
	return hunger

func getSocial() -> float:
	return social

func getSocialClamped() -> float:
	return clamp(social, 0.0, 1.0)

func satisfySocial():
	social = 0.0

func addSocial(howMuch:float):
	social += howMuch
	social = max(0.0, social)

func afterSocialInteraction():
	if(social <= 1.0):
		social -= RNG.randf_rangeX2(0.2, 0.4)
		if(social < 0.0):
			social = 0.0
	else:
		social *= 0.5

func afterFailedSocialInteraction():
	afterSocialInteraction()
	addAnger(RNG.randf_rangeX2(0.2, 0.4))

func getAnger() -> float:
	return anger

func getAngerClamped() -> float:
	return clamp(anger, 0.0, 1.0)

func addAnger(newAng:float):
	anger += newAng
	if(anger < 0.0):
		anger = 0.0

func affectAnger(howMuch:float):
	addAnger(howMuch * (1.0 + 0.5 * scorePersonality({PersonalityStat.Mean:1.0})))

func satisfyAnger():
	anger = 0.0

func wasDeleted() -> bool:
	return isDeleted

func deleteMe():
	GM.main.IS.deletePawn(charID)

func getDebugInfo():
	var res = [
		"ID: "+str(charID),
		"Location: "+str(getLocation()),
		"Hunger: "+str(Util.roundF(hunger, 2))+" Social: "+str(Util.roundF(social, 2))+" Anger: "+str(Util.roundF(anger, 2))+" Tired: "+str(Util.roundF(tiredness, 2))+" Stamina: "+str(Util.roundF(getChar().getStamina(), 2)),
		"currentInteraction: "+str(currentInteraction.id if currentInteraction != null else "null"),
	]
	if(currentInteraction != null):
		res.append_array(currentInteraction.getDebugInfo())

	return res

func isPlayer() -> bool:
	return charID == "pc"

func isPawn() -> bool:
	return true

func scoreFetish(fetishes:Dictionary, onlyPositive:bool = false) -> float:
	var fetishHolder: FetishHolder = getChar().getFetishHolder()
	return fetishHolder.scoreFetish(fetishes, onlyPositive)

func scoreFetishMax(fetishes:Dictionary, minValue:float = -999.9) -> float:
	var fetishHolder: FetishHolder = getChar().getFetishHolder()
	return fetishHolder.scoreFetishMax(fetishes, minValue)

func scorePersonality(personalityStats:Dictionary, onlyPositive:bool = false) -> float:
	var personality: Personality = getChar().getPersonality()
	return personality.personalityScore(personalityStats, onlyPositive)

func scorePersonalityMax(personalityStats:Dictionary, minValue:float = -999.9) -> float:
	var personality: Personality = getChar().getPersonality()
	return personality.personalityScoreMax(personalityStats, minValue)

func scoreExposed() -> float:
	var value:float = getChar().getExposure()
	return value

func scoreLike(otherCharID) -> float:
	if(!(otherCharID is String)):
		otherCharID = otherCharID.charID
	
	var affectionValue:float = GM.main.RS.getAffection(charID, otherCharID)
	return max(0.0, affectionValue)

func scoreHate(otherCharID) -> float:
	if(!(otherCharID is String)):
		otherCharID = otherCharID.charID
	
	var affectionValue:float = GM.main.RS.getAffection(charID, otherCharID)
	return max(0.0, -affectionValue)

func scoreAffection(otherCharID) -> float:
	if(!(otherCharID is String)):
		otherCharID = otherCharID.charID
	
	var affectionValue:float = GM.main.RS.getAffection(charID, otherCharID)
	return affectionValue

func getAffection(otherCharID) -> float:
	if(!(otherCharID is String)):
		otherCharID = otherCharID.charID
	
	var affectionValue:float = GM.main.RS.getAffection(charID, otherCharID)
	return affectionValue

func scoreLust(otherCharID) -> float:
	if(!(otherCharID is String)):
		otherCharID = otherCharID.charID
	
	var lustValue:float = GM.main.RS.getLust(charID, otherCharID)
	return max(0.0, lustValue)

func getLust(otherCharID) -> float:
	if(!(otherCharID is String)):
		otherCharID = otherCharID.charID
	
	var lustValue:float = GM.main.RS.getLust(charID, otherCharID)
	return max(0.0, lustValue)

func affectAffection(otherCharID, howMuch:float):
	if(!(otherCharID is String)):
		otherCharID = otherCharID.charID
	
	var mult:float = 1.0
	if(howMuch > 0.0):
		mult = getCharsRepMult(charID, otherCharID)
		
	if(howMuch > 0.0):
		mult -= scorePersonality({PersonalityStat.Mean:1.0})*0.5
	elif(howMuch < 0.0):
		mult += scorePersonality({PersonalityStat.Mean:1.0})*0.5
	
	var currentAffection:float = GM.main.RS.getAffection(charID, otherCharID)
	if((currentAffection > 0.1 && howMuch < 0.0) || (currentAffection < -0.1 && howMuch > 0.0)):
		GM.main.RS.addAffection(charID, otherCharID, howMuch*mult*2.0)
	else:
		GM.main.RS.addAffection(charID, otherCharID, howMuch*mult)

func getCharsRepMult(char1ID:String, char2ID:String) -> float:
	var character1 = GlobalRegistry.getCharacter(char1ID)
	var character2 = GlobalRegistry.getCharacter(char2ID)

	if(character1 == null || character2 == null):
		return 1.0
	
	if(!character1.isPlayer() && !character2.isPlayer()):
		return 1.0
	
	if(character1.isPlayer()):
		var rep1:ReputationPlaceholder = character1.getReputation()
		
		if(character2.isInmate()):
			return rep1.getGenericRepMult(RepStat.Inmates, 1.0)
		else:
			return rep1.getGenericRepMult(RepStat.Staff, 1.0)
	else:
		var rep2:ReputationPlaceholder = character2.getReputation()
		
		if(character1.isInmate()):
			return rep2.getGenericRepMult(RepStat.Inmates, 1.0)
		else:
			return rep2.getGenericRepMult(RepStat.Staff, 1.0)

func affectLust(otherCharID, howMuch:float):
	if(!(otherCharID is String)):
		otherCharID = otherCharID.charID
	
	GM.main.RS.addLust(charID, otherCharID, howMuch)

func shouldPersueGoalOverride(_goalID:String) -> bool:
	var pawnType = getPawnType()
	if(pawnType != null):
		return pawnType.shouldPersueGoalOverride(self, _goalID)
	return false

func getProcessedGoalScore(_goalID:String, _score:float, _isKeepScore:bool) -> float:
	var pawnType = getPawnType()
	if(pawnType != null):
		return pawnType.getProcessedGoalScore(self, _goalID, _score, _isKeepScore)
	return _score

func isDoingTask(_taskID:String) -> bool:
	if(currentInteraction == null):
		return false
	return currentInteraction.isDoingTask(_taskID)

func canDoTaskOverride(_taskID:String, _task) -> bool:
	var pawnType = getPawnType()
	if(pawnType != null):
		return pawnType.canDoTaskOverride(self, _taskID, _task)
	return false

func getCharType() -> String:
	var thechar = getChar()
	if(thechar == null):
		return CharacterType.Generic
	return thechar.getCharacterType()

func isInmate() -> bool:
	return getCharType() == CharacterType.Inmate

func isGuard() -> bool:
	return getCharType() == CharacterType.Guard

func isNurse() -> bool:
	return getCharType() == CharacterType.Nurse

func isEngineer() -> bool:
	return getCharType() == CharacterType.Engineer

func isStaff() -> bool:
	return isGuard() || isNurse() || isEngineer()

func isLilac() -> bool:
	return isInmate() && getChar().getInmateType() == InmateType.SexDeviant

func isGeneralInmate() -> bool:
	return isInmate() && getChar().getInmateType() == InmateType.General

func isHighSecInmate() -> bool:
	return isInmate() && getChar().getInmateType() == InmateType.HighSec

func isSlaveToPlayer():
	return getChar().isSlaveToPlayer()

func getNpcSlavery() -> NpcSlave:
	return getChar().getNpcSlavery()

func sendSlaveryActivityEvent(_eventID:String, _args:Dictionary):
	if(isSlaveToPlayer()):
		getNpcSlavery().onInteractionEvent(_eventID, _args)

func getSlutSkillMod() -> float:
	if(!isSlaveToPlayer()):
		return 1.0
	var npcSlavery:NpcSlave = getNpcSlavery()
	var slutSkill:int = npcSlavery.getSlaveSkill(SlaveType.Slut)
	
	var finalValue:float = 1.0
	finalValue += sqrt(float(slutSkill + 1))
	return finalValue

func getPawnTexture():
	var theChar = getChar()
	if(theChar == null):
		return RoomStuff.PawnTexture.Masc
	var femi = theChar.getFemininity()
	
	if(femi >= 50):
		return RoomStuff.PawnTexture.Fem
	return RoomStuff.PawnTexture.Masc

func getPawnColor() -> Color:
	var pawnType = getPawnType()
	if(pawnType != null):
		var customColor = pawnType.getCustomPawnColor(self)
		if(customColor != null):
			return customColor
	
	if(isLilac()):
		return Color.purple
	if(isGeneralInmate()):
		return Color.orange
	if(isHighSecInmate()):
		return Color.red
	if(isGuard()):
		return Color.blue
	if(isNurse()):
		return Color.yellowgreen
	if(isEngineer()):
		return Color.yellow
	
	return Color.pink

func afterLostFight():
	if(anger > 0.5):
		satisfyAnger()
	else:
		addAnger(1.0)
	if(isPlayer()):
		return
	fightExhaustion = 1.0

func afterWonFight():
	satisfyAnger()

func afterSex(_isDom:bool):
	satisfySocial()
	satisfyAnger()

func getExhaustion() -> float:
	return fightExhaustion

func recoverExhaustion(howMuch:float = 0.1):
	fightExhaustion -= howMuch
	if(fightExhaustion < 0.0):
		fightExhaustion = 0.0

func makeExhausted():
	if(isPlayer()):
		return
	fightExhaustion = 1.0
	if(canBeInterrupted()):
		GM.main.IS.startInteraction("FightExhaustion", {main = charID}, {})

func calculatePowerScore(ignoreCurrentState:bool = false) -> float:
	var theChar:BaseCharacter = getChar()
	if(theChar == null):
		return 0.0
	
	var finalScore:float = 0.0
	
	finalScore += theChar.painThreshold() * 0.01
	finalScore += theChar.lustThreshold() * 0.01
	finalScore += theChar.getMaxStamina() * 0.005
	
	finalScore += theChar.getLevel() * 0.1
	finalScore += theChar._getAttacks().size() * 0.1
	
	if(!ignoreCurrentState):
		finalScore *= (1.0 - theChar.getPainLevel()*0.9)
		finalScore *= (1.0 - theChar.getLustLevel()*0.8)
		finalScore *= (1.0 - theChar.getStaminaLevel()*0.5)
	
	return finalScore

func getHowMuchLikesPawn(otherPawn, isClamped:bool = false) -> float:
	var theChar:BaseCharacter = getChar()
	if(theChar == null || otherPawn == null):
		return 0.0
	var lust:LustInterests = theChar.getLustInterests()
	
	return lust.getOverallLikeness(otherPawn.getChar(), isClamped)

func getFocussedLikeness(otherPawn, _focus, isClamped:bool = false) -> float:
	var theChar:BaseCharacter = getChar()
	if(theChar == null || otherPawn == null):
		return 0.0
	var lust:LustInterests = theChar.getLustInterests()
	
	return lust.getFocussedLikeness(otherPawn.getChar(), _focus, isClamped)
	
func canSocial() -> bool:
	return social >= 0.1 || isPlayer()

func getActivityIcon():
	if(currentInteraction != null):
		return currentInteraction.getActivityIconForPawn(self)
	return RoomStuff.PawnActivity.None

func getShouldShowCollarOnSprite() -> bool:
	return isSlaveToPlayer()

func calculateSlutScore() -> float: # from 0.0 to 1.0
	var pawnType = getPawnType()
	if(pawnType != null):
		return pawnType.calculateSlutScore(self)
	return 0.0

func getProstitutionCreditsCost(_otherPawn, mult:float = 1.0, isDom:bool = false):
	var amountRequested:float = 2.0
	if(isPlayer()):
		var level:int = getChar().getLevel() # Replace with Slut Fame?
		if(level < 10):
			amountRequested = 2.0
		elif(level < 20):
			amountRequested = 4.0
		else:
			amountRequested = 5.0
	var personality:Personality = getCharacter().getPersonality()
	var cowardStat = personality.getStat(PersonalityStat.Coward)
	var naiveStat = personality.getStat(PersonalityStat.Naive)
	var subbyStat = personality.getStat(PersonalityStat.Subby)
	
	var affection:float = GM.main.RS.getAffection(charID, _otherPawn.charID)
	var lust:float = GM.main.RS.getLust(charID, _otherPawn.charID)
	var likeness:float = getHowMuchLikesPawn(_otherPawn, true)
	var slutScore:float = calculateSlutScore()
	
	amountRequested *= mult
	
	if(!isPlayer()):
		amountRequested += (-3 * cowardStat)
		amountRequested += (-3 * naiveStat)
		amountRequested *= (2.0 - likeness)
		amountRequested *= (0.5 + slutScore)
		
	if(affection < -0.1):
		amountRequested *= (1.0 + abs(affection)*max((-cowardStat+1.0)/2.0, 0.0))
	if(lust > 0.3):
		amountRequested *= (1.0 + abs(lust*lust)*max((-naiveStat+1.0)/2.0, 0.0))
	if(isDom && subbyStat < -0.1):
		amountRequested *= (1.0 + abs(subbyStat))
	if(isDom && subbyStat > 0.5):
		amountRequested *= (1.0 + abs(subbyStat))
	
	amountRequested *= sqrt(getSlutSkillMod())
	if(!isDom):
		amountRequested *= sqrt(getWhoreRepMult())
	else:
		amountRequested *= sqrt(getAlphaRepMult())
	amountRequested *= RNG.randf_rangeX2(0.8, 1.2)
		
	var finalCost:int = Util.maxi(2, int(round(amountRequested)))
	return finalCost

# Needs blocked arms/hands + blocked legs + gagged/muzzled OR blindfolded
func canGrabAndFuck() -> bool:
	var character = getCharacter()
	if(!(character.hasBoundArms() || character.hasBlockedHands()) || !character.hasBoundLegs()):
		return false
	if(!(character.isGagged() || character.isMuzzled()) && !character.isBlindfolded()):
		return false
	
	return true

func isOnALeash() -> bool:
	if(currentInteraction == null):
		return false
	if(currentInteraction.isRoleOnALeash(currentInteraction.getRoleForPawn(self))):
		return true
	return false

func isLeashingSomeone() -> bool:
	if(currentInteraction == null):
		return false
	if(currentInteraction.isRoleLeashing(currentInteraction.getRoleForPawn(self))):
		return true
	return false

func isBeingFucked() -> bool:
	if(currentInteraction == null):
		return false
	return currentInteraction.isPawnBeingFucked(self)

func isFuckingSomeone() -> bool:
	if(currentInteraction == null):
		return false
	return currentInteraction.isPawnFuckingSomeone(self)

func getRepLevel(_repID:String) -> int:
	var rep:ReputationPlaceholder = getCharacter().getReputation()
	if(rep == null):
		return 0
	return rep.getRepLevel(_repID)

func addRepScore(_repID:String, _howMuch:float):
	var rep:ReputationPlaceholder = getCharacter().getReputation()
	if(rep == null):
		return
	rep.addRep(_repID, _howMuch)

func getWhoreRepMult() -> float:
	var whoreLevel:int = getRepLevel(RepStat.Whore)
	if(whoreLevel <= 1):
		return 1.0
	
	var finalValue:float = 1.0
	finalValue += sqrt(float(whoreLevel * 2))
	return finalValue

func getAlphaRepMult() -> float:
	var whoreLevel:int = getRepLevel(RepStat.Alpha)
	if(whoreLevel <= 1):
		return 1.0
	
	var finalValue:float = 1.0
	finalValue += sqrt(float(whoreLevel * 2))
	return finalValue

func canEnslaveForFree(otherPawn) -> bool:
	if(otherPawn == null):
		return false
	if(otherPawn.isSlaveToPlayer()):
		return false
		
	if(otherPawn.scorePersonality({PersonalityStat.Subby:1.0}) < 0.2):
		return false
		
	var whoreLevel:int = getRepLevel(RepStat.Alpha)
	if(whoreLevel >= 6 && isPlayer()):
		return true
	return false

func addExperienceIfPlayer(ex: int, showMessage: bool = true):
	if(!isPlayer()):
		return
	if(showMessage):
		GM.main.addMessage("You received "+str(ex)+" experience")
	getChar().addExperience(ex)

func getPawnTypeID() -> String:
	if(pawnTypeID == "" && getChar() != null):
		return getChar().getCharType()
	return pawnTypeID

func getPawnType():
	return GlobalRegistry.getPawnType(getPawnTypeID())
