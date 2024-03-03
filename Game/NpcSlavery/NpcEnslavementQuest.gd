extends Reference
class_name NpcEnslavementQuest

var npc:WeakRef
var slaveType = SlaveType.Slut
var tasks = []

# Util
var canEnslaveReminded = false

func setChar(theChar):
	npc = weakref(theChar)

func setSlaveType(theSlaveType):
	slaveType = theSlaveType

func getChar():
	if(npc == null):
		return null
	return npc.get_ref()

func generateTasks():
	tasks.clear()
	var theChar = getChar()
	if(theChar == null):
		return
	
	tasks = NpcBreakTaskBase.generateTasksFor(theChar, slaveType, 2, 1.0)
	for task in tasks:
		var _ok = task.connect("onTaskCompleted", self, "onBreakTaskCompleted")

func onBreakTaskCompleted(_theTask):
	if(!canEnslaveReminded && isEverythingCompleted()):
		canEnslaveReminded = true
		
		if(GM.main != null):
			GM.main.addMessage(getChar().getName()+" is ready to be enslaved!")

func getQuestProgressText():
	var result = []
	
	for task in tasks:
		var taskString = task.getTaskString()
		if(task.isCompleted()):
			result.append("[color=green]"+str(taskString)+"[/color]")
		else:
			result.append("[color=red]"+str(taskString)+"[/color]")
	
	return Util.join(result, "\n")

func getQuestStartText():
	var result = []
	
	for task in tasks:
		var taskString = task.getTaskString()
		result.append("[b]"+str(taskString)+"[/b]")
		
		var hintString = task.getTaskHint()
		if(hintString != null && hintString != ""):
			result.append(" - "+hintString)
	
	return Util.join(result, "\n")

func isEverythingCompleted():
	for task in tasks:
		if(!task.isCompleted()):
			return false
	
	return true

func handleSexEvent(sexEvent:SexEvent):
	var theChar = getChar()
	for task in tasks:
		task.onSexEvent(theChar, sexEvent)

func clearTasks():
	tasks = []

func saveData():
	var data = {
		"slaveType": slaveType,
		"canEnslaveReminded": canEnslaveReminded,
	}
	var tasksData = []
	for task in tasks:
		var taskData = {
			"id": task.id,
			"data": task.saveData()
		}
		tasksData.append(taskData)
	data["tasks"] = tasksData
	
	return data

func loadData(data):
	slaveType = SAVE.loadVar(data, "slaveType", SlaveType.Slut)
	canEnslaveReminded = SAVE.loadVar(data, "canEnslaveReminded", false)
	
	clearTasks()
	var tasksData = SAVE.loadVar(data, "tasks", [])
	for taskData in tasksData:
		var taskID = SAVE.loadVar(taskData, "id", "")
		var taskObj:NpcBreakTaskBase = GlobalRegistry.createSlaveBreakTask(taskID)
		if(taskObj == null):
			continue
		taskObj.loadData(SAVE.loadVar(taskData, "data", {}))
		var _ok = taskObj.connect("onTaskCompleted", self, "onBreakTaskCompleted")
		tasks.append(taskObj)
