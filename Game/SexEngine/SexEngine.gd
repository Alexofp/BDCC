extends Reference
class_name SexEngine

var activities:Array = []
var revealedBodyparts: Dictionary = {}
var messages:Array = []

var doms:Dictionary = {}
var subs:Dictionary = {}
var trackedItems:Dictionary = {}
var inventoryToSaveItemsTo:LightInventory = null

var currentLastActivityID:int = 0

# Result stuff
var sexEnded:bool = false
var sexResult:Dictionary = {}

# Configuration
var sexType:SexTypeBase

var disabledGoals:Dictionary = {}
var bondageDisabled:bool = false
var subMustGoUnconscious:bool = false

var pcTarget:String = ""
var outputRaw:Array = []
const OUTPUT_TEXT = 0
const OUTPUT_SAY = 1
const OUTPUT_SEPARATOR = 2

func clearOutputRaw():
	outputRaw.clear()

func addOutputRaw(_rawEntry:Array):
	outputRaw.append(_rawEntry)

func addTextRaw(_text:String):
	if(_text.empty()):
		return
	addOutputRaw([OUTPUT_TEXT, _text])

func talkText(_charID:String, _text:String):
	if(_text.empty()):
		return
	addOutputRaw([OUTPUT_SAY, _charID, _text])

func addOutputSeparator():
	outputRaw.append([OUTPUT_SEPARATOR])

func getFinalOutput() -> String:
	var result:String = ""
	
	var savedTag:int = OUTPUT_TEXT
	#var savedCharID:String = ""
	
	for outputEntry in outputRaw:
		var isEmpt:bool = result.empty()
		var theTag:int = outputEntry[0]
		
		if(theTag == OUTPUT_TEXT):
			if(savedTag == OUTPUT_TEXT):
				result += (" " if !isEmpt else "")+outputEntry[1]
			else:
				result += ("\n\n" if !isEmpt else "")+outputEntry[1]
		elif(theTag == OUTPUT_SAY):
			result += ("\n\n" if !isEmpt else "")+"[say="+outputEntry[1]+"]"+outputEntry[2]+"[/say]"
		
		savedTag = theTag
	
	if(result == ""):
		return "Nothing new happened."
	return result

func initSexType(theSexType, args:Dictionary = {}):
	if(theSexType is String):
		theSexType = GlobalRegistry.createSexType(theSexType)
	if(theSexType == null):
		sexType = GlobalRegistry.createSexType(SexType.DefaultSex)
	else:
		sexType = theSexType
		
	if(args.has("unconscious") && args["unconscious"]):
		for subID in subs:
			getSubInfo(subID).getChar().addConsciousness(-1.0)
		
	if(args.has("disabledGoals")):
		disabledGoals = args["disabledGoals"]
		
	if(args.has("bondageDisabled")):
		bondageDisabled = args["bondageDisabled"]
	if(args.has("subMustGoUnconscious")):
		subMustGoUnconscious = args["subMustGoUnconscious"]
		
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

func checkNewExposedBodyparts():
	var bodypartsToCheck = [BodypartSlot.Breasts, BodypartSlot.Penis, BodypartSlot.Vagina, BodypartSlot.Anus]
	
	for domID in doms:
		var domInfo = doms[domID]
		var character = domInfo.getChar()
		
		for bodypartID in bodypartsToCheck:
			if(character.hasBodypart(bodypartID) && !revealedBodyparts[domID].has(bodypartID) && !character.isBodypartCovered(bodypartID)):
				revealedBodyparts[domID][bodypartID] = true
				
				var bodypart = character.getBodypart(bodypartID)
				var randomSubID:String = RNG.pick(subs)
				
				addTextRaw("[b]"+bodypart.getRevealMessage()+"[/b]")
				talkText(domID, character.getVoice().domReactionWhenUndressing(bodypart, self, domInfo, subs[randomSubID]))
#
#				resultData = combineData(resultData, {
#					text = "[b]"+bodypart.getRevealMessage()+"[/b]",
#					domSay = wrapWithSayTag(domID, character.getVoice().domReactionWhenUndressing(bodypart, self, domInfo, subs[randomSubID])),
#				})

	for subID in subs:
		var subInfo = subs[subID]
		var character = subInfo.getChar()
		
		for bodypartID in bodypartsToCheck:
			if(character.hasBodypart(bodypartID) && !revealedBodyparts[subID].has(bodypartID) && !character.isBodypartCovered(bodypartID)):
				revealedBodyparts[subID][bodypartID] = true
				
				var bodypart = character.getBodypart(bodypartID)
				var randomDomID:String = RNG.pick(doms)
				var domCharacter = doms[randomDomID].getChar()
				
				addTextRaw("[b]"+bodypart.getRevealMessage()+"[/b]")
				talkText(randomDomID, domCharacter.getVoice().domReactToSubBodypart(bodypart, self, doms[randomDomID], subInfo))
