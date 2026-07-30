extends LootList

# Used for Rahi recruit scene

func _init():
	handlesIds = ["guard", "engineer", "medical"]

func getLoot(_id, _characterID, _battleName):
	if(GM.pc == null || !is_instance_valid(GM.pc)):
		return []
	if(!GM.main.getFlag("KaitModule.needBallgag", false)):
		return []
	if(GM.main.getFlag("KaitModule.gotBallgag", false)):
		return []
	GM.main.setFlag("KaitModule.gotBallgag", true)
	return [
		[100.0, [["ballgag", 1]]]
	]
