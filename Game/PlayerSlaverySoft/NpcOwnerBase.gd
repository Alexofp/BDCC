extends Reference
class_name NpcOwnerBase

var id:String = "error"

var level:int = 0
var influence:float = 0.5
var charID:String = "" #no sync

var nextApproachDay:int = 0
var nextApproachOverride:int = 0 # 0 means disabled

var tasks:Array = []
var tasksCompletedReminded:bool = false
var ownerTasks:Array = []
var ownerTasksCompletedReminded:bool = false

var punishAmount:int = 0
var pcName:String = "slave"
var freedomPrice:int = 1000

var keyholderSatisfaction:float = 0.0 # If hits 1.0, the owner will be willing to unlock the sub
var lockedByOwner:bool = false
var ownerOfferedUnlock:bool = false

var interactedToday:bool = false
var daysAmount:int = 0

var eventHistory:Array = [] # keeps last 2 events so we don't repeat as often

var skipPunishCooldown:int = 0

# Used inside the SoftSlavery special relationship to pick the most fitting owner type. If 2 owner types have the same priority, random will be picked
func getStartPriority(_enslaverChar) -> int:
	return 0

func onStart():
	pickNewName()
	influence = 0.5#clamp(0.1 + getOwner().getPersonality().getStat(PersonalityStat.Subby)*0.8, 0.1, 0.9)
	freedomPrice = generateFreedomPrice()
	
func setRelationship(_softSlavery):
	charID = _softSlavery.charID

func getRelationship() -> SpecialRelationshipBase:
	return GM.main.RS.getSpecialRelationship(charID)

func endSlavery():
	var theRelationship := getRelationship()
	if(theRelationship && theRelationship.id == "SoftSlavery" && theRelationship.npcOwner == self):
		theRelationship.stopMe()

func getVisibleName() -> String:
	return "Fill me!"

func getApproachSubEventID() -> String:
	return "approach"

func getInfluenceMod(_am:float) -> float:
	if(_am <= 0.0):
		return _am
	
	var theLevel := getLevel()
	if(theLevel <= 0):
		return _am
	var levelF:float = float(theLevel)
	var theMod:float = pow(levelF-1.0, 1.5)*0.5 + 1.5
	_am /= theMod
	return _am

func addInfluence(_am:float):
	if(_am != 0.0):
		GM.main.RS.addAffection(charID, "pc", _am * 0.25)
	influence += getInfluenceMod(_am)
	influence = clamp(influence, 0.0, 1.0)
	if(influence >= 1.0):
		doLevelUp()
	if(_am > 0.0 && hasOwnerLock()):
		addKeyholderSatisfaction(_am * 0.4)

func getInfluence() -> float:
	return influence

func getExtraCategoryText() -> String:
	var theText:String = "\n"
	theText += "Level: "+str(level)+(" (max level)" if getLevel() >= getMaxLevel() else "")
	theText += "\nInfluence: "+str(Util.roundF(influence*100.0, 1))+"%"
	return theText

func getMaxLevel() -> int:
	return 5

func getLevel() -> int:
	return level

func setLevel(_level:int):
	influence = 0.5
	level = _level
	if(level < 0):
		level = 0
	if(level > getMaxLevel()):
		level = getMaxLevel()

func doLevelUp():
	if(level >= getMaxLevel()):
		return
	setLevel(level + 1)
	onLevelUp()

func lowerPunishAmount():
	if(punishAmount > 0):
		punishAmount -= 1

func onLevelUp():
	if(punishAmount > 0):
		punishAmount -= 1
	var oldPCName:String = getPCName()
	if(shouldPickNewNameOnLevelUp()):
		pickNewName()
	var newPCName:String = getPCName()
	addMessage(getOwnerName()+"'s influence level over you has increased to '"+str(level)+"'!"+((" You are now a '"+newPCName+"'.") if newPCName != oldPCName else ""))
	onNewLevelUnlockAnnounce()
	
