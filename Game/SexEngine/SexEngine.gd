extends Reference
class_name SexEngine

var activities:Array = []
var revealedBodyparts: Dictionary = {}
var messages:Array = []

var doms = {}
var subs = {}
var trackedItems = {}
var inventoryToSaveItemsTo:LightInventory = null

var currentLastActivityID = 0

var sexEnded = false

var sexType:SexTypeBase

func initSexType(theSexType, args = {}):
	if(theSexType is String):
		theSexType = GlobalRegistry.createSexType(theSexType)
	if(theSexType == null):
		sexType = GlobalRegistry.createSexType(SexType.DefaultSex)
	else:
		sexType = theSexType
		
	if(sexType != null):
		sexType.setSexEngine(self)
		sexType.initArgs(args)

func getSexTypeID():
	if(sexType == null):
		return SexType.DefaultSex
	return sexType.id

func getSexType():
	return sexType

func initPeople(domIDs, subIDs):
	if(domIDs is String):
		domIDs = [domIDs]
	if(subIDs is String):
		subIDs = [subIDs]
	
	for domID in domIDs:
		var domInfo = SexDomInfo.new()
		domInfo.initInfo(domID, self)
		
		doms[domID] = domInfo
		
	for subID in subIDs:
		var subInfo = SexSubInfo.new()
		subInfo.initInfo(subID, self)
		
		subs[subID] = subInfo
		
	checkExposedBodypartsOnStart()
	checkForHurtDoms()

func checkForHurtDoms():
	for domID in doms:
		var character = GlobalRegistry.getCharacter(domID)
		if(character != null && character.getPainLevel() >= 1.0):
			character.addPain(-1)

func checkExposedBodypartsOnStart():
	var bodypartsToCheck = [BodypartSlot.Breasts, BodypartSlot.Penis, BodypartSlot.Vagina, BodypartSlot.Anus]
	revealedBodyparts.clear()
	
	for domID in doms:
		revealedBodyparts[domID] = {}
		var domInfo = doms[domID]
		var character = domInfo.getChar()
		
		for bodypartID in bodypartsToCheck:
			if(character.hasBodypart(bodypartID) && !character.isBodypartCovered(bodypartID)):
				revealedBodyparts[domID][bodypartID] = true

	for subID in subs:
		revealedBodyparts[subID] = {}
		var subInfo = subs[subID]
		var character = subInfo.getChar()
		
		for bodypartID in bodypartsToCheck:
			if(character.hasBodypart(bodypartID) && !character.isBodypartCovered(bodypartID)):
				revealedBodyparts[subID][bodypartID] = true

func wrapWithSayTag(charID, text):
	if(charID == null || text == null || text == ""):
		return null
	return "[say="+str(charID)+"]"+str(text)+"[/say]"

func getExposedBodypartsNewData():
	var bodypartsToCheck = [BodypartSlot.Breasts, BodypartSlot.Penis, BodypartSlot.Vagina, BodypartSlot.Anus]
	var resultData = null
	
	for domID in doms:
		var domInfo = doms[domID]
		var character = domInfo.getChar()
		
		for bodypartID in bodypartsToCheck:
			if(character.hasBodypart(bodypartID) && !revealedBodyparts[domID].has(bodypartID) && !character.isBodypartCovered(bodypartID)):
				revealedBodyparts[domID][bodypartID] = true
				
				var bodypart = character.getBodypart(bodypartID)
				var randomSubID = RNG.pick(subs)
				
				resultData = combineData(resultData, {
					text = "[b]"+bodypart.getRevealMessage()+"[/b]",
					domSay = wrapWithSayTag(domID, character.getVoice().domReactionWhenUndressing(bodypart, self, domInfo, subs[randomSubID])),
				})

	for subID in subs:
		var subInfo = subs[subID]
		var character = subInfo.getChar()
		
		for bodypartID in bodypartsToCheck:
			if(character.hasBodypart(bodypartID) && !revealedBodyparts[subID].has(bodypartID) && !character.isBodypartCovered(bodypartID)):
				revealedBodyparts[subID][bodypartID] = true
				
				var bodypart = character.getBodypart(bodypartID)
				var randomDomID = RNG.pick(doms)
				var domCharacter = doms[randomDomID].getChar()
				
				resultData = combineData(resultData, {
					text = "[b]"+bodypart.getRevealMessage()+"[/b]",
					domSay = wrapWithSayTag(randomDomID, domCharacter.getVoice().domReactToSubBodypart(bodypart, self, doms[randomDomID], subInfo)),
				})
				
	return resultData

func getExtraData():
	var result = null
	result = combineData(result, getExposedBodypartsNewData())
	return result

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

