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

func isPossibleForPC(_pc, _npc):
	return true

func isPossibleFor(_npc):
	return false

func generateFor(_npc, _difficulty = 1.0):
	pass

func completeSelf():
	if(!taskIsCompleted):
		taskIsCompleted = true
		emit_signal("onTaskCompleted", self)

func isCompleted():
	return taskIsCompleted

func onSexEvent(_npc, _event:SexEvent):
	return false

func getTaskString():
	return "Do a backflip!"

func getTaskHint():
	return ""

func getProgressString():
	return ""+str(currentAmount)+"/"+str(needAmount)

func advanceTask():
	currentAmount += 1
	if(currentAmount >= needAmount && !taskIsCompleted):
		completeSelf()

static func generateTasksFor(theChar, slaveType, taskAmount, difficulty = 1.0):
	var tasks = []
	var weightMap = []
	
	for taskID in GlobalRegistry.getSlaveBreakTaskRefs():
		var taskRef:NpcBreakTaskBase = GlobalRegistry.getSlaveBreakTaskRef(taskID)
		
		if(!taskRef.isPossibleFor(theChar)):
			continue
		if(!taskRef.isPossibleForPC(GM.pc, theChar)):
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
		theTask.generateFor(theChar, difficulty)
		tasks.append(theTask)
		howManyTasks -= 1
		
	return tasks

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