# 0 1 2 3 4 5
# level 1 = sex event
# level 2 = set limits
# level 3 = pick name
# level 4 = pick approach frequency
# level 5 = ?
func onNewLevelUnlockAnnounce():
	if(level == 1):
		addMessage("You can now ask your owner to have sex with you!")
	if(level == 2):
		addMessage("You can now set sex limits for your owner in certain events!")
	if(level == 3):
		addMessage("You can now pick the nickname that "+getOwnerName()+" will use to call you!")
	if(level == 4):
		addMessage("You can now pick how often "+getOwnerName()+" will approach you (check their Relationship talk menu)!")

func shouldPickNewNameOnLevelUp() -> bool:
	if(getLevel() <= 3):
		return true
	return false

func pickNewName():
	setPCName(RNG.pick(getPossiblePCNamesForLevel(level)))

func hasTrait(_traitID:String) -> bool:
	return false

func getEventTags() -> Dictionary:
	return {}

func getOwner() -> BaseCharacter:
	return GlobalRegistry.getCharacter(charID)

func getOwnerName() -> String:
	var theOwner := getOwner()
	if(!theOwner):
		return "Error!"
	return theOwner.getName()

func getRelationshipFullInfo() -> Array:
	var result:Array = [
		"Owner level: "+str(getLevel())+"/"+str(getMaxLevel()),
		"Influence: "+str(Util.roundF(getInfluence()*100.0, 1))+"%",
		"Punishment points: "+str(punishAmount),
		"Days enslaved: "+str(daysAmount),
		"Slave's nickname: "+getPCName(),
	]
	if(hasOwnerLock()):
		result.append("Keyholder satisfaction: "+str(Util.roundF(keyholderSatisfaction*100.0, 1))+"%")
	
	return result

func addMessage(_text:String):
	GM.main.addMessage(_text)

func getPossiblePCNamesForLevel(_level:int) -> Array:
	return ["slave"]

func getPossiblePCNames() -> Array:
	var allNames:Dictionary = {}
	for _i in getMaxLevel():
		var theNames:Array = getPossiblePCNamesForLevel(_i)
		for theName in theNames:
			if(!allNames.has(theName)):
				allNames[theName] = true
	return allNames.keys()

func getPCName() -> String:
	return pcName

func setPCName(_newName:String):
	pcName = _newName

func shouldOwnerApproachPC() -> bool:
	return GM.main.getDays() >= nextApproachDay

#[id, args]
func getApproachEvent() -> Array:
	#shouldAppoach = false
	return ["Approach", [true]]

func onNewDay():
	daysAmount += 1
	interactedToday = false
	#shouldAppoach = true
	if(influence <= 0.0 || !getOwner()):
		endSlavery()
		return
	
	if(influence >= 1.0):
		if(punishAmount > 0):
			punishAmount -= 1
	
	if(GM.main.getDays() == nextApproachDay):
		GM.main.addMessage(getOwnerName()+", your owner, wants to approach you today.")
	
	if(skipPunishCooldown > 0):
		skipPunishCooldown -= 1
	
	if(hasOwnerLock()):
		if(keyholderSatisfaction < 1.0):
			addInfluence(0.15 + getOwner().getPersonality().getStat(PersonalityStat.Subby)*0.1)
	else:
		keyholderSatisfaction = 0.0
		ownerOfferedUnlock = false
	
	checkIfTasksGotCompleted()
	checkIfOwnerTasksGotCompleted()