func processData(data, theDomID, theSubID):
	if(data == null):
		return null
	var newresult = {}
	if(data.has("text")):
		newresult["text"] = processText(data["text"], theDomID, theSubID)
	if(data.has("domSay") && data["domSay"] != null):
		newresult["domSay"] = "[say="+str(theDomID)+"]"+processText(data["domSay"], theDomID, theSubID)+"[/say]"
	if(data.has("subSay") && data["subSay"] != null):
		newresult["subSay"] = "[say="+str(theSubID)+"]"+processText(data["subSay"], theDomID, theSubID)+"[/say]"
	
	return newresult

func sendProcessedData(data):
	if(data == null):
		return
	
	if(data.has("text") && data["text"] != ""):
		messages.append(data["text"])
	if(data.has("domSay")):
		messages.append(data["domSay"])
	if(data.has("subSay")):
		messages.append(data["subSay"])

func combineData(firstData, secondData):
	if(firstData == null && secondData == null):
		return null
	if(firstData == null):
		return secondData
	if(secondData == null):
		return firstData
	
	var texts = []
	var domSays = []
	var subSays = []
	
	for data in [firstData, secondData]:
		if(data.has("text") && data["text"] != null && data["text"] != ""):
			texts.append(data["text"])
		if(data.has("domSay") && data["domSay"] != null):
			domSays.append(data["domSay"])
		if(data.has("subSay") && data["subSay"] != null):
			subSays.append(data["subSay"])
		
	var resultData = {}
	if(texts.size() > 0):
		resultData["text"] = Util.join(texts, " ")
	if(domSays.size() > 0):
		resultData["domSay"] = RNG.pick(domSays)
	if(subSays.size() > 0):
		resultData["subSay"] = RNG.pick(subSays)
	return resultData

func reactToActivityEnd(theactivity):
	var resultData = null
	
	for activity in activities:
		if(activity.hasEnded || activity == theactivity):
			continue
		
		resultData = combineData(resultData, processData(activity.reactActivityEnd(theactivity), activity.domID, activity.subID))
		resultData = combineData(resultData, getExtraData())
	
	return resultData

func startActivity(id, theDomID, theSubID, _args = null, _startedBySub = false):
	var activity = makeActivity(id, theDomID, theSubID)
	if(activity == null):
		return
		
	var startData = processData(activity.startActivity(_args), theDomID, theSubID)
	if(activity.hasEnded):
		startData = combineData(startData, reactToActivityEnd(activity))
	startData = combineData(startData, getExtraData())
	
	sendProcessedData(startData)
	
func switchActivity(oldActivity, newActivityID, _args = []):
	oldActivity.endActivity()
	
	var activity = makeActivity(newActivityID, oldActivity.domID, oldActivity.subID)
	if(activity == null):
		return
	
	var startData = processData(activity.onSwitchFrom(oldActivity, _args), oldActivity.domID, oldActivity.subID)
	if(activity.hasEnded):
		startData = combineData(startData, reactToActivityEnd(activity))
	startData = combineData(startData, getExtraData())
	
	sendProcessedData(startData)

func getActivityWithUniqueID(uniqueID):
	for activity in activities:
		if(activity.uniqueID == uniqueID):
			return activity
	return null

func generateGoals():
	var amountToGenerate = 2
	var generatedAnyGoals = false
	
	for domID in doms:
		if(domID == "pc"):
			continue
		
		var personDomInfo = doms[domID]
		var possibleGoals = []
		
		var breedingGoalsAmount = 0
		var breedingGoals = []
		
		var dom = personDomInfo.getChar()
		
		for subID in subs:
			var personSubInfo = subs[subID]
			var sub = personSubInfo.getChar()
			if(sub.hasPerk(Perk.FertilitySubmissiveAndBreedable)):
				breedingGoalsAmount += 1
			
			var goalsToAdd = dom.getFetishHolder().getGoals(self, sub)
			if(goalsToAdd != null):
				for goal in goalsToAdd:
					if(subID == "pc"):
						if(GM.main.getEncounterSettings().isGoalDisabledForSubPC(goal[0])):
							continue
					
					if(!checkIfThereAreAnyActivitiesThatSupportGoal(goal[0])):
						continue

					var sexGoal:SexGoalBase = GlobalRegistry.getSexGoal(goal[0])
					var goalData = sexGoal.generateData(self, personDomInfo, personSubInfo)
					
					if(sexGoal.isPossible(self, personDomInfo, personSubInfo, goalData) && !sexGoal.isCompleted(self, personDomInfo, personSubInfo, goalData)):
						var goalWeightModifier = GM.main.getEncounterSettings().getGoalWeight(sexGoal.id, sexGoal.getGoalDefaultWeight())
						var goalObject = [[goal[0], sub.getID(), goalData], goal[1] * goalWeightModifier]
						
						possibleGoals.append(goalObject)
						
						if(sexGoal.canLeadToSubsPregnancy(self, personDomInfo, personSubInfo, goalData)):
							breedingGoals.append(goalObject)
							
		if(possibleGoals.size() > 0):
			for _i in range(0, amountToGenerate):
				var randomGoalInfo = RNG.pickWeightedPairs(possibleGoals)
				personDomInfo.goals.append(randomGoalInfo.duplicate(true))
				generatedAnyGoals = true
				
		if(breedingGoalsAmount > 0 && breedingGoals.size() > 0):
			for _i in range(0, breedingGoalsAmount):
				var randomGoalInfo = RNG.pickWeightedPairs(breedingGoals)
				personDomInfo.goals.append(randomGoalInfo.duplicate(true))
			
		print("Goals added to NPC: ", personDomInfo.goals)
	
	if(!isDom("pc") && !generatedAnyGoals):
		messages.append("Dom couldn't decide what to do with the sub, none of their fetishes apply.")
		
		messages.append("[say="+str(RNG.pick(doms))+"]You are a lucky slut.[/say]")
		
	#domInfo.goals.append([SexGoal.Fuck, subID])

