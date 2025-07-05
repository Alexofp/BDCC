extends Reference
class_name PlayerSlaveryHolder

# This object always exists and holds slavery-related stuff

var storedCredits:int = 0

# Returns IDs of slavery def objects that are possible
func getPossibleSlaveries(includeTrivial:bool = false) -> Array:
	var result:Array = []
	
	for slaveryID in GlobalRegistry.getPlayerSlaveryDefs():
		var playerSlaveryDef = GlobalRegistry.getPlayerSlaveryDef(slaveryID)
		if(!includeTrivial && playerSlaveryDef.isTrivial()):
			continue
		
		if(playerSlaveryDef.canBeChosen()):
			result.append(slaveryID)
	
	return result

func getPossibleSlaveriesAmount(includeTrivial:bool = false) -> int:
	return getPossibleSlaveries(includeTrivial).size()

func getRandomPossibleSlaveryID(includeTrivial:bool = false) -> String:
	var theSlaveries := getPossibleSlaveries(includeTrivial)
	
	if(theSlaveries.empty()):
		theSlaveries = getPossibleSlaveries(true)
		if(theSlaveries.empty()):
			return ""
	
	#TODO: Prefer to pick slaveries that weren't picked before
	return RNG.pick(theSlaveries)

func storePlayersItems():
	storedCredits += GM.pc.getCredits()
	GM.pc.addCredits(-GM.pc.getCredits())
	#TODO: Store items too

func givePlayerItemsBack():
	GM.pc.addCredits(storedCredits)
	storedCredits = 0
	#TODO: Restore items

func saveData() -> Dictionary:
	return {
		storedCredits = storedCredits,
	}

func loadData(_data:Dictionary):
	storedCredits = SAVE.loadVar(_data, "storedCredits", 0)
