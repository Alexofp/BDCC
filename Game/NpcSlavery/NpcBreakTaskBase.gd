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
