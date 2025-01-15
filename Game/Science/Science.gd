extends Reference
class_name Science

var points:int = 0

var generatedTasks:bool = false
var nurseryTasks:Array = []

var unlockedTFs:Dictionary = {} # {TFID = true}
var storedFluids:Dictionary = {} # {FluidType = Amount}

const DIFFICULTY_EASY = 0
const DIFFICULTY_MEDIUM = 1
const DIFFICULTY_HARD = 2
const DIFFICULTY_VERY_HARD = 3

func onNewDay():
	var newNurseryTasks:Array = []
	
	for task in nurseryTasks:
		task.days -= 1
		if(task.days > 0):
			newNurseryTasks.append(task)
	nurseryTasks = newNurseryTasks
	
	#nurseryTasks.clear()
	generatedTasks = false

func generateNurseryTasks():
	var needTasksToGenerate:int = 3
	needTasksToGenerate -= nurseryTasks.size()
	
	var possible:Array = []
	for taskID in GlobalRegistry.getNurseryTasks():
		var task:NurseryTaskBase = GlobalRegistry.createNurseryTask(taskID)
		
		var newTasksStuff:Array = task.generatePossibleTasks()
		for newTaskInfo in newTasksStuff:
			newTaskInfo["taskID"] = taskID
			var weight:float = 1.0
			if(newTaskInfo.has("weight")):
				weight = newTaskInfo["weight"]
			if(newTaskInfo.has("difficulty")):
				var diff:int = newTaskInfo["difficulty"]
				var credReward:int = 0
				var pointReward:int = 0
				
				if(diff == DIFFICULTY_EASY):
					credReward = 1 + (1 if RNG.chance(20) else 0)
					pointReward = 5
				if(diff == DIFFICULTY_MEDIUM):
					credReward = RNG.randi_range(3, 5)
					pointReward = 10
				if(diff == DIFFICULTY_HARD):
					credReward = RNG.randi_range(5, 10)
					pointReward = 15
				if(diff == DIFFICULTY_VERY_HARD):
					credReward = RNG.randi_range(10, 20)
					pointReward = 25
				
				if(!newTaskInfo.has("credits")):
					newTaskInfo["credits"] = credReward
				if(!newTaskInfo.has("sciPoints")):
					newTaskInfo["sciPoints"] = pointReward
			
			possible.append([newTaskInfo, weight])
	
	var picked:Array = []
	while(picked.size() < needTasksToGenerate && !possible.empty()):
		picked.append(RNG.grabWeightedPairs(possible))
	
	for pickedInfo in picked:
		var task:NurseryTaskBase = GlobalRegistry.createNurseryTask(pickedInfo["taskID"])
		task.setTaskDataFinal(pickedInfo)
		nurseryTasks.append(task)

func rerollTasks():
	nurseryTasks.clear()
	generateNurseryTasks()

func getNurseryTasks() -> Array:
	if(!generatedTasks):
		generateNurseryTasks()
		generatedTasks = true
		
	return nurseryTasks

func peekNurseryTasks() -> Array:
	return nurseryTasks

func removeNurseryTask(_task):
	if(nurseryTasks.has(_task)):
		nurseryTasks.erase(_task)
		return true
	return false

func addFluid(fluidID:String, amount:float):
	if(!storedFluids.has(fluidID)):
		storedFluids[fluidID] = 0.0

	storedFluids[fluidID] += amount

	if(storedFluids[fluidID] <= 0.0):
		storedFluids.erase(fluidID)

func getFluidAmount(fluidID:String) -> float:
	if(!storedFluids.has(fluidID)):
		return 0.0
	return storedFluids[fluidID]

func handleBountyFluid(_fluidType:String, _amount:float):
	for task in nurseryTasks:
		task.handleBountyFluid(_fluidType, _amount)
	#addFluid(_fluidType, _amount*0.1)

func handleSexEvent(_event:SexEvent):
	for task in nurseryTasks:
		task.handleSexEvent(_event)

func processTime(_seconds:int):
	var taskAmount:int = nurseryTasks.size()
	for _i in range(taskAmount):
		var task:NurseryTaskBase = nurseryTasks[taskAmount-1-_i]
		
		if(task.isCompleted()):
			task.completeSelf()
			continue
		
		if(task.shouldBeCancelled()):
			nurseryTasks.remove(taskAmount-1-_i)
			continue

func addPoints(howMuch:int):
	points += howMuch

func getPoints() -> int:
	return points

func isTransformationUnlocked(TFID:String) -> bool:
	if(unlockedTFs.has(TFID) && unlockedTFs[unlockedTFs]):
		return true
	return false

func getUnlockedTFs() -> Array:
	return unlockedTFs.keys()

func doUnlockTF(TFID:String, givePoints:bool = true):
	if(unlockedTFs.has(TFID)):
		return
	unlockedTFs[TFID] = true
	var tfBase = GlobalRegistry.getTransformationRef(TFID)
	if(givePoints):
		if(tfBase != null):
			addPoints(tfBase.getUnlockPointsAward())
	if(tfBase != null):
		GM.main.addMessage(tfBase.getPillName()+" pills will now be visible to you in the wild.")

func saveData() -> Dictionary:
	var taskData:Array = []
	for task in nurseryTasks:
		taskData.append({
			id = task.id,
			data = task.saveData(),
		})
	
	return {
		points = points,
		gt = generatedTasks,
		sf = storedFluids,
		nt = taskData,
		uf = unlockedTFs,
	}

func loadData(_data:Dictionary):
	points = SAVE.loadVar(_data, "points", 0)
	generatedTasks = SAVE.loadVar(_data, "gt", false)
	storedFluids = SAVE.loadVar(_data, "sf", {})
	unlockedTFs = SAVE.loadVar(_data, "uf", {})
	
	nurseryTasks.clear()
	var taskData = SAVE.loadVar(_data, "nt", [])
	for taskEntry in taskData:
		var taskID:String = SAVE.loadVar(taskEntry, "id", "")
		var theTask:NurseryTaskBase = GlobalRegistry.createNurseryTask(taskID)
		if(theTask == null):
			continue
		nurseryTasks.append(theTask)
		theTask.loadData(SAVE.loadVar(taskEntry, "data", {}))
