extends Reference
class_name NpcSlave

var npc:WeakRef
var slaveType = SlaveType.Slut
var slaveSpecializations = {
	SlaveType.Slut: 0,
}

var slaveLevel:int = 0
var slaveExperience:int = 0

# When reaches 1, the npc submits willingly
# Increased by punishing when punishments are needed (<=2)
# Increased by rewarding when rewards are needed
var obedience = 0.0
#func addObedience(howMuch:float):
	
# When reaches 1, the npc submits unwillingly (gives up)
# Increased by punishing when disobeying? (only if big punishments) (2-3-4)
# Increased by doing things that the npc doesn't like
var brokenspirit = 0.0
# When reaches 1, the npc submits out of love
# Increased by doing things that the npc likes
# Increased by giving gifts?
var love = 0.0

# When reaches 1, the npc becomes a mindless fuckdoll
# Increased by doing bad things (very bad, like making them black out) to them?
# Increased by punishing for no reason
# Decreased by rewarding
var despair = 0.0

# Slave's understanding of their place
# Increased by explaining them their place
# Increased slowly over time?
# Rules?
# Decreased by being punished for no reason
# 1.0 = I'm a slave
# 0.0 = I'm not a slave!
var awareness = 0.0

# Helps to lower spirit
# Increased by having restraints on the npc each day
# Decreased by rewarding for no reason
var tamed = 0.0

# Has the slave gave up trying to escape
# Happens (randomly?) through a random event if brokenspirit or love has reached 1
# If true, brokenspirit no longer decays
var submitted = false

# Daily vars
var tiredness:int = 0 # The higher this is, the higher the chance of disobeying

var rewardBalance:int = 0

var punishmentsToday:int = 0
var rewardsToday:int = 0
var gotBeatenUpToday:bool = false

var hasRandomEvent = false
var randomEventWillHappenID = "" # submitBroken, submitLove, escaped, removedOneRestraint

# Housekeeping stuff
var readyForLevelup = false
var levelupTasks = []

signal onSlaveLevelup(npcSlave)

func getDebugInfo():
	var result = [
		"Slave Type: "+str(slaveType),
		"Level: "+str(slaveLevel),
		"Experience: "+str(slaveExperience),
		"Obedience: "+str(Util.roundF(obedience, 2)),
		"Broken spirit: "+str(Util.roundF(brokenspirit, 2)),
		"Love: "+str(Util.roundF(love, 2)),
		"Despair: "+str(Util.roundF(despair, 2)),
		"Awareness: "+str(Util.roundF(awareness, 2)),
		"Tamed: "+str(Util.roundF(tamed, 2)),
		"submitted: "+str(submitted),
		"rewardBalance: "+str(rewardBalance),
		"punishmentsToday: "+str(punishmentsToday),
		"rewardsToday: "+str(rewardsToday),
		"tiredness: "+str(tiredness),
		"getResistScoreUnclamped(): "+str(Util.roundF(getResistScoreUnclamped(), 2)),
		"getBratScore(): "+str(Util.roundF(getBratScore(), 2)),
		"isActivelyResisting(): "+str(isActivelyResisting()),
		"isResistingSuperActively(): "+str(isResistingSuperActively()),
	]
	return Util.join(result, "\n")

func onNewDay():
	if(hasRandomEvent && randomEventWillHappenID != ""):
		var oldSlaveEvent = GlobalRegistry.getSlaveEvent(randomEventWillHappenID)
		if(oldSlaveEvent != null):
			oldSlaveEvent.onEventSkipped(self)
	hasRandomEvent = false
	randomEventWillHappenID = ""
	gotBeatenUpToday = false
	
	# Random event should be decided here
	var possibleEventsWithWeights = []
	for eventID in GlobalRegistry.getSlaveEvents():
		var slaveEvent = GlobalRegistry.getSlaveEvent(eventID)
		if(slaveEvent.canHappen(self) && slaveEvent.shouldHappen(self)):
			possibleEventsWithWeights.append([eventID, slaveEvent.getEventWeight()])
	
	if(possibleEventsWithWeights.size() > 0):
		var pickedRandomEvent = RNG.pickWeightedPairs(possibleEventsWithWeights)
		if(pickedRandomEvent != null):
			hasRandomEvent = true
			randomEventWillHappenID = pickedRandomEvent
		
		
	# If has any punishPoints, do something	
	
	var character = getChar()
	if(character.getInventory().hasRemovableRestraints()):
		var restraintAmount = character.getInventory().getEquppedRemovableRestraints().size()
		if(restraintAmount > 0):
			tamed += 0.05 * sqrt(restraintAmount)
		tamed = clamp(tamed, 0.0, 1.0)
	else:
		tamed = decayValue(tamed, RNG.randf_rangeX2(0.01, 0.05))
	
	awareness = clamp(awareness+0.02, 0.0, 1.0)
	if(submitted):
		pass
	else:
		obedience = decayValue(obedience, 0.05, personalityScore({
			PersonalityStat.Subby: -1.0,
		}), 0.8)
		brokenspirit = decayValue(brokenspirit, 0.05, personalityScore({
			PersonalityStat.Coward: -0.7,
			PersonalityStat.Naive: -0.5,
			PersonalityStat.Subby: -1.0,
			}))
		love = decayValue(love, 0.03, personalityScore({
			PersonalityStat.Mean: 1.0,
			PersonalityStat.Impatient: 0.3,
			PersonalityStat.Naive: -0.2,
		}), 3.0)
	
	rewardBalance = 0
	punishmentsToday = 0
	rewardsToday = 0
	tiredness = 0

