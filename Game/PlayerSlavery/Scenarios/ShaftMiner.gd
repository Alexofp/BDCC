extends PlayerSlaveryBase

const IconMinecart = preload("res://Images/WorldEntities/minecart.png")
const IconMinecartFull = preload("res://Images/WorldEntities/minecart_full.png")
const IconNugget1 = preload("res://Images/WorldEntities/nugget1.png")
const IconNugget2 = preload("res://Images/WorldEntities/nugget2.png")
const IconNugget3 = preload("res://Images/WorldEntities/nugget3.png")
const IconDudeMasc = preload("res://Images/WorldPawns/masc.png")
const IconDudeFem = preload("res://Images/WorldPawns/fem.png")

const LOC_ENTRANCE = "psmine_entrance"
const LOC_CAGE = "psmine_sleep"
const LOC_BOSS = "psmine_boss"

const MiningLocs = [
	"psmine_mine1", "psmine_mine2", "psmine_mine3", "psmine_mine4", "psmine_mine5", "psmine_mine6", "psmine_mine7", "psmine_mine8",
]

const debugFreeUpdates = false #Set this to false before ship

const UpgradesDB = {
	"headlight": {
		name = "Headlight",
		desc = "Let's you see further in the dark",
		cost = 3,
		reqs = [],
	},
	
	"pick1": {
		name = "Better pickaxe",
		desc = "Mining will yield ore nuggets every time.",
		cost = 5,
		reqs = ["headlight"],
	},
	"pick2": {
		name = "Notched pickaxe",
		desc = "Mining will produce 2 ore nuggets.",
		cost = 20,
		reqs = ["pick1"],
	},
	"pick3": {
		name = "Basic drill",
		desc = "Mining will produce 3 ore nuggets!",
		cost = 500,
		reqs = ["pick2"],
	},
	"pick4": {
		name = "Mega drill",
		desc = "Let's you mine the whole deposit in one go!",
		cost = 50000,
		reqs = ["pick3"],
	},
	"pick5": {
		name = "Super Mega drill",
		desc = "This drill can get through the world's strongest materials with ease, even Voidsteel!",
		cost = 1500000,
		reqs = ["pick4"],
	},
	
	"cart1": {
		name = "Minecart storage 1",
		desc = "Minecart can hold 20 ore nuggets.",
		cost = 20,
		reqs = ["pick1"],
	},
	"cart2": {
		name = "Minecart storage 2",
		desc = "Minecart can hold 30 ore nuggets.",
		cost = 60,
		reqs = ["cart1"],
	},
	"cart3": {
		name = "Minecart storage 3",
		desc = "Minecart can hold 100 ore nuggets.",
		cost = 1000,
		reqs = ["cart2"],
	},
	
	"gloves1": {
		name = "Grabby gloves",
		desc = "Allows you (and other slaves) to pick up 2 nuggets at once.",
		cost = 30,
		reqs = ["pick1"],
	},
	"gloves2": {
		name = "Grabbier Gloves",
		desc = "Allows you (and other slaves) to pick up 5 nuggets at once. Your slaves can carry 20 nuggets instead of 10.",
		cost = 90,
		reqs = ["gloves1"],
	},
	
	"minecartscoop": {
		name = "Minecart Scoop",
		desc = "Pushing the minecart over nuggets will make it automatically pick them up.",
		cost = 600,
		reqs = ["cart2", "gloves2"],
	},
	
	"minecartcredit": {
		name = "Careful delivery",
		desc = "Delivering ore with your minecart makes you earn 2x the credits!",
		cost = 250,
		reqs = ["cart2"],
	},
	
	"minecartrefreshments1": {
		name = "Refreshments",
		desc = "The minecart has a water bottle taped to it. It allows you to fully refresh your stamina once per day.",
		cost = 45,
		reqs = ["cart1"],
	},
	"minecartrefreshments2": {
		name = "Extra Refreshments",
		desc = "The minecart has a little fridge installed. Using it allows you to fully refresh your stamina 3 times a day.",
		cost = 3000,
		reqs = ["minecartrefreshments1", "cart2"],
	},
	
	"moreCreds1": {
		name = "Ore processing 1",
		desc = "Install basic ore processing (metal pans), allowing each nugget to get sold for 3 credits instead of 1.",
		cost = 20,
		reqs = ["headlight"],
	},
	"moreCreds2": {
		name = "Ore processing 2",
		desc = "Install better ore processing (magnets), allowing each nugget to get sold for 10 credits.",
		cost = 222,
		reqs = ["moreCreds1", "ore1"],
	},
	"moreCreds3": {
		name = "Ore processing 3",
		desc = "Install better ore processing (crushers), allowing each nugget to get sold for 20 credits.",
		cost = 1500,
		reqs = ["moreCreds2"],
	},
	"moreCreds4": {
		name = "Ore processing 4",
		desc = "Install better ore processing (sorting bots), allowing each nugget to get sold for 50 credits.",
		cost = 2500,
		reqs = ["moreCreds3"],
	},
	"moreCreds5": {
		name = "Ore processing 5",
		desc = "Install better ore processing (bluespace extractors), allowing each nugget to get sold for 100 credits.",
		cost = 10000,
		reqs = ["moreCreds4"],
	},
	"moreCreds6": {
		name = "Ore processing 6",
		desc = "Install better ore processing (weed-high kobols), allowing each nugget to get sold for 1000 credits.",
		cost = 69420,
		reqs = ["moreCreds5"],
	},
	
	"dudes1": {
		name = "Sex toys",
		desc = "Buy some sex toys for other slaves. This gives you 1x shaft miner and 1x ore carrier every morning.",
		cost = 15,
		reqs = ["pick1"],
	},
	"dudes2": {
		name = "Fuck machines",
		desc = "Install some fuck machines. This gives you 1x shaft miner and 1x ore carrier every morning.",
		cost = 69,
		reqs = ["dudes1"],
	},
	"dudes3": {
		name = "Whores",
		desc = "Hire some of the slaves as sluts for the other slaves. This gives you 1x shaft miner and 1x ore carrier every morning.",
		cost = 105,
		reqs = ["dudes2"],
	},
	"dudes4": {
		name = "Bluespace fleshlights",
		desc = "Hand out some portal panties and bluespace fleshlights to slaves. This gives you 1x shaft miner and 1x ore carrier every morning.",
		cost = 888,
		reqs = ["dudes3"],
	},
	"dudes5": {
		name = "VR porn",
		desc = "Give the slaves some portable VR headsets that are totally not hypnovisors. This gives you 1x shaft miner and 1x ore carrier every morning.",
		cost = 1569,
		reqs = ["dudes4"],
	},
	
	"ore1": {
		name = "Scanners 1",
		desc = "Install some basic ore scanners. Makes the mining zones have 3x as much ore in them on average.",
		cost = 100,
		reqs = ["pick2"],
	},
	"ore2": {
		name = "Scanners 2",
		desc = "Install better ore scanners. Makes the mining zones have 5x as much ore in them on average.",
		cost = 1000,
		reqs = ["ore1", "moreCreds2"],
	},
	"ore3": {
		name = "Scanners 3",
		desc = "Install the best ore scanners. Makes the mining zones have 10x as much ore in them on average.",
		cost = 10000,
		reqs = ["ore2"],
	},
	
	"rest": {
		name = "Comfy cages",
		desc = "Install better cages for you and other slaves. Allows you to rest for 2 hours to skip time and regain some stamina",
		cost = 20000,
		reqs = ["dudes3"],
	},
}

