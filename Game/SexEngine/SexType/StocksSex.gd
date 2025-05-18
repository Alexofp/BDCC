extends SexTypeBase

func _init():
	id = SexType.StocksSex

func getDefaultAnimation():
	var sexEngine = getSexEngine()
	var theDomIDs:Array = sexEngine.getXFreeDomIDsForAnim(1)
	var theSubIDs:Array = sexEngine.getXFreeSubIDsForAnim(1)
	
	if(theSubIDs.empty() && theDomIDs.empty()):
		return null
	
	if(theSubIDs.empty()):
		return [StageScene.Solo, "stand", {pc=theDomIDs[0]}]
	if(theDomIDs.empty()):
		return [StageScene.Stocks, "idle", {pc=theSubIDs[0]}]
	
	return [StageScene.StocksSexOral, "tease", {npc=theDomIDs[0], pc=theSubIDs[0]}]
