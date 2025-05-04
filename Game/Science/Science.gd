extends Reference
class_name Science

var points:int = 0

var generatedTasks:bool = false
var nurseryTasks:Array = []
var nurseryTasksCompleted:int = 0

var npcIDWithDrug:String = ""
var pickedNpcWithDrug:bool = false

var unlockedTFs:Dictionary = {} # {TFID = true}
var testedTFs:Dictionary = {} # {TFID = true}
var storedFluids:Dictionary = {} # {FluidType = Amount}
var upgrades:Dictionary = {} # {upgradeID = true}

var madeStrangePills:int = 0

const DIFFICULTY_EASY = 0
const DIFFICULTY_MEDIUM = 1
const DIFFICULTY_HARD = 2
const DIFFICULTY_VERY_HARD = 3

# (out of date)
#MAX SCIENCE FOR UNLOCKING TFS: 275
#MAX SCIENCE FOR UNLOCKING+TESTING TFS: 1100
# ALL UPGRADES COST: 900

# Base tank capacity 1000
# Upgrade 1 capacity 3000
# Upgrade 2 capacity 10000
# Upgrade 3 capacity 25000
# Upgrade 4 capacity 100000

# POSSIBLE FLUIDS
# Cum
# Milk
# GirlCum
# BlackGoo
# WhiteGoo
# IvyNectar

#Can't store:
# CumLube
# HealingGel
# HotWax
# Piss