func checkIfThereAreAnyActivitiesThatSupportGoal(goalID):
	var allactivities = GlobalRegistry.getSexActivityReferences()
	
	for activityID in allactivities:
		var activity = allactivities[activityID]
		
		var activityGoals = activity.getGoals()
		var supportedSexTypes = activity.getSupportedSexTypes()
		if(activityGoals.has(goalID) && activityGoals[goalID] > 0.0):
			if(areSexTypesSupported(supportedSexTypes)):
				return true
	return false

func areSexTypesSupported(supportedSexTypes):
	var sexTypesSupported = sexType.getSupportedSexActivities()
	for sexTypeSupported in sexTypesSupported:
		if(supportedSexTypes.has(sexTypeSupported) && supportedSexTypes[sexTypeSupported]):
			return true
	return false

func areSexTypesSupportedForActivity(activity):
	var supportedSexTypes = activity.getSupportedSexTypes()
	return areSexTypesSupported(supportedSexTypes)

func hasGoal(thedominfo, goal, thesubinfo):
	for goalInfo in thedominfo.goals:
		if(goalInfo[1] == thesubinfo.charID):
			if(goalInfo[0] == goal):
				return true
			
			var goalObject = GlobalRegistry.getSexGoal(goalInfo[0])
			if(goalObject != null):
				var subgoals = goalObject.getSubGoals(self, thedominfo, thesubinfo, goalInfo[2])
				if(subgoals != null && subgoals.has(goal)):
					return true
			
	return false

func hasGoalScore(thedominfo, goal, thesubinfo):
	for goalInfo in thedominfo.goals:
		if(goalInfo[1] == thesubinfo.charID):
			if(goalInfo[0] == goal):
				return 1.0
			
			var goalObject = GlobalRegistry.getSexGoal(goalInfo[0])
			if(goalObject != null):
				var subgoals = goalObject.getSubGoals(self, thedominfo, thesubinfo, goalInfo[2])
				if(subgoals != null && subgoals.has(goal)):
					return float(subgoals[goal])
			
	return 0.0

func satisfyGoal(thedominfo, goalid, thesubinfo):
	for _i in range(0, thedominfo.goals.size()):
		var goalInfo = thedominfo.goals[_i]
		
		if(goalInfo[0] == goalid && goalInfo[1] == thesubinfo.charID):
			thedominfo.goals.remove(_i)
			print(str(thedominfo.charID)+"'s goal to "+str(goalInfo[0])+" "+str(goalInfo[1])+" was satisfied")
			return true
	return false

func progressGoal(thedominfo, goalid, thesubinfo, args = []):
	for _i in range(0, thedominfo.goals.size()):
		var goalInfo = thedominfo.goals[_i]
		
		if(goalInfo[0] == goalid && goalInfo[1] == thesubinfo.charID):
			var thegoal:SexGoalBase = GlobalRegistry.getSexGoal(goalid)
			thegoal.progressGoal(self, thedominfo, thesubinfo, goalInfo[2], args)
			return true
	return false

func replaceGoal(thedominfo, goalid, thesubinfo, newgoalid, replaceAll = true):
	var atLeastOneReplaced = false
	for goalInfo in thedominfo.goals:
		if(goalInfo[0] == goalid && goalInfo[1] == thesubinfo.charID):
			goalInfo[0] = newgoalid
			print("Replaced goal")
			if(!replaceAll):
				return true
			atLeastOneReplaced = true

	if(atLeastOneReplaced):
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

func checkFailedAndCompletedGoals():
	for domID in doms:
		var domInfo = doms[domID]
		
		for i in range(domInfo.goals.size() - 1, -1, -1):
			var goalInfo = domInfo.goals[i]
			var subInfo = getSubInfo(goalInfo[1])
			
			var sexGoal:SexGoalBase = GlobalRegistry.getSexGoal(goalInfo[0])
			if(sexGoal.isCompleted(self, domInfo, subInfo, goalInfo[2])):
				print("GOAL "+str(sexGoal.getVisibleName())+" "+str(domID)+" "+str(goalInfo[1])+" got completed")
				domInfo.goals.remove(i)
			elif(!sexGoal.isPossible(self, domInfo, subInfo, goalInfo[2])):
				print("GOAL "+str(sexGoal.getVisibleName())+" "+str(domID)+" "+str(goalInfo[1])+" is impossible, removed")
				domInfo.goals.remove(i)