var day:int = 0
var totalMined:int = 0
const TOTAL_MINED_TARGET = 1000000

var nuggets:Array = [] # [id, indx]
var upgrades:Dictionary = {} # upgradeID = true

var minecartLoc:String = "psmine_cartspawn"
var pushingMinecart:bool = false
var nuggetsCarrying:int = 0
var nuggetsMinecart:int = 0
var refreshUsed:int = 0

var nextUniquieID:int = 0

var oreLeft:Dictionary = {}

var prevPCLoc:String = ""

var didFirstOfferEvent:bool = false

func getTextsForLoc(_loc:String):
	
	if(pushingMinecart):
		if(nuggetsMinecart <= 0):
			saynn("You are pushing an empty cart.")
		else:
			saynn("You are pushing a minecart that has "+str(nuggetsMinecart)+" ore "+("nugget" if nuggetsMinecart == 1 else "nuggets")+" in it.")
	elif(GM.pc.getLocation() == minecartLoc):
		if(nuggetsMinecart <= 0):
			saynn("You are standing near an empty cart.")
		else:
			saynn("You are standing near a minecart that has "+str(nuggetsMinecart)+" ore "+("nugget" if nuggetsMinecart == 1 else "nuggets")+" in it.")
	
	if(!pushingMinecart):
		sayn("Tool: "+getToolName())
	if(nuggetsCarrying > 0):
		saynn("You are holding "+str(nuggetsCarrying)+" "+("nugget" if nuggetsCarrying == 1 else "nuggets")+".")
	
	if(_loc == LOC_CAGE):
		if(getMaxDudeAmount(true) > 0 || getMaxDudeAmount(false) > 0):
			sayn("Hired shaft miners: "+str(getDudeAmount(true))+"/"+str(getMaxDudeAmount(true)))
			saynn("Hired ore carriers: "+str(getDudeAmount(false))+"/"+str(getMaxDudeAmount(false)))
	if(_loc == LOC_BOSS):
		var thePers:float = float(totalMined) / float(TOTAL_MINED_TARGET)
		sayn("Total amount of credits earned: "+str(totalMined))
		saynn("Target to get freedom: "+str(TOTAL_MINED_TARGET)+" ("+str(Util.roundF(thePers*100.0, 1))+"%)")

