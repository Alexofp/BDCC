extends Reference
class_name NpcOwnerBase

var id:String = "error"

var level:int = 0
var influence:float = 0.5
var charID:String = "" #no sync

var nextApproachDay:int = 0

var hasTasks:bool = false
var tasks:Array = []
var tasksCompletedReminded:bool = false

var punishAmount:int = 0
var pcName:String = "slave"
var freedomPrice:int = 1000

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

func addInfluence(_am:float):
	if(_am != 0.0):
		GM.main.RS.addAffection(charID, "pc", _am * 0.25)
	influence += _am
	influence = clamp(influence, 0.0, 1.0)
	if(influence >= 1.0):
		doLevelUp()
	

func getInfluence() -> float:
	return influence

func getExtraCategoryText() -> String:
	var theText:String = "\n"
	theText += "Level: "+str(level)+(" (max level)" if getLevel() >= getMaxLevel() else "")
	theText += "\nInfluence: "+str(Util.roundF(influence*100.0, 1))+"%"
	return theText

func getMaxLevel() -> int:
	return 3

func getLevel() -> int:
	return level

func setLevel(_level:int):
	level = _level
	if(level < 0):
		level = 0
	if(level > getMaxLevel()):
		level = getMaxLevel()
	onLevelUp()

func doLevelUp():
	if(level >= getMaxLevel()):
		return
	if(punishAmount > 0):
		punishAmount -= 1
	setLevel(level + 1)

func onLevelUp():
	influence = 0.5
	var oldPCName:String = getPCName()
	pickNewName()
	var newPCName:String = getPCName()
	addMessage(getOwnerName()+"'s influence level over you has increased to '"+str(level)+"'!"+((" You are now a '"+newPCName+"'.") if newPCName != oldPCName else ""))

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
	if(influence <= 0.0):
		endSlavery()
		return
	
	if(influence >= 1.0):
		if(punishAmount > 0):
			punishAmount -= 1
	
	if(GM.main.getDays() == nextApproachDay):
		GM.main.addMessage(getOwnerName()+", your owner, wants to approach you today.")
	
	if(skipPunishCooldown > 0):
		skipPunishCooldown -= 1
	
	checkIfTasksGotCompleted()

func generateTasks(howManyTasks:int = 2, difficultyMin:float = 1.0, difficultyMax:float = 2.0, taskPool:String = NpcTaskPool.Normal):
	hasTasks = true
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
		
		#var _ok = theTask.connect("onTaskCompleted", self, "onBreakTaskCompleted")
		theTask.generateFor(theChar, _isSlaveLevelup, RNG.randf_rangeX2(difficultyMin, difficultyMax))
		tasks.append(theTask)
		howManyTasks -= 1
		
	for task in tasks:
	#tasks = NpcBreakTaskBase.generateTasksFor(theChar, slaveType, false, tasksAmount, difficultyMin, difficultyMax)
	#for task in tasks:
		var _ok = task.connect("onTaskCompleted", self, "onSlutTaskCompleted")

func isEverythingCompleted():
	for task in tasks:
		if(!task.isCompleted()):
			return false
	
	return true

func onSlutTaskCompleted(_theTask):
	if(!tasksCompletedReminded && isEverythingCompleted()):
		tasksCompletedReminded = true

		if(GM.main != null):
			GM.main.addMessage("You have completed the tasks that "+getOwnerName()+" gave you!")
	pass

func handleSexEvent(sexEvent:SexEvent):
	var theChar = GM.pc
	for task in tasks:
		task.onSexEvent(theChar, sexEvent)

func onSexEnded(_contex = {}):
	var theChar = GM.pc
	for task in tasks:
		task.onSexEnded(theChar, _contex)

func onInteractionEvent(_eventID:String, _args:Dictionary):
	for task in tasks:
		task.onInteractionEvent(_eventID, _args)

func clearTasks():
	tasks = []
	hasTasks = false

func checkIfTasksGotCompleted():
	var theChar = GM.pc
	for task in tasks:
		task.checkIfCompletedFor(theChar)

func getQuestProgressArray() -> Array:
	var theChar = GM.pc
	var result = []
	
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