func removeEndedActivities():
	for i in range(activities.size() - 1, -1, -1):
		if(activities[i].hasEnded):
			activities.remove(i)
			
	checkFailedAndCompletedGoals()

func processTurn():
	removeEndedActivities()
	
	if(sexEnded):
		return
	
	var processedDatas = []
	
	for domID in doms:
		var domInfo = doms[domID]
		
		if(domInfo.checkIsDown()):
			processedDatas.append({text=processText("{dom.You} can't continue anymore!", domID, domID)})
			
			for i in range(activities.size() - 1, -1, -1):
				if(activities[i].domID == domID):
					activities.remove(i)
			continue
			
		domInfo.getChar().processSexTurn()
		domInfo.processTurn()
	for subID in subs:
		var subInfo = subs[subID]
		subInfo.getChar().processSexTurn()
		subInfo.processTurn()
	
	for activity in activities:
		if(activity.hasEnded):
			continue
		var processResult = processData(activity.processTurn(), activity.domID, activity.subID)
		if(processResult != null):
			processedDatas.append(processResult)

	var result = null
	for processedData in processedDatas:
		result = combineData(result, processedData)

	result = combineData(result, (getExtraData()))
	
	sendProcessedData(result)
	
	removeEndedActivities()
	
func getSubIDs():
	return subs.keys()
	
func getDomIDs():
	return doms.keys()
	
func hasAnyAcitivites(charID):
	for activity in activities:
		if(activity.hasEnded):
			continue
		if(activity.subID == charID || activity.domID == charID):
			return true
	return false
	
func processAIActions(isDom = true):
	if(sexEnded):
		return
	
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
		
		# if is dom
		if(isDom(personID)):
			var allSexActivities = GlobalRegistry.getSexActivityReferences()
			for possibleSexActivityID in allSexActivities:
				var newSexActivityRef = allSexActivities[possibleSexActivityID]
				newSexActivityRef.sexEngineRef = weakref(self)
				
				if(!areSexTypesSupportedForActivity(newSexActivityRef)):
					continue
				
				for subID in subs:
					newSexActivityRef.initParticipants(personID, subID)
					var subInfo = subs[subID]
					if(!newSexActivityRef.canBeStartedByDom()):
						continue
					
					if(!newSexActivityRef.canStartActivity(self, theinfo, subInfo)):
						continue
					
					var newpossibleActions = newSexActivityRef.getStartActions(self, theinfo, subInfo)
					if(newpossibleActions == null):
						continue
					
					for newaction in newpossibleActions:
						var score = newaction["score"]
						if(score > 0.0):
							possibleActions.append({
								id = "startNewDomActivity",
								activityID = possibleSexActivityID,
								subID = subInfo.charID,
								args = newaction["args"],
								score = score,
								priority = getSafeValueFromDict(newaction, "priority", 0),
							})
							actionsScores.append(score)
				newSexActivityRef.clearSexEngineRefAndParticipants()
		
		if(isSub(personID)):
			var allSexActivities = GlobalRegistry.getSexActivityReferences()
			for possibleSexActivityID in allSexActivities:
				var newSexActivityRef = allSexActivities[possibleSexActivityID]
				newSexActivityRef.sexEngineRef = weakref(self)
				
				if(!areSexTypesSupportedForActivity(newSexActivityRef)):
					continue
				
				for domID in doms:
					newSexActivityRef.initParticipants(domID, personID)
					var domInfo = doms[domID]
					
					if(!newSexActivityRef.canBeStartedBySub()):
						continue
					
					if(!newSexActivityRef.canStartActivity(self, domInfo, theinfo)):
						continue
					
					var newpossibleActions = newSexActivityRef.getStartActions(self, domInfo, theinfo)
					if(newpossibleActions == null):
						continue
					
					for newaction in newpossibleActions:
						var score = newaction["score"]
						if(score > 0.0):
							possibleActions.append({
								id = "startNewSubActivity",
								activityID = possibleSexActivityID,
								domID = domInfo.charID,
								args = newaction["args"],
								score = score,
								priority = getSafeValueFromDict(newaction, "priority", 0),
							})
							actionsScores.append(score)
				newSexActivityRef.clearSexEngineRefAndParticipants()
		
		for activity in activities:
			if(activity.hasEnded):
				continue
			if(activity.domID == personID):
				var domActions = activity.getDomActions()
				if(domActions != null):
					for action in domActions:
						var score = 1.0
						if(action.has("score")):
							score = max(action["score"], 0.0)
							
						possibleActions.append({
							id = "domAction",
							activityID = activity.uniqueID,
							action = action,
							score = score,
							priority = getSafeValueFromDict(action, "priority", 0),
						})
						actionsScores.append(score)
				
			if(activity.subID == personID):
				var subActions = activity.getSubActions()
				if(subActions != null):
					for action in subActions:
						var score = 1.0
						if(action.has("score")):
							score = max(action["score"], 0.0)
						
						possibleActions.append({
							id = "subAction",
							activityID = activity.uniqueID,
							action = action,
							score = score,
							priority = getSafeValueFromDict(action, "priority", 0),
						})
						actionsScores.append(score)

		if(possibleActions.size() > 0 && theinfo.canDoActions()):
			var importantActions = []
			var importantScores = []
			#var importantScore = 0.0
			
			var totalScore = 0.0
			for actionInfo in possibleActions:
				var thescore = actionInfo["score"]
				if(thescore > 0.0):
					totalScore += thescore
				if(actionInfo["priority"] >= 1000):
					importantActions.append(actionInfo)
					importantScores.append(actionInfo["score"])
					#importantScore += actionInfo["score"]
			
			var finalScore = totalScore
			var finalPossibleActions = possibleActions
			var finalActionScores = actionsScores
			if(importantActions.size() > 0):
				finalScore = 1.0#importantScore
				finalPossibleActions = importantActions
				finalActionScores = importantScores
			
			if(RNG.chance(finalScore * 100.0)):
				var pickedFinalAction = RNG.pickWeighted(finalPossibleActions, finalActionScores)
				
				if(pickedFinalAction != null):
					if(pickedFinalAction["id"] == "domAction"):
						var activity = getActivityWithUniqueID(pickedFinalAction["activityID"])
						doDomAction(activity, pickedFinalAction["action"])
					if(pickedFinalAction["id"] == "subAction"):
						var activity = getActivityWithUniqueID(pickedFinalAction["activityID"])
						doSubAction(activity, pickedFinalAction["action"])
					if(pickedFinalAction["id"] == "startNewDomActivity"):
						startActivity(pickedFinalAction["activityID"], personID, pickedFinalAction["subID"], pickedFinalAction["args"])
					if(pickedFinalAction["id"] == "startNewSubActivity"):
						startActivity(pickedFinalAction["activityID"], pickedFinalAction["domID"], personID, pickedFinalAction["args"])

	removeEndedActivities()
	
	if(sexShouldEnd()):
		endSex()

