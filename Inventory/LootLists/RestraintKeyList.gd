extends LootList

func _init():
	handlesIds = ["guard", "inmate", "engineer", "medical"]

func getLoot(_id, _characterID, _battleName):
	if(GM.pc == null || !is_instance_valid(GM.pc)):
		return []
	var smartAmount = GM.pc.getInventory().getSmartLockedItemsAmount()
	if(smartAmount <= 0):
		return []
	var keyAmount = GM.pc.getInventory().getAmountOf("restraintkey")
	
	var chanceMod = 1.0
	
	var keyLimit = 4 + smartAmount
	if(keyAmount > keyLimit):
		chanceMod -= (keyAmount-keyLimit)*0.2
	
	return [
		[75.0*chanceMod, [["restraintkey", 1, 1]]],
		[50.0*chanceMod, [["restraintkey", 1, 2]]],
		[10.0*chanceMod, [["restraintkey", 3, 5]]],
	]