#				resultData = combineData(resultData, {
#					text = "[b]"+bodypart.getRevealMessage()+"[/b]",
#					domSay = wrapWithSayTag(randomDomID, domCharacter.getVoice().domReactToSubBodypart(bodypart, self, doms[randomDomID], subInfo)),
#				})

func checkExtra():
	checkNewExposedBodyparts()

func checkExtraLessImportant():
	for domID in doms:
		doms[domID].getExtraOutputData(true, self)
	for subID in subs:
		subs[subID].getExtraOutputData(false, self)

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

func processText(thetext:String, theDomID:String, theSubID:String):
	return GM.ui.processString(thetext, {dom=theDomID, sub=theSubID})

func addText(thetext:String, theDomID:String, theSubID:String):
	#messages.append(processText(thetext, theDomID, theSubID))
	addTextRaw(processText(thetext, theDomID, theSubID))

#func processData(data, theDomID, theSubID):
#	if(data == null):
#		return null
#	var newresult = {}
#	if(data.has("text")):
#		newresult["text"] = processText(data["text"], theDomID, theSubID)
#	if(data.has("domSay") && data["domSay"] != null && getDomInfo(theDomID).canTalk()):
#		newresult["domSay"] = "[say="+str(theDomID)+"]"+processText(data["domSay"], theDomID, theSubID)+"[/say]"
#	if(data.has("subSay") && data["subSay"] != null && getSubInfo(theSubID).canTalk()):
#		newresult["subSay"] = "[say="+str(theSubID)+"]"+processText(data["subSay"], theDomID, theSubID)+"[/say]"
#
#	return newresult

#func sendProcessedData(data):
#	if(data == null):
#		return
#
#	if(data.has("text") && data["text"] != ""):
#		messages.append(data["text"])
#	if(data.has("domSay")):
#		messages.append(data["domSay"])
#	if(data.has("subSay")):
#		messages.append(data["subSay"])

#func combineData(firstData, secondData):
#	if(firstData == null && secondData == null):
#		return null
#	if(firstData == null):
#		return secondData
#	if(secondData == null):
#		return firstData
#
#	var texts = []
#	var domSays = []
#	var subSays = []
#
#	for data in [firstData, secondData]:
#		if(data.has("text") && data["text"] != null && data["text"] != ""):
#			texts.append(data["text"])
#		if(data.has("domSay") && data["domSay"] != null && data["domSay"] != ""):
#			domSays.append(data["domSay"])
#		if(data.has("subSay") && data["subSay"] != null && data["subSay"] != ""):
#			subSays.append(data["subSay"])
#
#	var resultData = {}
#	if(texts.size() > 0):
#		resultData["text"] = Util.join(texts, " ")
#	if(domSays.size() > 0):
#		resultData["domSay"] = RNG.pick(domSays)
#	if(subSays.size() > 0):
#		resultData["subSay"] = RNG.pick(subSays)
#	return resultData

func reactToActivityEnd(theactivity):
	for activity in activities:
		if(activity.hasEnded || activity == theactivity):
			continue
		
		activity.reactActivityEnd(theactivity)
		checkExtra()

func startActivity(id, theDomID, theSubID, _args = null):
	var activity = makeActivity(id, theDomID, theSubID)
	if(activity == null):
		return
		
	activity.startActivity(_args)
	if(activity.hasEnded):
		reactToActivityEnd(activity)
	checkExtra()

#TODO: MAKE THIS WORK PROPERLY. All doms/subs should be copied
func switchActivity(oldActivity, newActivityID, _args = []):
	oldActivity.endActivity()
	
	var activity = makeActivity(newActivityID, oldActivity.domID, oldActivity.subID)
	if(activity == null):
		return
	
	activity.onSwitchFrom(oldActivity, _args)
	if(activity.hasEnded):
		reactToActivityEnd(activity)
	checkExtra()

func getActivityWithUniqueID(uniqueID:int):
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
					if(disabledGoals.has(goal[0])):
						continue
					if(subID == "pc"):
						if(GM.main.getEncounterSettings().isGoalDisabledForSubPC(goal[0])):
							continue
					
					if(!checkIfThereAreAnyActivitiesThatSupportGoal(goal[0])):
						continue

					var sexGoal:SexGoalBase = GlobalRegistry.getSexGoal(goal[0])
					var goalData = sexGoal.generateData(self, personDomInfo, personSubInfo)
					
					if(sexGoal.isPossible(self, personDomInfo, personSubInfo, goalData) && !sexGoal.isCompleted(self, personDomInfo, personSubInfo, goalData)):
						var goalWeightModifier = GM.main.getEncounterSettings().getGoalWeight(sexGoal.id, sexGoal.getGoalDefaultWeight())
						goalWeightModifier *= sub.getSexGoalSubWeightModifier(sexGoal.id, domID)
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
		personDomInfo.afterGoalsAssigned()
	
	if(!isDom("pc") && !generatedAnyGoals):
		messages.append("Dom couldn't decide what to do with the sub, none of their fetishes apply.")
		
		messages.append("[say="+str(RNG.pick(doms))+"]You are a lucky slut.[/say]")
		
	#domInfo.goals.append([SexGoal.Fuck, subID])