func getToolName() -> String:
	if(hasUpgrade("pick5")):
		return "Super Mega drill"
	if(hasUpgrade("pick4")):
		return "Mega drill"
	if(hasUpgrade("pick3")):
		return "Basic drill"
	if(hasUpgrade("pick2")):
		return "Notched pickaxe"
	if(hasUpgrade("pick1")):
		return "New pickaxe"
	return "Rusty pickaxe"

class Dude:
	var iconID:String = ""
	var isMiner:bool = true
	var loc:String = ""
	var energyUsed:int = 0
	var path:Array = []
	var nuggets:int = 0
	
	func saveData() -> Dictionary:
		return {
			iconID = iconID,
			isMiner = isMiner,
			loc = loc,
			energyUsed = energyUsed,
			path = path,
			nuggets = nuggets,
		}
	
	func loadData(_data:Dictionary):
		iconID = SAVE.loadVar(_data, "iconID", "")
		isMiner = SAVE.loadVar(_data, "isMiner", false)
		loc = SAVE.loadVar(_data, "loc", "")
		energyUsed = SAVE.loadVar(_data, "energyUsed", 0)
		path = SAVE.loadVar(_data, "path", [])
		nuggets = SAVE.loadVar(_data, "nuggets", 0)
	
	func getTarget() -> String:
		if(path.empty()):
			return ""
		return path.back()
		
	func go(theTargetLoc:String) -> bool:
		var theLoc:String = loc
		if(theLoc == theTargetLoc):
			return true
		
		if(path.empty() || path.back() != theTargetLoc):
			path = GM.world.calculatePath(theLoc, theTargetLoc)
			if(!path.empty() && path[0] == loc):
				path.pop_front()
		
		if(path.empty()):
			Log.printerr("Dude path is empty, something is wrong!")
			return false
		
		var nextLoc:String = path.pop_front()
		setLoc(nextLoc)
		if(nuggets > 0):
			energyUsed += 1
		return false

	func goHome():
		if(go(LOC_CAGE)):
			energyUsed = 0
	
	func setLoc(_newLoc:String):
		loc = _newLoc
		GM.world.moveEntity(iconID, loc)
	
	func createIcon(_uidProvider):
		if(iconID == ""):
			var nextEntityID:String = "ps_dude"+_uidProvider.getUID()
			iconID = nextEntityID
		GM.world.createEntity(iconID, RNG.pick([_uidProvider.IconDudeMasc, _uidProvider.IconDudeFem]), loc)
	
var dudes:Array = []

func canHireDudes(_am:int) -> bool:
	var freeDudes:int = 0
	freeDudes += Util.maxi(0, getMaxDudeAmount(true) - getDudeAmount(true))
	freeDudes += Util.maxi(0, getMaxDudeAmount(false) - getDudeAmount(false))

	if(_am <= freeDudes):
		return true
	return false

func canHireDude(_isMiner:bool) -> bool:
	var freeDudes:int = Util.maxi(0, getMaxDudeAmount(_isMiner) - getDudeAmount(_isMiner))
	if(freeDudes > 0):
		return true
	return false

func getDudeSpawnOnSleep(_isMiner:bool) -> int:
	var result:int = 0
	if(hasUpgrade("dudes1")):
		result += 1
	if(hasUpgrade("dudes2")):
		result += 1# + (1 if _isMiner else 0)
	if(hasUpgrade("dudes3")):
		result += 1# + (1 if _isMiner else 0)
	if(hasUpgrade("dudes4")):
		result += 1# + (1 if _isMiner else 0)
	if(hasUpgrade("dudes5")):
		result += 1# + (1 if _isMiner else 0)
	return result

func getMaxDudeAmount(_isMiner:bool) -> int:
	var result:int = 0
	if(didFirstOfferEvent):
		result += 1
	return result + getDudeSpawnOnSleep(_isMiner)

func getDudeAmount(_isMiner:bool) -> int:
	var result:int = 0
	
	for dude in dudes:
		if(dude.isMiner == _isMiner):
			result += 1
	
	return result

