extends Reference
class_name NpcEnslavementQuest

var npc:WeakRef
var slaveType = SlaveType.Slut
var tasks = []
var forceCompleted:bool = false

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
	
	var personality:Personality = theChar.getPersonality()
	var subbyStat = personality.getStat(PersonalityStat.Subby)
	var cowardStat = personality.getStat(PersonalityStat.Coward)
	var meanStat = personality.getStat(PersonalityStat.Mean)
	var bratStat = personality.getStat(PersonalityStat.Brat)
	var impatientStat = personality.getStat(PersonalityStat.Impatient)
	var naiveStat = personality.getStat(PersonalityStat.Naive)
	
	var tasksAmountFloat = 1
	var difficultyMin = 1.0
	var difficultyMax = 1.0
	
	tasksAmountFloat += max(-0.33, -cowardStat) * 3
	tasksAmountFloat += max(-0.2, meanStat) * 2
	tasksAmountFloat += max(0.0, -subbyStat) * 3
	tasksAmountFloat += max(0.0, -naiveStat) * 2
	var tasksAmount:int = Util.maxi(2, int(round(tasksAmountFloat)))
	
	difficultyMax += max(0.0, bratStat) * 1.0
	difficultyMax += max(0.0, -impatientStat) * 0.5
	difficultyMin += max(0.0, -subbyStat) * 0.5
	difficultyMax += max(0.0, -subbyStat) * 2.0
	difficultyMin += max(0.0, -meanStat) * 0.5
	difficultyMax += max(0.0, -meanStat) * 1.0
	difficultyMin -= max(0.0, naiveStat) * 0.3
	difficultyMax -= max(0.0, naiveStat) * 0.6

	#print("TASK AMOUNT: "+str(tasksAmountFloat)+", Min diff: "+str(Util.roundF(difficultyMin, 2))+", Max diff: "+str(Util.roundF(difficultyMax, 2)))
	
	tasks = NpcBreakTaskBase.generateTasksFor(theChar, slaveType, false, tasksAmount, difficultyMin, difficultyMax)
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
		if(task.isCompleted() || forceCompleted):
			result.append("[color=green]"+str(taskString)+"[/color]")
		else:
			result.append("[color=red]"+str(taskString)+"[/color]")
	
	return Util.join(result, "\n")

func getQuestStartText():
	var result = []
	
	for task in tasks:
		var taskString = task.getTaskString()
		result.append("[b]"+str(taskString)+"[/b]")
		
		var hintString = task.getTaskHint(false)
		if(hintString != null && hintString != ""):
			result.append(" - "+hintString)
	
	return Util.join(result, "\n")

func isEverythingCompleted():
	if(forceCompleted):
		return true
	
	for task in tasks:
		if(!task.isCompleted()):
			return false
	
	return true

func handleSexEvent(sexEvent:SexEvent):
	var theChar = getChar()
	for task in tasks:
		task.onSexEvent(theChar, sexEvent)

func onSexEnded(_contex = {}):
	var theChar = getChar()
	for task in tasks:
		task.onSexEnded(theChar, _contex)

func clearTasks():
	tasks = []

func checkIfTasksGotCompleted():
	var theChar = getChar()
	for task in tasks:
		task.checkIfCompletedFor(theChar)

func forceComplete():
	forceCompleted = true
	onBreakTaskCompleted(null)

func saveData():
	var data = {
		"slaveType": slaveType,
		"canEnslaveReminded": canEnslaveReminded,
		"forceCompleted": forceCompleted,
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
	forceCompleted = SAVE.loadVar(data, "forceCompleted", false)
	
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