func doFastSex():
	var newResult:Dictionary = {}
	
	
	newResult["doms"] = {}
	newResult["subs"] = {}
	
	for subID in subs:
		GM.main.updateCharacterUntilNow(subID)
		GM.main.startUpdatingCharacter(subID)
	
	for domID in doms:
		GM.main.updateCharacterUntilNow(domID)
		GM.main.startUpdatingCharacter(domID)
		
		#var dom = personDomInfo.getChar()
		var domInfo = doms[domID]
		
		for goalInfo in domInfo.goals:
			var goalID = goalInfo[0]
			var goalSubID = goalInfo[1]
			var goalData = goalInfo[2]
			
			var sexGoal:SexGoalBase = GlobalRegistry.getSexGoal(goalID)
			if(sexGoal != null):
				sexGoal.doFastSex(self, domInfo, getSubInfo(goalSubID), goalData)
				
	for domID in doms:
		newResult["doms"][domID] = {
			"timesCame": RNG.randi_range(0, 3),
			"averageLust": RNG.randf_rangeX2(0.0, 1.0),
			"satisfaction": RNG.randf_rangeX2(0.0, 1.0),
		}
	for subID in subs:
		newResult["subs"][subID] = {
			"timesCame": RNG.randi_range(0, 3),
			"averageLust": RNG.randf_rangeX2(0.0, 1.0),
			"averageResistance": RNG.randf_rangeX2(0.0, 1.0),
			"averageFear": RNG.randf_rangeX2(0.0, 1.0),
			"satisfaction": RNG.randf_rangeX2(0.0, 1.0),
			"isUnconscious": RNG.chance(5),
		}
	
	return newResult

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
	if(goal == SexGoal.SubMakeUnconscious && subMustGoUnconscious):
		return true
	
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

func removeGoal(thedominfo, goalid, thesubinfo):
	for _i in range(0, thedominfo.goals.size()):
		var goalInfo = thedominfo.goals[_i]
		
		if(goalInfo[0] == goalid && goalInfo[1] == thesubinfo.charID):
			thedominfo.goals.remove(_i)
			return true
	return false

func satisfyGoal(thedominfo, goalid, thesubinfo):
	if(removeGoal(thedominfo, goalid, thesubinfo)):
		print(str(thedominfo.charID)+"'s goal to "+str(goalid)+" "+str(thesubinfo.charID)+" was satisfied")
		thedominfo.onGoalSatisfied(thedominfo, goalid, thesubinfo)
		thesubinfo.onGoalSatisfied(thedominfo, goalid, thesubinfo)
		return true
	return false

func failGoal(thedominfo, goalid, thesubinfo):
	if(removeGoal(thedominfo, goalid, thesubinfo)):
		print(str(thedominfo.charID)+"'s goal to "+str(goalid)+" "+str(thesubinfo.charID)+" was failed")
		thedominfo.onGoalFailed(thedominfo, goalid, thesubinfo)
		thesubinfo.onGoalFailed(thedominfo, goalid, thesubinfo)
		return true
	return false

func progressGoalGeneric(thedominfo, goalid, thesubinfo, args = []):
	for _i in range(0, thedominfo.goals.size()):
		var goalInfo = thedominfo.goals[_i]
		
		if(goalInfo[0] == goalid && goalInfo[1] == thesubinfo.charID):
			var thegoal:SexGoalBase = GlobalRegistry.getSexGoal(goalid)
			thegoal.progressGoal(self, thedominfo, thesubinfo, goalInfo[2], args)
			return true
	return false

func progressGoal(thedominfo, goalid, thesubinfo, args = []):
	if(progressGoalGeneric(thedominfo, goalid, thesubinfo, args)):
		thedominfo.onGoalSatisfied(thedominfo, goalid, thesubinfo, 0.5)
		thesubinfo.onGoalSatisfied(thedominfo, goalid, thesubinfo, 0.5)
		return true
	return false

func progressGoalFailed(thedominfo, goalid, thesubinfo, args = []):
	if(progressGoalGeneric(thedominfo, goalid, thesubinfo, args)):
		thedominfo.onGoalFailed(thedominfo, goalid, thesubinfo, 0.5)
		thesubinfo.onGoalFailed(thedominfo, goalid, thesubinfo, 0.5)
		return true
	return false

