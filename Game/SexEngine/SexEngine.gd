extends Reference
class_name SexEngine

var activities:Array = []

var messages:Array = []
var state = "start" # start, waitingForPCSub, waitingForPCDom
var waitingActivityID

var doms = {}
var subs = {}

var currentLastActivityID = 0

func initPeople(domIDs, subIDs):
	if(domIDs is String):
		domIDs = [domIDs]
	if(subIDs is String):
		subIDs = [subIDs]
	
	for domID in domIDs:
		var domInfo = SexDomInfo.new()
		domInfo.initInfo(domID)
		
		doms[domID] = domInfo
		
	for subID in subIDs:
		var subInfo = SexSubInfo.new()
		subInfo.initInfo(subID)
		
		subs[subID] = subInfo

func makeActivity(id, theDomID, theSubID):
	var activityObject = GlobalRegistry.createSexActivity(id)
	if(activityObject == null):
		return null
	
	activityObject.uniqueID = currentLastActivityID
	activityObject.sexEngineRef = weakref(self)
	activities.append(activityObject)
	activityObject.initParticipants(theDomID, theSubID)
	currentLastActivityID += 1
	return activityObject

func processText(thetext, theDomID, theSubID):
	return GM.ui.processString(thetext, {dom=theDomID, sub=theSubID})

func addText(thetext, theDomID, theSubID):
	messages.append(processText(thetext, theDomID, theSubID))

func startActivity(id, theDomID, theSubID, _args = null):
	var activityObject = makeActivity(id, theDomID, theSubID)
	if(activityObject == null):
		return
		
	var startData = activityObject.startActivity(_args)
	if(startData != null && startData.has("text")):
		addText(startData["text"], theDomID, theSubID)
	
func switchActivity(oldActivity, newActivityID, _args = []):
	oldActivity.endActivity()
	
	var activityObject = makeActivity(newActivityID, oldActivity.domID, oldActivity.subID)
	if(activityObject == null):
		return
	
	var startData = activityObject.onSwitchFrom(oldActivity, _args)
	if(startData != null && startData.has("text")):
		addText(startData["text"], oldActivity.domID, oldActivity.subID)

func getActivityWithUniqueID(uniqueID):
	for activity in activities:
		if(activity.uniqueID == uniqueID):
			return activity
	return null

func generateGoals():
	var amountToGenerate = 2
	
	for domID in doms:
		if(domID == "pc"):
			continue
		
		var personDomInfo = doms[domID]
		var possibleGoals = []
		
		var dom = personDomInfo.getChar()
		
		for subID in subs:
			var personSubInfo = subs[subID]
			var sub = personSubInfo.getChar()
			
			var goalsToAdd = dom.getFetishHolder().getGoals(self, sub)
			if(goalsToAdd != null):
				for goal in goalsToAdd:
					possibleGoals.append([[goal[0], sub.getID()], goal[1]])
		
		if(possibleGoals.size() > 0):
			for _i in range(0, amountToGenerate):
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

func satisfyGoal(thedominfo, goalid, thesubinfo):
	for _i in range(0, thedominfo.goals.size()):
		var goalInfo = thedominfo.goals[_i]
		
		if(goalInfo[0] == goalid && goalInfo[1] == thesubinfo.charID):
			thedominfo.goals.remove(_i)
			print(str(thedominfo.charID)+"'s goal to "+str(goalInfo[0])+" "+str(goalInfo[1])+" was satisfied")
			return true
	return false

func getDomInfo(theDomID) -> SexDomInfo:
	if(!doms.has(theDomID)):
		return null
	return doms[theDomID]

func getSubInfo(theSubID) -> SexSubInfo:
	if(!subs.has(theSubID)):
		return null
	return subs[theSubID]

func isDom(charID):
	if(!doms.has(charID)):
		return false
	return true

func isSub(charID):
	if(!subs.has(charID)):
		return false
	return true

func removeEndedActivities():
	for i in range(activities.size() - 1, -1, -1):
		if(activities[i].hasEnded):
			activities.remove(i)

func processTurn():
	removeEndedActivities()
	
	for domID in doms:
		var domInfo = doms[domID]
		domInfo.processTurn()
	for subID in subs:
		var subInfo = subs[subID]
		subInfo.processTurn()
	
	var processMessages = []
	for activity in activities:
		var processResult = activity.processTurn()
		if(processResult != null && processResult.has("text")):
			processMessages.append(processText(processResult["text"], activity.domID, activity.subID))
	if(processMessages.size() > 0):
		messages.append(Util.join(processMessages, " "))
		
	removeEndedActivities()
	
func getSubIDs():
	return subs.keys()
	
func getDomIDs():
	return doms.keys()
	
func hasAnyAcitivites(charID):
	for activity in activities:
		if(activity.subID == charID || activity.domID == charID):
			return true
	return false
	
