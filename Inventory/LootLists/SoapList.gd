extends LootList

func _init():
	handlesIds = ["guard", "inmate", "engineer", "medical", "junkie"]

func getLoot(_id, _characterID, _battleName):
	if(GM.pc == null || !is_instance_valid(GM.pc)):
		return []
	
	if(!GM.pc.hasPermanentBodywritings()):
		return []

	return [
		[5.0, [["Soap", 1, 1]]],
	]