func replaceGoal(thedominfo, goalid, thesubinfo, newgoalid, replaceAll = true):
	var atLeastOneReplaced = false
	for goalInfo in thedominfo.goals:
		if(goalInfo[0] == goalid && goalInfo[1] == thesubinfo.charID):
			goalInfo[0] = newgoalid
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
	checkImpossibleActivities()
	for i in range(activities.size() - 1, -1, -1):
		if(activities[i].hasEnded):
			activities.remove(i)
			
	checkFailedAndCompletedGoals()

func processTurn():
	removeEndedActivities()
	
	if(sexEnded):
		return
	
	for domID in doms:
		var domInfo:SexDomInfo = doms[domID]
		
		if(domInfo.checkIsDown()):
			addText("{dom.You} can't continue anymore!", domID, domID)
			#processedDatas.append({text=processText("{dom.You} can't continue anymore!", domID, domID)})
			
			#for i in range(activities.size() - 1, -1, -1):
			#	if(activities[i].domID == domID):
			#		activities.remove(i)
			endSex()
			continue
			
		domInfo.getChar().processSexTurnContex({sexEngine=self,isDom=true})
		domInfo.processTurn()
	for subID in subs:
		var subInfo:SexSubInfo = subs[subID]
		subInfo.getChar().processSexTurnContex({sexEngine=self,isDom=false})
		subInfo.processTurn()
	
	for activity in activities:
		if(activity.hasEnded):
			continue
		activity.processTurnFinal()

	checkExtra()
	checkExtraLessImportant()
	
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


func processAIActions(isDom:bool = true, playerIsHypnotized:bool = false):
	if(sexEnded):
		return
	
	if(sexShouldEnd()):
		endSex()
		return
	
	var peopleToCheck:Dictionary = {}
	if(isDom):
		peopleToCheck = doms
	else:
		peopleToCheck = subs
	
	for personID in peopleToCheck:
		var theinfo:SexInfoBase = peopleToCheck[personID]
		if(!theinfo.canDoActions()):
			continue
		if(personID == "pc" && !playerIsHypnotized):
			continue
		
		var actionsScores:Array= []
		var possibleActions:Array = getActionsForCharID(personID)
		for actionEntry in possibleActions:
			actionsScores.append(actionEntry["score"])
		
		if(possibleActions.empty()):
			continue
		
		var importantActions:Array = []
		var importantScores:Array = []
		
		var totalScore:float = 0.0
		for actionInfo in possibleActions:
			var thescore:float = actionInfo["score"]
			if(thescore > 0.0):
				totalScore += thescore
			if(actionInfo["priority"] >= 1000):
				importantActions.append(actionInfo)
				importantScores.append(actionInfo["score"])
		
		var finalPossibleActions = possibleActions
		var finalActionScores = actionsScores
		if(importantActions.size() > 0):
			totalScore = 1.0
			finalPossibleActions = importantActions
			finalActionScores = importantScores
		
		if(!RNG.chance(totalScore * 100.0) || finalPossibleActions.empty()):
			continue
			
		var pickedFinalAction:Dictionary = RNG.pickWeighted(finalPossibleActions, finalActionScores)
		
		if(pickedFinalAction["id"] == "action"):
			var activity = getActivityWithUniqueID(pickedFinalAction["activityID"])
			if(!activity):
				continue
			doActivityAction(personID, activity, pickedFinalAction["action"])
		if(pickedFinalAction["id"] == "start"):
			if(isDom(personID)):
				startActivity(pickedFinalAction["activityID"], personID, pickedFinalAction["target"], pickedFinalAction["args"])
			elif(isSub(personID)):
				startActivity(pickedFinalAction["activityID"], pickedFinalAction["target"], personID, pickedFinalAction["args"])
			
	removeEndedActivities()
	
	#if(sexShouldEnd()):
	#	endSex()

func doActivityAction(_whoID:String, activity, action:Dictionary):
	activity.doActionForCharID(_whoID, action)
	if(activity.hasEnded):
		reactToActivityEnd(activity)
#
#func doDomAction(activity, action):
#	var actionResult = processData(activity.doDomActionFinal(action["id"], action), activity.domID, activity.subID)
#	if(activity.hasEnded):
#		actionResult = combineData(actionResult, reactToActivityEnd(activity))
#	actionResult = combineData(actionResult, getExtraData())
#
#	sendProcessedData(actionResult)

#
#func doSubAction(activity, action):
#	var actionResult = processData(activity.doSubActionFinal(action["id"], action), activity.domID, activity.subID)
#	if(activity.hasEnded):
#		actionResult = combineData(actionResult, reactToActivityEnd(activity))
#	actionResult = combineData(actionResult, getExtraData())
#
#	sendProcessedData(actionResult)