func generateTasks(howManyTasks:int = 2, difficultyMin:float = 1.0, difficultyMax:float = 2.0, taskPool:String = NpcTaskPool.Normal):
	tasksCompletedReminded = false
	tasks.clear()
	var theChar = GM.pc
	if(theChar == null):
		return
	
	var weightMap:Array = []
	var _isSlaveLevelup:bool = false
	
	for taskID in GlobalRegistry.getSlaveBreakTaskRefs():
		var taskRef:NpcBreakTaskBase = GlobalRegistry.getSlaveBreakTaskRef(taskID)
		
		if(!taskRef.taskPools.has(taskPool)):
			continue
		if(!taskRef.isPossibleForSlutlock(theChar)):
			continue
		#if(!taskRef.isPossibleForPC(GM.pc, theChar, _isSlaveLevelup)):
		#	continue
		
		var taskWeight:float = taskRef.getNpcOwnerWeight(self)
		
		weightMap.append([taskRef, taskWeight])
	
	while(howManyTasks > 0 && weightMap.size() > 0):
		var theTaskRef:NpcBreakTaskBase = RNG.grabWeightedPairs(weightMap)
		var theTask:NpcBreakTaskBase = GlobalRegistry.createSlaveBreakTask(theTaskRef.id)
		
		theTask.generateFor(theChar, _isSlaveLevelup, RNG.randf_rangeX2(difficultyMin, difficultyMax))
		tasks.append(theTask)
		var _ok = theTask.connect("onTaskCompleted", self, "onSlutTaskCompleted")
		howManyTasks -= 1

func generateOwnerTasks(howManyTasks:int = 2, difficultyMin:float = 1.0, difficultyMax:float = 2.0, taskPool:String = NpcTaskPool.Normal):
	ownerTasksCompletedReminded = false
	ownerTasks.clear()
	var theChar = getOwner()
	if(theChar == null):
		return
	
	var weightMap:Array = []
	var _isSlaveLevelup:bool = false
	
	for taskID in GlobalRegistry.getSlaveBreakTaskRefs():
		var taskRef:NpcBreakTaskBase = GlobalRegistry.getSlaveBreakTaskRef(taskID)
		
		if(!taskRef.taskPools.has(taskPool)):
			continue
		if(!taskRef.isPossibleFor(theChar, _isSlaveLevelup)):
			continue
		if(!taskRef.isPossibleForPC(GM.pc, theChar, _isSlaveLevelup)):
			continue
		
		var taskWeight:float = taskRef.getNpcOwnerWeight(self)
		
		weightMap.append([taskRef, taskWeight])
	
	while(howManyTasks > 0 && weightMap.size() > 0):
		var theTaskRef:NpcBreakTaskBase = RNG.grabWeightedPairs(weightMap)
		var theTask:NpcBreakTaskBase = GlobalRegistry.createSlaveBreakTask(theTaskRef.id)
		
		theTask.generateFor(theChar, _isSlaveLevelup, RNG.randf_rangeX2(difficultyMin, difficultyMax))
		ownerTasks.append(theTask)
		var _ok = theTask.connect("onTaskCompleted", self, "onOwnerTaskCompleted")
		howManyTasks -= 1

func isEverythingCompleted() -> bool:
	for task in tasks:
		if(!task.isCompleted()):
			return false
	
	return true

func isEveryOwnerTaskCompleted() -> bool:
	for task in ownerTasks:
		if(!task.isCompleted()):
			return false
	
	return true

func onSlutTaskCompleted(_theTask):
	if(!tasksCompletedReminded && isEverythingCompleted()):
		tasksCompletedReminded = true
		if(GM.main != null):
			GM.main.addMessage("You have completed the tasks that "+getOwnerName()+" gave you!")

func onOwnerTaskCompleted(_theTask):
	if(!ownerTasksCompletedReminded && isEveryOwnerTaskCompleted()):
		ownerTasksCompletedReminded = true
		if(GM.main != null):
			GM.main.addMessage("You have completed the tasks that "+getOwnerName()+" gave you!")

func handleSexEvent(sexEvent:SexEvent):
	var theChar = GM.pc
	for task in tasks:
		task.onSexEvent(theChar, sexEvent)
	var theOwner = getOwner()
	for task in ownerTasks:
		task.onSexEvent(theOwner, sexEvent)

func onSexEnded(_contex = {}):
	var theChar = GM.pc
	for task in tasks:
		task.onSexEnded(theChar, _contex)
	var theOwner = getOwner()
	for task in ownerTasks:
		task.onSexEnded(theOwner, _contex)

