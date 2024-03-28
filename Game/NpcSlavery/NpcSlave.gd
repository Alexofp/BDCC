extends Reference
class_name NpcSlave

var npc:WeakRef
var slaveType = SlaveType.Slut
var slaveSpecializations = {
	SlaveType.Slut: 0,
}

var activity

var slaveLevel:int = 0
var slaveExperience:int = 0

# When reaches 1, the npc submits willingly
# Increased by punishing when punishments are needed (<=2)
# Increased by rewarding when rewards are needed
var obedience = 0.0
func getObedience() -> float:
	if(isMindBroken()):
		return 1.0
	return obedience
func addObedienceRaw(howMuch:float):
	obedience += howMuch
	obedience = clamp(obedience, 0.0, 1.0)
func addObedience(howMuch:float):
	var mult = 1.0
	if(howMuch > 0.0):
		#mult += getDespair()*0.1 # Despair makes obeying a liiiitle easier
		mult += getAwareness()*3.0
		#mult += getSpoiling()*-0.3
		#mult += getTiredEffect()*-0.2
	else:
		pass
		#mult += getTiredEffect()*0.5
	
	addObedienceRaw(howMuch * mult * (1.0 + sign(howMuch) * personalityScore({
		PersonalityStat.Subby:0.8, # Subby people obey better
		})))
	
# When reaches 1, the npc submits unwillingly (gives up)
# Increased by punishing when disobeying? (only if big punishments) (2-3-4)
# Increased by doing things that the npc doesn't like
var brokenspirit = 0.0
func getBrokenSpirit() -> float:
	if(isMindBroken()):
		return 1.0
	return brokenspirit
func addBrokenSpiritRaw(howMuch:float):
	brokenspirit += howMuch
	brokenspirit = clamp(brokenspirit, 0.0, 1.0)
func addBrokenSpirit(howMuch:float):
	var mult = 1.0
	if(howMuch > 0.0):
		mult += Util.distanceToHalfEased(getDespair())*0.8
		#mult += getAwareness()*0.5
		#mult += getSpoiling()*0.3
		#mult += getTiredEffect()*0.5
	else:
		#mult += getTiredEffect()*-0.2
		pass
	
	addBrokenSpiritRaw(howMuch * mult * (1.0 + sign(howMuch) * personalityScore({
		PersonalityStat.Coward:0.8, # Cowards are easier to break
		})))
# When reaches 1, the npc submits out of love
# Increased by doing things that the npc likes
# Increased by giving gifts?
var love = 0.0
func getLove() -> float:
	if(isMindBroken()):
		return 0.0
	return love
func addLoveRaw(howMuch:float):
	love += howMuch
	love = clamp(love, 0.0, 1.0)
func addLove(howMuch:float):
	var mult = 1.0
	if(howMuch > 0.0):
		#mult += getDespair()*-0.3
		#mult += getAwareness()*-0.3
		#mult += getSpoiling()*0.2
		#mult += getTiredEffect()*-0.2
		mult += getTrust()*3.0
	else:
		#mult += getDespair()*-0.5
		pass
	addLoveRaw(howMuch * mult * (1.0 + sign(howMuch) * personalityScore({
		PersonalityStat.Mean:-0.6, # Kind people fall in love easier
		PersonalityStat.Naive:0.4, # Being naive helps too
		})))

# When reaches 1, the npc becomes a mindless fuckdoll
# Increased by doing bad things (very bad, like making them black out) to them?
# Increased by punishing for no reason
# Decreased by rewarding
var despair = 0.0
func getDespair() -> float:
	if(isMindBroken()):
		return 1.0
	return despair
func addDespairRaw(howMuch:float):
	despair += howMuch
	despair = clamp(despair, 0.0, 1.0)
func addDespair(howMuch:float):
	var loveMult = 1.0
	if(getLove() > 0.4 && howMuch < 0.0): # Having feelings makes coping easier
		loveMult += getLove()
	addDespairRaw(howMuch * (1.0 + sign(howMuch) * personalityScore({
		PersonalityStat.Brat:-0.3, # Brats are more easy-going
		PersonalityStat.Naive:0.4, # Being naive makes despair hit harder
		})) * loveMult)

# Slave's understanding of their place
# Increased by explaining them their place (up to a point)
# Increased slowly over time? (only if you visit them)
# Increased by having restraints
# Rules?
# Decreased by being punished for no reason
# 1.0 = I'm a slave
# 0.0 = I'm not a slave!
var awareness = 0.0
func getAwareness() -> float:
	if(isMindBroken()):
		return 1.0
	return awareness
func addAwarenessRaw(howMuch:float):
	awareness += howMuch
	awareness = clamp(awareness, 0.0, 1.0)
func addAwareness(howMuch:float):
	if(getAwareness() >= 1.0):
		addObedience(howMuch / 3.0)
	addAwarenessRaw(howMuch * (1.0 + sign(howMuch) * personalityScore({
		PersonalityStat.Subby:0.3, # Subby people understand it easier
		PersonalityStat.Mean:-0.3, # Mean people don't want to understand it
		PersonalityStat.Naive:-0.4, # Naive people think its all just gonna stop soon
		})))

# How much the slave trusts you
# Increased by rewarding/punishing perfectly (treating the slave fairly)
# Decreased by punishing when deserves a reward (betraying!)
# Decreased by doing bad things that they don't like?
var trust = 0.0
func getTrust() -> float:
	if(isMindBroken()):
		return 1.0
	return trust
func addTrustRaw(howMuch:float):
	trust += howMuch
	trust = clamp(trust, 0.0, 1.0)
func addTrust(howMuch:float):
	if(getTrust() >= 1.0):
		addLove(howMuch / 3.0)
	addTrustRaw(howMuch * (1.0 + sign(howMuch) * personalityScore({
		PersonalityStat.Naive:0.95, # Naive people trust easier
		PersonalityStat.Impatient:-0.1, # Being patient makes you trust a little more
		})))

