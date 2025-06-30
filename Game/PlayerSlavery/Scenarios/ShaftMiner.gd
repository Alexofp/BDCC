extends PlayerSlaveryBase

const IconMinecart = preload("res://Images/WorldEntities/minecart.png")
const IconMinecartFull = preload("res://Images/WorldEntities/minecart_full.png")
const IconNugget1 = preload("res://Images/WorldEntities/nugget1.png")
const IconNugget2 = preload("res://Images/WorldEntities/nugget2.png")
const IconNugget3 = preload("res://Images/WorldEntities/nugget3.png")

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

func _init():
	id = "ShaftMiner"

func onSlaveryStart():
	print("Meow")
	createIcons()

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
		var staminaUse:int = nuggetsCarrying * 3
		addMessage("You used "+str(staminaUse)+" stamina carrying the nuggets.")
		useStamina(staminaUse)
		if(!hasStamina()):
			dropAllNuggets()

func processTurn():
	pass

func updateLoc():
	var theLoc:String = GM.pc.getLocation()
	if(pushingMinecart):
		minecartLoc = theLoc
		#GM.world.moveEntity("ps_cart", minecartLoc)
	
	updateIcons()

func canMine() -> bool:
	return GM.pc.getLocation() in MiningLocs

func doMine():
	var mineChance:float = 40.0
	if(hasUpgrade("pick1")):
		mineChance = 100.0
	
	useStamina(10)
	
	if(RNG.chance(mineChance)):
		spawnNugget()
		addMessage("You did some mining!")
	else:
		addMessage("You did some mining but failed to find any ore!")

func dropAllNuggets():
	if(GM.pc.getLocation() == LOC_ENTRANCE):
		var credAmount:int = nuggetsCarrying
		addCredits(credAmount)
		addMessage("You have unloaded all your nuggets and got "+str(credAmount)+" credits for it!")
		nuggetsCarrying = 0
		return
	
	for _i in range(nuggetsCarrying):
		spawnNugget()
	nuggetsCarrying = 0
	addMessage("You have dropped all your nuggets!")

func spawnNugget():
	var nuggetEntry:Array = [getUID(), GM.pc.getLocation()]
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

func loadMinecartFromPC():
	nuggetsMinecart += nuggetsCarrying
	nuggetsCarrying = 0
	updateCartIcon()
	addMessage("You have put all your nuggets into the minecart.")

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
	}

func loadData(_data:Dictionary):
	upgrades = SAVE.loadVar(_data, "upgrades", {})
	minecartLoc = SAVE.loadVar(_data, "minecartLoc", "psmine_cartspawn")
	nextUniquieID = SAVE.loadVar(_data, "nextUniquieID", 0)
	nuggets = SAVE.loadVar(_data, "nuggets", [])
	nuggetsCarrying = SAVE.loadVar(_data, "nuggetsCarrying", 0)
	nuggetsMinecart = SAVE.loadVar(_data, "nuggetsMinecart", 0)
	
	createIcons()