func start():
	if(sexType == null):
		initSexType(SexType.DefaultSex)
	
	generateGoals()
	
	for domID in doms:
		var character = GlobalRegistry.getCharacter(domID)
		character.onSexStarted({sexEngine=self,isDom=true})
	for subID in subs:
		var character = GlobalRegistry.getCharacter(subID)
		character.onSexStarted({sexEngine=self,isDom=false})
	
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

func getActionsForCharID(_charID:String, isForMenu:bool = false) -> Array:
	var result:Array = []
	
	var _isPC:bool = (_charID == "pc")
	var _isSub:bool = isSub(_charID)
	var _isDom:bool = isDom(_charID)
	var _charInfo:SexInfoBase
	if(_isSub):
		_charInfo = getSubInfo(_charID)
	if(_isDom):
		_charInfo = getDomInfo(_charID)
	
	if(isForMenu && _isPC && _isSub && _charInfo && _charInfo.canDoActions()):
		var forcedObedienceLevel = GM.pc.getForcedObedienceLevel()
		if(RNG.chance(forcedObedienceLevel*100.0)):
			result.append({
				id = "obey",
				name = "OBEY",
				desc = "You have lost control of your body..",
				priority = 999,
			})
			return result
	
	if(_isPC && isForMenu):
		result.append({
			id = "continue",
			name = "Continue",
			desc = "Just continue doing what you're doing",
			priority = 999,
		})
	
	if(!_charInfo): # We're not participating in this sex
		return result
	
	var canCharDoActions:bool = _charInfo.canDoActions()
	
	if(canCharDoActions):
		for activity in activities:
			if(activity.hasEnded):
				continue
			var activityActions:Array = activity.getActionsForCharID(_charID)
			for actionEntry in activityActions:
				result.append({
					id = "action",
					activityID = activity.uniqueID,
					name = actionEntry["name"] if actionEntry.has("name") else "UNNAMMED ACTION",
					desc = actionEntry["desc"] if actionEntry.has("desc") else "Do this action.",
					score = actionEntry["score"] if actionEntry.has("score") else 0.0,
					chance = actionEntry["chance"] if actionEntry.has("chance") else null,
					category = actionEntry["category"] if actionEntry.has("category") else [],
					priority = actionEntry["priority"] if actionEntry.has("priority") else 0,
					action = actionEntry,
				})
	
	var peopleToCheck:Array = []
	if(isSub(_charID)):
		if(_isPC && isForMenu):
			var thePCTarget:String = getPCTarget()
			peopleToCheck = [thePCTarget] if thePCTarget != "" else []
		else:
			peopleToCheck = doms.keys()
	if(isDom(_charID)):
		if(_isPC && isForMenu):
			var thePCTarget:String = getPCTarget()
			peopleToCheck = [thePCTarget] if thePCTarget != "" else []
		else:
			peopleToCheck = subs.keys()
	
	var allSexActivities:Dictionary = GlobalRegistry.getSexActivityReferences()
	
	for otherCharID in peopleToCheck:
		var _subInfo:SexSubInfo
		var _domInfo:SexDomInfo
		var otherCharInfo:SexInfoBase
		if(_isSub):
			otherCharInfo = getDomInfo(otherCharID)
			_subInfo = _charInfo
			_domInfo = otherCharInfo
		if(_isDom):
			otherCharInfo = getSubInfo(otherCharID)
			_subInfo = otherCharInfo
			_domInfo = _charInfo
		if(!otherCharInfo):
			continue
		
		for possibleSexActivityID in allSexActivities:
			var newSexActivityRef = allSexActivities[possibleSexActivityID]
			
			if(!areSexTypesSupportedForActivity(newSexActivityRef)):
				continue
			if(_isDom && !newSexActivityRef.canBeStartedByDom()):
				continue
			if(_isSub && !newSexActivityRef.canBeStartedBySub()):
				continue
			if(!newSexActivityRef.canStartActivity(self, _domInfo, _subInfo)):
				continue
			var possibleActions:Array = newSexActivityRef.getStartActionsFinal(self, _domInfo, _subInfo)
			if(possibleActions.empty()):
				continue
			for actionEntry in possibleActions:
				result.append({
					id = "start",
					activityID = possibleSexActivityID,
					name = actionEntry["name"] if actionEntry.has("name") else "Unnammed activity",
					category = actionEntry["category"] if actionEntry.has("category") else [],
					target = otherCharID,
					args = actionEntry["args"] if actionEntry.has("args") else [],
					chance = actionEntry["chance"] if actionEntry.has("chance") else null,
					desc = actionEntry["desc"] if actionEntry.has("desc") else "Start new activity.",
					priority = actionEntry["category"] if actionEntry.has("priority") else 0,
					score = actionEntry["score"] if actionEntry.has("score") else 0.0,
				})
	
	var importantActions:Array = []
	for actionInfo in result:
		if(actionInfo.has("priority") && actionInfo["priority"] >= 1000):
			importantActions.append(actionInfo)
		
	if(importantActions.size() > 0):
		if(_isPC && isForMenu):
			importantActions.sort_custom(self, "sortActionsByPriority")
		return importantActions
	
	if(_isPC && isForMenu):
		result.sort_custom(self, "sortActionsByPriority")
	return result