# How much have you spoiled your slave
# Increased by rewarding too much
var spoiling = 0.0
func getSpoiling() -> float:
	if(isMindBroken()):
		return 0.0
	return spoiling
func addSpoilingRaw(howMuch:float):
	spoiling += howMuch
	spoiling = clamp(spoiling, 0.0, 1.0)
func addSpoiling(howMuch:float):
	addSpoilingRaw(howMuch * (1.0 + sign(howMuch) * personalityScore({
		PersonalityStat.Brat:0.95, # Brats are super easy to spoil
		PersonalityStat.Subby:-0.2, # Doms are easier to spoil too
		})))

var fear = 0.0
func getFear() -> float:
	if(isMindBroken()):
		return 0.0
	return fear
func addFearRaw(howMuch:float):
	fear += howMuch
	fear = clamp(fear, 0.0, 1.0)
func addFear(howMuch:float):
	if(getFear() >= 1.0 && howMuch > 0.0):
		addBrokenSpirit(howMuch / 10.0)
	addFearRaw(howMuch * (1.0 + sign(howMuch) * personalityScore({
		PersonalityStat.Coward:0.8, # Doms are easier to spoil too
		})))

func addFearUpToAPoint(howMuch:float, maxPoint:float):
	var isHigherThanMaxPoint = getFear() >= maxPoint
	addFear(howMuch)
	if(!isHigherThanMaxPoint && getFear() > maxPoint):
		fear = maxPoint

# Has the slave gave up trying to escape
# Happens (randomly?) through a random event if brokenspirit or love has reached 1
# If true, brokenspirit no longer decays
var submitted = false
func hasSubmittedToPC():
	return submitted
func doSubmitToPC():
	submitted = true

# Has the slave snapped
# If broken, slaves becomes a doll
var broken = false
func isMindBroken():
	return broken
func doMindBreak():
	broken = true
func unMindBreak():
	broken = false
var brokenWarnings = 0 # Might use this as a warning?

# Daily vars
var tiredness:float = 0 # The higher this is, the higher the chance of disobeying
func addTired(howMuch:float):
	tiredness += howMuch
	if(tiredness < 0):
		tiredness = 0
# Returns a value between 0.0 and 0.9
# If 0.0 = full of power
# 0.0 - 0.9 = getting tired
func getTiredEffect() -> float:
	if(isMindBroken()):
		return 0.6
	if(tiredness <= 1.0):
		return 0.0
	if(tiredness >= 5.0):
		return 0.9
	var progress = Util.remapValue(tiredness, 1.0, 5.0, 0.0, 1.0)
	
	return 0.1 + progress * progress * (3.0 - 2.0 * progress) * 0.9

func getWorkEfficiency() -> float:
	return 1.0 - getTiredEffect()


# A value that describes how hard your slave wants to escape
# a value between -40.0 and 40.0
# unhappiness = 40.0 means the slave will escape with 40% chance on the start of the day
var unhappiness = 0.0
func getUnhappiness():
	return unhappiness
func addUnhappiness(howMuch:float):
	unhappiness += howMuch
	unhappiness = clamp(unhappiness, -40.0, 40.0)
func getUnhappinessEscapeChance():
	if(isMindBroken()):
		return 0.0
	if(unhappiness >= 20.0):
		return unhappiness * (1.0 - getFear())
	return 0.0
func tickUnhappiness():
	var unhapdelta = 0.3
	unhapdelta += personalityScore({
		PersonalityStat.Subby: 0.2,
		PersonalityStat.Coward: -0.2,
		})
	unhapdelta += getResistScoreUnclamped() * 0.3
	# A little bit of despair makes us act!
	unhapdelta += Util.distanceToHalfWithIntervalEased(getDespair(), 0.15, 0.25) * 0.4
	
	var hapdelta = 0.0
	# Spoiling us makes us less eager to leave
	hapdelta += Util.distanceToHalfWithIntervalEased(max(getBrokenSpirit(), max(getObedience(), getLove())), 1.0, 1.0)
	hapdelta += max(getAwareness(), max(getTrust(), getSpoiling()))
	
	hapdelta += Util.distanceToHalfWithIntervalEased(getFear(), 1.0, 1.0)
	
	var finalMod = 20.0
	addUnhappiness((unhapdelta - hapdelta) * finalMod)

var rewardBalance:int = 0

var punishmentsToday:int = 0
var rewardsToday:int = 0
var gotBeatenUpToday:bool = false
var checkedOnSlaveToday:bool = false
func markCheckedOnSlaveToday():
	checkedOnSlaveToday = true
var talkedTimesToday = 0

var hasRandomEvent = false
var randomEventWillHappenID = "" # submitBroken, submitLove, escaped, removedOneRestraint
var eventCooldowns = {}
var lastDayOrgasmed = 0

# How horny are we. Increased by 1.0 each days we didn't cum. Gets set to zero if we came
# Denying orgasms also increases it.. it should at least.
var neediness = 0.0
func getNeediness() -> float:
	if(isMindBroken()):
		return 0.0
	return neediness
func addNeedinessRaw(howMuch:float):
	neediness += howMuch
	neediness = clamp(neediness, 0.0, 100.0)
func addNeediness(howMuch:float):
	var needyMod = 1.0
	if(getChar().isInHeat() && howMuch > 0.0):
		needyMod = 2.0
	if(getChar().isPregnant() && howMuch > 0.0):
		needyMod = 0.2
	if(getNeediness() >= 10.0 && howMuch > 0.0):
		addDespair(0.01)
	addNeedinessRaw(howMuch * needyMod * (1.0 + sign(howMuch) * personalityScore({
		PersonalityStat.Impatient:0.95,
		})))