func decayValue(theValue:float, howMuch:float, statModifier:float = 0.0, statEffect:float = 0.5) -> float:
	return max(0.0, theValue - max(0.0, howMuch * (1.0 + clamp(statModifier, -1.0, 1.0)*statEffect)))

func getRewardBalanceString():
	if(rewardBalance == 0):
		return "Doesn't deserve rewards or punishments"
	if(rewardBalance > 0):
		var rewardTexts = ["Deserves a small reward", "Deserves a normal reward", "Deserves a big reward", "Deserves the best reward"]
		return rewardTexts[Util.mini(rewardBalance-1, rewardTexts.size()-1)]
	else:
		var punishText = ["Deserves a small punishment", "Deserves a normal punishment", "Deserves a big punishment", "Deserves the biggest punishment"]
		return punishText[Util.mini(-rewardBalance-1, punishText.size()-1)]
		
# 1 = small punishment
# 2 = normal punishment
# 3 = big punishment
# 4 = NOW YOU FUCKED UP
func deservesPunishment(howBig:int):
	if(rewardBalance == -1 && howBig == -1): # 2 small punishments do stack but nothing else
		rewardBalance = -2
		return
	rewardBalance = Util.mini(rewardBalance, -howBig)

# 1 = deserves some praise
# 2 = a headpat
# 3 = a treat
# 4 = You are the best!
func deservesReward(howBig:int):
	if(rewardBalance == howBig):
		rewardBalance = howBig + 1
		return
	if(rewardBalance < 0):
		rewardBalance += howBig
		return
	rewardBalance = Util.maxi(rewardBalance, howBig)

func handlePunishment(_howBig:int):
	punishmentsToday += 1
	
	# Just did it
	if(rewardBalance == 0):
		pass
	# Need to be rewarded
	elif(rewardBalance > 0):
		pass
	# Need to be punished
	else:
		if(rewardBalance == -1):
			obedience += 0.1
		if(rewardBalance == -2):
			obedience += 0.15
	
	rewardBalance = 0

func handleReward(_howBig:int):
	rewardsToday += 1
	
	# Just did it
	if(rewardBalance == 0):
		pass
	# Need to be rewarded
	elif(rewardBalance > 0):
		if(rewardBalance == 1):
			obedience += 0.1
		if(rewardBalance == 2):
			obedience += 0.15
	# Need to be punished
	else:
		pass
	
	rewardBalance = 0

func setChar(theChar):
	npc = weakref(theChar)

func setMainSlaveType(theSlaveType):
	slaveType = theSlaveType

func getMainSlaveType():
	return slaveType

func getChar():
	if(npc == null):
		return null
	return npc.get_ref()

func handleSexEvent(_sexEvent:SexEvent):
	var theChar = getChar()
	for task in levelupTasks:
		task.onSexEvent(theChar, _sexEvent)

func levelupCurrentSpecialization():
	if(!slaveSpecializations.has(slaveType)):
		slaveSpecializations[slaveType] = 0
	
	slaveSpecializations[slaveType] += 1
	if(slaveSpecializations[slaveType] > 15):
		slaveSpecializations[slaveType] = 15

# F- F  F+ D- D  D+ C- C  B- B  A- A  S- S  S+ S++
# 0  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15
static func rankToLetter(theRank:int):
	var scoreToText = ["F-", "F", "F+", "D-", "D", "D+", "C-", "C", "B-", "B", "A-", "A", "S-", "S", "S+", "S++"]

	theRank = Util.mini(Util.maxi(int(theRank), 0), 15)
	return scoreToText[theRank]

func doTrain():
	var currentSlaveType:SlaveTypeBase = GlobalRegistry.getSlaveType(slaveType)
	
	var texts = []
	texts.append(RNG.pick(currentSlaveType.getTrainTexts(getChar())))
	
	var result = {
		success = true,
		texts = texts,
	}
	levelupCurrentSpecialization()
	addExperience(25)
	deservesReward(1)
	tiredness += 1
	
	return result

