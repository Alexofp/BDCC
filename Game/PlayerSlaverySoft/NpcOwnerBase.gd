extends Reference
class_name NpcOwnerBase

var id:String = "error"

var level:int = 1
var influence:float = 0.5
var charID:String = ""

var shouldAppoach:bool = false

var hasTasks:bool = false
var tasks:Array = []

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

func getInteractEvents() -> Array:
	return [
		
	]

func addInfluence(_am:float):
	influence += _am
	influence = clamp(influence, 0.0, 1.0)

func getInfluence() -> float:
	return influence

func getExtraCategoryText() -> String:
	var theText:String = "\n"
	theText += "Level: "+str(level)
	theText += "\nInfluence: "+str(Util.roundF(influence*100.0, 1))+"%"
	return theText

func getPCName() -> String:
	if(true):
		return "pet"
	return "slave"

func shouldOwnerApproachPC() -> bool:
	return shouldAppoach

#[id, args]
func getApproachEvent() -> Array:
	shouldAppoach = false
	return ["FuckInStocks", []]

func onNewDay():
	shouldAppoach = true
	if(influence <= 0.0):
		endSlavery()
		return
	
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

func saveData() -> Dictionary:
	return {}

func loadData(_data:Dictionary):
	pass
