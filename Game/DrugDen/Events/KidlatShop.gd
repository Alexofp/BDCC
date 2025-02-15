extends DrugDenEventBase

const sellList = {
	"painkillers": {
		costMin = 5,
		costMax = 10,
		buyLines = [
			"That should help you last a little longer, luv!",
			"Should help take the edge off.",
			"Don't take too many at once, hun.",
		],
	},
	"appleitem": {
		costMin = 1,
		costMax = 5,
		buyLines = [
			"Fresh and juicy!",
			"Good choice, luv. Ain’t often you find real fruit down here!",
			"Better than nibblin' on some weird paste, that’s for sure!",
		],
	},
	"AnaphrodisiacPill": {
		costMin = 1,
		costMax = 5,
		buyLines = [
			"Need a clear head, eh? This should do the trick, luv.",
			"Take it quick before someone down here makes things.. complicated.",
			"Best to keep your wits sharp, yeah? No distractions.",
		],
	},
	"EnergyDrink": {
		costMin = 1,
		costMax = 5,
		buyLines = [
			"Not enough alcohol in these for my likings.",
			"A little pick-me-up for when the tunnels get rough. Stay quick, luv!",
			"That should keep ya buzzin’ for a while. Try not to bounce off the walls.",
		],
	},
	"restraintkey": {
		costMin = 5,
		costMax = 10,
		buyLines = [
			"Bet you’re glad to have that, eh? Never know when you’ll need it.",
			"It’s yours now!",
			"This might save your hide!",
		],
	},
	"TFPill": {
		costMin = 5,
		costMax = 10,
		buyLines = [
			"Feelin’ brave, eh? Good luck, luv. Hope you like surprises!",
			"Ooo, curious, are we? You never know what’s comin’ with those.",
			"Don’t say I didn’t warn ya!",
		],
	},
	"BreederPill": {
		costMin = 2,
		costMax = 5,
		buyLines = [
			"Feelin' frisky, eh? Careful, luv. This one’s a game-changer.",
			"Take that, and you’ll be ready for.. well, everything.",
			"Better hope you’re ready for what this’ll do, hun. No backsies.",
		],
	},
	"HeatPill": {
		costMin = 2,
		costMax = 5,
		buyLines = [
			"Whew, someone’s lookin' for a very good time, huh?",
			"Pop that and watch the world get a whole lot.. hotter~.",
			"Just be ready. Once it kicks in, you’ll be cravin’ somethin’ fierce~.",
		],
	},
	"StunBaton": {
		costMin = 10,
		costMax = 15,
		buyLines = [
			"Shock ‘em silly, luv! No better way to keep a junkie in line!",
			"Careful where you swing that, hun. You could knock someone’s teeth loose.",
			"Buzz-buzz! Give ‘em a little zap for me, yeah?",
		],
	},
	"Shiv": {
		costMin = 10,
		costMax = 15,
		buyLines = [
			"Close and personal, huh? Just like a real pro~.",
			"Simple, but deadly. Just what you need in this shithole.",
			"Sharp enough to make anyone think twice. Keep it handy, luv!",
		],
	},
}

const weightList = {
	"painkillers": 0.3,
	"appleitem": 2.0,
	"AnaphrodisiacPill": 1.0,
	"EnergyDrink": 0.3,
	"restraintkey": 0.1,
	"TFPill": 0.3,
	"BreederPill": 0.2,
	"HeatPill": 0.2,
	"StunBaton": 0.1,
	"Shiv": 0.1,
}

const weightBetterList = {
	"painkillers": 1.0,
	"appleitem": 2.0,
	"AnaphrodisiacPill": 1.0,
	"EnergyDrink": 1.0,
	"restraintkey": 1.0,
	"TFPill": 0.3,
	"BreederPill": 0.2,
	"HeatPill": 0.2,
	"StunBaton": 0.5,
	"Shiv": 0.5,
}

var selling:Array = []
var hasBap:bool = false

func _init():
	id = "KidlatShop"
	eventWeight = 10.5

func onSpawn(_drugDen):
	generateItemsToSell()
	
	var itemsBoughtAmount:int = getDrugDenFlag("KidlatItemsBought", 0)
	if(itemsBoughtAmount > 0 && !getDrugDenFlag("KidlatBap", false) && RNG.chance(30)):
		hasBap = true

func getMaxPerFloor() -> int:
	return 1

func getCooldown() -> int:
	return 0#RNG.randi_range(2, 10)

func getStartCooldown() -> int:
	return 0#RNG.randi_range(1, 2)

func getInteractInfo() -> Dictionary:
	return {
		text = "KIDLAAAAT.",
		actions = [
			{
				id = "approach",
				name = "Approach",
				desc = "See what's up",
				args = [],
				disabled = false,
			},
		],
	}

func doInteract(_actionID:String, _args:Array = []) -> Dictionary:
	var scene1Hap:bool = getModuleFlag("Kidlat1Hap", false)
	
	if(!scene1Hap):
		setModuleFlag("Kidlat1Hap", true)
		return {sceneID="DrugDenKidlat1Scene"}
	
	var isFirstTimeInRun:bool = isFirstTimeThisRun()
	var scene2Hap:bool = getModuleFlag("Kidlat2Hap", false)
	var scene3Hap:bool = getModuleFlag("Kidlat3Hap", false)
	var itemsBoughtAmount:int = getDrugDenFlag("KidlatItemsBought", 0)
	
	if(!scene2Hap):
		if(isFirstTimeInRun && RNG.chance(100) && itemsBoughtAmount >= 3):
			setModuleFlag("Kidlat2Hap", true)
			return {sceneID="DrugDenKidlat2Scene"}
	
	if(scene2Hap && !scene3Hap):
		if(getDrugDenFlag("hasKidlatUniform", false)):
			setModuleFlag("Kidlat3Hap", true)
			setDrugDenFlag("hasKidlatUniform", false)
			return {sceneID="DrugDenKidlat3Scene"}
	
	
	return {sceneID="DrugDenKidlatShopScene"}

