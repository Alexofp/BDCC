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
	var theChar:BaseCharacter = getChar()
	if(theChar == null):
		return
	
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
	
	var howManyTasks = 2
	while(howManyTasks > 0 && weightMap.size() > 0):
		var theTaskRef:NpcBreakTaskBase = RNG.grabWeightedPairs(weightMap)
		var theTask:NpcBreakTaskBase = GlobalRegistry.createSlaveBreakTask(theTaskRef.id)
		
		var _ok = theTask.connect("onTaskCompleted", self, "onBreakTaskCompleted")
		theTask.generateFor(theChar)
		tasks.append(theTask)
		howManyTasks -= 1

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