func spawnDude(_isMiner:bool):
	var newDude:Dude = Dude.new()
	newDude.loc = LOC_CAGE
	newDude.isMiner = _isMiner
	newDude.createIcon(self)
	
	dudes.append(newDude)

func dudeGetFreeMiningSpot() -> String:
	var theLocs:Array = MiningLocs.duplicate()
	theLocs.shuffle()
	
	var hasOreLocs:Array = []
	for theLoc in theLocs:
		if(!oreLeft.has(theLoc) || oreLeft[theLoc] <= 0):
			continue
		hasOreLocs.append(theLoc)
		var _canPick:bool = true
		
		for dude in dudes:
			if(dude.isMiner && dude.getTarget() == theLoc):
				_canPick = false
				break
		if(_canPick):
			return theLoc
	if(hasOreLocs.empty()):
		return ""
	return RNG.pick(hasOreLocs)
		

func processDude(dude:Dude):
	if(dude.isMiner):
		if(dude.energyUsed >= 10):
			dude.goHome()
			return
		
		if(canMineLoc(dude.loc)):
			doMineSpot(dude.loc)
			if(hasUpgrade("pick2")):
				doMineSpot(dude.loc)
			if(hasUpgrade("pick3")):
				doMineSpot(dude.loc)
			if(hasUpgrade("pick4")):
				doMineSpot(dude.loc)
				doMineSpot(dude.loc)
			dude.energyUsed += 1
			return
			
		var theTarget:String = dude.getTarget()
		if(theTarget == ""):
			theTarget = dudeGetFreeMiningSpot()
		if(theTarget == ""):
			dude.goHome()
			return
		
		dude.go(theTarget)
		return
	else:
		if(dude.energyUsed >= 10):
			dudeDropNuggets(dude)
			dude.goHome()
			return
		
		var maxNuggets:int = 10
		if(hasUpgrade("gloves2")):
			maxNuggets = 20
		var canPickup:bool = (dude.nuggets < maxNuggets)
		if(hasNuggetsIn(dude.loc) && canPickup):
			removeNuggetIn(dude.loc)
			dude.nuggets += 1
			if(hasUpgrade("gloves1") && hasNuggetsIn(dude.loc) && (dude.nuggets < maxNuggets)):
				removeNuggetIn(dude.loc)
				dude.nuggets += 1
			if(hasUpgrade("gloves2") && getNuggetsAmmountIn(dude.loc)>=3 && (dude.nuggets < maxNuggets)):
				removeNuggetIn(dude.loc)
				removeNuggetIn(dude.loc)
				removeNuggetIn(dude.loc)
				dude.nuggets += 3
			return
		
		if(dude.loc == LOC_ENTRANCE && dude.nuggets > 0):
			dude.path.clear()
			dudeDropNuggets(dude)
			return
		
		if(loadMinecartFromDude(dude)):
			return
		
		if(dude.nuggets > 0):
			dude.goHome()
			return
		
		var theTarget:String = dude.getTarget()
		if(theTarget == "" || !hasNuggetsIn(theTarget)):
			if(canPickup && !nuggets.empty() && dude.energyUsed < 7):
				theTarget = RNG.pick(nuggets)[1]
		if(theTarget == ""):
			dude.goHome()
			return
		
		dude.go(theTarget)
		pass

func dudeDropNuggets(_dude:Dude):
	if(_dude.nuggets <= 0):
		return
	if(_dude.loc == LOC_ENTRANCE):
		var theCreds:int = getNuggetCredits(_dude.nuggets)
		addTotalMined(theCreds)
		addCredits(theCreds)
		addMessage("A carrier has deposited "+str(_dude.nuggets)+" "+("nugget" if _dude.nuggets == 1 else "nuggets")+" of ore, earning you "+str(theCreds)+" "+("credit" if theCreds == 1 else "credits")+"!")
	else:
		if(loadMinecartFromDude(_dude)):
			return
		for _i in range(_dude.nuggets):
			spawnNugget(_dude.loc)
	_dude.nuggets = 0

func _init():
	id = "ShaftMiner"

func saynn(_text:String):
	outputTexts.append(_text+"\n\n")

func sayn(_text:String):
	outputTexts.append(_text+"\n")

var outputTexts:Array = []
func getTextsForLocFinal(_loc:String) -> Array:
	outputTexts = []
	getTextsForLoc(_loc)
	return outputTexts

func getMiningZonesMod() -> int:
	if(hasUpgrade("ore3")):
		return 10
	if(hasUpgrade("ore2")):
		return 5
	if(hasUpgrade("ore1")):
		return 3
	return 1

