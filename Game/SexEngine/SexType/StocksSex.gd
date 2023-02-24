extends SexTypeBase

func _init():
	id = SexType.StocksSex

func getDefaultAnimation():
	var sexEngine = getSexEngine()
	var subs = sexEngine.subs
	var doms = sexEngine.doms
	
	if(subs.size() == 0 || doms.size() == 0):
		return null
	
	return [StageScene.StocksSexOral, "tease", {npc=doms.keys()[0], pc=subs.keys()[0]}]
