extends LootList

func _init():
	handlesAll = true

func getLoot(_id, _characterID, _battleName):
	if(GM.main == null || !is_instance_valid(GM.main) || !GM.main.SCI):
		return []
	
	if(_characterID == GM.main.SCI.peekRandomNpcIDForStrangeDrug()):
		GM.main.SCI.clearRandomNpcIDForStrangeDrug() # Maybe will lead to problems. Oh well
		return [
			[100.0, [["TFPill", 1, 1]]],
		]
	
	return [
	]