func updateMiningZones():
	oreLeft.clear()
	for zone in MiningLocs:
		var toAdd:int = RNG.randi_range(2, 4)
		if(RNG.chance(80)):
			toAdd += RNG.randi_range(1, 2)
		if(RNG.chance(60)):
			toAdd += RNG.randi_range(1, 2)
		if(RNG.chance(40)):
			toAdd += RNG.randi_range(1, 2)
		oreLeft[zone] = toAdd * getMiningZonesMod()
		
	for _i in range(RNG.randi_range(1, 2)*getMiningZonesMod()):
		var randomZone:String = RNG.pick(MiningLocs)
		for _i2 in range(RNG.randi_range(1, 3)):
			spawnNugget(randomZone)

func sleep():
	day += 1
	refreshUsed = 0
	minecartLoc = "psmine_cartspawn"
	pushingMinecart = false
	nuggetsCarrying = 0
	nuggetsMinecart = 0
	for dude in dudes:
		GM.world.deleteEntity(dude.iconID)
	dudes.clear()
	for nuggetEntry in nuggets:
		GM.world.deleteEntity("ps_nugget"+nuggetEntry[0])
	nuggets.clear()
	GM.pc.addStamina(GM.pc.getMaxStamina())
	GM.pc.addPain(-GM.pc.getPain())
	updateCartIcon()
	GM.world.moveEntity("ps_cart", minecartLoc)
	updateMiningZones()
	
	#upgrade stuff here
	for _i in range(getDudeSpawnOnSleep(true)):
		spawnDude(true)
	for _i in range(getDudeSpawnOnSleep(false)):
		spawnDude(false)

func onSlaveryStart():
	#print("Meow")
	createIcons()
	updateMiningZones()

func onSlaveryEnd():
	for dude in dudes:
		GM.world.deleteEntity(dude.iconID)
	#dudes.clear()
	for nuggetEntry in nuggets:
		GM.world.deleteEntity("ps_nugget"+nuggetEntry[0])
	GM.world.deleteEntity("ps_cart")
	#nuggets.clear()

func shouldDoFirstSlaveOfferEvent() -> bool:
	if(didFirstOfferEvent):
		return false
	if(day >= 2 && GM.pc.getLocation() == "psmine_meet"):
		didFirstOfferEvent = true
		return true
	return false

func getStartScene() -> String:
	return "PSShaftMinerStart"#"PSShaftMinerGameplayScene"#"PSShaftMinerStart"

func unlockUpgrade(_upgradeID:String):
	upgrades[_upgradeID] = true

func hasUpgrade(_upgradeID:String) -> bool:
	return upgrades.has(_upgradeID)

func canSeeUpgrade(_upgradeID:String) -> bool:
	if(!UpgradesDB.has(_upgradeID)):
		return false
	if(upgrades.has(_upgradeID)):
		return false
	if(_upgradeID == "dudes1" && !didFirstOfferEvent):
		return false
	var upgradeInfo:Dictionary = UpgradesDB[_upgradeID]
	var theReqs:Array = upgradeInfo["reqs"] if upgradeInfo.has("reqs") else []
	
	for otherUpgradeID in theReqs:
		if(!hasUpgrade(otherUpgradeID)):
			return false
	return true

func getCredits() -> int:
	return GM.pc.getCredits()

func addCredits(_howMany:int):
	GM.pc.addCredits(_howMany)

func addTotalMined(_howMuch:int):
	totalMined += _howMuch

func canUnlockUpgrade(_upgradeID:String) -> bool:
	if(!UpgradesDB.has(_upgradeID)):
		return false
	if(upgrades.has(_upgradeID)):
		return false
	if(!canSeeUpgrade(_upgradeID)):
		return false
	var upgradeInfo:Dictionary = UpgradesDB[_upgradeID]
	var theCost:int = upgradeInfo["cost"]
	
	if(getCredits() < theCost && !debugFreeUpdates):
		return false
	return true

func payUnlockUpgrade(_upgradeID:String):
	if(!UpgradesDB.has(_upgradeID)):
		return
	if(upgrades.has(_upgradeID)):
		return
	var upgradeInfo:Dictionary = UpgradesDB[_upgradeID]
	var theCost:int = upgradeInfo["cost"]

	unlockUpgrade(_upgradeID)
	if(!debugFreeUpdates):
		addCredits(-theCost)

func getUpgradesCanSee() -> Array:
	var result:Array = []
	
	for upgradeID in UpgradesDB:
		if(canSeeUpgrade(upgradeID)):
			result.append(upgradeID)
	
	return result

func getUpgradesCompletionStr() -> String:
	var totalUpgrades:int = UpgradesDB.size()
	var boughtUpgrades:int = upgrades.size()
	return str(boughtUpgrades)+"/"+str(totalUpgrades)

