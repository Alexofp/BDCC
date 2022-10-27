extends Reference
class_name SexEngine

var activities:Array = []
var domID = null
var subID = null
var domInfo: SexDomInfo
var subInfo: SexSubInfo

func initPeople(theTopID, theSubID):
	domID = theTopID
	subID = theSubID
	
	domInfo = SexDomInfo.new()
	domInfo.initInfo(domID)
	
	subInfo = SexSubInfo.new()
	subInfo.initInfo(subID)

func generateGoals():
	domInfo.goals.append([SexGoal.Fuck, subID])

func getDom() -> BaseCharacter:
	if(domID == null):
		return null
	var character = GlobalRegistry.getCharacter(domID)
	return character

func getSub() -> BaseCharacter:
	if(subID == null):
		return null
	var character = GlobalRegistry.getCharacter(subID)
	return character

func getBestDomAction():
	var actions = GlobalRegistry.getDomSexActions()
	for actionID in actions:
		var action = actions[actionID]
		
		if(action.canDo(self, domInfo, subInfo)):
			return action
	return null

func getBestSubAction():
	var actions = GlobalRegistry.getSubSexActions()
	for actionID in actions:
		var action = actions[actionID]
		
		if(action.canDo(self, domInfo, subInfo)):
			return action
	return null

func processTurn():
	var texts = []
	
	var domAction = getBestDomAction()
	if(domAction != null):
		var actionResult = domAction.doAction(self, domInfo, subInfo)
		texts.append(actionResult["text"])
	
	var subAction = getBestSubAction()
	if(subAction != null):
		var actionResult = subAction.doAction(self, domInfo, subInfo)
		texts.append(actionResult["text"])
	
	return {
		text = Util.join(texts, "\n\n")
	}
	
