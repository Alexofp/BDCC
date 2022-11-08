extends Reference
class_name SexEngine

var activities:Array = []
var revealedBodyparts: Dictionary = {}
var messages:Array = []

var doms = {}
var subs = {}

var currentLastActivityID = 0

var sexEnded = false

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
		
	checkExposedBodypartsOnStart()

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

func subOrgasmData():
	var result = null
	
	for subID in subs:
		var subInfo = subs[subID]
		if(subInfo.isReadyToCum()):
			# add a check to see if some activity wants to handle this event instead here
			
			subInfo.getChar().cumOnFloor()
			subInfo.cum()
			var text = RNG.pick([
				"A [b]powerful orgasm[/b] overwhelms {sub.your} body.",
				"[b]{sub.You} {sub.youVerb('cum')}[/b] hard!",
			])
			
			if(subInfo.getChar().hasPenis()):
				text += RNG.pick([
					" {sub.YourHis} "+RNG.pick(["cock", "dick", "member"])+" wastes its load!",
					" {sub.YourHis} "+RNG.pick(["cock", "dick", "member"])+" shoots out a load!",
					" {sub.YourHis} "+RNG.pick(["cock", "dick", "member"])+" throbs while wasting its seed!",
				])
			if(subInfo.getChar().hasVagina()):
				text += RNG.pick([
					" {sub.YourHis} "+RNG.pick(["pussy", "slit"])+" gets tight!",
					" {sub.YourHis} "+RNG.pick(["pussy", "slit"])+" clenches and twitches!",
					" {sub.YourHis} "+RNG.pick(["pussy", "slit"])+" pulsates irregularly!",
					" {sub.YourHis} "+RNG.pick(["pussy", "slit"])+" squirts!",
				])
			
			result = combineData(result, processData({
				text = text,
			}, RNG.pick(doms), subID))

	return result

func getExtraData():
	var result = null
	result = combineData(result, getExposedBodypartsNewData())
	result = combineData(result, subOrgasmData())
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
	
	if(data.has("text")):
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
		if(data.has("text")):
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
					var sexGoal:SexGoalBase = GlobalRegistry.getSexGoal(goal[0])
					if(sexGoal.isPossible(self, dom, sub) && !sexGoal.isCompleted(self, dom, sub)):
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
		var domChar = domInfo.getChar()
		
		for i in range(domInfo.goals.size() - 1, -1, -1):
			var subChar = getSubInfo(domInfo.goals[i][1]).getChar()
			
			var sexGoal:SexGoalBase = GlobalRegistry.getSexGoal(domInfo.goals[i][0])
			if(sexGoal.isCompleted(self, domChar, subChar)):
				print("GOAL "+str(sexGoal.getVisibleName())+" "+str(domID)+" "+str(domInfo.goals[i][1])+" got completed")
				domInfo.goals.remove(i)
			elif(!sexGoal.isPossible(self, domChar, subChar)):
				print("GOAL "+str(sexGoal.getVisibleName())+" "+str(domID)+" "+str(domInfo.goals[i][1])+" is impossible, removed")
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
			
		domInfo.processTurn()
	for subID in subs:
		var subInfo = subs[subID]
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
		if(hasAnyAcitivites(personID)):
			possibleActions = [{id="donothing"}]
			actionsScores = [0.01]
		
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
							})
							actionsScores.append(score)
		
		
		for activity in activities:
			if(activity.hasEnded):
				continue
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

		if(possibleActions.size() > 0 && theinfo.canDoActions()):
			var totalScore = 0.0
			for thescore in actionsScores:
				if(thescore > 0.0):
					totalScore += thescore
			
			if(RNG.chance(totalScore * 100.0)):
				var pickedFinalAction = RNG.pickWeighted(possibleActions, actionsScores)
				
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
	if(!isDom("pc")):
		processAIActions(true)
		processAIActions(false)
		processTurn()

func getFinalText():
	return Util.join(messages, "\n\n")

func getActions():
	var result = []
	result.append({
		id = "continue",
		name = "Continue",
		desc = "Just continue doing what you're doing",
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
						chance = getSafeValueFromDict(action, "chance"),
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
						chance = getSafeValueFromDict(action, "chance"),
					})
					
	if(isDom("pc") && getDomInfo("pc").canDoActions()):
		var pctargetID = getPCTarget()
		if(pctargetID != null):
			var allSexActivities = GlobalRegistry.getSexActivityReferences()
			for possibleSexActivityID in allSexActivities:
				var newSexActivityRef = allSexActivities[possibleSexActivityID]
				
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
					})
					
	if(isSub("pc") && getSubInfo("pc").canDoActions()):
		var pctargetID = getPCTarget()
		if(pctargetID != null):
			var allSexActivities = GlobalRegistry.getSexActivityReferences()
			for possibleSexActivityID in allSexActivities:
				var newSexActivityRef = allSexActivities[possibleSexActivityID]
				
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
					})
	
	return result

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
		processAIActions(false)
		processTurn()
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
		processAIActions(false)
		processTurn()

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
	
	for domID in doms:
		var domInfo = doms[domID]
		
		domInfo.getChar().afterSexEnded(domInfo)
		
		var sexEndInfo = domInfo.getSexEndInfo()
		if(sexEndInfo.size() > 0):
			texts.append(domInfo.getChar().getName()+":")
			texts.append(Util.join(sexEndInfo, "\n"))

	for subID in subs:
		var subInfo = subs[subID]
		
		subInfo.getChar().afterSexEnded(subInfo)

		var sexEndInfo = subInfo.getSexEndInfo()
		if(sexEndInfo.size() > 0):
			texts.append(subInfo.getChar().getName()+":")
			texts.append(Util.join(sexEndInfo, "\n"))

	messages.append(Util.join(texts, "\n"))

func hasSexEnded():
	return sexEnded

func getBestAnimation():
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
				return animInfo
		else:
			return animInfo
	
	#return null
	if(subs.size() == 0 || doms.size() == 0):
		return null
	
	return [StageScene.Duo, "stand", {pc=subs.keys()[0], npc=doms.keys()[0]}]

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
	
	if(!newSexActivityRef.canStartActivity(self, domInfo, subInfo)):
		return -1.0
	
	var newpossibleActions = newSexActivityRef.getStartActions(self, domInfo, subInfo)
	if(newpossibleActions == null):
		return -1.0
	
	var maxScore = 0.0
	for newaction in newpossibleActions:
		var score = newaction["score"]
		
		maxScore = max(maxScore, score)
	
	return maxScore
