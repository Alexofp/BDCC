extends SexTypeBase

func _init():
	id = SexType.BitchsuitSex

func getDefaultAnimation():
	var sexEngine = getSexEngine()
	var theDomIDs:Array = sexEngine.getXFreeDomIDsForAnim(1)
	var theSubIDs:Array = sexEngine.getXFreeSubIDsForAnim(1)
	
	if(theSubIDs.empty() && theDomIDs.empty()):
		return null
	
	if(theSubIDs.empty()):
		return [StageScene.Solo, "stand", {pc=theDomIDs[0]}]
	if(theDomIDs.empty()):
		return [StageScene.PuppySolo, "stand" if !isUnconscious(theSubIDs[0]) else "sad", {pc=theSubIDs[0]}]
	
	if(isUnconscious(theSubIDs[0])):
		return [StageScene.PuppySexStart, "sad", {pc=theDomIDs[0], npc=theSubIDs[0]}]
	return [StageScene.PuppySexStart, "start", {pc=theDomIDs[0], npc=theSubIDs[0]}]
