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

const MiningLocs = [
	"psmine_mine1", "psmine_mine2", "psmine_mine3", "psmine_mine4", "psmine_mine5", "psmine_mine6", "psmine_mine7", "psmine_mine8",
]

const UpgradesDB = {
	"pick1": {
		name = "Better pickaxe",
		desc = "Let's you mine more!",
		cost = 10,
		reqs = [],
	},
	"pick2": {
		name = "Notched pickaxe",
		desc = "Let's you mine even more!",
		cost = 20,
		reqs = ["pick1"],
	},
}

var nuggets:Array = [] # [id, indx]
var upgrades:Dictionary = {} # upgradeID = true

var minecartLoc:String = "psmine_cartspawn"
var pushingMinecart:bool = false
var nuggetsCarrying:int = 0
var nuggetsMinecart:int = 0

var nextUniquieID:int = 0

var oreLeft:Dictionary = {}

var prevPCLoc:String = ""

class Dude:
	var iconID:String = ""
	var isMiner:bool = true
	var loc:String = ""
	var energyUsed:int = 0
	var path:Array = []
	var nuggets:int = 0
	
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
		
		var canPickup:bool = (dude.nuggets < 10)
		if(hasNuggetsIn(dude.loc) && canPickup):
			removeNuggetIn(dude.loc)
			dude.nuggets += 1
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
		addMessage("A carrier has deposited "+str(_dude.nuggets)+" "+("nugget" if _dude.nuggets == 1 else "nuggets")+" of ore, earning you "+str(theCreds)+" "+("credit" if theCreds == 1 else "credits")+"!")
	else:
		if(loadMinecartFromDude(_dude)):
			return
		for _i in range(_dude.nuggets):
			spawnNugget(_dude.loc)
	_dude.nuggets = 0

func _init():
	id = "ShaftMiner"

func updateMiningZones():
	oreLeft.clear()
	for zone in MiningLocs:
		oreLeft[zone] = RNG.randi_range(1, 8)
		
	for _i in range(RNG.randi_range(2, 4)):
		var randomZone:String = RNG.pick(MiningLocs)
		for _i2 in range(RNG.randi_range(1, 2)):
			spawnNugget(randomZone)

func sleep():
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
	updateMiningZones()
	
	#upgrade stuff here
	spawnDude(true)
	spawnDude(true)
	spawnDude(false)

func onSlaveryStart():
	print("Meow")
	createIcons()
	updateMiningZones()
	


func getStartScene() -> String:
	return "PSShaftMinerGameplayScene"#"PSShaftMinerStart"

func unlockUpgrade(_upgradeID:String):
	upgrades[_upgradeID] = true

func hasUpgrade(_upgradeID:String) -> bool:
	return upgrades.has(_upgradeID)

func canSeeUpgrade(_upgradeID:String) -> bool:
	if(!UpgradesDB.has(_upgradeID)):
		return false
	if(upgrades.has(_upgradeID)):
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

func canUnlockUpgrade(_upgradeID:String) -> bool:
	if(!UpgradesDB.has(_upgradeID)):
		return false
	if(upgrades.has(_upgradeID)):
		return false
	if(!canSeeUpgrade(_upgradeID)):
		return false
	var upgradeInfo:Dictionary = UpgradesDB[_upgradeID]
	var theCost:int = upgradeInfo["cost"]
	
	if(getCredits() < theCost):
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

func getMinecartTexture() -> Texture:
	return (IconMinecart if nuggetsMinecart <= 0 else IconMinecartFull)

func updateCartIcon():
	GM.world.setEntityTexture("ps_cart", getMinecartTexture())

func updateIcons():
	GM.world.moveEntity("ps_cart", minecartLoc)
	for nuggetEntry in nuggets:
		GM.world.moveEntity("ps_nugget"+nuggetEntry[0], nuggetEntry[1])

func getPCViewDistance() -> float:
	return 64.0

func afterMove():
	if(nuggetsCarrying > 0):
		if(GM.pc.getLocation() != minecartLoc || pushingMinecart):
			var staminaUse:int = nuggetsCarrying * 3
			addMessage("You used "+str(staminaUse)+" stamina carrying the nuggets.")
			useStamina(staminaUse)
			if(!hasStamina()):
				dropAllNuggets()

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
	if(pushingMinecart):
		return [false, "You can't mine if you are pushing a minecart"]
	
	var theOreLeft:int = oreLeft[theLoc] if oreLeft.has(theLoc) else 0
	if(theOreLeft <= 0):
		return [false, "There is no ore left here"]
	return [true, ""]

func doMineSpot(_loc:String):
	var am:int = oreLeft[_loc] if oreLeft.has(_loc) else 0
	if(am > 0):
		oreLeft[_loc] -= 1
		spawnNugget(_loc)

func doMine():
	var mineChance:float = 40.0
	if(hasUpgrade("pick1")):
		mineChance = 100.0
	
	useStamina(10)
	
	if(RNG.chance(mineChance)):
		doMineSpot(GM.pc.getLocation())
		addMessage("You did some mining!")
	else:
		addMessage("You did some mining but failed to find any ore!")

func getNuggetCredits(_am:int) -> int:
	return _am

func dropAllNuggets():
	if(GM.pc.getLocation() == LOC_ENTRANCE):
		var credAmount:int = getNuggetCredits(nuggetsCarrying)
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

func pickupNugget():
	removeNuggetIn(GM.pc.getLocation())
	nuggetsCarrying += 1

func getUID() -> String:
	nextUniquieID += 1
	return str(nextUniquieID - 1)

func addMessage(_text:String):
	GM.main.addMessage(_text)

func useStamina(_howMuch:int):
	GM.pc.addStamina(-_howMuch)

func hasStamina() -> bool:
	return GM.pc.getStamina() > 0

func getMinecartCapacity() -> int:
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
	var credAmount:int = nuggetsMinecart
	addCredits(credAmount)
	addMessage("You have unloaded the minecart and got "+str(credAmount)+" credits for it!")
	nuggetsMinecart = 0
	updateCartIcon()

func saveData() -> Dictionary:
	return {
		upgrades = upgrades,
		minecartLoc = minecartLoc,
		nextUniquieID = nextUniquieID,
		nuggets = nuggets,
		nuggetsCarrying = nuggetsCarrying,
		nuggetsMinecart = nuggetsMinecart,
		oreLeft = oreLeft,
	}

func loadData(_data:Dictionary):
	upgrades = SAVE.loadVar(_data, "upgrades", {})
	minecartLoc = SAVE.loadVar(_data, "minecartLoc", "psmine_cartspawn")
	nextUniquieID = SAVE.loadVar(_data, "nextUniquieID", 0)
	nuggets = SAVE.loadVar(_data, "nuggets", [])
	nuggetsCarrying = SAVE.loadVar(_data, "nuggetsCarrying", 0)
	nuggetsMinecart = SAVE.loadVar(_data, "nuggetsMinecart", 0)
	oreLeft = SAVE.loadVar(_data, "oreLeft", {})
	
	createIcons()