func doDomAction(activity, action):
	var actionResult = processData(activity.doDomAction(action["id"], action), activity.domID, activity.subID)
	if(activity.hasEnded):
		actionResult = combineData(actionResult, reactToActivityEnd(activity))
	actionResult = combineData(actionResult, getExtraData())
	
	sendProcessedData(actionResult)


func doSubAction(activity, action):
	var actionResult = processData(activity.doSubAction(action["id"], action), activity.domID, activity.subID)
	if(activity.hasEnded):
		actionResult = combineData(actionResult, reactToActivityEnd(activity))
	actionResult = combineData(actionResult, getExtraData())
	
	sendProcessedData(actionResult)

func start():
	if(sexType == null):
		initSexType(SexType.DefaultSex)
	
	generateGoals()
	
	if(!isDom("pc")):
		processAIActions(true)
		processAIActions(false)
		processTurn()
	else:
		messages.append("You are a dom so you can choose what you wanna do with the sub.")

func getFinalText():
	if(messages.size() == 0):
		return "Nothing new happened."
	
	return Util.join(messages, "\n\n")

func getActions():
	var result = []
	result.append({
		id = "continue",
		name = "Continue",
		desc = "Just continue doing what you're doing",
		priority = 999,
	})
	
	for activity in activities:
		if(activity.hasEnded):
			continue
		if(activity.domID == "pc" && getDomInfo("pc").canDoActions()):
			var domActions = activity.getDomActions()
			if(domActions != null):
				for action in domActions:
					result.append({
						id = "domAction",
						activityID = activity.uniqueID,
						action = action,
						name = action["name"],
						desc = action["desc"],
						category = getSafeValueFromDict(action, "category", []),
						chance = getSafeValueFromDict(action, "chance"),
						priority = getSafeValueFromDict(action, "priority", 0),
					})
		if(activity.subID == "pc" && getSubInfo("pc").canDoActions()):
			var subActions = activity.getSubActions()
			if(subActions != null):
				for action in subActions:
					result.append({
						id = "subAction",
						activityID = activity.uniqueID,
						action = action,
						name = action["name"],
						desc = action["desc"],
						category = getSafeValueFromDict(action, "category", []),
						chance = getSafeValueFromDict(action, "chance"),
						priority = getSafeValueFromDict(action, "priority", 0),
					})
					
	if(isDom("pc") && getDomInfo("pc").canDoActions()):
		var pctargetID = getPCTarget()
		if(pctargetID != null):
			var allSexActivities = GlobalRegistry.getSexActivityReferences()
			for possibleSexActivityID in allSexActivities:
				var newSexActivityRef = allSexActivities[possibleSexActivityID]
				newSexActivityRef.sexEngineRef = weakref(self)
				newSexActivityRef.initParticipants("pc", pctargetID)
				
				if(!areSexTypesSupportedForActivity(newSexActivityRef)):
					continue
				
				if(!newSexActivityRef.canBeStartedByDom()):
					continue
				
				if(!newSexActivityRef.canStartActivity(self, getDomInfo("pc"), getSubInfo(pctargetID))):
					continue
				
				var possibleActions = newSexActivityRef.getStartActions(self, getDomInfo("pc"), getSubInfo(pctargetID))
				if(possibleActions == null):
					continue
				
				for newaction in possibleActions:
					result.append({
						id = "startNewDomActivity",
						activityID = possibleSexActivityID,
						name = newaction["name"],
						category = newaction["category"],
						subID = pctargetID,
						args = newaction["args"],
						chance = getSafeValueFromDict(newaction, "chance"),
						desc = getSafeValueFromDict(newaction, "desc", "Start new activity"),
						priority = getSafeValueFromDict(newaction, "priority", 0),
					})
				newSexActivityRef.clearSexEngineRefAndParticipants()
					
	if(isSub("pc") && getSubInfo("pc").canDoActions()):
		var pctargetID = getPCTarget()
		if(pctargetID != null):
			var allSexActivities = GlobalRegistry.getSexActivityReferences()
			for possibleSexActivityID in allSexActivities:
				var newSexActivityRef = allSexActivities[possibleSexActivityID]
				newSexActivityRef.sexEngineRef = weakref(self)
				newSexActivityRef.initParticipants(pctargetID, "pc")
				
				if(!areSexTypesSupportedForActivity(newSexActivityRef)):
					continue
				
				if(!newSexActivityRef.canBeStartedBySub()):
					continue
				
				if(!newSexActivityRef.canStartActivity(self, getDomInfo(pctargetID), getSubInfo("pc"))):
					continue
				
				var possibleActions = newSexActivityRef.getStartActions(self, getDomInfo(pctargetID), getSubInfo("pc"))
				if(possibleActions == null):
					continue
				
				for newaction in possibleActions:
					result.append({
						id = "startNewSubActivity",
						activityID = possibleSexActivityID,
						name = newaction["name"],
						category = newaction["category"],
						domID = pctargetID,
						args = newaction["args"],
						chance = getSafeValueFromDict(newaction, "chance"),
						desc = getSafeValueFromDict(newaction, "desc", "Start new activity"),
						priority = getSafeValueFromDict(newaction, "priority", 0),
					})
				newSexActivityRef.clearSexEngineRefAndParticipants()
				
	var importantActions = []
	for actionInfo in result:
		if(actionInfo.has("priority") && actionInfo["priority"] >= 1000):
			importantActions.append(actionInfo)
		
	if(importantActions.size() > 0):