# Housekeeping stuff
var readyForLevelup = false
var levelupTasks = []

signal onSlaveLevelup(npcSlave)

func getDebugInfo():
	var result = [
		"Obedience: "+str(Util.roundF(getObedience(), 2)),
		"Broken spirit: "+str(Util.roundF(getBrokenSpirit(), 2)),
		"Love: "+str(Util.roundF(getLove(), 2)),
		"Despair: "+str(Util.roundF(getDespair(), 2)),
		"Awareness: "+str(Util.roundF(getAwareness(), 2)),
		"Trust: "+str(Util.roundF(getTrust(), 2)),
		"Spoiling: "+str(Util.roundF(getSpoiling(), 2)),
		"Fear: "+str(Util.roundF(getFear(), 2)),
		"submitted: "+str(submitted),
		"rewardBalance: "+str(rewardBalance),
		"punishmentsToday: "+str(punishmentsToday),
		"rewardsToday: "+str(rewardsToday),
		"tiredness: "+str(Util.roundF(tiredness, 2)),
		"unhappiness: "+str(Util.roundF(unhappiness, 2)),
		"getUnhappinessEscapeChance(): "+str(Util.roundF(getUnhappinessEscapeChance(), 2)),
		"getWorkEfficiency(): "+str(Util.roundF(getWorkEfficiency(), 2)),
		"getResistScoreUnclamped(): "+str(Util.roundF(getResistScoreUnclamped(), 2)),
		"getBratScore(): "+str(Util.roundF(getBratScore(), 2)),
		"isActivelyResisting(): "+str(isActivelyResisting()),
		"isResistingSuperActively(): "+str(isResistingSuperActively()),
		"lastDayOrgasmed: "+str(lastDayOrgasmed),
		"neediness: "+str(Util.roundF(neediness, 2)),
	]
	return Util.join(result, "\n")

func slaveStatToString(theStat, theStrings:Array = ["Very low", "Low", "Below medium", "Medium", "Above medium", "High", "Very high"]):
	theStat = clamp(theStat, 0.0, 1.0)
	var index:int = int(theStat * float(theStrings.size() - 1))
	return theStrings[Util.mini(index, theStrings.size() - 1)]

