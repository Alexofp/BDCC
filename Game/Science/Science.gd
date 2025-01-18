extends Reference
class_name Science

var points:int = 0

var generatedTasks:bool = false
var nurseryTasks:Array = []

var unlockedTFs:Dictionary = {} # {TFID = true}
var testedTFs:Dictionary = {} # {TFID = true}
var storedFluids:Dictionary = {} # {FluidType = Amount}
var upgrades:Dictionary = {} # {upgradeID = true}

const DIFFICULTY_EASY = 0
const DIFFICULTY_MEDIUM = 1
const DIFFICULTY_HARD = 2
const DIFFICULTY_VERY_HARD = 3

const upgradesInfo:Dictionary = {
	"advBreastPump": {
		name = "Breast Pump Mk2",
		desc = "Unlocks a prototype of an advanced breast pump that you can buy in the medical vendomat.",
		cost = 10,
		requiredUpgrades = [],
	},
	"advPenisPump": {
		name = "Penis Pump Mk2",
		desc = "Unlocks a prototype of an advanced penis pump that you can buy in the medical vendomat.",
		cost = 10,
		requiredUpgrades = [],
	},
}

func isUpgradeVisible(upgradeID:String) -> bool:
	if(!upgradesInfo.has(upgradeID)):
		return false
	var theInfo:Dictionary = upgradesInfo[upgradeID]
	if(!theInfo.has("requiredUpgrades")):
		return true
	for otherUpgradeID in theInfo["requiredUpgrades"]:
		if(!hasUpgrade(otherUpgradeID)):
			return false
	return true

func unlockUpgrade(upgradeID:String):
	if(upgradesInfo.has(upgradeID)):
		upgrades[upgradeID] = true

func getUpgrades() -> Dictionary:
	return upgradesInfo

func getTotalUpgradeCount() -> int:
	return upgradesInfo.size()

func getUpgradeCount() -> int:
	return upgrades.size()

func hasUpgrade(upgradeID:String) -> bool:
	if(upgrades.has(upgradeID)):
		return true
	return false

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
	
	if(storedFluids[fluidID] > getStoredFluidLimit(fluidID)):
		storedFluids[fluidID] = getStoredFluidLimit(fluidID)

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
	if(unlockedTFs.has(TFID) && unlockedTFs[TFID]):
		return true
	return false

func isTransformationTested(TFID:String) -> bool:
	if(testedTFs.has(TFID) && testedTFs[TFID]):
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

func getStoredFluids() -> Dictionary:
	return storedFluids

func getStoredFluidsWithDefauls() -> Dictionary:
	var result:Dictionary = {
		Milk = 0.0,
		Cum = 0.0,
		GirlCum = 0.0,
	} # This way these 3 fluids are always first and always appear in the list
	for fluidID in storedFluids:
		result[fluidID] = storedFluids[fluidID]
	return result

func getStoredFluidLimit(fluidType:String) -> float:
	var result:float = 1000.0
	
	var theFluid:FluidBase = GlobalRegistry.getFluid(fluidType)
	if(theFluid != null):
		result *= theFluid.getFluidTankLimitMod()
	return result

func getSciencePoints() -> int:
	return points

func getTotalStrangePillCount() -> int:
	var result:int = 0
	
	for tfID in GlobalRegistry.getTransformationRefs():
		var tf:TFBase = GlobalRegistry.getTransformationRef(tfID)
		
		if(tf.canUnlockAsPill()):
			result += 1
	
	return result

func getUnlockedStrangePillsCount() -> int:
	return unlockedTFs.size()

func getTestedStrangePillsCount() -> int:
	return testedTFs.size()

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
		tt = testedTFs,
		up = upgrades,
	}

func loadData(_data:Dictionary):
	points = SAVE.loadVar(_data, "points", 0)
	generatedTasks = SAVE.loadVar(_data, "gt", false)
	storedFluids = SAVE.loadVar(_data, "sf", {})
	unlockedTFs = SAVE.loadVar(_data, "uf", {})
	testedTFs = SAVE.loadVar(_data, "tt", {})
	upgrades = SAVE.loadVar(_data, "up", {})
	
	nurseryTasks.clear()
	var taskData = SAVE.loadVar(_data, "nt", [])
	for taskEntry in taskData:
		var taskID:String = SAVE.loadVar(taskEntry, "id", "")
		var theTask:NurseryTaskBase = GlobalRegistry.createNurseryTask(taskID)
		if(theTask == null):
			continue
		nurseryTasks.append(theTask)
		theTask.loadData(SAVE.loadVar(taskEntry, "data", {}))
