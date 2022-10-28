extends Reference
class_name SexEngine

var activities:Array = []
var domID = null
var subID = null
var domInfo: SexDomInfo
var subInfo: SexSubInfo
var messages:Array = []
var state = "start" # start, waitingForPCSub, waitingForPCDom
var waitingActivityID
var turnOrder = []

var currentLastActivityID = 0

func initPeople(theTopID, theSubID):
	domID = theTopID
	subID = theSubID
	
	domInfo = SexDomInfo.new()
	domInfo.initInfo(domID)
	
	subInfo = SexSubInfo.new()
	subInfo.initInfo(subID)

func startActivity(id, theDomID, theSubID, _args = null):
	var activityObject = GlobalRegistry.createSexActivity(id)
	if(activityObject == null):
		return
	
	activityObject.uniqueID = currentLastActivityID
	activities.append(activityObject)
	activityObject.initParticipants(theDomID, theSubID)
	
	var startData = activityObject.startActivity(_args)
	if(startData != null && startData.has("text")):
		messages.append(startData["text"])
	
	turnOrder.append(["newturn"])
	turnOrder.append(["turn", currentLastActivityID, "dom"])
	turnOrder.append(["turn", currentLastActivityID, "sub"])
	
	currentLastActivityID += 1
	

func getActivityWithUniqueID(uniqueID):
	for activity in activities:
		if(activity.uniqueID == uniqueID):
			return activity
	return null

func generateGoals():
	domInfo.goals.append([SexGoal.Fuck, subID])
	#startActivity("SexFuckTest", domID, subID)
	#startActivity("SexFuckTest2", domID, subID)
	startActivity("SexFuckExample", domID, subID)

func getDom() -> BaseCharacter:
	if(domID == null):
		return null
	var character = GlobalRegistry.getCharacter(domID)
	return character

func getDomInfo(theDomID) -> SexDomInfo:
	if(theDomID == domID):
		return domInfo
	return null

func getSubInfo(theSubID) -> SexSubInfo:
	if(theSubID == subID):
		return subInfo
	return null

func getSub() -> BaseCharacter:
	if(subID == null):
		return null
	var character = GlobalRegistry.getCharacter(subID)
	return character

func processTurn():
	var processMessages = []
	for activity in activities:
		var processResult = activity.processTurn()
		if(processResult != null && processResult.has("text")):
			processMessages.append(processResult["text"])
	if(processMessages.size() > 0):
		messages.append(Util.join(processMessages, " "))
	
	var peopleToCheck = [
		domID,
		subID,
	]
	
	for personID in peopleToCheck:
		if(personID == "pc"):
			continue
		
		var possibleActions = []
		var actionsScores = []
		
		for activity in activities:
			
			if(activity.domID == personID):
				var domActions = activity.getDomActions()
				if(domActions != null):
					for action in domActions:
						possibleActions.append({
							id = "domAction",
							activityID = activity.uniqueID,
							action = action,
						})
						actionsScores.append(1.0)
				
			if(activity.subID == personID):
				var subActions = activity.getSubActions()
				if(subActions != null):
					for action in subActions:
						possibleActions.append({
							id = "subAction",
							activityID = activity.uniqueID,
							action = action,
						})
						actionsScores.append(1.0)

		if(possibleActions.size() > 0):
			var pickedFinalAction = RNG.pickWeighted(possibleActions, actionsScores)
			
			if(pickedFinalAction["id"] == "domAction"):
				var activity = getActivityWithUniqueID(pickedFinalAction["activityID"])
				doDomAction(activity, pickedFinalAction["action"])
			if(pickedFinalAction["id"] == "subAction"):
				var activity = getActivityWithUniqueID(pickedFinalAction["activityID"])
				doSubAction(activity, pickedFinalAction["action"])

	for i in range(activities.size() - 1, -1, -1):
		if(activities[i].hasEnded):
			activities.remove(i)

func doDomAction(activity, action):
	var actionResult = activity.doDomAction(action["id"], action)
	
	if(actionResult != null && actionResult.has("text")):
		messages.append(actionResult["text"])

func doSubAction(activity, action):
	var actionResult = activity.doSubAction(action["id"], action)
	
	if(actionResult != null && actionResult.has("text")):
		messages.append(actionResult["text"])

func start():
	pass

func getFinalText():
	return Util.join(messages, "\n\n")

func getActions():
	var result = []
	result.append({
		id = "continue",
		name = "Do nothing",
	})
	
	for activity in activities:
		if(activity.domID == "pc"):
			var domActions = activity.getDomActions()
			if(domActions != null):
				for action in domActions:
					result.append({
						id = "domAction",
						activityID = activity.uniqueID,
						action = action,
						name = action["name"],
					})
		if(activity.subID == "pc"):
			var subActions = activity.getSubActions()
			if(subActions != null):
				for action in subActions:
					result.append({
						id = "subAction",
						activityID = activity.uniqueID,
						action = action,
						name = action["name"],
					})
	return result

func doAction(_actionInfo):
	if(_actionInfo["id"] == "continue"):
		messages.clear()
		processTurn()
	if(_actionInfo["id"] == "domAction"):
		messages.clear()
		var activity = getActivityWithUniqueID(_actionInfo["activityID"])
		doDomAction(activity, _actionInfo["action"])
		processTurn()
	if(_actionInfo["id"] == "subAction"):
		messages.clear()
		var activity = getActivityWithUniqueID(_actionInfo["activityID"])
		doSubAction(activity, _actionInfo["action"])
		processTurn()

func hasTag(charID, tag):
	for activity in activities:
		if(activity.domID == charID):
			if(tag in activity.getDomTags()):
				return true
		if(activity.subID == charID):
			if(tag in activity.getSubTags()):
				return true
	return false