func createIcons():
	GM.world.createEntity("ps_cart", getMinecartTexture(), minecartLoc)
	
	for nuggetEntry in nuggets:
		GM.world.createEntity("ps_nugget"+nuggetEntry[0], RNG.pick([IconNugget1, IconNugget2, IconNugget3]), nuggetEntry[1])
	
	#for dude in dudes:
	#	dude.createIcon(self)
	
func getMinecartTexture() -> Texture:
	return (IconMinecart if nuggetsMinecart <= 0 else IconMinecartFull)

func updateCartIcon():
	GM.world.setEntityTexture("ps_cart", getMinecartTexture())

func updateIcons():
	GM.world.moveEntity("ps_cart", minecartLoc)
	for nuggetEntry in nuggets:
		GM.world.moveEntity("ps_nugget"+nuggetEntry[0], nuggetEntry[1])

func getPCViewDistance() -> float:
	if(hasUpgrade("headlight")):
		return 80.0
	return 40.0

func afterMove():
	if(pushingMinecart):
		minecartLoc = GM.pc.getLocation()
	
	if(nuggetsCarrying > 0):
		if(GM.pc.getLocation() != minecartLoc || pushingMinecart):
			var staminaUse:int = nuggetsCarrying * 3
			addMessage("You used "+str(staminaUse)+" stamina carrying the nuggets.")
			useStamina(staminaUse)
			if(!hasStamina()):
				dropAllNuggets()
	
	if(pushingMinecart && hasUpgrade("minecartscoop")):
		var theNuggetAmount:int = getNuggetsAmmountIn(minecartLoc)
		if(theNuggetAmount > 0):
			var freeSpace:int = Util.maxi(0, getMinecartCapacity() - theNuggetAmount)
			if(freeSpace >= theNuggetAmount):
				addMessage("The minecart scoop has picked up "+str(theNuggetAmount)+" "+("nugget" if theNuggetAmount == 1 else "nuggets")+"!")
				removeXNuggetsIn(minecartLoc, theNuggetAmount)
				nuggetsMinecart += theNuggetAmount
			elif(freeSpace > 0):
				addMessage("The minecart scoop has picked up "+str(freeSpace)+" "+("nugget" if freeSpace == 1 else "nuggets")+"! The minecart is now full.")
				removeXNuggetsIn(minecartLoc, freeSpace)
				nuggetsMinecart += freeSpace
	
func processTurn():
	for dude in dudes:
		processDude(dude)

func updateLoc():
	var theLoc:String = GM.pc.getLocation()
	if(pushingMinecart):
		minecartLoc = theLoc
		#GM.world.moveEntity("ps_cart", minecartLoc)
	
	updateIcons()

func canMine() -> bool:
	return GM.pc.getLocation() in MiningLocs

func canMineLoc(theLoc:String) -> bool:
	if(!MiningLocs.has(theLoc)):
		return false
	
	var theOreLeft:int = oreLeft[theLoc] if oreLeft.has(theLoc) else 0
	if(theOreLeft <= 0):
		return false
	return true

func canMineSmart(theLoc:String) -> Array:
	if(!MiningLocs.has(theLoc)):
		return [false, ""]
		
	var theOreLeft:int = oreLeft[theLoc] if oreLeft.has(theLoc) else 0
	if(theOreLeft <= 0):
		return [false, "There is no ore left here"]
		
	if(pushingMinecart):
		return [false, "You can't mine if you are pushing a minecart"]
	
	return [true, ""]

func doMineOutSpot(_loc:String):
	var am:int = oreLeft[_loc] if oreLeft.has(_loc) else 0
	if(am > 0):
		for _i in range(am):
			spawnNugget(_loc)
		oreLeft[_loc] = 0

func doMineSpot(_loc:String):
	var am:int = oreLeft[_loc] if oreLeft.has(_loc) else 0
	if(am > 0):
		oreLeft[_loc] -= 1
		spawnNugget(_loc)

func hasOreIn(_loc:String) -> bool:
	var am:int = oreLeft[_loc] if oreLeft.has(_loc) else 0
	if(am > 0):
		return true
	return false

func doMineSpotUpgraded(_loc:String):
	if(hasUpgrade("pick4")):
		doMineOutSpot(_loc)
		return
	doMineSpot(_loc)
	if(hasUpgrade("pick2")):
		doMineSpot(_loc)
	if(hasUpgrade("pick3")):
		doMineSpot(_loc)