func processAIActions(isDom = true):
	var peopleToCheck = [
	]
	if(isDom):
		peopleToCheck = doms
	else:
		peopleToCheck = subs
	
	for personID in peopleToCheck:
		var theinfo = peopleToCheck[personID]
		if(personID == "pc"):
			continue
		
		var possibleActions = []
		var actionsScores = []
		if(hasAnyAcitivites(personID)):
			possibleActions = [{id="donothing"}]
			actionsScores = [1.0]
		
		# if is dom
		if(isDom(personID)):
			var allSexActivities = GlobalRegistry.getSexActivityReferences()
			for possibleSexActivityID in allSexActivities:
				var newSexActivityRef = allSexActivities[possibleSexActivityID]
				
				for subID in subs:
					var subInfo = subs[subID]
					if(!newSexActivityRef.canBeStartedByDom()):
						continue
					
					if(!newSexActivityRef.canStartActivity(self, theinfo, subInfo)):
						continue
					
					var score = newSexActivityRef.getActivityScore(self, theinfo, subInfo)
					if(score > 0.0):
						possibleActions.append({
							id = "startNewDomActivity",
							activityID = possibleSexActivityID,
							subID = subInfo.charID,
						})
						actionsScores.append(score)
		
		if(isSub(personID)):
			var allSexActivities = GlobalRegistry.getSexActivityReferences()
			for possibleSexActivityID in allSexActivities:
				var newSexActivityRef = allSexActivities[possibleSexActivityID]
				
				for domID in doms:
					var domInfo = doms[domID]
					if(!newSexActivityRef.canBeStartedBySub()):
						continue
					
					if(!newSexActivityRef.canStartActivity(self, domInfo, theinfo)):
						continue
					
					var score = newSexActivityRef.getActivityScore(self, domInfo, theinfo)
					if(score > 0.0):
						possibleActions.append({
							id = "startNewSubActivity",
							activityID = possibleSexActivityID,
							domID = domInfo.charID,
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
						if(action.has("score")):
							actionsScores.append(max(action["score"], 0.0))
						else:
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
						if(action.has("score")):
							actionsScores.append(max(action["score"], 0.0))
						else:
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
				startActivity(pickedFinalAction["activityID"], personID, pickedFinalAction["subID"])
			if(pickedFinalAction["id"] == "startNewSubActivity"):
				startActivity(pickedFinalAction["activityID"], pickedFinalAction["domID"], personID)

	removeEndedActivities()

func doDomAction(activity, action):
	var actionResult = activity.doDomAction(action["id"], action)
	
	if(actionResult != null && actionResult.has("text")):
		addText(actionResult["text"], activity.domID, activity.subID)

func doSubAction(activity, action):
	var actionResult = activity.doSubAction(action["id"], action)
	
	if(actionResult != null && actionResult.has("text")):
		addText(actionResult["text"], activity.domID, activity.subID)

func start():
	if(isSub("pc")):
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
					
	if(isDom("pc")):
		var pctargetID = getPCTarget()
		if(pctargetID != null):
			var allSexActivities = GlobalRegistry.getSexActivityReferences()
			for possibleSexActivityID in allSexActivities:
				var newSexActivityRef = allSexActivities[possibleSexActivityID]
				
				if(!newSexActivityRef.canBeStartedByDom()):
					continue
				
				if(!newSexActivityRef.canStartActivity(self, getDomInfo("pc"), getSubInfo(pctargetID))):
					continue
				
				result.append({
					id = "startNewDomActivity",
					activityID = possibleSexActivityID,
					name = newSexActivityRef.getVisibleName(),
					category = newSexActivityRef.getCategory(),
					subID = pctargetID,
				})
					
	if(isSub("pc")):
		var pctargetID = getPCTarget()
		if(pctargetID != null):
			var allSexActivities = GlobalRegistry.getSexActivityReferences()
			for possibleSexActivityID in allSexActivities:
				var newSexActivityRef = allSexActivities[possibleSexActivityID]
				
				if(!newSexActivityRef.canBeStartedBySub()):
					continue
				
				if(!newSexActivityRef.canStartActivity(self, getDomInfo(pctargetID), getSubInfo("pc"))):
					continue
				
				result.append({
					id = "startNewSubActivity",
					activityID = possibleSexActivityID,
					name = newSexActivityRef.getVisibleName(),
					category = newSexActivityRef.getCategory(),
					domID = pctargetID,
				})
				
	return result

func getPCTarget():
	if(isDom("pc")):
		return subs.keys()[0]
	if(isSub("pc")):
		return doms.keys()[0]
	
	return null

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
	if(_actionInfo["id"] == "startNewDomActivity"):
		messages.clear()
		startActivity(_actionInfo["activityID"], "pc", _actionInfo["subID"])
		processAIActions(true)
		processAIActions(false)
		processTurn()
	if(_actionInfo["id"] == "startNewSubActivity"):
		messages.clear()
		startActivity(_actionInfo["activityID"], _actionInfo["domID"], "pc")
		processAIActions(true)
		processAIActions(false)
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

func hasActivity(id, thedomID, thesubID):
	for activity in activities:
		if(activity.id != id):
			continue
		
		if(activity.domID == thedomID && activity.subID == thesubID):
			return true
	return false
