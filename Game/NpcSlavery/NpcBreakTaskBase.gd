extends Reference
class_name NpcBreakTaskBase

var id = "Error"
var taskIsCompleted = false
var currentAmount = 0
var needAmount = 1

signal onTaskCompleted(theTask)

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
		SlaveType.All : 1.0,
	}

func getSlutlockWeight() -> float:
	return 0.0

func isPossibleForPC(_pc, _npc, _isSlaveLevelup):
	return true

func isPossibleFor(_npc, _isSlaveLevelup):
	return false

func generateFor(_npc, _isSlaveLevelup, _difficulty = 1.0):
	pass

func isCompletedFor(_npc):
	return false

func checkIfCompletedFor(_npc):
	if(!isCompleted()):
		if(currentAmount >= needAmount || isCompletedFor(_npc)):
			completeSelf()

func completeSelf():
	if(!taskIsCompleted):
		taskIsCompleted = true
		emit_signal("onTaskCompleted", self)

func isCompleted():
	return taskIsCompleted

func onSexEvent(_npc, _event:SexEvent):
	return false

func onSexEnded(_npc, _contex = {}):
	pass

func getTaskString():
	return "Do a backflip!"

func getTaskStringSlutLock():
	return getTaskString()

func getTaskHint(_isSlaveLevelup):
	return ""

func getProgressString(extraStr = ""):
	return ""+str(currentAmount)+"/"+str(needAmount)+(" "+extraStr if extraStr != "" else "")

func getProgressStringFluids():
	return ""+str(Util.roundF(currentAmount, 1))+"/"+str(Util.roundF(needAmount, 1))+"ml"

func getProgressStringCustomCurrent(customCurrent):
	return ""+str(customCurrent)+"/"+str(needAmount)

func advanceTask(howMuch = 1):
	currentAmount += howMuch
	if(currentAmount >= needAmount && !taskIsCompleted):
		completeSelf()

static func generateTasksFor(theChar, slaveType, _isSlaveLevelup, taskAmount, difficultyMin = 1.0, difficultyMax = 1.0):
	difficultyMin = max(1.0, difficultyMin)
	difficultyMax = max(1.0, difficultyMax)
	if(difficultyMax < difficultyMin):
		difficultyMax = difficultyMin
	var tasks = []
	var weightMap = []
	
	for taskID in GlobalRegistry.getSlaveBreakTaskRefs():
		var taskRef:NpcBreakTaskBase = GlobalRegistry.getSlaveBreakTaskRef(taskID)
		
		if(!taskRef.isPossibleFor(theChar, _isSlaveLevelup)):
			continue
		if(!taskRef.isPossibleForPC(GM.pc, theChar, _isSlaveLevelup)):
			continue
		
		var taskWeights = taskRef.getSlaveTypeWeights(false)
		var taskWeight = 0.0
		if(taskWeights.has(SlaveType.All)):
			taskWeight = taskWeights[SlaveType.All]
		if(taskWeights.has(slaveType)):
			taskWeight = taskWeights[slaveType]
		
		weightMap.append([taskRef, taskWeight])
	
	var howManyTasks = taskAmount
	while(howManyTasks > 0 && weightMap.size() > 0):
		var theTaskRef:NpcBreakTaskBase = RNG.grabWeightedPairs(weightMap)
		var theTask:NpcBreakTaskBase = GlobalRegistry.createSlaveBreakTask(theTaskRef.id)
		
		#var _ok = theTask.connect("onTaskCompleted", self, "onBreakTaskCompleted")
		theTask.generateFor(theChar, _isSlaveLevelup, RNG.randf_rangeX2(difficultyMin, difficultyMax))
		tasks.append(theTask)
		howManyTasks -= 1
		
	return tasks

func scaledRangeWithDifficulty(minv:int, maxv:int, _difficulty:float):
	var newminv:int = int(round(minv * _difficulty))
	var newmaxv:int = int(round(maxv * _difficulty))
	return RNG.randi_range(newminv, newmaxv)

func saveData():
	var data = {
		"taskIsCompleted": taskIsCompleted,
		"currentAmount": currentAmount,
		"needAmount": needAmount,
	}
	
	return data

func loadData(data):
	taskIsCompleted = SAVE.loadVar(data, "taskIsCompleted", false)
	currentAmount = SAVE.loadVar(data, "currentAmount", 0)
	needAmount = SAVE.loadVar(data, "needAmount", 1)