func doMine():
	var mineChance:float = 40.0
	if(hasUpgrade("pick1")):
		mineChance = 100.0
	
	#if(hasUpgrade("pick3")):
	#	useStamina(5)
	#else:
	useStamina(10)
	
	if(RNG.chance(mineChance)):
		doMineSpotUpgraded(GM.pc.getLocation())
		addMessage("You did some mining!"+(" The deposit has been mined out." if !hasOreIn(GM.pc.getLocation()) else ""))
	else:
		addMessage("You did some mining but failed to find any ore!"+(" The deposit has been mined out." if !hasOreIn(GM.pc.getLocation()) else ""))

func getNuggetCredits(_am:int) -> int:
	if(hasUpgrade("moreCreds6")):
		return _am * 1000
	if(hasUpgrade("moreCreds5")):
		return _am * 100
	if(hasUpgrade("moreCreds4")):
		return _am * 50
	if(hasUpgrade("moreCreds3")):
		return _am * 20
	if(hasUpgrade("moreCreds2")):
		return _am * 10
	if(hasUpgrade("moreCreds1")):
		return _am * 3
	
	return _am

func dropAllNuggets():
	if(GM.pc.getLocation() == LOC_ENTRANCE):
		var credAmount:int = getNuggetCredits(nuggetsCarrying)
		addTotalMined(credAmount)
		addCredits(credAmount)
		addMessage("You have unloaded all your nuggets and got "+str(credAmount)+" credits for it!")
		nuggetsCarrying = 0
		return
	
	for _i in range(nuggetsCarrying):
		spawnNugget(GM.pc.getLocation())
	nuggetsCarrying = 0
	addMessage("You have dropped all your nuggets!")

func spawnNugget(_theLoc:String):
	var nuggetEntry:Array = [getUID(), _theLoc]
	nuggets.append(nuggetEntry)
	GM.world.createEntity("ps_nugget"+nuggetEntry[0], RNG.pick([IconNugget1, IconNugget2, IconNugget3]), nuggetEntry[1])

func hasNuggetsIn(_loc:String) -> bool:
	for nuggetEntry in nuggets:
		if(nuggetEntry[1] == _loc):
			return true
	return false

func getNuggetsIn(_loc:String) -> Array:
	var result:Array = []
	for nuggetEntry in nuggets:
		if(nuggetEntry[1] == _loc):
			result.append(nuggetEntry[0])
	return result

func getNuggetsAmmountIn(_loc:String) -> int:
	var result:int = 0
	for nuggetEntry in nuggets:
		if(nuggetEntry[1] == _loc):
			result += 1
	return result

func removeNugget(_id:String):
	var _i:int = 0
	for nuggetEntry in nuggets:
		if(nuggetEntry[0] == _id):
			GM.world.deleteEntity("ps_nugget"+nuggetEntry[0])
			nuggets.remove(_i)
			return
		_i += 1

func removeNuggetIn(_loc:String):
	var _i:int = 0
	for nuggetEntry in nuggets:
		if(nuggetEntry[1] == _loc):
			GM.world.deleteEntity("ps_nugget"+nuggetEntry[0])
			nuggets.remove(_i)
			return
		_i += 1

func removeXNuggetsIn(_loc:String, _am:int):
	while(_am > 0):
		removeNuggetIn(_loc)
		_am -= 1

func pickupNugget():
	if(!hasNuggetsIn(GM.pc.getLocation())):
		return
	removeNuggetIn(GM.pc.getLocation())
	nuggetsCarrying += 1

func getUID() -> String:
	nextUniquieID += 1
	return str(nextUniquieID - 1)

func addMessage(_text:String):
	GM.main.addMessage(_text)

func useStamina(_howMuch:int):
	var theMaxStamina:int = GM.pc.getMaxStamina()
	var theMod:float = float(theMaxStamina) / 100.0
	
	GM.pc.addStamina(-int(ceil(_howMuch*theMod)))

func hasStamina() -> bool:
	return GM.pc.getStamina() > 0

func getMinecartCapacity() -> int:
	if(hasUpgrade("cart3")):
		return 100
	if(hasUpgrade("cart2")):
		return 30
	if(hasUpgrade("cart1")):
		return 20
	return 10

func canLoadMinecart() -> bool:
	if(nuggetsMinecart >= getMinecartCapacity()):
		return false
	return true

func loadMinecartFromPC():
	var freeSpace:int = getMinecartCapacity() - nuggetsMinecart
	if(freeSpace <= 0):
		return
	if(freeSpace >= nuggetsCarrying):
		nuggetsMinecart += nuggetsCarrying
		nuggetsCarrying = 0
		addMessage("You have put all your nuggets into the minecart.")
	else:
		nuggetsMinecart += freeSpace
		nuggetsCarrying -= freeSpace
		addMessage("You have put some of your nuggets into the minecart. The minecart is now [b]full[/b]!")

	updateCartIcon()