#		importantActions.insert(0, {
#			id = "continue",
#			name = "Continue",
#			desc = "Just continue doing what you're doing",
#			priority = 99999,
#		})
		
		importantActions.sort_custom(self, "sortActionsByPriority")
		return importantActions
	
	result.sort_custom(self, "sortActionsByPriority")
	return result

func sortActionsByPriority(a, b):
	if a["priority"] <= b["priority"]:
		return false
	return true

func getSafeValueFromDict(thedict:Dictionary, keyid:String, defaultValue = null):
	if(thedict.has(keyid)):
		return thedict[keyid]
	return defaultValue

func getPCTarget():
	if(isDom("pc")):
		return subs.keys()[0]
	if(isSub("pc")):
		return doms.keys()[0]
	
	return null

func processScene():
	messages.clear()
	processAIActions(true)
	processTurn()
	processAIActions(false)

func doAction(_actionInfo):
	if(_actionInfo["id"] == "continue"):
		messages.clear()
		processAIActions(true)
		processTurn()
		processAIActions(false)
	if(_actionInfo["id"] == "domAction"):
		messages.clear()
		var activity = getActivityWithUniqueID(_actionInfo["activityID"])
		doDomAction(activity, _actionInfo["action"])
		processAIActions(true)
		processTurn()
		processAIActions(false)
	if(_actionInfo["id"] == "subAction"):
		messages.clear()
		var activity = getActivityWithUniqueID(_actionInfo["activityID"])
		doSubAction(activity, _actionInfo["action"])
		processAIActions(true)
		processTurn()
		processAIActions(false)
	if(_actionInfo["id"] == "startNewDomActivity"):
		messages.clear()
		startActivity(_actionInfo["activityID"], "pc", _actionInfo["subID"], _actionInfo["args"])
		processAIActions(true)
		processTurn()
		processAIActions(false)
	if(_actionInfo["id"] == "startNewSubActivity"):
		messages.clear()
		startActivity(_actionInfo["activityID"], _actionInfo["domID"], "pc", _actionInfo["args"])
		processAIActions(true)
		processTurn()
		processAIActions(false)

