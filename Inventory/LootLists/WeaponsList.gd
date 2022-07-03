extends LootList

func _init():
	handlesIds = ["guard", "inmate"]

func getLoot(_id, _characterID, _battleName):
	if(_id == "guard"):
		return [
			[15, ["StunBaton"]],
		]
	if(_id == "inmate"):
		return [
			[10, ["Shiv"]],
		]

	return []