func getMindreaderInfo():
	var result = [
		"Obedience: "+slaveStatToString(getObedience()),
		"Broken spirit: "+slaveStatToString(getBrokenSpirit()),
		"Love: "+slaveStatToString(getLove()),
		"Despair: "+slaveStatToString(getDespair()),
		"Awareness: "+slaveStatToString(getAwareness()),
		"Trust: "+slaveStatToString(getTrust()),
		"Spoiling: "+slaveStatToString(getSpoiling()),
		"Fear: "+slaveStatToString(getFear()),
		"Tiredness: "+str(Util.roundF(tiredness/5.0*100.0, 2))+"%",
		"Unhappiness: "+str(Util.roundF(unhappiness/40.0*100.0, 2))+"%",
		"Neediness: "+str(Util.roundF(neediness/10.0, 2))+"%",
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
	
	tickUnhappiness()
	var daysWithoutOrgasm = GM.main.getDays() - lastDayOrgasmed
	if(daysWithoutOrgasm > 100):
		neediness *= 0.5 # After 100 days of not cumming.. they no longer need to anymore.. Their libido starts to crash
		pass
	elif(daysWithoutOrgasm > 10):
		addNeediness(2.0)
	elif(daysWithoutOrgasm > 2):
		addNeediness(1.0)
	elif(getChar().isInHeat()):
		addNeediness(1.0)
	
	# Random event should be decided here
	var possibleEventsWithWeights = []
	for eventID in GlobalRegistry.getSlaveEvents():
		var slaveEvent = GlobalRegistry.getSlaveEvent(eventID)
		if(!eventCooldowns.has(eventID) && slaveEvent.supportsActivity(getActivityID()) && slaveEvent.shouldHappenFinal(self)):
			possibleEventsWithWeights.append([eventID, slaveEvent.getEventWeight()])
	
	for eventID in eventCooldowns.keys():
		eventCooldowns[eventID] -= 1
		if(eventCooldowns[eventID] <= 0):
			eventCooldowns.erase(eventID)
	
	if(possibleEventsWithWeights.size() > 0):
		var pickedRandomEvent = RNG.pickWeightedPairs(possibleEventsWithWeights)
		if(pickedRandomEvent != null):
			hasRandomEvent = true
			randomEventWillHappenID = pickedRandomEvent
			var slaveEvent = GlobalRegistry.getSlaveEvent(randomEventWillHappenID)
			var theCooldown = slaveEvent.getCooldown(self)
			if(theCooldown > 0):
				eventCooldowns[randomEventWillHappenID] = theCooldown
		
	# If has any punishPoints, do something (maybe?)
	
	var character = getChar()
	if(character.getInventory().hasRemovableRestraints()):
		var restraintAmount = character.getInventory().getEquppedRemovableRestraints().size()
		if(restraintAmount > 0):
			addAwareness(0.03 * sqrt(restraintAmount))
	
	# If checked on us last day
	if(checkedOnSlaveToday):
		addBrokenSpirit(Util.distanceToHalfEased(getDespair())*(1.0+getAwareness())*0.02)
		addAwareness(0.02)
	
	fear = fear / (2.5+personalityScore({PersonalityStat.Coward:-1.0}))
	if(fear < 0.02):
		fear = 0.0
	
	if(activity == null || !activity.preventsStatsDecay()): # Stats decay happens here
		if(rewardBalance < 0):
			addTrust(-rewardBalance * 0.04)
		if(submitted):
			despair = decayValue(despair, 0.05, personalityScore({
				PersonalityStat.Naive: 1.0,
			}), 0.8)
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
		spoiling = decayValue(spoiling, 0.05, personalityScore({
			PersonalityStat.Brat: -1.0,
		}), 0.8)
	
	if(activity != null):
		activity.onNewDay()
	
	rewardBalance = 0
	punishmentsToday = 0
	rewardsToday = 0
	tiredness = 0
	checkedOnSlaveToday = false
	talkedTimesToday = 0

func decayValue(theValue:float, howMuch:float, statModifier:float = 0.0, statEffect:float = 0.5) -> float:
	return max(0.0, theValue - max(0.0, howMuch * (1.0 + clamp(statModifier, -1.0, 1.0)*statEffect)))

func getRewardBalanceString():
	if(rewardBalance == 0):
		return "doesn't deserve rewards or punishments"
	if(rewardBalance > 0):
		var rewardTexts = ["deserves a [b]small[/b] reward", "deserves a [b]normal[/b] reward", "deserves a [b]big[/b] reward", "deserves the [b]best[/b] reward"]
		return rewardTexts[Util.mini(rewardBalance-1, rewardTexts.size()-1)]
	else:
		var punishText = ["deserves a [b]small[/b] punishment", "deserves a [b]normal[/b] punishment", "deserves a [b]big[/b] punishment", "deserves the [b]biggest[/b] punishment"]
		return punishText[Util.mini(-rewardBalance-1, punishText.size()-1)]
		
# 1 = small punishment
# 2 = normal punishment
# 3 = big punishment
# 4 = NOW YOU FUCKED UP
func deservesPunishment(howBig:int):
	if(rewardBalance == -howBig): # 2 small punishments do stack but nothing else
		rewardBalance = Util.maxi(-4, rewardBalance - 1)
		return
	rewardBalance = Util.mini(rewardBalance, -howBig)
	
	if(rewardBalance < -4):
		rewardBalance = -4

# 1 = deserves some praise
# 2 = a headpat
# 3 = a treat
# 4 = You are the best!
func deservesReward(howBig:int):
	if(rewardBalance == howBig):
		rewardBalance = Util.mini(4, howBig + 1)
		return
	if(rewardBalance < 0):
		rewardBalance += howBig
		return
	rewardBalance = Util.maxi(rewardBalance, howBig)
	if(rewardBalance > 4):
		rewardBalance = 4

func handlePunishment(_howBig:int):
	punishmentsToday += 1
	
	var diff = -rewardBalance - _howBig
	var diffAbs = Util.maxi(diff, -diff)
	
	#if(getWorkEfficiency() <= 0.1): # We are very tired
		# Who cares
	#	rewardBalance = 0
	#	return
	
	if(_howBig >= 3): # Big punishments always add despair
		addDespair(0.02*_howBig)
	addFearUpToAPoint(0.04 * _howBig * _howBig, 0.25 + 0.2*_howBig)
	
	if(diff >= 2): # Punishing not enough
		addAwareness(-0.01 * diffAbs)
	if(diff <= -2): # punishing way too much (or punishing when we should be rewarding)
		addTrust(-0.02*diffAbs)
		addDespair(0.05*diffAbs)
		addSpoiling(-0.02 * diffAbs * diffAbs)
		addBrokenSpirit(0.02*diffAbs)
		
	if(diff == 0): # The punishment fits the crime just right
		addAwareness(0.02 * _howBig)
		addTrust(-0.02)
		addSpoiling(-0.02 * _howBig)
		addDespair(-0.01)
		addObedience(0.02 * _howBig)
	elif(diffAbs <= 1 && rewardBalance != 0): # The punishment more or less fits the crime
		addAwareness(0.01 * _howBig)
		addTrust(-0.01)
		addObedience(0.007 * _howBig)
		addSpoiling(-0.01 * _howBig)
	
	if(punishmentsToday >= 2): # Did too many punishments
		addDespair(0.01*diffAbs)
		addTired(1)
		if(rewardsToday == 0): # But never rewarded!
			addSpoiling(-0.01 * _howBig)
		else: #Gave some rewards at least
			pass
	
	rewardBalance = 0

func handleReward(_howBig:int):
	rewardsToday += 1
	
	var diff = rewardBalance - _howBig
	var diffAbs = Util.maxi(diff, -diff)
	
	#if(getWorkEfficiency() <= 0.1): # We are very tired
		# Who cares
	#	rewardBalance = 0
	#	return
	addFear(-0.02 * _howBig * _howBig)
	
	if(diff >= 2): # Reward not big enough
		addTrust(-0.03)
		addAwareness(-0.02)
		addDespair(0.01)
	if(diff <= -2): # Reward too big (Or got rewarded when should be punished)
		addSpoiling(0.04 * diffAbs)
		addTrust(0.03)
	if(diff <= -1 && rewardBalance != 0): # Rewarding when should be punishing
		addLove(0.01 * diffAbs)
		addDespair(-0.02 * diffAbs)
	
	if(diff == 0): # Reward fits just right
		addTrust(0.03 * _howBig)
		addAwareness(0.02)
		addDespair(-0.02 * _howBig)
		addObedience(0.01)
	elif(diffAbs <= 1 && rewardBalance != 0): # The reward more or less fits
		addTrust(0.02 * _howBig)
		addAwareness(0.01)
		addObedience(0.005)
		addDespair(-0.01)
	else: # Rewarding for no good reason
		pass
	
	if(rewardsToday >= 2): # Did too many rewards
		addSpoiling(0.01 * _howBig)
		if(rewardsToday == 0): # But never punished
			addDespair(-0.02 * _howBig)
		else: #Gave some punishments too
			addDespair(-0.01 * _howBig)
	
	rewardBalance = 0

func setChar(theChar):
	npc = weakref(theChar)

func setMainSlaveType(theSlaveType):
	slaveType = theSlaveType

func getMainSlaveType():
	return slaveType

func onEnslave():
	lastDayOrgasmed = GM.main.getDays()

func getChar():
	if(npc == null):
		return null
	return npc.get_ref()

func handleSexEvent(_event:SexEvent):
	var theChar = getChar()
	
	if(_event.getTargetChar() == theChar):
		addNeediness(0.03) # Any kind of sex event makes us sliiightly needier
		if(_event.getType() == SexEvent.Orgasmed):
			neediness = 0.0 # Orgasms reset it
			lastDayOrgasmed = GM.main.getDays()
	else:
		addNeediness(0.01) # Watching others get fucked also makes us a bit needier
			
	for task in levelupTasks:
		task.onSexEvent(theChar, _event)

func levelupCurrentSpecialization():
	if(!slaveSpecializations.has(slaveType)):
		slaveSpecializations[slaveType] = 0
	
	slaveSpecializations[slaveType] += 1
	if(slaveSpecializations[slaveType] > 15):
		slaveSpecializations[slaveType] = 15

func levelupSpecialization(theSlaveType):
	if(!slaveSpecializations.has(slaveType)):
		return false
	
	if(slaveSpecializations[theSlaveType] >= 15):
		return false
	slaveSpecializations[theSlaveType] += 1
	if(slaveSpecializations[theSlaveType] > 15):
		slaveSpecializations[theSlaveType] = 15
	return true

# F- F  F+ D- D  D+ C- C  B- B  A- A  S- S  S+ S++
# 0  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15
static func rankToLetter(theRank:int):
	var scoreToText = ["F-", "F", "F+", "D-", "D", "D+", "C-", "C", "B-", "B", "A-", "A", "S-", "S", "S+", "S++"]

	theRank = Util.mini(Util.maxi(int(theRank), 0), 15)
	return scoreToText[theRank]

func getCurrentSpecializationLevel() -> int:
	if(!slaveSpecializations.has(slaveType)):
		return 0
	return slaveSpecializations[slaveType]

func getSlaveSkill(theSlaveType):
	if(!slaveSpecializations.has(theSlaveType)):
		return 0
	return slaveSpecializations[theSlaveType]

func getMoodForWork() -> float:
	return max(getLove(), max(getBrokenSpirit(), getObedience()))/2.0 - getSpoiling() - getResistScoreUnclamped() - max(getFear(), getDespair())/2.0

func doTrain():
	var currentSlaveType:SlaveTypeBase = GlobalRegistry.getSlaveType(slaveType)
	
	var currentSkillLevel = getCurrentSpecializationLevel()
	
	var texts = []
	texts.append(currentSlaveType.getTrainText(getChar(), currentSkillLevel))
	var extraTexts = []
	
	var isSuccess = true
	var actuallyAddedSkill = false
	if(isResistingSuperActively()):
		isSuccess = false
		texts.append( currentSlaveType.getFailedTrainTextResist(getChar()) )
		deservesPunishment(2)
	else:
		var workEffect = getWorkEfficiency()
		var obeyMood = getMoodForWork()
		
		if(workEffect < 0.5 && RNG.chance(80.0*(1.0-workEffect))):
			isSuccess = false
			texts.append( currentSlaveType.getFailedTrainTextWeak(getChar()) )
			addDespair(0.01)
			#addBrokenSpirit(0.02)
			if(rewardBalance >= 2):
				addLove(-0.01)
		else:
			var workRoll = obeyMood + workEffect + RNG.randf_range(-0.7, 0.7) + float(sqrt(slaveLevel))/10.0
			print("WORKROLL: "+str(workRoll))
			if(workRoll < 0.0):
				isSuccess = false
				texts.append( currentSlaveType.getFailedTrainTextBad(getChar()) )
				deservesPunishment(1)
				addSpoiling(-0.04)
			elif(workRoll <= 1.0):
				isSuccess = true
				texts.append( currentSlaveType.getFailedTrainTextSomeSuccess(getChar()) )
				deservesReward(1)
				if(RNG.chance(10 + Util.mini(50, slaveLevel*2))):
					levelupCurrentSpecialization()
					actuallyAddedSkill = true
				addObedience(0.005)
				addFear(-0.03)
			else:
				isSuccess = true
				texts.append( currentSlaveType.getFailedTrainTextGreatSuccess(getChar()) )
				deservesReward(2)
				if(RNG.chance(30 + slaveLevel * 5)):
					levelupCurrentSpecialization()
					actuallyAddedSkill = true
				addObedience(0.01)
				addLove(0.01)
				addFear(-0.1)
	
	var newSkillLevel = getCurrentSpecializationLevel()
	var unlockedSomething = false
	if(actuallyAddedSkill && newSkillLevel != currentSkillLevel):
		var allUnlocks = currentSlaveType.getUnlockHints(getChar())
		
		for unlockInfo in allUnlocks:
			if(unlockInfo["unlocksAt"] == newSkillLevel):
				extraTexts.append("[i]"+unlockInfo["name"]+" unlocked! "+unlockInfo["text"]+"[/i]")
				unlockedSomething = true
				
		if(unlockedSomething):
			for unlockInfo in allUnlocks:
				if(unlockInfo["unlocksAt"] > newSkillLevel):
					extraTexts.append("[i]Next unlock is "+unlockInfo["name"]+" at rank "+rankToLetter(unlockInfo["unlocksAt"])+"[/i]")
					break
	
	texts.append_array(extraTexts)
	
	var result = {
		actuallyAddedSkill = actuallyAddedSkill,
		success = isSuccess,
		texts = texts,
	}
	
	if(isSuccess && actuallyAddedSkill):
		addExperience(30)
	elif(isSuccess):
		addExperience(15)
	else:
		addExperience(5)
	tiredness += 1
	
	return result

func hoursPassed(_howMuch):
	if(activity != null):
		activity.hoursPassed(_howMuch)

static func getNextLevelExperienceForLevel(theLevel:int) -> int:
	var baseExp = 100
	var expMult = 1.1
	
	if(theLevel <= 0):
		return baseExp
	
	var rawExp:float = float(baseExp) * pow(expMult, theLevel-1)
	var nextLevelExp = int(((rawExp + 9) / 10) * 10)
	return nextLevelExp

func getExperienceRequiredForNextLevel():
	return getNextLevelExperienceForLevel(slaveLevel)

func getExperienceStr():
	return str(slaveExperience) + "/" + str(getExperienceRequiredForNextLevel())

func generateLevelUpTasks():
	var taskAmount = 1
	
	if(slaveLevel >= 3 && RNG.chance(50)):
		taskAmount += 1
	if(slaveLevel >= 10 && RNG.chance(50)):
		taskAmount += 1
	if(slaveLevel >= 4 && RNG.chance(20 + personalityScore({PersonalityStat.Subby: 1.0}) * 10.0)):
		taskAmount += 1
	
	var difficultyMin = 1.0
	var difficultyMax = 1.0
	
	difficultyMin += sqrt(slaveLevel)*0.05
	difficultyMax += sqrt(slaveLevel)*0.1
	
	if(slaveLevel >= 6 && RNG.chance(5)):
		difficultyMax *= 2
	
	if(slaveLevel >= 3 && RNG.chance(10 + personalityScore({PersonalityStat.Mean: 1.0}) * 5.0)):
		difficultyMax *= 4
		
	
	levelupTasks = NpcBreakTaskBase.generateTasksFor(getChar(), slaveType, true, taskAmount, difficultyMin, difficultyMax)
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
		var howMuchExp = int(slaveLevel * 5)
		GM.main.addMessage("You received "+str(howMuchExp)+" experience")
		GM.pc.addExperience(howMuchExp)
		
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
	var overComeValue = 1.2
	if(submitted):
		overComeValue = 1.0

	overComeValue *= (1.0 - getFear() * (1.0 - getSpoiling()*0.3))

	overComeValue += personalityScore({
		PersonalityStat.Subby: -0.3,
		PersonalityStat.Mean: 0.3,
		PersonalityStat.Coward: -0.2,
		PersonalityStat.Naive: -0.2,
		})
	overComeValue = clamp(overComeValue, 0.2, 3.0)

	overComeValue *= (1.0 - getObedience())
	overComeValue *= (1.0 - getLove())
	overComeValue *= (1.0 - getBrokenSpirit())
	
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
	if(isMindBroken()):
		return false
	return getResistScoreUnclamped() >= 0.5 || getBratScore() >= 0.5

func isResistingSuperActively():
	# Temporary got shown their place
	if(gotBeatenUpToday):
		return false
	if(isMindBroken()):
		return false
	return getResistScoreUnclamped() > 1.0

func afterBeatenUp():
	#gotBeatenUpToday = true
	#addBrokenSpirit(0.04)
	#addObedience(0.02)
	addFear(0.5)

func getBratScore():
	#var theValue = personalityScore({
	#	PersonalityStat.Brat: 0.1,
	#})
	return clamp(getSpoiling(), 0.0, 1.0 - getFear())

func getOwnerName():
	return "owner"

func getLevel():
	return slaveLevel

func getSlaveTypeName():
	var slaveTypeObj:SlaveTypeBase = GlobalRegistry.getSlaveType(getMainSlaveType())
	if(slaveTypeObj == null):
		return "slave"
	return slaveTypeObj.getVisibleName()

func getCurrentSkillName():
	return getSlaveTypeName()

func getMaxSkillsAmount():
	return Util.maxi(1, 1+int(float(slaveLevel) / 5))

func canLearnNewSkill():
	var skillAmount = slaveSpecializations.size()
	
	if(skillAmount < getMaxSkillsAmount()):
		return true
	return false

func canLearnNewSkillAndHasAvailable():
	if(!canLearnNewSkill()):
		return false
	
	var allSkills = GlobalRegistry.getSlaveTypes()
	for theSkillID in allSkills:
		if(!slaveSpecializations.has(theSkillID)):
			return true
	return false

func setMainSkill(theSlaveType):
	slaveType = theSlaveType

func hasSkill(theSlaveType):
	if(!slaveSpecializations.has(theSlaveType)):
		return false
	return true

func learnNewSkill(theSlaveType):
	if(!slaveSpecializations.has(theSlaveType)):
		slaveSpecializations[theSlaveType] = 0

func getPerfectIdleMessage():
	if(isMindBroken()):
		return "{npc.He} stands still, {npc.his} stare blank.."
	
	var db = [
		{stats={obedience=1.0,love=0.0,brokenspirit=1.0}, notblind=true, message="{npc.HeShe} stands perfectly still, eyes locked onto you with unwavering obedience. There's an unsettling lack of emotion in {npc.hisHer} gaze, as if {npc.heShe} exists solely to fulfill your commands."},
		{stats={obedience=0.0,love=0.0,brokenspirit=0.0}, notblind=true, message="{npc.HeShe} glares defiantly at you, a spark of rebellion in {npc.hisHer} eyes. {npc.HisHer} posture exudes resistance, {npc.hisHer} body language challenging your authority at every turn. It's clear that {npc.heShe} despises being under your control."},
		{stats={obedience=0.1,love=1.0,brokenspirit=1.0}, message="{npc.HeShe} gazes at you with adoration, love radiating from {npc.hisHer} every glance. {npc.HisHer} stance is submissive, almost vulnerable, as if {npc.heShe} would do anything to please you and bask in your affection."},
		{stats={obedience=1.0,love=0.1,trust=0.5}, message="{npc.HeShe} stands before you with unwavering obedience, {npc.his} eyes reflecting complete submission. There's a noticeable lack of affection, only a cold compliance."},
		{stats={tiredness=0.9,fear=0.7,brokenspirit=0.0}, message="Standing defiantly, {npc.heShe} glares at you, {npc.his} spirit unbroken despite the evident fatigue. Fear lingers in the air, but {npc.heShe} remains resolute, refusing to succumb to the exhaustion."},
		{stats={love=1.0,trust=0.1,fear=0.8}, message="Despite the overwhelming love in {npc.his} eyes, a sense of unease is palpable. It's clear that trust is lacking, overshadowed by an undercurrent of fear that strains the connection between you and {npc.him}."},
		{stats={obedience=0.9,love=0.3,despair=0.4,tiredness=0.8}, message="With a weariness in {npc.his} eyes, {npc.heShe} obediently awaits your command. The love is there, but despair and exhaustion cast a shadow, making the connection seem more like a duty than a desire."},
		{stats={love=1.0,obedience=1.0,brokenspirit=1.0}, message="{npc.HeShe} looks at you with both love and unwavering obedience. There's no hint of resistance, just a display of complete surrender."},
		{stats={obedience=1.0,love=0.0,trust=0.0}, message="{npc.HeShe} stands in a rigid, submissive posture, eyes downcast, hands clasped behind {npc.his} back. There's an unquestioning obedience in {npc.his} demeanor, yet the lack of trust manifests in the subtle tremble of {npc.his} fingers."},
		{stats={obedience=0.3,love=1.0,fear=0.8}, message="Gazing at you with an intensity bordering on adoration, {npc.heShe} seems to be holding back tears. Love emanates from every pore, but there's an underlying fear, as if {npc.heShe} is afraid of shattering the fragile bond between you."},
		{stats={brokenspirit=0.0,spoiling=0.7,awareness=0.9,fear=0.0}, message="Standing defiantly, {npc.heShe} locks eyes with you, a spark of rebellion gleaming beneath the surface. {npc.HeShe} seems acutely aware of every move you make, as if ready to challenge your dominance at any moment."},
		{stats={obedience=0.3,love=0.8,spoiling=0.7}, message="Leaning slightly, {npc.HeShe} regards you with a mixture of affection and expectation. Love is present, but the subtle tilt of {npc.his} head and the glint in {npc.his} eyes suggest a desire for indulgence, as if {npc.heShe} expects you to cater to {npc.his} whims."},
		{stats={brokenspirit=0.0,awareness=0.6,fear=0.6}, message="Eyes ablaze with defiance, {npc.heShe} stands tall, seemingly unyielding against your commands. There's a heightened awareness in {npc.his} gaze, as if {npc.heShe} is acutely attuned to every nuance of your presence."},
		{stats={obedience=0.7,love=0.2,fear=0.8}, message="Avoiding your gaze, {npc.heShe} fidgets nervously, a mix of obedience and fear evident in {npc.his} demeanor. There's a hesitant submission, and the aura of tension suggests an anticipation of potential consequences for any misstep."},
		#{stats={love=0.0}, message=""},
	]
	
	var mainStats = {
		obedience = obedience, love = love, brokenspirit = brokenspirit,
	}
	var supportStats = {
		awareness = awareness, trust = trust, despair = despair, spoiling = spoiling, tiredness=getTiredEffect(), fear = fear,
	}
	
	var highestScore = -100.0
	var bestMessage = "Your slave stands still."
	
	for dbEntry in db:
		var mainDistance = 0.0
		var supportDistance = 0.0
		var missingStatsDistance = 0.0
		
		var foundMainStats = 0
		var foundSupportStats = 0
		var theStats = dbEntry["stats"]
		for stat in theStats:
			if(mainStats.has(stat)):
				var distance = abs(mainStats[stat] - theStats[stat])
				mainDistance += 1.0 - distance
				foundMainStats += 1
			elif(supportStats.has(stat)):
				var distance = abs(supportStats[stat] - theStats[stat])
				supportDistance += 1.0 - distance
				foundSupportStats += 1
		
		missingStatsDistance = Util.maxi(0, mainStats.size() - foundMainStats) * 2.0 + Util.maxi(0, supportStats.size() - foundSupportStats) * 1.0
		
		var finalScore = mainDistance*2.0/(foundMainStats+1) + supportDistance*1.0/(foundSupportStats+1) - missingStatsDistance*0.1
		
		if(finalScore > highestScore):
			highestScore = finalScore
			bestMessage = dbEntry["message"]
	
	return bestMessage

func isDoingActivity():
	return activity != null

func getActivityID() -> String:
	if(activity == null):
		return ""
	return activity.id

func getActivity():
	return activity

func stopActivity():
	if(activity != null):
		activity.onEnd()
	activity = null

func startActivity(activID, args = []):
	if(isDoingActivity()):
		stopActivity()
	var newActivity = GlobalRegistry.createSlaveActivity(activID)
	if(newActivity == null):
		return null
	newActivity.slavery = weakref(self)
	newActivity.onStart(args)
	activity = newActivity
	return activity

func didTalkWithToday():
	talkedTimesToday += 1

func getTalkedTimesToday() -> int:
	return talkedTimesToday

func getLevelUpHintText():
	var result = []
	
	for task in levelupTasks:
		var taskString = task.getTaskString()
		result.append("[b]"+str(taskString)+"[/b]"+(" (completed)" if task.isCompleted() else ""))
		
		var hintString = task.getTaskHint(true)
		if(hintString != null && hintString != ""):
			result.append(" - "+hintString)
	
	return Util.join(result, "\n")

func checkIfTasksGotCompleted():
	var theChar = getChar()
	for task in levelupTasks:
		task.checkIfCompletedFor(theChar)

func onSexEnded(_context = {}):
	#_context = {sexEngine=self,isDom=false,sexFullResult=sexResult,sexResult=sexResult["subs"][subID]}
	
	if(_context.has("isDom") && !_context["isDom"]):
		var domOrgasms = 0
		var slaveOrgasms = 0
		if(_context.has("sexFullResult")):
			var fullSexResult = _context["sexFullResult"]
			for domKey in fullSexResult["doms"]:
				domOrgasms += fullSexResult["doms"][domKey]["timesCame"]
		if(_context.has("sexResult")):
			slaveOrgasms = _context["sexResult"]["timesCame"]
		
		if(slaveOrgasms == 0 && domOrgasms > 0):
			# We got denied!
			addNeediness(sqrt(domOrgasms) / 2.0)
	
	var theChar = getChar()
	for task in levelupTasks:
		task.onSexEnded(theChar, _context)

func saveData():
	var data = {
		"slaveType": slaveType,
		"slaveSpecializations": slaveSpecializations,
		"slaveLevel": slaveLevel,
		"slaveExperience": slaveExperience,
		"obedience": obedience,
		"brokenspirit": brokenspirit,
		"love": love,
		"despair": despair,
		"awareness": awareness,
		"trust": trust,
		"spoiling": spoiling,
		"fear": fear,
		"submitted": submitted,
		"tiredness": tiredness,
		"rewardBalance": rewardBalance,
		"punishmentsToday": punishmentsToday,
		"rewardsToday": rewardsToday,
		"gotBeatenUpToday": gotBeatenUpToday,
		"checkedOnSlaveToday": checkedOnSlaveToday,
		"talkedTimesToday": talkedTimesToday,
		"hasRandomEvent": hasRandomEvent,
		"randomEventWillHappenID": randomEventWillHappenID,
		"readyForLevelup": readyForLevelup,
		"broken": broken,
		"brokenWarnings": brokenWarnings,
		"unhappiness": unhappiness,
		"eventCooldowns": eventCooldowns,
		"lastDayOrgasmed": lastDayOrgasmed,
		"neediness": neediness,
	}
	
	if(activity == null):
		data["activity_id"] = ""
		data["activity_data"] = {}
	else:
		data["activity_id"] = activity.id
		data["activity_data"] = activity.saveData()
	
	var tasksData = []
	for task in levelupTasks:
		var taskData = {
			"id": task.id,
			"data": task.saveData()
		}
		tasksData.append(taskData)
	data["levelupTasks"] = tasksData
	
	return data

func loadData(data):
	slaveType = SAVE.loadVar(data, "slaveType", SlaveType.Slut)
	var newslaveSpecializations = SAVE.loadVar(data, "slaveSpecializations", {})
	slaveSpecializations = {}
	for theSlaveType in newslaveSpecializations:
		var slaveTypeObj:SlaveTypeBase = GlobalRegistry.getSlaveType(theSlaveType)
		if(slaveTypeObj == null):
			continue
		slaveSpecializations[theSlaveType] = newslaveSpecializations[theSlaveType]
	slaveLevel = SAVE.loadVar(data, "slaveLevel", 0)
	slaveExperience = SAVE.loadVar(data, "slaveExperience", 0)
	obedience = SAVE.loadVar(data, "obedience", 0.0)
	brokenspirit = SAVE.loadVar(data, "brokenspirit", 0.0)
	love = SAVE.loadVar(data, "love", 0.0)
	despair = SAVE.loadVar(data, "despair", 0.0)
	awareness = SAVE.loadVar(data, "awareness", 0.0)
	trust = SAVE.loadVar(data, "trust", 0.0)
	spoiling = SAVE.loadVar(data, "spoiling", 0.0)
	fear = SAVE.loadVar(data, "fear", 0.0)
	submitted = SAVE.loadVar(data, "submitted", false)
	tiredness = SAVE.loadVar(data, "tiredness", 0.0)
	rewardBalance = SAVE.loadVar(data, "rewardBalance", 0)
	punishmentsToday = SAVE.loadVar(data, "punishmentsToday", 0)
	rewardsToday = SAVE.loadVar(data, "rewardsToday", 0)
	gotBeatenUpToday = SAVE.loadVar(data, "gotBeatenUpToday", false)
	checkedOnSlaveToday = SAVE.loadVar(data, "checkedOnSlaveToday", false)
	talkedTimesToday = SAVE.loadVar(data, "talkedTimesToday", 0)
	hasRandomEvent = SAVE.loadVar(data, "hasRandomEvent", false)
	randomEventWillHappenID = SAVE.loadVar(data, "randomEventWillHappenID", "")
	readyForLevelup = SAVE.loadVar(data, "readyForLevelup", false)
	broken = SAVE.loadVar(data, "broken", false)
	brokenWarnings = SAVE.loadVar(data, "brokenWarnings", 0)
	unhappiness = SAVE.loadVar(data, "unhappiness", 0.0)
	eventCooldowns = SAVE.loadVar(data, "eventCooldowns", {})
	lastDayOrgasmed = SAVE.loadVar(data, "lastDayOrgasmed", 0)
	neediness = SAVE.loadVar(data, "neediness", 0.0)
	
	var theActivityID = SAVE.loadVar(data, "activity_id", "")
	if(theActivityID == null || theActivityID == ""):
		activity = null
	else:
		var newActivity = GlobalRegistry.createSlaveActivity(theActivityID)
		if(newActivity != null):
			newActivity.slavery = weakref(self)
			#newActivity.onStart(args)
			activity = newActivity
			newActivity.loadData(SAVE.loadVar(data, "activity_data", {}))
	
	levelupTasks = []
	var tasksData = SAVE.loadVar(data, "levelupTasks", [])
	for taskData in tasksData:
		var taskID = SAVE.loadVar(taskData, "id", "")
		var taskObj:NpcBreakTaskBase = GlobalRegistry.createSlaveBreakTask(taskID)
		if(taskObj == null):
			continue
		taskObj.loadData(SAVE.loadVar(taskData, "data", {}))
		var _ok = taskObj.connect("onTaskCompleted", self, "onLevelupTaskCompleted")
		levelupTasks.append(taskObj)