func getActions():
	var result = []
	
	if(isSub("pc") && getSubInfo("pc").canDoActions()):
		var forcedObedienceLevel = GM.pc.getForcedObedienceLevel()
		if(RNG.chance(forcedObedienceLevel*100.0)):
			result.append({
				id = "obey",
				name = "OBEY",
				desc = "You have lost control of your body..",
				priority = 999,
			})
			return result
	
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
			var domActions = activity.getDomActionsFinal()
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
			var subActions = activity.getSubActionsFinal()
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

func getPCTarget() -> String:
	if(isDom("pc")):
		if(pcTarget == "" || !subs.has(pcTarget)):
			pcTarget = subs.keys()[0] if !subs.empty() else ""
		return pcTarget
	if(isSub("pc")):
		if(pcTarget == "" || !doms.has(pcTarget)):
			pcTarget = doms.keys()[0] if !doms.empty() else ""
		return pcTarget
	
	return ""

func switchPCTarget():
	var theTarget:String = getPCTarget()
	if(isDom("pc")):
		var subKeys:Array = subs.keys()
		var theIndx:int = subKeys.find(theTarget)
		if(theIndx < 0):
			return
		theIndx += 1
		if(theIndx >= subKeys.size()):
			theIndx = 0
		pcTarget = subKeys[theIndx]
	if(isSub("pc")):
		var domKeys:Array = doms.keys()
		var theIndx:int = domKeys.find(theTarget)
		if(theIndx < 0):
			return
		theIndx += 1
		if(theIndx >= domKeys.size()):
			theIndx = 0
		pcTarget = domKeys[theIndx]

func canSwitchPCTarget() -> bool:
	if(isDom("pc")):
		if(subs.size() >= 2):
			return true
	if(isSub("pc")):
		if(doms.size() >= 2):
			return true
	return false

func processScene():
	clearOutputRaw()
	processAIActions(true)
	processTurn()
	processAIActions(false)

func doAction(_actionInfo:Dictionary):
	if(_actionInfo["id"] == "obey"):
		clearOutputRaw()
		if(isSub("pc")):
			getSubInfo("pc").setObeyMode(true)
		processAIActions(true, true)
		processTurn()
		processAIActions(false, true)
		if(isSub("pc")):
			getSubInfo("pc").setObeyMode(false)
	if(_actionInfo["id"] == "continue"):
		clearOutputRaw()
		processAIActions(true)
		processTurn()
		processAIActions(false)
	if(_actionInfo["id"] == "action"):
		clearOutputRaw()
		var activity = getActivityWithUniqueID(_actionInfo["activityID"])
		if(activity):
			doActivityAction("pc", activity, _actionInfo["action"])
		processAIActions(true)
		processTurn()
		processAIActions(false)
	if(_actionInfo["id"] == "start"):
		clearOutputRaw()
		if(isDom("pc")):
			startActivity(_actionInfo["activityID"], "pc", _actionInfo["target"], _actionInfo["args"])
		else:
			startActivity(_actionInfo["activityID"], _actionInfo["target"], "pc", _actionInfo["args"])
		processAIActions(true)
		processTurn()
		processAIActions(false)

func hasTag(charID:String, tag:int) -> bool:
	for activity in activities:
		if(activity.hasEnded):
			continue
		
		var theIndx:int = activity.convertCharIDToIndx(charID)
		if(theIndx > -99):
			if(tag in activity.getTags(theIndx)):
				return true

	return false

func hasActivity(id:String, thedomID:String, thesubID:String) -> bool:
	var theDomInfo:SexDomInfo = getDomInfo(thedomID)
	var theSubInfo:SexSubInfo = getSubInfo(thesubID)
	if(!theDomInfo || !theSubInfo):
		return false
	for activity in activities:
		if(activity.hasEnded):
			continue
		
		if(activity.id != id):
			continue
		
		if(activity.doms.has(theDomInfo) && activity.subs.has(theSubInfo)):
			return true
	return false

func sexShouldEnd():
	if(isDom("pc") && getDomInfo("pc").canDoActions()):
		return false
		
	if(subMustGoUnconscious):
		var hasAnyHealthySubs:bool = false
		for subID in subs:
			var subInfo = subs[subID]
			if(!subInfo.isUnconscious()):
				hasAnyHealthySubs = true
		if(!hasAnyHealthySubs):
			return true
		
	var hasAnyHealthyDoms:bool = false
	for domID in doms:
		var domInfo = doms[domID]
		
		if(domInfo.canDoActions()):
			hasAnyHealthyDoms = true
		
		if(domInfo.canDoActions() && domInfo.hasGoals()):
			return false
	
	if(activities.size() <= 0 || !hasAnyHealthyDoms):
		return true
	else:
		return false

