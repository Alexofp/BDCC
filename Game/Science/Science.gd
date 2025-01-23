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

var upgradesInfo:Dictionary = {
	"advBreastPump": {
		name = "Breast Pump Mk2",
		desc = "Unlocks a prototype of an advanced breast pump that you can buy in the medical vendomat.",
		cost = 50,
		requiredUpgrades = [],
	},
	"advPenisPump": {
		name = "Penis Pump Mk2",
		desc = "Unlocks a prototype of an advanced penis pump that you can buy in the medical vendomat.",
		cost = 50,
		requiredUpgrades = [],
	},
	"configurableDrugs": {
		name = "Lab upgrade",
		desc = "Allows you to 'configure' certain types of drugs when making them.",
		cost = 50,
		requiredUpgrades = [],
	},
	"TFAcceleratePill": {
		name = "QuickShift Pill",
		desc = "Allows you to make 'QuickShift' pills that speed up the process of transformation greatly.",
		cost = 10,
		requiredUpgrades = [],
		items = {
			"TFAcceleratePill": {
				fluids = {
					"Cum": 69.0,
				},
			},
		},
	},
	"TFApplyPill": {
		name = "MorphIn Pill",
		desc = "Allows you to make 'MorphIn' pills that make all transformations permanent.",
		cost = 10,
		requiredUpgrades = [],
		items = {
			"TFApplyPill": {
				fluids = {
					"Cum": 69.0,
				},
			},
		},
	},
	"TFUndoPill": {
		name = "MorphAway Pill",
		desc = "Allows you to make 'MorphAway' pills that undo all transformations.",
		cost = 10,
		requiredUpgrades = [],
		items = {
			"TFUndoPill": {
				fluids = {
					"Cum": 69.0,
				},
			},
		},
	},
	"painkillers": {
		name = "Painkillers",
		desc = "Allows you to make painkillers.",
		cost = 10,
		requiredUpgrades = [],
		items = {
			"painkillers": {
				fluids = {
					"Cum": 69.0,
				},
			},
		},
	},
	"cheaperCrafts1": {
		name = "Lab efficiency 1",
		desc = "Lowers the amount of fluids you need to create something by 10%.",
		cost = 10,
		drugAmount = 2,
		requiredUpgrades = [],
	},
	"cheaperCrafts2": {
		name = "Lab efficiency 2",
		desc = "Lowers the amount of fluids you need to create something by an additional 15%.",
		cost = 30,
		drugAmount = 5,
		requiredUpgrades = ["cheaperCrafts1"],
	},
	"cheaperCrafts3": {
		name = "Lab efficiency 3",
		desc = "Lowers the amount of fluids you need to create something by an additional 25%.",
		cost = 50,
		drugAmount = 10,
		requiredUpgrades = ["cheaperCrafts2"],
	},
	"shower1": {
		name = "Special shower",
		desc = "Install a special shower that will wash off any fluids from your body and deposit them into the fluid tanks.",
		cost = 20,
		requiredUpgrades = [],
	},
	"shower2": {
		name = "Shower Douche",
		desc = "Upgrade the shower, allowing it to also collect fluids from inside your holes!",
		cost = 20,
		requiredUpgrades = ["shower1"],
	},
	"bluespaceStash": {
		name = "Bluespace Stash",
		desc = "Allows you to access your private stash from inside the lab!",
		cost = 30,
		requiredUpgrades = [],
	},
	"fluidInspector": {
		name = "Fluid inspector",
		desc = "Install a special scanner that will allow you to closely inspect any fluid container. It will show you the DNA of every fluid in the selected container",
		cost = 20,
		requiredUpgrades = [],
	},
	"fluidFilter": {
		name = "Fluid filter",
		desc = "Install a special fluid filter machine that will allow you to filter out selected fluids from your fluid containers.",
		cost = 20,
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
	var curVal:float = storedFluids[fluidID]
	
	storedFluids[fluidID] += amount
	
	if(storedFluids[fluidID] > getStoredFluidLimit(fluidID)):
		storedFluids[fluidID] = getStoredFluidLimit(fluidID)
	
	var newVal:float = storedFluids[fluidID]
	if(storedFluids[fluidID] <= 0.0):
		storedFluids.erase(fluidID)
	return newVal - curVal

func getFluidAmount(fluidID:String) -> float:
	if(!storedFluids.has(fluidID)):
		return 0.0
	return storedFluids[fluidID]

func clearFluid(fluidID:String):
	if(storedFluids.has(fluidID)):
		storedFluids.erase(fluidID)

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

func addPoints(howMuch:int, showMessage:bool = true):
	points += howMuch
	if(showMessage):
		if(howMuch > 0):
			GM.main.addMessage("You received "+str(howMuch)+" science point"+("s" if howMuch != 1 else "")+"!")
		if(howMuch < 0):
			GM.main.addMessage("You lost "+str(-howMuch)+" science point"+("s" if howMuch != -1 else "")+"")
		
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
	var tfBase = GlobalRegistry.getTransformationRef(TFID)
	if(!tfBase.canUnlockAsPill()):
		return
	unlockedTFs[TFID] = true
	if(givePoints):
		if(tfBase != null):
			addPoints(tfBase.getUnlockPointsAward())
	if(tfBase != null):
		GM.main.addMessage(tfBase.getPillName()+" pills will now be visible to you in the wild.")

func doTestTF(TFID:String, givePoints:bool = true):
	if(!unlockedTFs.has(TFID)):
		return
	if(testedTFs.has(TFID)):
		return
	var tfBase = GlobalRegistry.getTransformationRef(TFID)
	if(!tfBase.canUnlockAsPill()):
		return
	testedTFs[TFID] = true
	if(givePoints):
		if(tfBase != null):
			addPoints(tfBase.getUnlockPointsAward()*3)
	if(tfBase != null):
		GM.main.addMessage("The database now contains full info about "+tfBase.getPillName()+" pills.")

func doTestTFsOf(theChar:BaseCharacter):
	var holder:TFHolder = theChar.getTFHolder()
	if(holder == null):
		return
	for tf in holder.getTransformationsInFinalStage():
		doTestTF(tf.id)

func hasTFsCanScan(theChar:BaseCharacter) -> bool:
	var holder:TFHolder = theChar.getTFHolder()
	if(holder == null):
		return false
	for tf in holder.getTransformationsInFinalStage():
		var TFID:String = tf.id
		
		if(!unlockedTFs.has(TFID)):
			continue
		if(testedTFs.has(TFID)):
			continue
		return true
	return false

func getTFsCanScanAmount(theChar:BaseCharacter) -> int:
	var holder:TFHolder = theChar.getTFHolder()
	if(holder == null):
		return 0
	var result:int = 0
	for tf in holder.getTransformationsInFinalStage():
		var TFID:String = tf.id
		
		if(!unlockedTFs.has(TFID)):
			continue
		if(testedTFs.has(TFID)):
			continue
		result += 1
	return result

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

func doesPCHaveUnknownStrangePills() -> bool:
	for itemA in GM.pc.getInventory().getItems():
		var item:ItemBase = itemA
		if(item.id != "TFPill"):
			continue
		var tfID:String = item.getTFID()
		if(!isTransformationUnlocked(tfID)):
			return true
	return false

func getPCUnknownStrangePills() -> Array:
	var result:Array = []
	for itemA in GM.pc.getInventory().getItems():
		var item:ItemBase = itemA
		if(item.id != "TFPill"):
			continue
		var tfID:String = item.getTFID()
		if(!isTransformationUnlocked(tfID)):
			result.append(item)
	return result

func canConfigureDrugs() -> bool:
	return hasUpgrade("configurableDrugs")

func canMakePillResult(tfID:String) -> Array:
	var tf:TFBase = GlobalRegistry.getTransformationRef(tfID)
	if(tf == null):
		return [false, "Error?"]
	
	var costMod:float = getFluidsCostMod()
	var badResult:Array = []
	var fluidsNeed:Dictionary = tf.getPillFluidsRequired()
	for fluidID in fluidsNeed:
		var fluidObj:FluidBase = GlobalRegistry.getFluid(fluidID)
		var howMuchNeed:float = round(fluidsNeed[fluidID] * costMod)
		var howMuchWeHave:float = getFluidAmount(fluidID)
		
		if(howMuchWeHave < howMuchNeed):
			badResult.append("Not enough "+(fluidObj.getVisibleName() if fluidObj != null else fluidID))
	
	if(badResult.empty()):
		return [true, ""]
	return [false, Util.join(badResult, "\n")]

func canMakeHasFluids(fluidsNeed:Dictionary) -> Array:
	var badResult:Array = []
	
	var costMod:float = getFluidsCostMod()
	for fluidID in fluidsNeed:
		var fluidObj:FluidBase = GlobalRegistry.getFluid(fluidID)
		var howMuchNeed:float = round(fluidsNeed[fluidID] * costMod)
		var howMuchWeHave:float = getFluidAmount(fluidID)
		
		if(howMuchWeHave < howMuchNeed):
			badResult.append("Not enough "+(fluidObj.getVisibleName() if fluidObj != null else fluidID))
	
	if(badResult.empty()):
		return [true, ""]
	return [false, Util.join(badResult, "\n")]

func canMakeGetFluidsDescription(fluidsNeed:Dictionary) -> String:
	var costMod:float = getFluidsCostMod()
	var result:String = ""
	for fluidID in fluidsNeed:
		var fluidObj:FluidBase = GlobalRegistry.getFluid(fluidID)
		var howMuchNeed:float = round(fluidsNeed[fluidID] * costMod)
		var howMuchWeHave:float = getFluidAmount(fluidID)
		
		if(result != ""):
			result += "\n"
		result += "- "+(fluidObj.getVisibleName() if fluidObj != null else fluidID)+": "+str(round(howMuchNeed))+"ml  (You have "+str(Util.roundF(howMuchWeHave, 1))+"ml)"
	return result

func useFluidsToMakeSomething(fluidsNeed:Dictionary):
	var costMod:float = getFluidsCostMod()
	for fluidID in fluidsNeed:
		addFluid(fluidID, -round(fluidsNeed[fluidID]*costMod))

func getFluidsCostMod() -> float:
	var theMod:float = 1.0
	if(hasUpgrade("cheaperCrafts1")):
		theMod -= 0.1
	if(hasUpgrade("cheaperCrafts2")):
		theMod -= 0.15
	if(hasUpgrade("cheaperCrafts3")):
		theMod -= 0.25
	
	return theMod

func getMakePillDescription(tfID:String) -> String:
	var result:String = ""
	var tf:TFBase = GlobalRegistry.getTransformationRef(tfID)
	if(tf == null):
		return "Error, bad pill"
	
	result += "Effect: "+tf.getName()
	result += "\n\nRequired:"
	
	var costMod:float = getFluidsCostMod()
	var fluidsNeed:Dictionary = tf.getPillFluidsRequired()
	for fluidID in fluidsNeed:
		var fluidObj:FluidBase = GlobalRegistry.getFluid(fluidID)
		var howMuchNeed:float = round(fluidsNeed[fluidID] * costMod)
		var howMuchWeHave:float = getFluidAmount(fluidID)
		
		result += "\n- "+(fluidObj.getVisibleName() if fluidObj != null else fluidID)+": "+str(round(howMuchNeed))+"ml  (You have "+str(Util.roundF(howMuchWeHave, 1))+"ml)"
	
	if(canConfigureDrugs() && tf.getPillCanConfigure()):
		result += "\n\nThis pill can be configured!"
	
	return result

func useFluidsToMakePill(tfID:String, _args:Dictionary = {}) -> ItemBase:
	var tf:TFBase = GlobalRegistry.getTransformationRef(tfID)
	if(tf == null):
		return null
	
	var costMod:float = getFluidsCostMod()
	var fluidsNeed:Dictionary = tf.getPillFluidsRequired()
	for fluidID in fluidsNeed:
		addFluid(fluidID, -round(fluidsNeed[fluidID]*costMod))
	
	var newPill:ItemBase = GlobalRegistry.createItem("TFPill")
	newPill.tfID = tfID
	newPill.tfArgs = _args
	return newPill

func getCraftableItems() -> Dictionary:
	var result:Dictionary = {}
	
	for upgradeID in upgrades:
		var upgradeInfo:Dictionary = upgradesInfo[upgradeID]
		
		if(upgradeInfo.has("items")):
			var theItems:Dictionary = upgradeInfo["items"]
			
			for itemID in theItems:
				result[itemID] = theItems[itemID]
	
	return result

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