var upgradesInfo:Dictionary = {
	"TFAcceleratePill": {
		name = "QuickShift Pill",
		desc = "Allows you to make 'QuickShift' pills that speed up the process of transformation greatly.",
		cost = 15,
		requiredUpgrades = [],
		items = {
			"TFAcceleratePill": {
				fluids = {
					"Milk": 250.0,
				},
			},
		},
	},
	"TFApplyPill": {
		name = "MorphIn Pill",
		desc = "Allows you to make 'MorphIn' pills that make all transformations permanent.",
		cost = 30,
		requiredUpgrades = ["TFAcceleratePill"],
		items = {
			"TFApplyPill": {
				fluids = {
					"Milk": 500.0,
					"Cum": 100.0,
				},
			},
		},
	},
	"TFUndoPill": {
		name = "MorphAway Pill",
		desc = "Allows you to make 'MorphAway' pills that undo all transformations.",
		cost = 50,
		requiredUpgrades = ["TFAcceleratePill"],
		items = {
			"TFUndoPill": {
				fluids = {
					"Milk": 400.0,
					"GirlCum": 100.0,
				},
			},
		},
	},
	
	
	"BasicPills": {
		name = "Basic pills",
		desc = "Lets you use fluids to create some of the non-transformative drugs: Heat pills, Breeder pills, Birth control pills, Anaphrodisiac pills.",
		cost = 30,
		requiredUpgrades = [],
		items = {
			"HeatPill": {
				fluids = {
					"Milk": 200.0,
					"Cum": 100.0,
				},
			},
			"BreederPill": {
				fluids = {
					"Cum": 200.0,
				},
			},
			"BirthControlPill": {
				fluids = {
					"Milk": 200.0,
				},
			},
			"AnaphrodisiacPill": {
				fluids = {
					"GirlCum": 200.0,
				},
			},
		},
	},
	"EnergyDrink": {
		name = "Energy drink",
		desc = "Download a recipe of the most generic energy drink, allowing you to create them.",
		cost = 40,
		requiredUpgrades = ["BasicPills"],
		items = {
			"EnergyDrink": {
				fluids = {
					"Milk": 700.0,
					"GirlCum": 100.0,
				},
			},
		},
	},
	"painkillers": {
		name = "Painkillers",
		desc = "Allows you to make painkillers.",
		cost = 50,
		requiredUpgrades = ["BasicPills"],
		items = {
			"painkillers": {
				fluids = {
					"Milk": 2500.0,
					"Cum": 500.0,
				},
			},
		},
	},
	"strangepill": {
		name = "Strange pill",
		desc = "As you unlock more and more pills, it's becoming harder to find ones that you haven't seen before. This upgrade allows you to spend some Science Points and a lot of fluids to try to create a new strange pill from scratch by generating and assembling random molecular structures. Each pill will cost more than the last!",
		cost = 50,
		requiredUpgrades = ["painkillers", "EnergyDrink"],
		main = true,
		items = {
			"TFPill": {
				science = 10,
				fluids = {
					"Milk": 2500.0,
					"Cum": 1000.0,
					"GirlCum": 2500.0,
				},
			},
		},
	},
	
	
	"cheaperCrafts1": {
		name = "Lab efficiency 1",
		desc = "Lowers the amount of fluids you need to create something by 10%.",
		cost = 10,
		drugAmount = 2,
		requiredUpgrades = ["TFAcceleratePill"],
		main = true,
	},
	
	"shower1": {
		name = "Smart Shower",
		desc = "Install a special shower that will wash off any fluids from your body and deposit them into the fluid tanks.",
		cost = 20,
		requiredUpgrades = ["cheaperCrafts1"],
	},
	
	"cheaperCrafts2": {
		name = "Lab efficiency 2",
		desc = "Lowers the amount of fluids you need to create something by an additional 15%.",
		cost = 35,
		drugAmount = 5,
		requiredUpgrades = ["cheaperCrafts1"],
		main = true,
	},
	
	"shower2": {
		name = "Shower Douche",
		desc = "Upgrade the shower, allowing it to also collect fluids from inside your holes!",
		cost = 20,
		requiredUpgrades = ["shower1", "cheaperCrafts2"],
		main = true,
	},
	
	"cheaperCrafts3": {
		name = "Lab efficiency 3",
		desc = "Lowers the amount of fluids you need to create something by an additional 25%.",
		cost = 60,
		drugAmount = 10,
		requiredUpgrades = ["cheaperCrafts2"],
		main = true,
	},
	
	"configurableDrugs": {
		name = "Custom drugs",
		desc = "Allows you to 'configure' certain types of drugs when making them.",
		cost = 100,
		requiredUpgrades = ["cheaperCrafts3"],
		main = true,
	},
	
	
	"tanksUpgrade1": {
		name = "Tanks capacity 1",
		desc = "Expand the lab and install bigger fluid tanks that will hold more fluids.",
		cost = 20,
		requiredUpgrades = [],
		main = true,
	},
	
	"fluidInspector": {
		name = "Fluid inspector",
		desc = "Install a special scanner that will allow you to closely inspect any fluid container. It will show you the DNA of every fluid in the selected container",
		cost = 20,
		requiredUpgrades = ["tanksUpgrade1"],
	},
	
	"tanksUpgrade2": {
		name = "Tanks capacity 2",
		desc = "Expand the lab and install bigger fluid tanks that will hold more fluids.",
		cost = 40,
		requiredUpgrades = ["tanksUpgrade1"],
		main = true,
	},
	
	"fluidFilter": {
		name = "Fluid filter",
		desc = "Install a special fluid filter machine that will allow you to filter out selected fluids from your fluid containers.",
		cost = 20,
		requiredUpgrades = ["tanksUpgrade2"],
	},
	"bluespaceStash": {
		name = "Bluespace Stash",
		desc = "Allows you to access your private stash from inside the lab!",
		cost = 30,
		requiredUpgrades = ["tanksUpgrade2"],
	},
	
	"tanksUpgrade3": {
		name = "Tanks capacity 3",
		desc = "Expand the lab and install bigger fluid tanks that will hold more fluids.",
		cost = 60,
		requiredUpgrades = ["tanksUpgrade2"],
		main = true,
	},
	
	"advBreastPump": {
		name = "Breast Pump Mk2",
		desc = "Unlocks a prototype of an advanced breast pump that you can buy in the medical vendomat.",
		cost = 50,
		requiredUpgrades = ["tanksUpgrade3"],
	},
	"advPenisPump": {
		name = "Penis Pump Mk2",
		desc = "Unlocks a prototype of an advanced penis pump that you can buy in the medical vendomat.",
		cost = 50,
		requiredUpgrades = ["tanksUpgrade3"],
	},
	"advPlasticBottle": {
		name = "Bluespace Plastic Bottle",
		desc = "Unlocks a bluespace plastic bottle that you can buy in the medical vendomat. This bottle can store 100x as much fluids!",
		cost = 50,
		requiredUpgrades = ["advBreastPump", "advPenisPump"],
	},
	
	"tanksUpgrade4": {
		name = "Tanks capacity 4",
		desc = "Expand the lab and install bigger fluid tanks that will hold more fluids.",
		cost = 100,
		requiredUpgrades = ["tanksUpgrade3"],
		main = true,
	},
	
	"milkingBetter1": {
		name = "Milking efficiency 1",
		desc = "Install a better equipment in the milking room. Unlocks more ways for Eliza to milk you, makes ALL kinds of milking 25% more efficient.",
		cost = 20,
		requiredUpgrades = [],
	},
	"milkingBetter2": {
		name = "Milking efficiency 2",
		desc = "Install an even more better equipment in the milking room. Unlocks more ways for Eliza to milk you, makes ALL kinds of milking 75% more efficient.",
		cost = 30,
		drugAmount = 5,
		requiredUpgrades = ["milkingBetter1"],
	},
	"milkingBetter3": {
		name = "Milking efficiency 3",
		desc = "Install the best equipment in the milking room. Unlocks ability for Eliza to 'quick milk' you, makes ALL kinds of milking 100% more efficient.",
		cost = 50,
		drugAmount = 10,
		requiredUpgrades = ["milkingBetter2"],
	},
	
	
	"unlimitedFluidStorage": {
		name = "Tanks capacity +INF!",
		desc = "Install special BLUESPACE fluid tanks that will hold a shit ton of fluids!",
		cost = 250,
		requiredUpgrades = ["milkingBetter3", "tanksUpgrade4", "advPlasticBottle", "configurableDrugs", "strangepill", "bluespaceStash"],
	},
	"drugDenLoot": {
		name = "Strong Nanobots!",
		desc = "Upgrade Eliza's nanobots, allowing them to extract you with ALL items that you have found during the drug den exploration!",
		cost = 250,
		requiredUpgrades = ["milkingBetter3", "tanksUpgrade4", "advPlasticBottle", "configurableDrugs", "strangepill", "bluespaceStash"],
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
	
	npcIDWithDrug = ""
	pickedNpcWithDrug = false

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
	if(!hasAccessToLab()):
		return 0.0
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
			addPoints(tfBase.getTestingPointsAward())
	if(tfBase != null):
		GM.main.addMessage("The database now contains full info about "+tfBase.getPillName()+" pills.")

func doTestTFsOf(theChar:BaseCharacter):
	var holder:TFHolder = theChar.getTFHolder()
	if(holder == null):
		return
	for tf in holder.getTransformationsCanBeTested():
		doTestTF(tf.id)

func hasTFsCanScan(theChar:BaseCharacter) -> bool:
	var holder:TFHolder = theChar.getTFHolder()
	if(holder == null):
		return false
	for tf in holder.getTransformationsCanBeTested():
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
	for tf in holder.getTransformationsCanBeTested():
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
	if(hasUpgrade("tanksUpgrade1")):
		result = 3000.0
	if(hasUpgrade("tanksUpgrade2")):
		result = 10000.0
	if(hasUpgrade("tanksUpgrade3")):
		result = 25000.0
	if(hasUpgrade("tanksUpgrade4")):
		result = 100000.0
	if(hasUpgrade("unlimitedFluidStorage")):
		result = 100000000.0
	
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
	
	for upgradeID in upgradesInfo:
		if(!upgrades.has(upgradeID)):
			continue
		var upgradeInfo:Dictionary = upgradesInfo[upgradeID]
		
		if(upgradeInfo.has("items")):
			var theItems:Dictionary = upgradeInfo["items"]
			
			for itemID in theItems:
				result[itemID] = theItems[itemID]
	
	if(result.has("TFPill")):
		result["TFPill"]["science"] = 10 + madeStrangePills * 5
	
	return result

func getAmountOfUnlockedMainUpgrade() -> int:
	var result:int = 0
	
	for upgradeID in upgrades:
		if(!upgradesInfo.has(upgradeID)):
			continue
		var upgradeInfo:Dictionary = upgradesInfo[upgradeID]
		
		if(upgradeInfo.has("main") && upgradeInfo["main"]):
			result += 1
	
	return result

func hasAccessToLab() -> bool:
	if(GM.main.getFlag("ElizaModule.s2hap", false)):
		return true
	return false

func getMilkingOfPlayerEfficiency() -> float:
	var mod:float = 1.0
	
	if(hasUpgrade("milkingBetter1")):
		mod += 0.25
	if(hasUpgrade("milkingBetter2")):
		mod += 0.75
	if(hasUpgrade("milkingBetter3")):
		mod += 1.0
	
	return mod

func hasMilkingTier1() -> bool:
	return hasUpgrade("milkingBetter1")

func hasMilkingTier2() -> bool:
	return hasUpgrade("milkingBetter2")

func hasMilkingTier3() -> bool:
	return hasUpgrade("milkingBetter3")

func doMilkCharacterCustom(theChar:BaseCharacter, bodypartSlot, howMuch:float = 1.0, showMessage:bool = true) -> Dictionary:
	if(!theChar):
		return {}
	var efficiency:float = (getMilkingOfPlayerEfficiency() if theChar.isPlayer() else 1.0)
	
	howMuch = clamp(howMuch, 0.0, 1.0)
	if(!theChar.hasBodypart(bodypartSlot)):
		return {}
	var fluidsGot:Dictionary = {}
	
	if(bodypartSlot in [BodypartSlot.Penis, BodypartSlot.Breasts]):
		#if(bodypartSlot == BodypartSlot.Breasts && theChar.hasSoreNipples()):
		#	return {}
		var thePart:Bodypart = theChar.getBodypart(bodypartSlot)
		var theFluids:Fluids = thePart.getFluids()
		if(theFluids == null):
			return {}
		var fluidsByType:Dictionary = theFluids.getFluidAmountByType()
		for fluidID in fluidsByType:
			if(!fluidsGot.has(fluidID)):
				fluidsGot[fluidID] = 0.0
			fluidsGot[fluidID] += fluidsByType[fluidID] * howMuch * efficiency
		theFluids.drainPercent(howMuch)
		
		thePart.getFluidProduction().afterMilked()
		
		#if(howMuch >= 1.0): # Call it manually, I decided
		#	theChar.makeNipplesSore()
		
	if(bodypartSlot == BodypartSlot.Vagina):
		var fluidAmount:float = theChar.getFluidAmount(FluidSource.Vagina)
		var fluidType:String = theChar.getFluidType(FluidSource.Vagina)
		if(!fluidsGot.has(fluidType)):
			fluidsGot[fluidType] = 0.0
		fluidsGot[fluidType] += fluidAmount * howMuch * efficiency
	
	var totalFluid:float = 0.0
	for fluidType in fluidsGot:
		totalFluid += fluidsGot[fluidType]
	
	if(showMessage):
		for fluidType in fluidsGot:
			var fluidObj:FluidBase = GlobalRegistry.getFluid(fluidType)
			if(!fluidObj):
				continue
			var fluidAmStr:String = str(Util.roundF(fluidsGot[fluidType], 1))
			GM.main.addMessage(fluidAmStr+" ml of "+fluidObj.getVisibleName()+" got collected from "+theChar.getName())
	
	if(theChar.isPlayer()):
		if(bodypartSlot == BodypartSlot.Penis && totalFluid > 100.0):
			var xpToGiveFloat:float = round(8.0*efficiency*pow(totalFluid,0.2))
			var xpToGiveInt:int = int(xpToGiveFloat/5.0)*5
			theChar.addSkillExperience(Skill.Breeder, xpToGiveInt)
		if(bodypartSlot == BodypartSlot.Breasts && totalFluid > 100.0):
			var xpToGiveFloat:float = round(8.0*efficiency*pow(totalFluid,0.2))
			var xpToGiveInt:int = int(xpToGiveFloat/5.0)*5
			theChar.addSkillExperience(Skill.Milking, xpToGiveInt)
	
	return fluidsGot

func processMilkCharacterCustom(theChar, bodypartSlot, addBounty:bool = true):
	var fluidsGot:Dictionary = doMilkCharacterCustom(theChar, bodypartSlot, 1.0, true)
	var totalFluid:float = 0.0
	for fluidType in fluidsGot:
		totalFluid += fluidsGot[fluidType]
		addFluid(fluidType, fluidsGot[fluidType])
		if(addBounty):
			handleBountyFluid(fluidType, fluidsGot[fluidType])
	return totalFluid

func processMilkPlayerCustom(bodypartSlot):
	var fluidsGot:Dictionary = doMilkCharacterCustom(GM.pc, bodypartSlot, 1.0, true)
	var totalFluid:float = 0.0
	for fluidType in fluidsGot:
		totalFluid += fluidsGot[fluidType]
		addFluid(fluidType, fluidsGot[fluidType])
		handleBountyFluid(fluidType, fluidsGot[fluidType])
	return totalFluid

func processMilkPlayerBreasts(makeNipsSore:bool = true):
	# add sore nips
	# add stimulation
	var totalFluid:float = processMilkPlayerCustom(BodypartSlot.Breasts)
	if(makeNipsSore):
		GM.pc.makeNipplesSore()
	return totalFluid

func processMilkPlayerVagina():
	return processMilkPlayerCustom(BodypartSlot.Vagina)

func processMilkPlayerPenis():
	return processMilkPlayerCustom(BodypartSlot.Penis)

func doMilkCharacter(theChar:BaseCharacter):
	if(!theChar):
		return {}
	var fluidsGotTotal:Dictionary = {}
	
	if(true): # We always try to milk breasts
		var fluidsGot:Dictionary = doMilkCharacterCustom(theChar, BodypartSlot.Breasts, 1.0, false)
		for fluidType in fluidsGot:
			if(!fluidsGotTotal.has(fluidType)):
				fluidsGotTotal[fluidType] = 0.0
			fluidsGotTotal[fluidType] += fluidsGot[fluidType]
	
	if(theChar.hasPenis()):
		var fluidsGot:Dictionary = doMilkCharacterCustom(theChar, BodypartSlot.Penis, 1.0, false)
		for fluidType in fluidsGot:
			if(!fluidsGotTotal.has(fluidType)):
				fluidsGotTotal[fluidType] = 0.0
			fluidsGotTotal[fluidType] += fluidsGot[fluidType]
	
	if(theChar.hasVagina()):
		var fluidsGot:Dictionary = doMilkCharacterCustom(theChar, BodypartSlot.Vagina, 1.0, false)
		for fluidType in fluidsGot:
			if(!fluidsGotTotal.has(fluidType)):
				fluidsGotTotal[fluidType] = 0.0
			fluidsGotTotal[fluidType] += fluidsGot[fluidType]
	
	for fluidType in fluidsGotTotal:
		fluidsGotTotal[fluidType] *= RNG.randf_range(0.8, 1.0) # Simulates milking in-efficiency
		addFluid(fluidType, fluidsGotTotal[fluidType])
	
	return fluidsGotTotal

func getMaxScienceFromUnlockingTFs() -> int:
	var result:int = 0
	
	for tfID in GlobalRegistry.getTransformationRefs():
		var tf:TFBase = GlobalRegistry.getTransformationRef(tfID)
		result += tf.getUnlockPointsAward()
	
	return result

func getMaxScienceFromUnlockingAndTestingTFs() -> int:
	var result:int = 0
	
	for tfID in GlobalRegistry.getTransformationRefs():
		var tf:TFBase = GlobalRegistry.getTransformationRef(tfID)
		result += tf.getUnlockPointsAward()
		result += tf.getTestingPointsAward()
	
	return result

func getAllUpgradesScienceCost() -> int:
	var result:int = 0
	
	for upgradeID in upgradesInfo:
		var upgradeEntry:Dictionary = upgradesInfo[upgradeID]
		
		result += upgradeEntry["cost"]
	
	return result

func getAmountOfCompletedNurseryTasks() -> int:
	return nurseryTasksCompleted

func doPCShowerRaw(fluidObjs:Array):
	for fluidObjA in fluidObjs:
		var fluidObj:Fluids = fluidObjA
		
		var fluidsByType:Dictionary = fluidObj.getFluidAmountByType()
		for fluidID in fluidsByType:
			var theFluidOBJ:FluidBase = GlobalRegistry.getFluid(fluidID)
			if(theFluidOBJ == null):
				continue
			
			var howMuchAdded:float = GM.main.SCI.addFluid(fluidID, fluidsByType[fluidID])
			if(howMuchAdded > 0.0):
				GM.main.addMessage(str(Util.roundF(howMuchAdded, 1))+" ml of "+theFluidOBJ.getVisibleName()+" was deposited into the fluids tanks.")
		fluidObj.clear()

func doPCShower():
	doPCShowerRaw([GM.pc.getFluids()])

func doPCShowerInside():
	var fluidObjs:Array = []
	for bodypartSlot in [BodypartSlot.Head, BodypartSlot.Vagina, BodypartSlot.Anus]:
		if(GM.pc.hasBodypart(bodypartSlot)):
			fluidObjs.append(GM.pc.getBodypart(bodypartSlot).getFluids())
	doPCShowerRaw(fluidObjs)

func findRandomNpcIDForStrangeDrug() -> String:
	var tries:int = 10
	while(tries > 0):
		tries -= 1
		
		var poolID:String = CharacterPool.Inmates
		if(RNG.chance(5)):
			poolID = RNG.pick([CharacterPool.Guards, CharacterPool.Nurses, CharacterPool.Nurses, CharacterPool.Engineers])
		
		var poolChars = GM.main.getDynamicCharacterIDsFromPool(poolID)
		if(poolChars.empty()):
			continue
			
		var randomDynamicCharID:String = RNG.pick(poolChars)
		
		var character:BaseCharacter = GlobalRegistry.getCharacter(randomDynamicCharID)
		if(character == null):
			continue
		var fetishHolder:FetishHolder = character.getFetishHolder()
		if(tries > 2 && fetishHolder.getFetishValue(Fetish.DrugUse) < 0.3 && fetishHolder.getFetishValue(Fetish.TFGiving) < 0.3 && fetishHolder.getFetishValue(Fetish.TFReceiving) < 0.3):
			continue
		return randomDynamicCharID
	return ""

func getRandomNpcIDForStrangeDrug() -> String:
	if(!pickedNpcWithDrug):
		npcIDWithDrug = findRandomNpcIDForStrangeDrug()
		pickedNpcWithDrug = true
	
	if(npcIDWithDrug == ""):
		return npcIDWithDrug
	
	if(GlobalRegistry.getCharacter(npcIDWithDrug) == null):
		npcIDWithDrug = ""
	
	return npcIDWithDrug

func peekRandomNpcIDForStrangeDrug() -> String:
	if(npcIDWithDrug == ""):
		return npcIDWithDrug
	if(GlobalRegistry.getCharacter(npcIDWithDrug) == null):
		npcIDWithDrug = ""
	return npcIDWithDrug

func clearRandomNpcIDForStrangeDrug():
	npcIDWithDrug = ""

func saveData() -> Dictionary:
	var taskData:Array = []
	for task in nurseryTasks:
		taskData.append({
			id = task.id,
			data = task.saveData(),
		})
	
	return { # Shorter names use less space on disk.. ignore the rest of the game..
		points = points,
		gt = generatedTasks,
		sf = storedFluids,
		nt = taskData,
		uf = unlockedTFs,
		tt = testedTFs,
		up = upgrades,
		ms = madeStrangePills,
		ntc = nurseryTasksCompleted,
		nid = npcIDWithDrug,
		pnd = pickedNpcWithDrug,
	}

func loadData(_data:Dictionary):
	points = SAVE.loadVar(_data, "points", 0)
	generatedTasks = SAVE.loadVar(_data, "gt", false)
	storedFluids = SAVE.loadVar(_data, "sf", {})
	unlockedTFs = SAVE.loadVar(_data, "uf", {})
	testedTFs = SAVE.loadVar(_data, "tt", {})
	upgrades = SAVE.loadVar(_data, "up", {})
	madeStrangePills = SAVE.loadVar(_data, "ms", 0)
	nurseryTasksCompleted = SAVE.loadVar(_data, "ntc", 0)
	npcIDWithDrug = SAVE.loadVar(_data, "nid", "")
	pickedNpcWithDrug = SAVE.loadVar(_data, "pnd", false)
	for upgradeID in upgrades.keys():
		if(!upgradesInfo.has(upgradeID)):
			upgrades.erase(upgradeID)
	
	nurseryTasks.clear()
	var taskData = SAVE.loadVar(_data, "nt", [])
	for taskEntry in taskData:
		var taskID:String = SAVE.loadVar(taskEntry, "id", "")
		var theTask:NurseryTaskBase = GlobalRegistry.createNurseryTask(taskID)
		if(theTask == null):
			continue
		nurseryTasks.append(theTask)
		theTask.loadData(SAVE.loadVar(taskEntry, "data", {}))