func getRecovarableItemsAfterSex():
	var result = []
	if(trackedItems.has("pc")):
		for trackedItem in trackedItems["pc"]:
			var character:BaseCharacter = GlobalRegistry.getCharacter(trackedItem[0])
			var item:ItemBase = character.getInventory().getItemByUniqueID(trackedItem[1])
			if(item == null):
				continue
			if(!item.isPersistent() && !item.alwaysRecoveredAfterSex()):
				result.append(item)
	return result

func canKeepItemsAfterSex():
	return getRecovarableItemsAfterSex().size() > 0

func keepItemsAfterSex(onlyAlwaysKept = false):
	if(trackedItems.has("pc")):
		var newPCTracked = []
		
		for trackedItem in trackedItems["pc"]:
			var character:BaseCharacter = GlobalRegistry.getCharacter(trackedItem[0])
			var item:ItemBase = character.getInventory().getItemByUniqueID(trackedItem[1])
			if(item == null):
				continue
			if(!item.isPersistent() && (!onlyAlwaysKept || (onlyAlwaysKept && item.alwaysRecoveredAfterSex()))):
				character.getInventory().removeItem(item)
				character.getInventory().removeEquippedItem(item)
				var restraintData:RestraintData = item.getRestraintData()
				if(restraintData != null):
					restraintData.onStruggleRemoval()
			
				GM.pc.getInventory().addItem(item)
				GM.main.addMessage("You recovered "+item.getAStackName())
			else:
				newPCTracked.append(trackedItem)
				
		trackedItems["pc"] = newPCTracked

func endSex():
	if(sexEnded):
		return
	sexResult = {
		subs = {},
		doms = {},
	}
	for domID in doms:
		var domInfo = doms[domID]
		sexResult["doms"][domID] = {
			"timesCame": domInfo.timesCame,
			"averageLust": domInfo.getAverageLust(),
			"satisfaction": domInfo.calculateFinalSatisfaction(),
		}
	for subID in subs:
		var subInfo = subs[subID]
		sexResult["subs"][subID] = {
			"timesCame": subInfo.timesCame,
			"averageLust": subInfo.getAverageLust(),
			"averageResistance": subInfo.getAverageResistance(),
			"averageFear": subInfo.getAverageFear(),
			"satisfaction": subInfo.calculateFinalSatisfaction(),
			"isUnconscious": subInfo.isUnconscious(),
		}
	
	sexEnded = true
	var texts = ["The sex scene has ended!"]
	
	for activity in activities:
		activity.endActivity()
	
	keepItemsAfterSex(true)
	
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
		domInfo.getChar().onSexEnded({sexEngine=self,isDom=true,sexFullResult=sexResult,sexResult=sexResult["doms"][domID]})
		
		var sexEndInfo = domInfo.getSexEndInfo()
		if(sexEndInfo.size() > 0):
			texts.append(domInfo.getChar().getName()+":")
			texts.append(Util.join(sexEndInfo, "\n"))


	for subID in subs:
		var subInfo = subs[subID]
		
		var sexEndInfo = subInfo.getSexEndInfo()
		if(sexEndInfo.size() > 0):
			texts.append(subInfo.getChar().getName()+":")
			texts.append(Util.join(sexEndInfo, "\n"))
		
		# Lets us loot used condoms
		var theCondom = subInfo.getChar().getWornCondom()
		if(theCondom != null):
			if(theCondom.getFluids() != null):
				if(!theCondom.getFluids().isEmpty()):
					theCondom.destroyMe()
					saveItemToLoot(theCondom)
		
		subInfo.getChar().afterSexEnded(subInfo)
		subInfo.getChar().onSexEnded({sexEngine=self,isDom=false,sexFullResult=sexResult,sexResult=sexResult["subs"][subID]})

	messages.append(Util.join(texts, "\n"))

func hasSexEnded():
	return sexEnded

func getBestAnimation():
	var foundPriority = -999
	var foundAnimInfo = null
	var foundActivity = null
	
	#var hasPlayer:bool = false
	#if(isSub("pc") || isDom("pc")):
	#	hasPlayer = true
	
	for activity in activities:
		if(activity.hasEnded):
			continue
		var animInfo = activity.getAnimation()
		if(animInfo == null):
			continue
		
