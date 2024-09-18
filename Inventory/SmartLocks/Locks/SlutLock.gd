extends SmartLockBase

var keyAmount:int = 5
var tasks = []
var canRemoveReminded:bool = false

func _init():
	id = SmartLock.SlutLock

func getName():
	return "SlutLock"

func getUnlockDescription():
	var theText = "Unable to struggle off. Little screen shows this:\n"
	theText += getQuestProgressText()
	theText += "\nAlternatively, there are "+str(keyAmount)+" keyholes.."
	return theText

func getKeysAmountToUnlock() -> int:
	return keyAmount

func onLocked(_contex):
	keyAmount = RNG.randi_range(2, 3)
	if(OPTIONS.isHardStruggleEnabled()):
		keyAmount = RNG.randi_range(2, 5)
	
	if(RNG.chance(3)): #EVIL
		generateTasks(5)
	elif(RNG.chance(10)):
		generateTasks(3)
	else:
		generateTasks(RNG.randi_range(1, 2))

func saveData():
	var tasksData = []
	for task in tasks:
		var taskData = {
			"id": task.id,
			"data": task.saveData()
		}
		tasksData.append(taskData)
	return {
		keyAmount = keyAmount,
		canRemoveReminded = canRemoveReminded,
		tasks = tasksData,
	}

func loadData(_data):
	keyAmount = SAVE.loadVar(_data, "keyAmount", 5)
	canRemoveReminded = SAVE.loadVar(_data, "canRemoveReminded", false)

	clearTasks()
	var tasksData = SAVE.loadVar(_data, "tasks", [])
	for taskData in tasksData:
		var taskID = SAVE.loadVar(taskData, "id", "")
		var taskObj:NpcBreakTaskBase = GlobalRegistry.createSlaveBreakTask(taskID)
		if(taskObj == null):
			continue
		taskObj.loadData(SAVE.loadVar(taskData, "data", {}))
		var _ok = taskObj.connect("onTaskCompleted", self, "onSlutTaskCompleted")
		tasks.append(taskObj)

func generateTasks(howManyTasks = 2):
	tasks.clear()
	var theChar = getWearer()
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
	if(!canRemoveReminded && isEverythingCompleted() && GM.pc == getWearer()):
		canRemoveReminded = true
		
		if(GM.main != null):
			GM.main.addMessage("One of your SlutLocks beeps and turns green!")

func handleSexEvent(sexEvent:SexEvent):
	var theChar = getWearer()
	for task in tasks:
		task.onSexEvent(theChar, sexEvent)

func onSexEnded(_contex = {}):
	var theChar = getWearer()
	for task in tasks:
		task.onSexEnded(theChar, _contex)

func clearTasks():
	tasks = []

func checkIfTasksGotCompleted():
	var theChar = getWearer()
	for task in tasks:
		task.checkIfCompletedFor(theChar)

func canBeSimpleRemoved() -> bool:
	checkIfTasksGotCompleted()
	return isEverythingCompleted()

func getQuestProgressText():
	var result = []
	
	for task in tasks:
		var taskString = task.getTaskStringSlutLock()
		if(task.isCompleted()):
			result.append("[color=green]"+str(taskString)+"[/color]")
		else:
			result.append("[color=red]"+str(taskString)+"[/color]")
	
	return Util.join(result, "\n")