func loadMinecartFromDude(_dude:Dude) -> bool:
	if((_dude.loc != GM.pc.getLocation() && _dude.loc != prevPCLoc) || !pushingMinecart):
		return false
	if(_dude.nuggets <= 0):
		return false
	var freeSpace:int = getMinecartCapacity() - nuggetsMinecart
	if(freeSpace <= 0):
		return false
	if(freeSpace >= _dude.nuggets):
		addMessage("One of the slaves throws "+str(_dude.nuggets)+" "+("nugget" if _dude.nuggets == 1 else "nuggets")+" into your minecart!")
		nuggetsMinecart += _dude.nuggets
		_dude.nuggets = 0
		_dude.path.clear()
	else:
		nuggetsMinecart += freeSpace
		_dude.nuggets -= freeSpace
		addMessage("One of the slaves throws "+str(_dude.nuggets)+" "+("nugget" if _dude.nuggets == 1 else "nuggets")+" into your minecart! The minecart is now [b]full[/b]!")

	updateCartIcon()
	return true

func unloadMinecart():
	var credAmount:int = getNuggetCredits(nuggetsMinecart)
	if(hasUpgrade("minecartcredit")):
		credAmount *= 2
	addTotalMined(credAmount)
	addCredits(credAmount)
	addMessage("You have unloaded the minecart and got "+str(credAmount)+" credits for it!")
	nuggetsMinecart = 0
	updateCartIcon()

func canRefresh() -> bool:
	if(GM.pc.getStaminaLevel() >= 1.0):
		return false
	if(GM.pc.getLocation() != minecartLoc):
		return false
	
	if(hasUpgrade("minecartrefreshments2") && refreshUsed < 3):
		return true
	if(hasUpgrade("minecartrefreshments1") && refreshUsed < 1):
		return true
	return false

func doRefresh():
	refreshUsed += 1
	GM.pc.addStamina(GM.pc.getMaxStamina())
	addMessage("You drink some water and feel refreshed!")

func getExtraPickupAmount() -> int:
	if(hasUpgrade("gloves2")):
		return 4
	if(hasUpgrade("gloves1")):
		return 1
	
	return 0

func didReachTarget() -> bool:
	return totalMined >= TOTAL_MINED_TARGET

func saveData() -> Dictionary:
	var dudesData:Array = []
	for dude in dudes:
		dudesData.append(dude.saveData())
	
	return {
		upgrades = upgrades,
		minecartLoc = minecartLoc,
		nextUniquieID = nextUniquieID,
		nuggets = nuggets,
		nuggetsCarrying = nuggetsCarrying,
		nuggetsMinecart = nuggetsMinecart,
		oreLeft = oreLeft,
		day = day,
		totalMined = totalMined,
		didFirstOfferEvent = didFirstOfferEvent,
		pushingMinecart = pushingMinecart,
		dudes = dudesData,
		refreshUsed = refreshUsed,
	}

func loadData(_data:Dictionary):
	for dude in dudes:
		GM.world.deleteEntity(dude.iconID)
	dudes.clear()
	for nuggetEntry in nuggets:
		GM.world.deleteEntity("ps_nugget"+nuggetEntry[0])
	nuggets.clear()
	
	upgrades = SAVE.loadVar(_data, "upgrades", {})
	minecartLoc = SAVE.loadVar(_data, "minecartLoc", "psmine_cartspawn")
	nextUniquieID = SAVE.loadVar(_data, "nextUniquieID", 0)
	nuggets = SAVE.loadVar(_data, "nuggets", [])
	nuggetsCarrying = SAVE.loadVar(_data, "nuggetsCarrying", 0)
	nuggetsMinecart = SAVE.loadVar(_data, "nuggetsMinecart", 0)
	oreLeft = SAVE.loadVar(_data, "oreLeft", {})
	day = SAVE.loadVar(_data, "day", 0)
	totalMined = SAVE.loadVar(_data, "totalMined", 0)
	didFirstOfferEvent = SAVE.loadVar(_data, "didFirstOfferEvent", false)
	pushingMinecart = SAVE.loadVar(_data, "pushingMinecart", false)
	refreshUsed = SAVE.loadVar(_data, "refreshUsed", 0)
	
	var dudesData:Array = SAVE.loadVar(_data, "dudes", [])
	for dudeEntry in dudesData:
		var newDude:Dude = Dude.new()
		newDude.loadData(dudeEntry)
		newDude.createIcon(self)
		dudes.append(newDude)
	
	createIcons()