func hasGivenPCTasks() -> bool:
	return !tasks.empty()

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
	
	result.append("Level: "+str(level))
	result.append("Influence: "+str(Util.roundF(influence*100.0, 1))+"%")
	result.append("Punishments: "+str(punishAmount))
	
	return result

func getOwnerInfoString() -> String:
	return Util.join(getOwnerInfo(), "\n")

func didInteractWithToday() -> bool:
	return interactedToday

func markInteractedWithToday():
	interactedToday = true

func talkAction(_name:String, _desc:String, _id:String, _args:Array=[]):
	return [_name, _desc, _id, _args]
	
func talkActionDisabled(_name:String, _desc:String):
	return [_name, _desc]


func getTalkActions(_event) -> Array:
	var result:Array = []
	
	if(!didInteractWithToday()):
		result.append(talkAction("Submit", "Ask your owner to do something with you. You can only do this once per day.", "submit"))
		result.append(talkAction("Attack!", "Try to get rid of your owner's influence.", "attack"))
	else:
		result.append(talkActionDisabled("Submit", "Your owner doesn't feel like doing anything with you today anymore."))
		result.append(talkActionDisabled("Attack!", "You have already interacted with your owner today."))
	
	if(getLevel() >= 3):
		result.append(talkAction("Change name", "(Influence level 3) Ask your owner to change how they call you", "changeName"))
	#if(getLevel() >= getMaxLevel()):
	#	if(getInfluence() >= 1.0):
	result.append(talkAction("Ask freedom", "Ask your owner if they can let you go", "askFreedom"))
	#	else:
	#		result.append(talkActionDisabled("Ask freedom", "Requires max influence"))
	result.append(talkAction("Relationship", "See how your slavery relationship is progressing", "info"))
	
	return result

func doTalkAction(_event, _actionID:String, _args:Array):
	if(_actionID == "changeName"):
		_event.runEvent("", "ChangeSlaveName")
	if(_actionID == "askFreedom"):
		_event.runEvent("", "AskFreedom")
	if(_actionID == "submit"):
		markInteractedWithToday()
		_event.runEvent("", "Approach", ["interact"])
	if(_actionID == "attack"):
		markInteractedWithToday()
		_event.runEvent("", "AttackOwner", ["interact"])
	if(_actionID == "info"):
		_event.runEvent("", "RelationshipInfo")

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
	
func checkNextApproachDay(_doAnnounce:bool = true):
	#var oldNextApproachDay:int = nextApproachDay
	if(GM.main.getDays() < nextApproachDay):
		return
	if(getLevel() <= 0):
		nextApproachDay = GM.main.getDays() + 2
	elif(getLevel() <= 1):
		nextApproachDay = GM.main.getDays() + RNG.randi_range(2, 3)
	elif(getLevel() <= 2):
		nextApproachDay = GM.main.getDays() + RNG.randi_range(2, 5)
	else:
		nextApproachDay = GM.main.getDays() + RNG.randi_range(2, 6)
	
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

func saveData() -> Dictionary:
	var tasksData:Array = []
	for task in tasks:
		var taskData = {
			"id": task.id,
			"data": task.saveData()
		}
		tasksData.append(taskData)
	
	return {
		l = level,
		i = influence,
		nad = nextApproachDay,
		ht = hasTasks,
		t = tasksData,
		pa = punishAmount,
		pn = pcName,
		it = interactedToday,
		eh = eventHistory,
		fp = freedomPrice,
		spc = skipPunishCooldown,
		tcr = tasksCompletedReminded,
	}

func loadData(_data:Dictionary):
	level = SAVE.loadVar(_data, "l", 0)
	influence = SAVE.loadVar(_data, "i", 0.5)
	nextApproachDay = SAVE.loadVar(_data, "nad", 0)
	hasTasks = SAVE.loadVar(_data, "ht", false)
	punishAmount = SAVE.loadVar(_data, "pa", 0)
	pcName = SAVE.loadVar(_data, "pn", "slave")
	interactedToday = SAVE.loadVar(_data, "it", false)
	eventHistory = SAVE.loadVar(_data, "eh", [])
	freedomPrice = SAVE.loadVar(_data, "fp", 1000)
	skipPunishCooldown = SAVE.loadVar(_data, "spc", 0)
	tasksCompletedReminded = SAVE.loadVar(_data, "tcr", false)
	
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