func getMapIcon():
	return RoomStuff.RoomSprite.IMPORTANT

func getModuleFlag(flagID:String, default):
	return GM.main.getFlag("DrugDenModule."+flagID, default)

func setModuleFlag(flagID:String, newVal):
	return GM.main.setFlag("DrugDenModule."+flagID, newVal)

func isFirstTimeThisFloor():
	return getModuleFlag("KidlatShopFirstTimeFloor", false)

func isFirstTimeThisRun():
	return getModuleFlag("KidlatShopFirstTimeRun", false)

func isOutOfItems():
	for entry in selling:
		if(!entry["sold"]):
			return false
	return true

func addBuyButtons(_scene):
	for entry in selling:
		var itemID:String = entry["itemID"]
		var cost:int = entry["cost"]
		var wasSold:bool = entry["sold"]
		
		var itemRef:ItemBase = GlobalRegistry.getItemRef(itemID)
		
		if(itemRef == null):
			continue
		
		if(wasSold):
			_scene.addDisabledButton(itemRef.getVisibleName(), "You already bought this!\n\n"+itemRef.getVisibleDescription())
		elif(GM.pc.getCredits() < cost):
			_scene.addDisabledButton(itemRef.getVisibleName(), "Cost: "+str(cost)+" credit"+("s" if cost != 1 else "")+"\nNot enough credits!\n\n"+itemRef.getVisibleDescription())
		else:
			_scene.addButton(itemRef.getVisibleName(), "Cost: "+str(cost)+" credit"+("s" if cost != 1 else "")+"\n\n"+itemRef.getVisibleDescription(), "buyKidlatItem", [entry])
		
func doBuyItem(entry:Dictionary):
	var itemID:String = entry["itemID"]
	var cost:int = entry["cost"]
	var itemRef:ItemBase = GlobalRegistry.getItemRef(itemID)
	
	if(itemRef == null):
		return "Something went wrong.."
	GM.pc.getInventory().addItem(GlobalRegistry.createItem(itemID))
	GM.pc.addCredits(-cost)
	
	GM.main.addMessage("You bought "+itemRef.getAStackName()+" from Kidlat!")
	entry["sold"] = true
	
	setDrugDenFlag("KidlatItemsBought", getDrugDenFlag("KidlatItemsBought", 0)+1)
	
	if(!sellList.has(itemID) || !sellList[itemID].has("buyLines")):
		return "There you go, hun!"
	var sellEntry:Dictionary = sellList[itemID]
	return RNG.pick(sellEntry["buyLines"])

func getItemsListText():
	var resultTexts:Array = []
	
	var _i:int = 1
	for entry in selling:
		var itemID:String = entry["itemID"]
		var cost:int = entry["cost"]
		var wasSold:bool = entry["sold"]
		
		var itemRef:ItemBase = GlobalRegistry.getItemRef(itemID)
		
		if(itemRef == null):
			continue
		resultTexts.append(str(_i)+") "+itemRef.getVisibleName()+". Cost: "+str(cost)+" credit"+("s" if cost != 1 else "")+(" (SOLD!)" if wasSold else ""))
		_i += 1
	
	if(hasBap):
		resultTexts.append(str(_i)+") Loaf of bread. Cost: ? credits")
		_i += 1
		
	return Util.join(resultTexts, "\n\n")

func isBetterItems() -> bool:
	return getModuleFlag("Kidlat3Hap", false)

func getAmountOfItemsToSell() -> int:
	if(getModuleFlag("Kidlat2Hap", false) && !getModuleFlag("Kidlat3Hap", false)):
		return 2
	
	return 3

func generateItemsToSell():
	var howMany:int = getAmountOfItemsToSell()
	selling = []
	
	for _i in range(howMany):
		var nextEntryID:String = RNG.pickWeightedDict(weightList if !isBetterItems() else weightBetterList)
		
		if(!sellList.has(nextEntryID)):
			Log.printerr("MISSING ENTRY IN KIDLAT SHOP: "+str(nextEntryID))
			continue
		
		var entryInfo:Dictionary = sellList[nextEntryID]
		
		var cost:int = entryInfo["cost"] if entryInfo.has("cost") else 5
		if(entryInfo.has("costMin") && entryInfo.has("costMax")):
			cost = RNG.randi_range(entryInfo["costMin"], entryInfo["costMax"])
		
		selling.append({
			itemID = nextEntryID,
			cost = cost,
			sold = false,
		})
		

func applyVisitFlags():
	setModuleFlag("KidlatShopFirstTimeRun", false)
	setModuleFlag("KidlatShopFirstTimeFloor", false)

func onRunStart(_drugDen):
	setModuleFlag("KidlatShopFirstTimeRun", true)
	setModuleFlag("KidlatShopFirstTimeFloor", true)

func onRunEnd(_drugDen):
	setModuleFlag("KidlatShopFirstTimeRun", false)
	setModuleFlag("KidlatShopFirstTimeFloor", false)

func onRunNextFloor(_drugDen):
	setModuleFlag("KidlatShopFirstTimeFloor", true)

func saveData() -> Dictionary:
	return {
		selling = selling,
		hasBap = hasBap,
	}

func loadData(_data:Dictionary):
	selling = SAVE.loadVar(_data, "selling", [])
	hasBap = SAVE.loadVar(_data, "hasBap", false)
