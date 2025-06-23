extends LootList

# Adds extra keys to loot if you are bound

func _init():
	handlesIds = ["guard", "inmate", "engineer", "medical", "junkie", "junkieStash"]

func getLoot(_id, _characterID, _battleName):
	if(GM.pc == null || !is_instance_valid(GM.pc)):
		return []
	var restraintAmount:int = GM.pc.getInventory().getRemovableRestraintsAmount()
	if(restraintAmount <= 0):
		return []
	var smartAmount:int = GM.pc.getInventory().getSmartLockedItemsAmount()
	var keyAmount:int = GM.pc.getInventory().getAmountOf("restraintkey")
	
	var chanceMod:float = 0.0
	
	chanceMod += pow(restraintAmount, 0.7)*0.3
	chanceMod += pow(smartAmount, 0.5)*0.2
	chanceMod -= pow(keyAmount, 1.5)*0.1

	chanceMod = clamp(chanceMod, 0.0, 1.0)

	if(_id == "junkie"):
		chanceMod *= 0.3
	
	return [
		[35.0*chanceMod, [["restraintkey", 1]]],
		[10.0*chanceMod, [["restraintkey", 1]]],
		[5.0*chanceMod, [["restraintkey", 1]]],
		[1.0*chanceMod, [["restraintkey", 2, 4]]], # jackpot
	]
