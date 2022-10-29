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

var currentLastActivityID = 0

func initPeople(theTopID, theSubID):
	domID = theTopID
	subID = theSubID
	
	domInfo = SexDomInfo.new()
	domInfo.initInfo(domID)
	
	subInfo = SexSubInfo.new()
	subInfo.initInfo(subID)

func makeActivity(id, theDomID, theSubID):
	var activityObject = GlobalRegistry.createSexActivity(id)
	if(activityObject == null):
		return null
	
	activityObject.uniqueID = currentLastActivityID
	activityObject.sexEngine = weakref(self)
	activities.append(activityObject)
	activityObject.initParticipants(theDomID, theSubID)
	return activityObject

func startActivity(id, theDomID, theSubID, _args = null):
	var activityObject = makeActivity(id, theDomID, theSubID)
	if(activityObject == null):
		return
		
	var startData = activityObject.startActivity(_args)
	if(startData != null && startData.has("text")):
		messages.append(startData["text"])
	
	currentLastActivityID += 1

func switchActivity(oldActivity, newActivityID, _args = []):
	oldActivity.endActivity()
	
	var activityObject = makeActivity(newActivityID, oldActivity.domID, oldActivity.subID)
	if(activityObject == null):
		return
	
	var startData = activityObject.onSwitchFrom(oldActivity, _args)
	if(startData != null && startData.has("text")):
		messages.append(startData["text"])
	
	currentLastActivityID += 1

func getActivityWithUniqueID(uniqueID):
	for activity in activities:
		if(activity.uniqueID == uniqueID):
			return activity
	return null

func generateGoals():
	var peopleToGenerateGoalsFor = [domInfo]
	var subsInfo = [subInfo]
	
	for personDomInfo in peopleToGenerateGoalsFor:
		var possibleGoals = []
		
		var dom = personDomInfo.getChar()
		
		for personSubInfo in subsInfo:
			var sub = personSubInfo.getChar()
			
			var goalsToAdd = dom.getFetishHolder().getGoals(self, sub)
			if(goalsToAdd != null):
				for goal in goalsToAdd:
					possibleGoals.append([[goal[0], sub.getID()], goal[1]])
		
		if(possibleGoals.size() > 0):
			var randomGoalInfo = RNG.pickWeightedPairs(possibleGoals)
			personDomInfo.goals.append(randomGoalInfo)
			
		print(personDomInfo.goals)
	
	#domInfo.goals.append([SexGoal.Fuck, subID])
	
	#startActivity("SexFuckTest", domID, subID)
	#startActivity("SexFuckTest2", domID, subID)
	#startActivity("SexFuckExample", domID, subID)

func hasGoal(thedominfo, goal, thesubinfo):
	for goalInfo in thedominfo.goals:
		if(goalInfo[0] == goal && goalInfo[1] == thesubinfo.charID):
			return true
	return false

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

func removeEndedActivities():
	for i in range(activities.size() - 1, -1, -1):
		if(activities[i].hasEnded):
			activities.remove(i)

func processTurn():
	removeEndedActivities()
	
	var processMessages = []
	for activity in activities:
		var processResult = activity.processTurn()
		if(processResult != null && processResult.has("text")):
			processMessages.append(processResult["text"])
	if(processMessages.size() > 0):
		messages.append(Util.join(processMessages, " "))
		
	removeEndedActivities()
	
func processAIActions(isDom = true):
	var peopleToCheck = [
		#domID,
		#subID,
	]
	if(isDom):
		peopleToCheck = [domID]
	else:
		peopleToCheck = [subID]
	
	for personID in peopleToCheck:
		if(personID == "pc"):
			continue
		
		var possibleActions = []
		var actionsScores = []
		
		# if is dom
		if(personID == domID):
			var allSexActivities = GlobalRegistry.getSexActivityReferences()
			for possibleSexActivityID in allSexActivities:
				var newSexActivityRef = allSexActivities[possibleSexActivityID]
				
				if(!newSexActivityRef.canStartActivity(self, getDomInfo(personID), getSubInfo(subID))):
					continue
				
				var score = newSexActivityRef.getActivityScore(self, getDomInfo(personID), getSubInfo(subID))
				if(score > 0.0):
					possibleActions.append({
						id = "startNewDomActivity",
						activityID = possibleSexActivityID,
					})
					actionsScores.append(score)
		
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
			if(pickedFinalAction["id"] == "startNewDomActivity"):
				startActivity(pickedFinalAction["activityID"], domID, subID)

	removeEndedActivities()

func doDomAction(activity, action):
	var actionResult = activity.doDomAction(action["id"], action)
	
	if(actionResult != null && actionResult.has("text")):
		messages.append(actionResult["text"])

func doSubAction(activity, action):
	var actionResult = activity.doSubAction(action["id"], action)
	
	if(actionResult != null && actionResult.has("text")):
		messages.append(actionResult["text"])

func start():
	processAIActions(true)

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
		processAIActions(true)
		processAIActions(false)
		processTurn()
	if(_actionInfo["id"] == "domAction"):
		messages.clear()
		var activity = getActivityWithUniqueID(_actionInfo["activityID"])
		doDomAction(activity, _actionInfo["action"])
		processAIActions(true)
		processAIActions(false)
		processTurn()
	if(_actionInfo["id"] == "subAction"):
		messages.clear()
		var activity = getActivityWithUniqueID(_actionInfo["activityID"])
		doSubAction(activity, _actionInfo["action"])
		processAIActions(false)
		processTurn()
		processAIActions(true)

func hasTag(charID, tag):
	for activity in activities:
		if(activity.domID == charID):
			if(tag in activity.getDomTags()):
				return true
		if(activity.subID == charID):
			if(tag in activity.getSubTags()):
				return true
	return false