func onInteractionEvent(_eventID:String, _args:Dictionary):
	for task in tasks:
		task.onInteractionEvent(_eventID, _args)

func clearTasks():
	tasks = []

func clearOwnerTasks():
	ownerTasks = []

func checkIfTasksGotCompleted():
	var theChar = GM.pc
	for task in tasks:
		task.checkIfCompletedFor(theChar)

func checkIfOwnerTasksGotCompleted():
	var theChar = getOwner()
	for task in ownerTasks:
		task.checkIfCompletedFor(theChar)

func getQuestProgressArray() -> Array:
	var theChar = GM.pc
	var result:Array = []
	
	for task in tasks:
		var taskString = task.getTaskStringSlutLock()
		if(task.isCompleted()):
			result.append("[color=green]"+str(taskString)+"[/color]")
		elif(theChar == null || task.isPossibleForSlutlock(theChar)):
			result.append("[color=red]"+str(taskString)+"[/color]")
		else:
			result.append("[color=red]"+str(taskString)+" (Impossible)[/color]")
	
	return result
		
func getQuestProgressText() -> String:
	return Util.join(getQuestProgressArray(), "\n")

func getOwnerQuestProgressArray() -> Array:
	var theChar = getOwner()
	var result:Array = []
	
	for task in ownerTasks:
		var taskString = task.getTaskString()
		if(task.isCompleted()):
			result.append("[color=green]"+str(taskString)+"[/color]")
		elif(theChar == null || task.isPossibleForSlutlock(theChar)):
			result.append("[color=red]"+str(taskString)+"[/color]")
		else:
			result.append("[color=red]"+str(taskString)+" (Impossible)[/color]")
	
	return result
		
func getOwnerQuestProgressText() -> String:
	return Util.join(getOwnerQuestProgressArray(), "\n")

func hasGivenPCTasks() -> bool:
	return !tasks.empty()

func hasGivenPCOwnerTasks() -> bool:
	return !ownerTasks.empty()

func hasGivenPCAnyTasks() -> bool:
	return hasGivenPCTasks() || hasGivenPCOwnerTasks()

func getPunishAmount() -> int:
	return punishAmount

func addPunishAmount(_am:int=1):
	punishAmount += 1
	if(punishAmount < 0):
		punishAmount = 0

func checkSkipPunishment() -> bool:
	return false

func onPunish():
	punishAmount += 1

func onSkipPunish():
	skipPunishCooldown = 10

func getOwnerInfo() -> Array:
	var result:Array = []
	
	result.append("Level: "+str(level)+(" (Max level)" if getLevel() >= getMaxLevel() else ""))
	result.append("Influence: "+str(Util.roundF(influence*100.0, 1))+"%")
	if(punishAmount > 0):
		result.append("Punishment counter: "+str(punishAmount))
	
	return result

func getOwnerInfoString() -> String:
	return Util.join(getOwnerInfo(), "\n")

func didInteractWithToday() -> bool:
	return interactedToday

func markInteractedWithToday():
	interactedToday = true

func talkAction(_name:String, _desc:String, _id:String, _args:Array=[]) -> Array:
	return [_name, _desc, _id, _args]
	
func talkActionDisabled(_name:String, _desc:String) -> Array:
	return [_name, _desc]


func getTalkActions(_event) -> Array:
	var result:Array = []
	
	if(!didInteractWithToday()):
		result.append(talkAction("Submit", "Ask your owner to do something with you. You can only do this once per day. Removes 1 punishment point if you doing it willingly.", "submit"))
		result.append(talkAction("Attack!", "Try to get rid of your owner's influence.", "attack"))
	else:
		result.append(talkActionDisabled("Submit", "Your owner doesn't feel like doing anything with you today anymore."))
		result.append(talkActionDisabled("Attack!", "You have already interacted with your owner today."))
	
	result.append(talkAction("Ask freedom", "Ask your owner if they can let you go", "askFreedom"))
	result.append(talkAction("Relationship", "See how your slavery relationship is progressing", "info"))
	
	if(getLevel() >= 1):
		result.append(talkAction("Ask sex", "Ask your owner to fuck you!", "askSex"))
	if(getLevel() >= 3):
		result.append(talkAction("Change name", "Ask your owner to change how they call you", "changeName"))
	
	if(hasOwnerLock()):
		if(!didInteractWithToday()):
			result.append(talkAction("Beg unlock", "Beg your owner to unlock you.", "begUnlock"))
		else:
			result.append(talkActionDisabled("Beg unlock", "You have already interacted with your owner today."))
		
	return result