#		if(hasPlayer):
#			if(activity.subID == "pc" || activity.domID == "pc"):
#				if(activity.getAnimationPriority() > foundPriority || foundAnimInfo == null):
#					foundAnimInfo = animInfo
#					foundPriority = activity.getAnimationPriority()
#					foundActivity = activity
#		else:
		if(activity.getAnimationPriority() > foundPriority || foundAnimInfo == null):
			foundAnimInfo = animInfo
			foundPriority = activity.getAnimationPriority()
			foundActivity = activity
	
	if(foundAnimInfo != null):
		if(foundAnimInfo.size() > 2):
			var extraInfoDict:Dictionary = foundAnimInfo[2]
			
			var fieldsToCheck:Array = ["pc", "npc", "npc2"]
			for npcField in fieldsToCheck:
				if(extraInfoDict.has(npcField)):
					if(extraInfoDict[npcField] is int):
						extraInfoDict[npcField] = foundActivity.getDomOrSubID(extraInfoDict[npcField])
					
					var theCharID:String = extraInfoDict[npcField]
					var theInfo:SexInfoBase
					if(subs.has(theCharID)):
						theInfo = subs[theCharID]
					if(doms.has(theCharID)):
						theInfo = doms[theCharID]
					if(theInfo && theInfo.didJustCame()):
						extraInfoDict[npcField+"Cum"] = true

		return foundAnimInfo
	return sexType.getDefaultAnimation()

func resetJustCame():
	for subID in subs:
		subs[subID].resetJustCame()
	for domID in doms:
		doms[domID].resetJustCame()

func playAnimation():
	var animInfo = getBestAnimation()
	
	if(animInfo == null):
		return
	
	if(animInfo.size() > 2):
		GM.main.playAnimation(animInfo[0], animInfo[1], animInfo[2])
	else:
		GM.main.playAnimation(animInfo[0], animInfo[1])
	resetJustCame()

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
	
	for entry in trackedItems[ownerID]:
		if(entry[1] == itemUniqueID && entry[0] == whoWearsItID):
			return
	
	trackedItems[ownerID].append([whoWearsItID, itemUniqueID])

func removeTrackedGear(ownerID, whoWearsItID, itemUniqueID):
	if(!trackedItems.has(ownerID)):
		return false
	
	for entry in trackedItems[ownerID]:
		if(entry[1] == itemUniqueID && entry[0] == whoWearsItID):
			trackedItems[ownerID].erase(entry)
			return true
	return false

func checkGearIsFromPC(whoWearsItID, itemUniqueID):
	if(!trackedItems.has("pc")):
		return false
	
	for trackedData in trackedItems["pc"]:
		if(trackedData[0] == whoWearsItID && trackedData[1] == itemUniqueID):
			return true
	return false

func getMaxOrgasmHandlePriority(_charID:String) -> int:
	var maxResult:int = -1
	for activity in activities:
		var _indx:int = activity.convertCharIDToIndx(_charID)
		if(_indx > -99):
			var newPrio:int = activity.getOrgasmHandlePriority(_indx)
			if(newPrio > maxResult):
				maxResult = newPrio
	return maxResult

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

func getSexResult():
	return sexResult

func isBondageDisabled() -> bool:
	return bondageDisabled || (GM.main.getEncounterSettings().getGoalWeight(SexGoal.TieUp) <= 0.0)

func hasWallsNearby() -> bool:
	var locToCheck:String = ""
	if(doms.has("pc") || subs.has("pc")):
		locToCheck = GM.pc.getLocation()
	elif(GM.main != null):
		for domID in doms:
			if(GM.main.IS.hasPawn(domID)):
				locToCheck = GM.main.IS.getPawn(domID).getLocation()
		if(locToCheck == ""):
			for subID in subs:
				if(GM.main.IS.hasPawn(subID)):
					locToCheck = GM.main.IS.getPawn(subID).getLocation()
	
	if(locToCheck == ""):
		return true
	if(GM.world != null && GM.world.hasWallsNearby(locToCheck)):
		return true
	
	return false

func checkImpossibleActivities():
	var activityAmount:int = activities.size()
	for _i in range(activityAmount):
		var acIndex:int = activityAmount - _i - 1
		var theActivity = activities[acIndex]
		
		if(theActivity.isActivityImpossibleShouldStop()):
			theActivity.endActivity()

func saveData():
	var data = {
		"revealedBodyparts": revealedBodyparts,
		"messages": messages,
		"trackedItems": trackedItems,
		"currentLastActivityID": currentLastActivityID,
		"sexEnded": sexEnded,
		"sexResult": sexResult,
		"bondageDisabled": bondageDisabled,
		"subMustGoUnconscious": subMustGoUnconscious,
		"outputRaw": outputRaw,
		"pcTarget": pcTarget,
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
	sexResult = SAVE.loadVar(data, "sexResult", {})
	bondageDisabled = SAVE.loadVar(data, "bondageDisabled", false)
	subMustGoUnconscious = SAVE.loadVar(data, "subMustGoUnconscious", false)
	outputRaw = SAVE.loadVar(data, "outputRaw", [])
	pcTarget = SAVE.loadVar(data, "pcTarget", "")
	
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
