extends Reference
class_name NpcSlave

var npc:WeakRef
var slaveType = SlaveType.Slut
var slaveSpecializations = {
	SlaveType.Slut: 0,
}

var slaveLevel:int = 0
var slaveExperience:int = 0

# When reaches 1, the npc submits unwillingly
# Increased by punishing when disobeying?
# Increased by doing things that the npc doesn't like
var brokenspirit = 0.0
# When reaches 1, the npc submits willingly
# Increased by doing things that the npc likes
# Increased by giving gifts?
var love = 0.0

# When reaches 1, the npc becomes a mindless fuckdoll
# Increased by doing bad things (very bad, like making them black out) to them?
# Increased by punishing for no reason
# Decreased by rewarding
var despair = 0.0

# Helps to lower spirit
# Increased by having restraints on the npc each day
# Decreased by rewarding for no reason
var tamed = 0.0

# Daily vars
var punishmentsToday:int = 0
var rewardsToday:int = 0

# Housekeeping stuff
var readyForLevelup = false
var levelupTasks = []

signal onSlaveLevelup(npcSlave)

func getDebugInfo():
	var result = [
		"Slave Type: "+str(slaveType),
		"Level: "+str(slaveLevel),
		"Experience: "+str(slaveExperience),
		"Broken spirit: "+str(Util.roundF(brokenspirit, 2)),
		"Love: "+str(Util.roundF(love, 2)),
		"Despair: "+str(Util.roundF(despair, 2)),
		"Tamed: "+str(Util.roundF(tamed, 2)),
		"punishmentsToday: "+str(punishmentsToday),
		"rewardsToday: "+str(rewardsToday),
	]
	return Util.join(result, "\n")

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