func hasTag(charID, tag):
	for activity in activities:
		if(activity.hasEnded):
			continue
		
		if(activity.domID == charID):
			if(tag in activity.getDomTags()):
				return true
		if(activity.subID == charID):
			if(tag in activity.getSubTags()):
				return true
	return false

func hasActivity(id, thedomID, thesubID):
	for activity in activities:
		if(activity.hasEnded):
			continue
		
		if(activity.id != id):
			continue
		
		if(activity.domID == thedomID && activity.subID == thesubID):
			return true
	return false

func sexShouldEnd():
	if(isDom("pc") && getDomInfo("pc").canDoActions()):
		return false
		
	for domID in doms:
		var domInfo = doms[domID]
		
		if(domInfo.canDoActions() && domInfo.hasGoals()):
			return false
	
	return true
	#return false

func endSex():
	if(sexEnded):
		return
	
	sexEnded = true
	var texts = ["The sex scene has ended!"]
	
	for activity in activities:
		activity.endActivity()
	
	if(trackedItems.has("pc")):
		for trackedItem in trackedItems["pc"]:
			var character:BaseCharacter = GlobalRegistry.getCharacter(trackedItem[0])
			var item:ItemBase = character.getInventory().getItemByUniqueID(trackedItem[1])
			if(item == null):
				continue
			character.getInventory().removeItem(item)
			character.getInventory().removeEquippedItem(item)
			var restraintData:RestraintData = item.getRestraintData()
			if(restraintData != null):
				restraintData.onStruggleRemoval()
			
			GM.pc.getInventory().addItem(item)
			GM.main.addMessage("You recovered "+item.getAStackName())
	trackedItems.erase("pc")
	
	for domID in doms:
		var domInfo = doms[domID]
		
		# Lets us loot used condoms
		var theCondom = domInfo.getChar().getWornCondom()
		if(theCondom != null):
			if(theCondom.getFluids() != null):
				if(!theCondom.getFluids().isEmpty()):
					theCondom.destroyMe()
					saveCondomToLootIfPerk(theCondom)
			
		domInfo.getChar().afterSexEnded(domInfo)
		
		var sexEndInfo = domInfo.getSexEndInfo()
		if(sexEndInfo.size() > 0):
			texts.append(domInfo.getChar().getName()+":")
			texts.append(Util.join(sexEndInfo, "\n"))

	for subID in subs:
		var subInfo = subs[subID]
		
		# Lets us loot used condoms
		var theCondom = subInfo.getChar().getWornCondom()
		if(theCondom != null):
			if(theCondom.getFluids() != null):
				if(!theCondom.getFluids().isEmpty()):
					theCondom.destroyMe()
					saveItemToLoot(theCondom)
		
		subInfo.getChar().afterSexEnded(subInfo)

		var sexEndInfo = subInfo.getSexEndInfo()
		if(sexEndInfo.size() > 0):
			texts.append(subInfo.getChar().getName()+":")
			texts.append(Util.join(sexEndInfo, "\n"))

	messages.append(Util.join(texts, "\n"))

func hasSexEnded():
	return sexEnded

func getBestAnimation():
	var foundPriority = -999
	var foundAnimInfo = null
	
	var hasPlayer = false
	if(isSub("pc") || isDom("pc")):
		hasPlayer = true
	
	for activity in activities:
		if(activity.hasEnded):
			continue
		var animInfo = activity.getAnimation()
		if(animInfo == null):
			continue
		
		if(hasPlayer):
			if(activity.subID == "pc" || activity.domID == "pc"):
				if(activity.getAnimationPriority() > foundPriority || foundAnimInfo == null):
					foundAnimInfo = animInfo
					foundPriority = activity.getAnimationPriority()
		else:
			if(activity.getAnimationPriority() > foundPriority || foundAnimInfo == null):
				foundAnimInfo = animInfo
				foundPriority = activity.getAnimationPriority()
	
	if(foundAnimInfo != null):
		return foundAnimInfo
	return sexType.getDefaultAnimation()

func playAnimation():
	var animInfo = getBestAnimation()
	
	if(animInfo == null):
		return
	
	if(animInfo.size() > 2):
		GM.main.playAnimation(animInfo[0], animInfo[1], animInfo[2])
	else:
		GM.main.playAnimation(animInfo[0], animInfo[1])