func getExperienceRequiredForNextLevel():
	return 100

func generateLevelUpTasks():
	levelupTasks = NpcBreakTaskBase.generateTasksFor(getChar(), slaveType, 2, 1.0)
	for task in levelupTasks:
		var _ok = task.connect("onTaskCompleted", self, "onLevelupTaskCompleted")

func addExperience(howMuch:int):
	slaveExperience += howMuch
	
	var experienceCap = getExperienceRequiredForNextLevel()
	if(slaveExperience >= experienceCap):
		if(!readyForLevelup):
			readyForLevelup = true
			if(GM.main != null):
				GM.main.addMessage("Your slave named "+getChar().getName()+" is ready to be leveled up.")
			generateLevelUpTasks()
		
		slaveExperience = experienceCap

func isReadyToBeLeveledUp():
	return readyForLevelup

func onLevelupTaskCompleted(_theTask):
	if(readyForLevelup && areLevelupTasksCompleted()):
		readyForLevelup = false
		
		doLevelup()

func areLevelupTasksCompleted():
	for task in levelupTasks:
		if(!task.isCompleted()):
			return false
	return true

func checklevelUp():
	if(readyForLevelup && areLevelupTasksCompleted()):
		doLevelup()

func doLevelup():
	readyForLevelup = false
	levelupTasks.clear()
	
	slaveExperience = 0
	slaveLevel += 1

	if(GM.main != null):
		GM.main.addMessage("Your slave named "+getChar().getName()+" has reached slave level "+str(slaveLevel)+"!")
		
	emit_signal("onSlaveLevelup", self)

func getLevelupTaskProgressText():
	var result = []
	
	for task in levelupTasks:
		var taskString = task.getTaskString()
		if(task.isCompleted()):
			result.append("[color=green]"+str(taskString)+"[/color]")
		else:
			result.append("[color=red]"+str(taskString)+"[/color]")
	
	return Util.join(result, "\n")

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

# 1 = loves, -1 = hates
func fetishScoreOne(fetishID):
	return fetishScore({fetishID:1.0})

func personalityScore(personalityStats = {}, addscore = 0.0):
	var personality: Personality = getChar().getPersonality()
	
	var result = addscore
	for personalityStatID in personalityStats:
		var personalityValue = personality.getStat(personalityStatID)
		result += personalityValue * personalityStats[personalityStatID]
	
	return result

func personalityScoreOne(personalityStat):
	return personalityScore({personalityStat:1.0})

func hasRandomEventToTrigger():
	return hasRandomEvent

func remap01(value:float, newMinValue:float, newMaxValue:float) -> float:
	return Util.remapValue(value, 0.0, 1.0, newMinValue, newMaxValue)
# 0.0 = No resistance
# 0.5 = Resisting 50% of the time?
# 1.0 = ACTIVELY RESISTING EVERY STEP
func getResistScoreUnclamped():
	var overComeValue = 1.5
	if(submitted):
		overComeValue = 1.0

	overComeValue += personalityScore({
		PersonalityStat.Subby: -0.3,
		PersonalityStat.Mean: 0.3,
		PersonalityStat.Coward: -0.2,
		PersonalityStat.Naive: -0.2,
		})
	overComeValue = clamp(overComeValue, 0.2, 3.0)

	overComeValue *= (1.0 - obedience)
	overComeValue *= (1.0 - love)
	if(brokenspirit > 0.5):
		overComeValue *= (1.0 - Util.remapValue(brokenspirit, 0.5, 1.0, 0.0, 1.0))
	
	var restraintAmount = getChar().getInventory().getEquppedRemovableRestraints().size()
	for _i in range(restraintAmount):
		overComeValue *= 0.9
	
	# Close to breaking, no resistance anymore
	if(despair > 0.9):
		overComeValue = min(0.1, overComeValue)
	elif(despair > 0.6):
		overComeValue = min(0.5, overComeValue)
	
	return max(0.0, overComeValue)
		
func getResistScore():
	return clamp(getResistScoreUnclamped(), 0.0, 1.0)

func isActivelyResisting():
	# Temporary got shown their place
	if(gotBeatenUpToday):
		return false
	return getResistScoreUnclamped() >= 0.5

func isResistingSuperActively():
	# Temporary got shown their place
	if(gotBeatenUpToday):
		return false
	return getResistScoreUnclamped() > 1.0

func afterBeatenUp():
	gotBeatenUpToday = true

func getBratScore():
	var theValue = personalityScore({
		PersonalityStat.Brat: 1.0,
	})
	return clamp(theValue, 0.0, 1.0)
