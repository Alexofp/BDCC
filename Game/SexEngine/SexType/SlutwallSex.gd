extends SexTypeBase

func _init():
	id = SexType.SlutwallSex

func getDefaultAnimation():
	var sexEngine = getSexEngine()
	var subs = sexEngine.subs
	var doms = sexEngine.doms
	
	if(subs.size() == 0 || doms.size() == 0):
		return null
	
	return [StageScene.SlutwallSex, "tease", {npc=doms.keys()[0], pc=subs.keys()[0]}]