func doTalkAction(_event, _actionID:String, _args:Array):
	if(_actionID == "changeName"):
		_event.runEvent("", "ChangeSlaveName")
	if(_actionID == "askFreedom"):
		_event.runEvent("", "AskFreedom")
	if(_actionID == "submit"):
		lowerPunishAmount()
		markInteractedWithToday()
		_event.runEvent("", "Approach", ["interact"])
	if(_actionID == "attack"):
		markInteractedWithToday()
		_event.runEvent("", "AttackOwner", ["interact"])
	if(_actionID == "info"):
		_event.runEvent("", "RelationshipInfo")
	if(_actionID == "begUnlock"):
		markInteractedWithToday()
		_event.runEvent("", "BegUnlock")
	if(_actionID == "askSex"):
		_event.runEvent("", "AskSex")

func generateFreedomPrice() -> int:
	return RNG.randi_range(500, 2000)

# Automatically gets scaled down
func getFullFreedomPrice() -> int:
	return freedomPrice

func calcFreedomPrice() -> int:
	if(getLevel() >= getMaxLevel() && getInfluence() >= 1.0):
		return 0 # Free at max level and 100% influence
	
	var theMaxValue:float = float(getMaxLevel() + 1)
	var outMaxValue:float = theMaxValue*theMaxValue
	if(outMaxValue <= 0.0):
		return 0
	
	var theValue:float = float(getLevel()) + getInfluence()
	var invertedValue:float = max(float(getMaxLevel()+1) - theValue, 0.0)
	
	var outResult:float = (invertedValue * invertedValue) / outMaxValue * getFullFreedomPrice()
	
	return int(ceil(outResult))

func canChooseApproachDays() -> bool:
	return getLevel() >= 4

func getDaysBeforeNextApproach() -> int:
	if(nextApproachOverride > 0):
		return nextApproachOverride
	var theLevel:int = getLevel()
	if(theLevel <= 0):
		return 2
	elif(theLevel <= 2):
		return RNG.randi_range(2, 3)
	elif(theLevel <= 4):
		return RNG.randi_range(2, 5)
	else:
		return RNG.randi_range(2, 6)

func checkNextApproachDay(_doAnnounce:bool = true):
	#var oldNextApproachDay:int = nextApproachDay
	if(GM.main.getDays() < nextApproachDay):
		return
	nextApproachDay = GM.main.getDays() + getDaysBeforeNextApproach()
	
	if(nextApproachDay > GM.main.getDays()):
		if(_doAnnounce):
			var dayDiff:int = nextApproachDay - GM.main.getDays()
			GM.main.addMessage(getOwnerName()+" will check on you in "+str(dayDiff)+" day"+("s" if dayDiff != 1 else ""))

func debugCanPickTraits() -> bool:
	return false

# Check the NOM.gd file
func getNOM(_nom:String) -> float:
	return 0.0

func getNOMs() -> Dictionary:
	return {}

func shouldPreferToSpawnPawn() -> bool:
	return shouldOwnerApproachPC()

func canSetLimits() -> bool:
	return getLevel() >= 2

func getKeyholderSatisfaction() -> float:
	return keyholderSatisfaction

func addKeyholderSatisfaction(_val:float, _announcesCanUnlock:bool = true):
	var wasReady:bool = (keyholderSatisfaction >= 1.0)
	keyholderSatisfaction += _val
	keyholderSatisfaction = clamp(keyholderSatisfaction, 0.0, 1.0)
	if(!wasReady && keyholderSatisfaction >= 1.0 && _announcesCanUnlock):
		GM.main.addMessage(getOwnerName()+" is ready to unlock you.")