func getStartActivityScore(activityID, domInfo, subInfo):
	var newSexActivityRef = GlobalRegistry.getSexActivityReference(activityID)
	if(newSexActivityRef == null):
		return -1.0
	newSexActivityRef.sexEngineRef = weakref(self)
	newSexActivityRef.initParticipants(domInfo.charID, subInfo.charID)
	
	if(!newSexActivityRef.canStartActivity(self, domInfo, subInfo)):
		newSexActivityRef.clearSexEngineRefAndParticipants()
		return -1.0
	
	var newpossibleActions = newSexActivityRef.getStartActions(self, domInfo, subInfo)
	if(newpossibleActions == null):
		newSexActivityRef.clearSexEngineRefAndParticipants()
		return -1.0
	
	var maxScore = 0.0
	for newaction in newpossibleActions:
		var score = newaction["score"]
		
		maxScore = max(maxScore, score)
	
	newSexActivityRef.clearSexEngineRefAndParticipants()
	return maxScore

func addTrackedGear(ownerID, whoWearsItID, itemUniqueID):
	if(!trackedItems.has(ownerID)):
		trackedItems[ownerID] = []
	
	trackedItems[ownerID].append([whoWearsItID, itemUniqueID])

func checkGearIsFromPC(whoWearsItID, itemUniqueID):
	if(!trackedItems.has("pc")):
		return false
	
	for trackedData in trackedItems["pc"]:
		if(trackedData[0] == whoWearsItID && trackedData[1] == itemUniqueID):
			return true
	return false

func getCurrentActivitiesMaxSubOrgasmHandlePriority(domID, subID):
	var maxResult = -1
	for activity in activities:
		if(activity.domID == domID && activity.subID == subID):
			var thePriority = activity.getSubOrgasmHandlePriority()
			if(thePriority > maxResult):
				maxResult = thePriority
	return maxResult

func getCurrentActivitiesMaxDomOrgasmHandlePriority(domID, subID):
	var maxResult = -1
	for activity in activities:
		if(activity.domID == domID && activity.subID == subID):
			var thePriority = activity.getDomOrgasmHandlePriority()
			if(thePriority > maxResult):
				maxResult = thePriority
	return maxResult

func setInventoryToUse(newInv):
	inventoryToSaveItemsTo = newInv

func saveCondomToLootIfPerk(theItem):
	if(GM.pc.hasPerk(Perk.CumKeepCondoms)):
		saveItemToLoot(theItem)

func saveItemToLoot(theItem):
	if(inventoryToSaveItemsTo != null):
		inventoryToSaveItemsTo.addItem(theItem)

func saveData():
	var data = {
		"revealedBodyparts": revealedBodyparts,
		"messages": messages,
		"trackedItems": trackedItems,
		"currentLastActivityID": currentLastActivityID,
		"sexEnded": sexEnded,
	}
	if(sexType != null):
		data["sexTypeID"] = sexType.id
		data["sexTypeData"] = sexType.saveData()
	
	var domsData = {}
	for domID in doms:
		domsData[domID] = doms[domID].saveData()
	data["doms"] = domsData

	var subsData = {}
	for subID in subs:
		subsData[subID] = subs[subID].saveData()
	data["subs"] = subsData
	
	var activityData = []
	for activity in activities:
		activityData.append({
			"id": activity.id,
			"data": activity.saveData(),
		})
	data["activities"] = activityData

	return data
	
func loadData(data):
	revealedBodyparts = SAVE.loadVar(data, "revealedBodyparts", {})
	messages = SAVE.loadVar(data, "messages", [])
	trackedItems = SAVE.loadVar(data, "trackedItems", {})
	currentLastActivityID = SAVE.loadVar(data, "currentLastActivityID", 0)
	sexEnded = SAVE.loadVar(data, "sexEnded", false)
	
	var sexTypeID = SAVE.loadVar(data, "sexTypeID", SexType.DefaultSex)
	var theSexType = GlobalRegistry.createSexType(sexTypeID)
	if(theSexType == null):
		theSexType = GlobalRegistry.createSexType(SexType.DefaultSex)
	sexType = theSexType
	sexType.setSexEngine(self)
	sexType.loadData(SAVE.loadVar(data, "sexTypeData", {}))
	
	doms.clear()
	subs.clear()
	activities.clear()
	
	var domsData = SAVE.loadVar(data, "doms", {})
	for domID in domsData:
		var domInfo = SexDomInfo.new()
		domInfo.initInfo(domID, self)
		domInfo.loadData(domsData[domID])
		
		doms[domID] = domInfo

	var subsData = SAVE.loadVar(data, "subs", {})
	for subID in subsData:
		var subInfo = SexSubInfo.new()
		subInfo.initInfo(subID, self)
		subInfo.loadData(subsData[subID])
		
		subs[subID] = subInfo
	
	var activityData = SAVE.loadVar(data, "activities", [])
	for activityInfo in activityData:
		var activityID = SAVE.loadVar(activityInfo, "id", "")
		
		var activityObject = GlobalRegistry.createSexActivity(activityID)
		if(activityObject == null):
			continue
		
		activityObject.sexEngineRef = weakref(self)
		activityObject.loadData(SAVE.loadVar(activityInfo, "data", {}))
		
		activities.append(activityObject)
