extends Reference
class_name NpcOwnerBase

var id:String = "error"

var level:int = 0
var influence:float = 0.5
var charID:String = "" #no sync

var shouldAppoach:bool = true #TODO: Switch to false before ship

var hasTasks:bool = false
var tasks:Array = []

var punishAmount:int = 0
var pcName:String = "slave"

func onStart():
	pickNewName()

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
	return "aMean" # a stands for Approach

func addInfluence(_am:float):
	influence += _am
	influence = clamp(influence, 0.0, 1.0)
	if(influence >= 1.0):
		doLevelUp()

func getInfluence() -> float:
	return influence

func getExtraCategoryText() -> String:
	var theText:String = "\n"
	theText += "Level: "+str(level)
	theText += "\nInfluence: "+str(Util.roundF(influence*100.0, 1))+"%"
	return theText

func getMaxLevel() -> int:
	return 3

func getLevel() -> int:
	return level

func doLevelUp():
	if(level >= getMaxLevel()):
		return
	if(punishAmount > 0):
		punishAmount -= 1
	influence = 0.5
	level += 1
	var oldPCName:String = getPCName()
	pickNewName()
	var newPCName:String = getPCName()
	addMessage(getOwnerName()+"'s influence level over you has increased to '"+str(level)+"'!"+((" You are now a '"+newPCName+"'.") if newPCName != oldPCName else ""))

func pickNewName():
	pcName = RNG.pick(getPossiblePCNamesForLevel(level))

func getOwner() -> BaseCharacter:
	return GlobalRegistry.getCharacter(charID)

func getOwnerName() -> String:
	var theOwner := getOwner()
	if(!theOwner):
		return "Error!"
	return theOwner.getName()

func addMessage(_text:String):
	GM.main.addMessage(_text)

func getPossiblePCNamesForLevel(_level:int) -> Array:
	return ["slave"]

func getPossiblePCNames() -> Array:
	var allNames:Array = []
	for _i in getMaxLevel():
		var theNames:Array = getPossiblePCNamesForLevel(_i)
		for theName in theNames:
			if(!allNames.has(theName)):
				allNames.append(theName)
	return allNames

func getPCName() -> String:
	#if(true):
	#	return "pet"
	return pcName

func shouldOwnerApproachPC() -> bool:
	return shouldAppoach

#[id, args]
func getApproachEvent() -> Array:
	shouldAppoach = false
	return ["Approach", []]

func onNewDay():
	shouldAppoach = true
	if(influence <= 0.0):
		endSlavery()
		return
	
	if(influence >= 1.0):
		if(punishAmount > 0):
			punishAmount -= 1
	
	checkIfTasksGotCompleted()

func generateTasks(howManyTasks = 2):
	hasTasks = true
	tasks.clear()
	var theChar = GM.pc
	if(theChar == null):
		return
	
	var weightMap = []
	var _isSlaveLevelup = false
	var difficultyMin = 1.0
	var difficultyMax = 2.0
	
	for taskID in GlobalRegistry.getSlaveBreakTaskRefs():
		var taskRef:NpcBreakTaskBase = GlobalRegistry.getSlaveBreakTaskRef(taskID)
		
		if(!taskRef.isPossibleForSlutlock(theChar)):
			continue
		#if(!taskRef.isPossibleForPC(GM.pc, theChar, _isSlaveLevelup)):
		#	continue
		
		var taskWeight = taskRef.getSlutlockWeight()
		
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
#	if(!canRemoveReminded && isEverythingCompleted()):
#		canRemoveReminded = true
#
#		if(GM.main != null):
#			GM.main.addMessage("One of your SlutLocks beeps and turns green!")
	pass

func handleSexEvent(sexEvent:SexEvent):
	var theChar = GM.pc
	for task in tasks:
		task.onSexEvent(theChar, sexEvent)

func onSexEnded(_contex = {}):
	var theChar = GM.pc
	for task in tasks:
		task.onSexEnded(theChar, _contex)

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
	return hasTasks

func getPunishAmount() -> int:
	return punishAmount

func addPunishAmount(_am:int=1):
	punishAmount += 1
	if(punishAmount < 0):
		punishAmount = 0

func onPunish():
	punishAmount += 1

func getOwnerInfo() -> Array:
	var result:Array = []
	
	result.append("Level: "+str(level))
	result.append("Influence: "+str(Util.roundF(influence*100.0, 1))+"%")
	result.append("Punishments: "+str(punishAmount))
	
	return result

func getOwnerInfoString() -> String:
	return Util.join(getOwnerInfo(), "\n")

func shouldPunishWeak() -> bool:
	return punishAmount <= 1

func shouldPunishStrong() -> bool:
	return punishAmount == 2

func shouldPunishGetRidOf() -> bool:
	return punishAmount >= 3

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
		sa = shouldAppoach,
		ht = hasTasks,
		t = tasksData,
		pa = punishAmount,
		pn = pcName,
	}

func loadData(_data:Dictionary):
	level = SAVE.loadVar(_data, "l", 0)
	influence = SAVE.loadVar(_data, "i", 0.5)
	shouldAppoach = SAVE.loadVar(_data, "sa", false)
	hasTasks = SAVE.loadVar(_data, "ht", false)
	punishAmount = SAVE.loadVar(_data, "pa", 0)
	pcName = SAVE.loadVar(_data, "pn", "slave")
	
	tasks.clear()
	var tasksData:Array = SAVE.loadVar(_data, "tasks", [])
	for taskData in tasksData:
		var taskID = SAVE.loadVar(taskData, "id", "")
		var taskObj:NpcBreakTaskBase = GlobalRegistry.createSlaveBreakTask(taskID)
		if(taskObj == null):
			continue
		taskObj.loadData(SAVE.loadVar(taskData, "data", {}))
		var _ok = taskObj.connect("onTaskCompleted", self, "onSlutTaskCompleted")
		tasks.append(taskObj)