func checkReadyToUnlockOwnerLock() -> bool:
	if(keyholderSatisfaction >= 1.0):
		return true
	return false

# Does the pc have anything locked by the owner
func hasOwnerLock() -> bool:
	return GM.pc.hasKeyholderLocksFrom(charID)

func unlockOwnerLock() -> int:
	setMustHaveOwnerLock(false)
	return GM.pc.unlockAllKeyholderLocksFrom(charID)

func setMustHaveOwnerLock(_l:bool):
	lockedByOwner = _l

func rememberMustHaveOwnerLock() -> bool:
	return lockedByOwner

func saveData() -> Dictionary:
	var tasksData:Array = []
	for task in tasks:
		var taskData = {
			"id": task.id,
			"data": task.saveData()
		}
		tasksData.append(taskData)
	var ownerTasksData:Array = []
	for task in ownerTasks:
		var taskData = {
			"id": task.id,
			"data": task.saveData()
		}
		ownerTasksData.append(taskData)
	
	return { #Short names so the saves are smaller
		l = level,
		i = influence,
		nad = nextApproachDay,
		t = tasksData,
		ot = ownerTasksData,
		pa = punishAmount,
		pn = pcName,
		it = interactedToday,
		eh = eventHistory,
		fp = freedomPrice,
		spc = skipPunishCooldown,
		tcr = tasksCompletedReminded,
		otcr = ownerTasksCompletedReminded,
		ks = keyholderSatisfaction,
		lbo = lockedByOwner,
		oou = ownerOfferedUnlock,
	}

func loadData(_data:Dictionary):
	level = SAVE.loadVar(_data, "l", 0)
	influence = SAVE.loadVar(_data, "i", 0.5)
	nextApproachDay = SAVE.loadVar(_data, "nad", 0)
	punishAmount = SAVE.loadVar(_data, "pa", 0)
	pcName = SAVE.loadVar(_data, "pn", "slave")
	interactedToday = SAVE.loadVar(_data, "it", false)
	eventHistory = SAVE.loadVar(_data, "eh", [])
	freedomPrice = SAVE.loadVar(_data, "fp", 1000)
	skipPunishCooldown = SAVE.loadVar(_data, "spc", 0)
	tasksCompletedReminded = SAVE.loadVar(_data, "tcr", false)
	ownerTasksCompletedReminded = SAVE.loadVar(_data, "otcr", false)
	keyholderSatisfaction = SAVE.loadVar(_data, "ks", 0.0)
	lockedByOwner = SAVE.loadVar(_data, "lbo", false)
	ownerOfferedUnlock = SAVE.loadVar(_data, "oou", false)
	
	tasks.clear()
	var tasksData:Array = SAVE.loadVar(_data, "t", [])
	for taskData in tasksData:
		var taskID = SAVE.loadVar(taskData, "id", "")
		var taskObj:NpcBreakTaskBase = GlobalRegistry.createSlaveBreakTask(taskID)
		if(taskObj == null):
			continue
		taskObj.loadData(SAVE.loadVar(taskData, "data", {}))
		var _ok = taskObj.connect("onTaskCompleted", self, "onSlutTaskCompleted")
		tasks.append(taskObj)
	
	ownerTasks.clear()
	var ownerTasksData:Array = SAVE.loadVar(_data, "ot", [])
	for taskData in ownerTasksData:
		var taskID = SAVE.loadVar(taskData, "id", "")
		var taskObj:NpcBreakTaskBase = GlobalRegistry.createSlaveBreakTask(taskID)
		if(taskObj == null):
			continue
		taskObj.loadData(SAVE.loadVar(taskData, "data", {}))
		var _ok = taskObj.connect("onTaskCompleted", self, "onOwnerTaskCompleted")
		ownerTasks.append(taskObj)
