extends PlayerSlaveryBase

const IconMinecart = preload("res://Images/WorldEntities/minecart.png")
const IconMinecartFull = preload("res://Images/WorldEntities/minecart_full.png")
const IconNugget1 = preload("res://Images/WorldEntities/nugget1.png")
const IconNugget2 = preload("res://Images/WorldEntities/nugget2.png")
const IconNugget3 = preload("res://Images/WorldEntities/nugget3.png")

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
	var theReqs:Array = upgradeInfo[_upgradeID] if upgradeInfo.has(_upgradeID) else []
	
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

func createIcons():
	GM.world.createEntity("ps_cart", IconMinecart, minecartLoc)
	
	for nuggetEntry in nuggets:
		GM.world.createEntity("ps_nugget"+nuggetEntry[0], RNG.pick([IconNugget1, IconNugget2, IconNugget3]), nuggetEntry[1])

func updateIcons():
	GM.world.moveEntity("ps_cart", minecartLoc)
	for nuggetEntry in nuggets:
		GM.world.moveEntity("ps_nugget"+nuggetEntry[0], nuggetEntry[1])

func getPCViewDistance() -> float:
	return 64.0

func onStep():
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
	var nuggetEntry:Array = [getUID(), GM.pc.getLocation()]
	nuggets.append(nuggetEntry)
	GM.world.createEntity("ps_nugget"+nuggetEntry[0], RNG.pick([IconNugget1, IconNugget2, IconNugget3]), nuggetEntry[1])

func getUID() -> String:
	nextUniquieID += 1
	return str(nextUniquieID - 1)

func saveData() -> Dictionary:
	return {
		upgrades = upgrades,
		minecartLoc = minecartLoc,
		nextUniquieID = nextUniquieID,
		nuggets = nuggets,
	}

func loadData(_data:Dictionary):
	upgrades = SAVE.loadVar(_data, "upgrades", {})
	minecartLoc = SAVE.loadVar(_data, "minecartLoc", "psmine_cartspawn")
	nextUniquieID = SAVE.loadVar(_data, "nextUniquieID", 0)
	nuggets = SAVE.loadVar(_data, "nuggets", [])
	
	createIcons()
