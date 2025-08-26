extends Reference
class_name SexEngine

var activities:Array = []
var revealedBodyparts: Dictionary = {}

var doms:Dictionary = {}
var subs:Dictionary = {}
var trackedItems:Dictionary = {}
var inventoryToSaveItemsTo:LightInventory = null
var participatedDoms:Dictionary = {}

var currentLastActivityID:int = 0

# Result stuff
var sexEnded:bool = false
var sexResult:SexEngineResult = SexEngineResult.new()

# Configuration
var sexType:SexTypeBase

var disabledGoals:Dictionary = {}
var bondageDisabled:bool = false
var subMustGoUnconscious:bool = false
var noDynamicJoiners:bool = false

var pcAllowsDomAutonomy:bool = false
var pcAllowsDynJoiners:bool = false

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
		
	if(args.has(SexMod.SubsStartUnconscious) && args[SexMod.SubsStartUnconscious]):
		for subID in subs:
			getSubInfo(subID).getChar().addConsciousness(-1.0)
		
	if(args.has(SexMod.DisabledGoals)):
		disabledGoals = args[SexMod.DisabledGoals]
		
	if(args.has(SexMod.BondageDisabled)):
		bondageDisabled = args[SexMod.BondageDisabled]
	if(args.has(SexMod.SubMustGoUnconscious)):
		subMustGoUnconscious = args[SexMod.SubMustGoUnconscious]
	if(args.has(SexMod.DisableDynamicJoiners)):
		noDynamicJoiners = args[SexMod.DisableDynamicJoiners]
		
	if(sexType != null):
		sexType.setSexEngine(self)
		sexType.initArgs(args)

func getSexTypeID() -> String:
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

const bodypartsToCheckReveal = [BodypartSlot.Breasts, BodypartSlot.Penis, BodypartSlot.Vagina, BodypartSlot.Anus]

func checkRevealedFor(_charID:String):
	var character = GlobalRegistry.getCharacter(_charID)
	if(!character):
		return
	if(!revealedBodyparts.has(_charID)):
		revealedBodyparts[_charID] = {}
	for bodypartID in bodypartsToCheckReveal:
		if(character.hasBodypart(bodypartID) && !character.isBodypartCovered(bodypartID)):
			revealedBodyparts[_charID][bodypartID] = true

func checkExposedBodypartsOnStart():
	revealedBodyparts.clear()
	
	for domID in doms:
		checkRevealedFor(domID)

	for subID in subs:
		checkRevealedFor(subID)

func checkNewExposedBodyparts():
	for domID in doms:
		var domInfo = doms[domID]
		var character = domInfo.getChar()
		var bodypartsToReactTo:Array = []
		
		for bodypartID in bodypartsToCheckReveal:
			if(character.hasBodypart(bodypartID) && !revealedBodyparts[domID].has(bodypartID) && !character.isBodypartCovered(bodypartID)):
				var bodypart = character.getBodypart(bodypartID)
				bodypartsToReactTo.append(bodypart)
				revealedBodyparts[domID][bodypartID] = true
				domInfo.fetishAffect(Fetish.Exhibitionism, 1.0*subs.size())
				addTextRaw("[b]"+bodypart.getRevealMessage()+"[/b]")
				
		for bodypart in bodypartsToReactTo:
			var randomSubID:String = RNG.pick(subs)
			talkText(domID, SexVoice.domReactionWhenUndressing(bodypart, self, domInfo, subs[randomSubID]))
		
	for subID in subs:
		var subInfo = subs[subID]
		var character = subInfo.getChar()
		var bodypartsToReactTo:Array = []
		
		for bodypartID in bodypartsToCheckReveal:
			if(character.hasBodypart(bodypartID) && !revealedBodyparts[subID].has(bodypartID) && !character.isBodypartCovered(bodypartID)):
				var bodypart = character.getBodypart(bodypartID)
				bodypartsToReactTo.append(bodypart)
				revealedBodyparts[subID][bodypartID] = true
				subInfo.fetishAffect(Fetish.Exhibitionism, 1.0*doms.size())
				addTextRaw("[b]"+bodypart.getRevealMessage()+"[/b]")
				
		for bodypart in bodypartsToReactTo:
			var randomDomID:String = RNG.pick(doms)
			#var domCharacter = doms[randomDomID].getChar()
			talkText(randomDomID, SexVoice.domReactToSubBodypart(bodypart, self, doms[randomDomID], subInfo))

func checkExtra():
	checkNewExposedBodyparts()

func checkExtraLessImportant():
	for domID in doms:
		doms[domID].getExtraOutputData(true, self)
	for subID in subs:
		subs[subID].getExtraOutputData(false, self)

func makeActivity(id:String, theDomID, theSubID):
	var activityObject = makeActivityEmpty(id)
	if(activityObject == null):
		return null
	activityObject.initParticipants(theDomID, theSubID)
	return activityObject

func makeActivityEmpty(id:String):
	var activityObject = GlobalRegistry.createSexActivity(id)
	if(activityObject == null):
		return null
	activityObject.uniqueID = currentLastActivityID
	activityObject.sexEngineRef = weakref(self)
	activities.append(activityObject)
	currentLastActivityID += 1
	return activityObject

func processText(thetext:String, theDomID:String, theSubID:String):
	return GM.ui.processString(thetext, {dom=theDomID, sub=theSubID})

func addText(thetext:String, theDomID:String, theSubID:String):
	addTextRaw(processText(thetext, theDomID, theSubID))

func reactToActivityEnd(theactivity):
	for activity in activities:
		if(activity.hasEnded || activity == theactivity):
			continue
		
		activity.reactActivityEnd(theactivity)
	checkExtra()
	reconsiderPCTarget()

func startActivity(id, theDomID, theSubID, _args = null):
	var activity = makeActivity(id, theDomID, theSubID)
	if(activity == null):
		return
		
	activity.startActivity(_args)
	if(activity.hasEnded):
		reactToActivityEnd(activity)
	checkExtra()
	reconsiderPCTarget()

func switchActivity(oldActivity, newActivityID, _args = []):
	var theDomIDs:Array = []
	for theDomInfo in oldActivity.doms:
		theDomIDs.append(theDomInfo.getCharID())
	var theSubIDs:Array = []
	for theSubInfo in oldActivity.subs:
		theSubIDs.append(theSubInfo.getCharID())
	oldActivity.endActivity()
	
	var activity = makeActivityEmpty(newActivityID)
	if(activity == null):
		return
	activity.initParticipants(theDomIDs, theSubIDs)
	
	activity.onSwitchFrom(oldActivity, _args)
	if(activity.hasEnded):
		reactToActivityEnd(activity)
	checkExtra()
	reconsiderPCTarget()

func getActivityWithUniqueID(uniqueID:int):
	for activity in activities:
		if(activity.uniqueID == uniqueID):
			return activity
	return null

func generateGoalsFor(domID:String, amountToGenerate:int) -> bool:
	if(domID == "pc"):
		return false
	
	var generatedAnyGoals:bool = false
	var personDomInfo:SexDomInfo = doms[domID]
	var possibleGoals:Array = []
	
	var breedingGoalsAmount:int = 0
	var breedingGoals:Array = []
	
	var dom:BaseCharacter = personDomInfo.getChar()
	
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
		
	Log.printVerbose("Goals added to NPC: "+str(personDomInfo.goals))
	personDomInfo.afterGoalsAssigned()
	return generatedAnyGoals

func generateGoals():
	var amountToGenerate = 2 + (subs.size()-1)
	var generatedAnyGoals:bool = false
	
	for domID in doms:
		if(generateGoalsFor(domID, amountToGenerate)):
			generatedAnyGoals = true

	if(!isDom("pc") && !generatedAnyGoals && !doms.empty()):
		addTextRaw("Dom couldn't decide what to do with the sub, none of their fetishes apply.")
		talkText(RNG.pick(doms), "You are a lucky slut.")

func checkIfDomsNeedMoreGoals():
	if(!shouldDomsKeepGeneratingTasks()):
		return
	if(sexEnded):
		return
	for domID in doms:
		var domInfo:SexDomInfo = doms[domID]
		if(!domInfo.hasGoals() && !domInfo.isDynamicJoiner()):
			generateGoalsFor(domID, 2)

func doFastSex() -> SexEngineResult:
	var newResult:SexEngineResult = SexEngineResult.new()
	
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
		var newDomResult:SexEngineResultDom = SexEngineResultDom.new()
		newDomResult.doFastSex(self, doms[domID])
		newResult.doms[domID] = newDomResult
	for subID in subs:
		var newSubResult:SexEngineResultSub = SexEngineResultSub.new()
		newSubResult.doFastSex(self, subs[subID])
		newResult.subs[subID] = newSubResult
	
	return newResult

func checkIfThereAreAnyActivitiesThatSupportGoal(goalID) -> bool:
	var allactivities = GlobalRegistry.getSexActivityReferences()
	
	for activityID in allactivities:
		var activity = allactivities[activityID]
		
		var activityGoals = activity.getGoals()
		var supportedSexTypes = activity.getSupportedSexTypes()
		if(activityGoals.has(goalID) && activityGoals[goalID] > 0.0):
			if(areSexTypesSupported(supportedSexTypes)):
				return true
	return false

func areSexTypesSupported(supportedSexTypes) -> bool:
	var sexTypesSupported = sexType.getSupportedSexActivities()
	for sexTypeSupported in sexTypesSupported:
		if(supportedSexTypes.has(sexTypeSupported) && supportedSexTypes[sexTypeSupported]):
			return true
	return false

func areSexTypesSupportedForActivity(activity) -> bool:
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

func getCharInfo(_theID:String) -> SexInfoBase:
	if(doms.has(_theID)):
		return doms[_theID]
	if(subs.has(_theID)):
		return subs[_theID]
	return null

func isDom(charID) -> bool:
	if(!doms.has(charID)):
		return false
	return true

func isSub(charID) -> bool:
	if(!subs.has(charID)):
		return false
	return true

func isInvolved(_charID:String) -> bool:
	return isDom(_charID) || isSub(_charID)

func checkFailedAndCompletedGoals():
	for domID in doms:
		var domInfo = doms[domID]
		
		for i in range(domInfo.goals.size() - 1, -1, -1):
			var goalInfo = domInfo.goals[i]
			var subInfo = getSubInfo(goalInfo[1])
			
			var sexGoal:SexGoalBase = GlobalRegistry.getSexGoal(goalInfo[0])
			if(sexGoal.isCompleted(self, domInfo, subInfo, goalInfo[2])):
				Log.printVerbose("GOAL "+str(sexGoal.getVisibleName())+" "+str(domID)+" "+str(goalInfo[1])+" got completed")
				domInfo.goals.remove(i)
			elif(!sexGoal.isPossible(self, domInfo, subInfo, goalInfo[2])):
				Log.printVerbose("GOAL "+str(sexGoal.getVisibleName())+" "+str(domID)+" "+str(goalInfo[1])+" is impossible, removed")
				domInfo.goals.remove(i)

func removeEndedActivities():
	checkImpossibleActivities()
	for i in range(activities.size() - 1, -1, -1):
		if(activities[i].hasEnded):
			activities.remove(i)
			
	checkFailedAndCompletedGoals()

func stopActivitiesThatInvolveCharID(_charID:String):
	for i in range(activities.size() - 1, -1, -1):
		if(activities[i].isInvolved(_charID)):
			activities.remove(i)

func processTurn():
	removeEndedActivities()
	
	if(sexEnded):
		return
	
	for domID in doms:
		var domInfo:SexDomInfo = doms[domID]
		
		if(domInfo.checkIsDown()):
			addText("{dom.You} can't continue anymore!", domID, domID)
			
			stopActivitiesThatInvolveCharID(domID)
			#endSex()
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
	
	checkIfDomsNeedMoreGoals()
	
	removeEndedActivities()
	
func getSubs() -> Dictionary:
	return subs
	
func getDoms() -> Dictionary:
	return doms

func shouldPauseDomActions() -> bool:
	if(!isDom("pc") || !getDomInfo("pc").canDoActions()):
		return false
	return !pcAllowsDomAutonomy

func canChooseDomAutonomy() -> bool:
	return isDom("pc") && getDomInfo("pc").canDoActions() && doms.size() > 1

func shouldDomsKeepGeneratingTasks() -> bool:
	return canChooseDomAutonomy()

func isDomAutonomyEnabled() -> bool:
	return pcAllowsDomAutonomy

func toggleDomAutonomy():
	pcAllowsDomAutonomy = !pcAllowsDomAutonomy

func processAIActions(isDom:bool = true, processPlayerToo:bool = false):
	if(sexEnded):
		return
	
	if(sexShouldEnd()):
		endSex()
		return
	
	if(isDom && shouldPauseDomActions()):
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
		if(personID == "pc" && !processPlayerToo):
			continue
		
		var actionsScores:Array= []
		var possibleActions:Array = getActionsForCharID(personID)
		for actionEntry in possibleActions:
			actionsScores.append(max(actionEntry["score"], 0.0))
		
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
		if(pickedFinalAction["id"] == "joinAction"):
			var activity = getActivityWithUniqueID(pickedFinalAction["activityID"])
			if(!activity):
				continue
			doJoinAction(personID, activity, pickedFinalAction["args"] if pickedFinalAction.has("args") else [])
		if(pickedFinalAction["id"] == "dynamicLeave"):
			removeDynamicJoiner(personID)
		
	removeEndedActivities()
	
	#if(sexShouldEnd()):
	#	endSex()

func doActivityAction(_whoID:String, activity, action:Dictionary):
	activity.doActionForCharID(_whoID, action)
	if(activity.hasEnded):
		reactToActivityEnd(activity)

func doJoinAction(_whoID:String, activity, _args):
	activity.doJoinAction(getCharInfo(_whoID), _args)
	if(activity.hasEnded):
		reactToActivityEnd(activity)

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
		addTextRaw("You are a dom so you can choose what you wanna do with the sub.")

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
	if(!canCharDoActions): # Can't do anything, we can only continue
		return result
	
	if(canCharDoActions):
		if(!_isPC && !isForMenu && _isDom && (_charInfo is SexDomInfo)):
			var _theDomInfo:SexDomInfo = _charInfo
			if(_theDomInfo.isDynamicJoiner() && !_theDomInfo.hasGoals()):
				result.append({
					id = "dynamicLeave",
					name = "Leave",
					desc = "Leave the scene",
					score = 1.0,
					priority = 0,
				})
		
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
			
			if(!activity.isInvolved(_charID) && (_charID != "pc" || activity.isInvolved(getPCTarget()))):
				var joinActions:Array = activity.getJoinActionsFinal(_charInfo)
				for actionEntry in joinActions:
					result.append({
						id = "joinAction",
						activityID = activity.uniqueID,
						name = actionEntry["name"] if actionEntry.has("name") else "UNNAMMED ACTION",
						desc = actionEntry["desc"] if actionEntry.has("desc") else "Do this action.",
						score = actionEntry["score"] if actionEntry.has("score") else 0.0,
						chance = actionEntry["chance"] if actionEntry.has("chance") else null,
						category = actionEntry["category"] if actionEntry.has("category") else [],
						priority = actionEntry["priority"] if actionEntry.has("priority") else 0,
						args = actionEntry["args"] if actionEntry.has("args") else [],
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

func sortActionsByPriority(a, b):
	if a["priority"] <= b["priority"]:
		return false
	return true

func getPCTarget() -> String:
	var canChooseDoms:bool = true
	var canChooseSubs:bool = true
	if(isDom("pc")):
		canChooseDoms = false
		canChooseSubs = true
	if(isSub("pc")):
		canChooseDoms = true
		canChooseSubs = false
	
	if(canChooseDoms && doms.has(pcTarget)):
		return pcTarget
	if(canChooseSubs && subs.has(pcTarget)):
		return pcTarget
	
	if(!subs.has(pcTarget) && !doms.has(pcTarget)):
		pcTarget = ""
	
	if(pcTarget == ""):
		if(canChooseDoms && !doms.empty()):
			pcTarget = doms.keys()[0]
		elif(canChooseSubs && !subs.empty()):
			pcTarget = subs.keys()[0]
	
	return pcTarget

func switchPCTarget():
	var idList:Array = []
	if(isDom("pc")):
		idList = subs.keys()
	if(isSub("pc")):
		idList = doms.keys()
	if(!isDom("pc") && !isSub("pc")):
		idList = (doms.keys() + subs.keys())
	
	var theTarget:String = getPCTarget()
	var theIndx:int = idList.find(theTarget)
	if(theIndx < 0):
		return
	theIndx += 1
	if(theIndx >= idList.size()):
		theIndx = 0
	pcTarget = idList[theIndx]


func canSwitchPCTarget() -> bool:
	if(isDom("pc")):
		if(subs.size() >= 2):
			return true
	elif(isSub("pc")):
		if(doms.size() >= 2):
			return true
	elif((subs.size() + doms.size()) >= 3):
		return true
	return false

func doFullTurn(_isObeyMode:bool = false):
	processAIActions(true, _isObeyMode)
	addOutputSeparator()
	processTurn()
	addOutputSeparator()
	processAIActions(false, _isObeyMode)
	if(shouldFindDynamicJoiners()):
		findDynamicJoiner()

func processScene():
	clearOutputRaw()
	doFullTurn()

func doAction(_actionInfo:Dictionary):
	if(_actionInfo["id"] == "obey"):
		clearOutputRaw()
		if(isSub("pc")):
			getSubInfo("pc").setObeyMode(true)
		doFullTurn(true)
		if(isSub("pc")):
			getSubInfo("pc").setObeyMode(false)
	if(_actionInfo["id"] == "auto"):
		clearOutputRaw()
		doFullTurn(true)
	if(_actionInfo["id"] == "continue"):
		clearOutputRaw()
		doFullTurn()
	if(_actionInfo["id"] == "action"):
		clearOutputRaw()
		var activity = getActivityWithUniqueID(_actionInfo["activityID"])
		if(activity):
			doActivityAction("pc", activity, _actionInfo["action"])
		doFullTurn()
	if(_actionInfo["id"] == "start"):
		clearOutputRaw()
		if(isDom("pc")):
			startActivity(_actionInfo["activityID"], "pc", _actionInfo["target"], _actionInfo["args"])
		else:
			startActivity(_actionInfo["activityID"], _actionInfo["target"], "pc", _actionInfo["args"])
		doFullTurn()
	if(_actionInfo["id"] == "joinAction"):
		clearOutputRaw()
		var activity = getActivityWithUniqueID(_actionInfo["activityID"])
		if(activity):
			doJoinAction("pc", activity, _actionInfo["args"] if _actionInfo.has("args") else [])
		doFullTurn()

func isAllowedAsRole(_activityID:String, _indx:int, _sexInfo:SexInfoBase, skipTagCheck:bool, _args:Array = []) -> bool:
	var theActivity = GlobalRegistry.getSexActivityReference(_activityID)
	if(!theActivity):
		return false
	return theActivity.isAllowedAsRoleFinal(self, _indx, _sexInfo, skipTagCheck, _args)

func isAllowedAsRoles(_activityID:String, theDoms:Array, theSubs:Array, _args:Array = []) -> bool:
	for _i in range(theDoms.size()):
		if(!isAllowedAsRole(_activityID, _i, theDoms[_i][0], theDoms[_i][1], _args)):
			return false
	for _i in range(theSubs.size()):
		if(!isAllowedAsRole(_activityID, -_i-1, theSubs[_i][0], theSubs[_i][1], _args)):
			return false
	return true

func hasTag(charID:String, tag:int) -> bool:
	for activity in activities:
		if(activity.hasEnded):
			continue
		
		var theIndx:int = activity.convertCharIDToIndx(charID)
		if(theIndx > -99):
			if(tag in activity.getTags(theIndx)):
				return true

	return false

func hasAnyTag(_info:SexInfoBase, tags:Array) -> bool:
	var theCharID:String = _info.getCharID()
	for theTag in tags:
		if(hasTag(theCharID, theTag)):
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

func hasActivityWithInfo(id:String, _info:SexInfoBase) -> bool:
	for activity in activities:
		if(activity.hasEnded):
			continue
		if(activity.id != id):
			continue
		if(activity.doms.has(_info) && activity.subs.has(_info)):
			return true
	return false

func sexShouldEnd() -> bool:
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
	if(!hasAnyHealthyDoms):
		return true
	
	for activity in activities:
		if(!activity.canStopSexWithThisActivity()):
			return false
	return true

func getRecovarableItemsAfterSex() -> Array:
	var result:Array = []
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
	sexResult.clear()
	sexResult.subsWon = true
	for domID in doms:
		var domInfo = doms[domID]
		if(!domInfo.getIsDown()):
			sexResult.subsWon = false
		
		var newDomResult:SexEngineResultDom = SexEngineResultDom.new()
		newDomResult.grabInfo(self, domInfo)
		
		sexResult.doms[domID] = newDomResult

	for subID in subs:
		var subInfo = subs[subID]
		var newSubResult:SexEngineResultSub = SexEngineResultSub.new()
		newSubResult.grabInfo(self, subInfo)
		
		sexResult.subs[subID] = newSubResult
	
	sexEnded = true
	var texts:Array = ["The sex scene has ended!"]
	
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
		domInfo.getChar().onSexEnded({sexEngine=self,isDom=true,sexFullResult=sexResult,sexResult=sexResult.doms[domID]})
		
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
					saveCondomToLootIfPerk(theCondom)
		
		subInfo.getChar().afterSexEnded(subInfo)
		subInfo.getChar().onSexEnded({sexEngine=self,isDom=false,sexFullResult=sexResult,sexResult=sexResult.subs[subID]})

	addOutputSeparator()
	addTextRaw(Util.join(texts, "\n"))

func hasSexEnded():
	return sexEnded

func getActivityWithMaxAnimPriorityFor(_charID:String, skipOptional:bool = false):
	var foundPriority = -999
	#var foundAnimInfo = null
	var foundActivity = null
	
	var foundCharInfo:SexInfoBase = null
	var theIsDom:bool = false
	if(subs.has(_charID)):
		foundCharInfo = subs[_charID]
	if(doms.has(_charID)):
		foundCharInfo = doms[_charID]
		theIsDom = true
	if(!foundCharInfo):
		return null
	
	for activity in activities:
		if(activity.hasEnded):
			continue
		if(theIsDom && !activity.doms.has(foundCharInfo)):
			continue
		if(!theIsDom && !activity.subs.has(foundCharInfo)):
			continue
		if(skipOptional && activity.isAnimOptional()):
			continue
		
		var animInfo = activity.getAnimationFinal()
		if(animInfo == null):
			continue
		if(activity.getAnimationPriority() > foundPriority || foundActivity == null):
			#foundAnimInfo = animInfo
			foundPriority = activity.getAnimationPriority()
			foundActivity = activity
	return foundActivity

func getXFreeDomIDsForAnim(_amount:int) -> Array:
	if(_amount <= 0):
		return []
	var result:Array = []
	var thePcTarget:String = getPCTarget()
	
	var toCheck:Array = doms.keys()
	if(thePcTarget in toCheck):
		toCheck.erase(thePcTarget)
		toCheck = [thePcTarget] + toCheck
	if("pc" in toCheck):
		toCheck.erase("pc")
		toCheck = ["pc"] + toCheck
	
	for charID in toCheck:
		if(getActivityWithMaxAnimPriorityFor(charID, true) == null):
			result.append(charID)
			_amount -= 1
			if(_amount <= 0):
				return result
	return result

func getXFreeSubIDsForAnim(_amount:int) -> Array:
	if(_amount <= 0):
		return []
	var result:Array = []
	var thePcTarget:String = getPCTarget()
	
	var toCheck:Array = subs.keys()
	if(thePcTarget in toCheck):
		toCheck.erase(thePcTarget)
		toCheck = [thePcTarget] + toCheck
	if("pc" in toCheck):
		toCheck.erase("pc")
		toCheck = ["pc"] + toCheck
	
	for charID in toCheck:
		if(getActivityWithMaxAnimPriorityFor(charID, true) == null):
			result.append(charID)
			_amount -= 1
			if(_amount <= 0):
				return result
	return result

# Makes us automatically switch targets if one of the doms grabs us
func reconsiderPCTarget():
	if(!isSub("pc") || doms.size() < 2):
		return
	var theTargetChar:String = getPCTarget()
	var theTargetInfo:SexInfoBase = getCharInfo(theTargetChar)
	if(!theTargetInfo):
		return
	var domsThatHaveActivitiesWithPC:Array = []
	for activity in activities:
		if(activity.hasEnded || !activity.isInvolved("pc") || activity.getAnimation() == null):
			continue
		
		for otherDomInfo in activity.doms:
			if(otherDomInfo == theTargetInfo):
				return # We have at least one animated activity with the current target, all is good
			
			if(!domsThatHaveActivitiesWithPC.has(otherDomInfo.charID)):
				domsThatHaveActivitiesWithPC.append(otherDomInfo.charID)
	# We have a target but we don't have any sex activities with it, lets try to switch to the one that we do
	if(!domsThatHaveActivitiesWithPC.empty()):
		pcTarget = domsThatHaveActivitiesWithPC[0]
	
func getBestAnimation():
	var theTargetChar:String = getPCTarget()
	if(theTargetChar == ""):
		return null
	var theTargetInfo:SexInfoBase
	if(isDom(theTargetChar)):
		theTargetInfo = doms[theTargetChar]
	if(isSub(theTargetChar)):
		theTargetInfo = subs[theTargetChar]
	if(theTargetInfo == null):
		return
	var foundAnimInfo = null#getActivityAnimFor(theTargetChar)
	for activity in activities:
		if(!activity.subs.has(theTargetInfo) && !activity.doms.has(theTargetInfo)):
			continue
		var canUseThis:bool = true
		for theOtherInfo in activity.subs:
			if(activity != getActivityWithMaxAnimPriorityFor(theOtherInfo.getCharID())):
				canUseThis = false
				break
		for theOtherInfo in activity.doms:
			if(activity != getActivityWithMaxAnimPriorityFor(theOtherInfo.getCharID())):
				canUseThis = false
				break
		if(canUseThis):
			foundAnimInfo = activity.getAnimationFinal()
			break
		
	if(foundAnimInfo == null):
		foundAnimInfo = sexType.getDefaultAnimation()
	if(foundAnimInfo == null):
		return null

	#if(foundAnimInfo != null && foundAnimInfo.size() == 2):
	#	foundAnimInfo.append({})

	var leashesInfo:Dictionary = gatherAllLeashes()

	if(foundAnimInfo != null && foundAnimInfo.size() > 2):
		var extraInfoDict:Dictionary = foundAnimInfo[2]
		
		var fieldsToCheck:Array = ["pc", "npc", "npc2", "npc3"]
		for npcField in fieldsToCheck:
			if(extraInfoDict.has(npcField)):
				var theCharID:String = extraInfoDict[npcField]
				var theInfo:SexInfoBase
				
				var bodyStateName:String = "bodyState"
				if(npcField != "pc"):
					bodyStateName = npcField + "BodyState"
				if(!extraInfoDict.has(bodyStateName)):
					extraInfoDict[bodyStateName] = {}
				
				if(subs.has(theCharID)):
					theInfo = subs[theCharID]
				if(doms.has(theCharID)):
					theInfo = doms[theCharID]
				if(theInfo && theInfo.didJustCame()):
					extraInfoDict[npcField+"Cum"] = true
					extraInfoDict[bodyStateName]["hard"] = true
				
				if(theInfo && leashesInfo.has(theCharID)):
					extraInfoDict[bodyStateName]["leashedBy"] = leashesInfo[theCharID]

		return foundAnimInfo
	return null

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

func getStartActivityScore(activityID:String, domInfo, subInfo):
	var newSexActivityRef = GlobalRegistry.getSexActivityReference(activityID)
	if(newSexActivityRef == null):
		return -1.0
	
	if(!newSexActivityRef.canStartActivity(self, domInfo, subInfo)):
		return -1.0
	
	var newpossibleActions = newSexActivityRef.getStartActions(self, domInfo, subInfo)
	if(newpossibleActions == null):
		return -1.0
	
	var maxScore:float = 0.0
	for newaction in newpossibleActions:
		var score = newaction["score"]
		
		maxScore = max(maxScore, score)
	
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

func checkGearIsFromPC(whoWearsItID, itemUniqueID) -> bool:
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

func setInventoryToUse(newInv):
	inventoryToSaveItemsTo = newInv

func saveCondomToLootIfPerk(theItem):
	if(GM.pc.hasPerk(Perk.CumKeepCondoms)):
		saveItemToLoot(theItem)

func saveItemToLoot(theItem):
	if(inventoryToSaveItemsTo != null):
		inventoryToSaveItemsTo.addItem(theItem)

func getSexResult() -> SexEngineResult:
	return sexResult

func isBondageDisabled() -> bool:
	return bondageDisabled || (GM.main.getEncounterSettings().getGoalWeight(SexGoal.TieUp) <= 0.0)

func getCharIDList() -> Array:
	var extraCharIDs:Array = []
	for activity in activities:
		extraCharIDs.append_array(activity.getExtraInvolvedCharIDs())
	
	return doms.keys() + subs.keys() + extraCharIDs

func isDynamicJoinAllowed() -> bool:
	return !noDynamicJoiners

func shouldFindDynamicJoiners() -> bool:
	if(!isDynamicJoinAllowed()):
		return false
	if(doms.size() >= 2):
		return false
	if(isDom("pc") && !didPCAllowDynamicJoiners()):
		return false
	return true

func toggleDynamicJoiners():
	pcAllowsDynJoiners = !pcAllowsDynJoiners

func didPCAllowDynamicJoiners() -> bool:
	return pcAllowsDynJoiners

func canToggleDynamicJoiners() -> bool:
	if(!isDom("pc")):
		return false
	if(noDynamicJoiners):
		return false
	
	return true

func removeDynamicJoiner(_charID:String):
	if(!doms.has(_charID)):
		return
	
	var theDomInfo:SexDomInfo = doms[_charID]
	var theCharacter:BaseCharacter = theDomInfo.getChar()
	
	stopActivitiesThatInvolveCharID(_charID)
	doms.erase(_charID)
	
	addTextRaw("[b]Dominant leaves.[/b] "+theCharacter.getName()+" has left.")
	
	# The InSex interaction should handle this
	#var sexLoc:String = getLocation()
	#if(theCharacter.isDynamicCharacter() && sexLoc != ""):
	#	var thePawn = GM.main.IS.spawnPawn(_charID)
	#	if(thePawn):
	#		thePawn.setLocation(sexLoc)

func addDynamicDomParticipant(_charID:String):
	if(doms.has(_charID) || subs.has(_charID)):
		return
	var domInfo := SexDomInfo.new()
	domInfo.initInfo(_charID, self)
	domInfo.setDynamicJoiner(true)
	doms[_charID] = domInfo
	checkRevealedFor(_charID)
	generateGoalsFor(_charID, 2)
	addTextRaw("[b]NEW DOMINANT![/b] "+domInfo.getChar().getName()+" joins in on the fun.")
	participatedDoms[_charID] = true
	if(GM.main):
		if(_charID != "pc" && GM.main.IS.hasPawn(_charID)):
			var sexLoc:String = getLocation()
			if(sexLoc != ""):
				GM.main.IS.getPawn(_charID).setLocation(sexLoc)
			GM.main.IS.startInteraction("InSex", {main=_charID})

func getChanceForDynamicJoiner(_charID:String) -> float:
	var result:float = 20.0
	if(isDom("pc")):
		result += 40.0
	
	var theCharacter:BaseCharacter = GlobalRegistry.getCharacter(_charID)
	if(!theCharacter):
		return 0.0
	var thePers:Personality = theCharacter.getPersonality()
	var theMean:float = thePers.getStat(PersonalityStat.Mean)
	var theDom:float = -thePers.getStat(PersonalityStat.Subby)
	
	result += theMean*20.0
	result += theDom*30.0
	
	for subID in subs:
		var affection:float = GM.main.RS.getAffection(subID, _charID)
		if(affection > 0.80): # best fren
			return 0.0
		result -= affection * 50.0 * (0.2 + max(theMean, -0.2))
	
	var thePawn:CharacterPawn = GM.main.IS.getPawn(_charID)
	if(thePawn):
		result += thePawn.getAngerClamped() * 50.0
	
	return clamp(result, 0.0, 90.0)

func findDynamicJoiner():
	var theLoc:String = getLocation()
	if(theLoc == ""):
		return
	
	var allPawnIDs:Array = GM.main.IS.getPawnIDsNear(theLoc, 1, 1)
	if(allPawnIDs.empty()):
		return
	var pickedNewDomID:String = RNG.pick(allPawnIDs)
	if(participatedDoms.has(pickedNewDomID)):
		return
	var thePawn = GM.main.IS.getPawn(pickedNewDomID)
	if(!thePawn || !thePawn.canBeInterrupted()):
		return
	# Little hack-ish but it basically makes it so if you allow dynamic joiners, they will do stuff by default
	if(isDom("pc") && doms.size() == 1 && participatedDoms.empty()):
		pcAllowsDomAutonomy = true
	var theChance:float = getChanceForDynamicJoiner(pickedNewDomID)
	if(!RNG.chance(theChance)):
		return
	addDynamicDomParticipant(pickedNewDomID)

func getLocation() -> String:
	if(doms.has("pc") || subs.has("pc")):
		return GM.pc.getLocation()
	elif(GM.main != null):
		for domID in doms:
			if(GM.main.IS.hasPawn(domID)):
				return GM.main.IS.getPawn(domID).getLocation()
		for subID in subs:
			if(GM.main.IS.hasPawn(subID)):
				return GM.main.IS.getPawn(subID).getLocation()
	return ""
	
func hasWallsNearby() -> bool:
	var locToCheck:String = getLocation()
	
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

# key= whoIsLeashed, value= leashedByWho
func gatherAllLeashes() -> Dictionary:
	var result:Dictionary = {}
	for activity in activities:
		var theLeashes:Dictionary = activity.getLeashes()
		for whoHoldsLeashIndx in theLeashes:
			var leashTargetIndx = theLeashes[whoHoldsLeashIndx]
			var whoID:String = activity.getDomOrSubID(whoHoldsLeashIndx) if whoHoldsLeashIndx is int else whoHoldsLeashIndx
			var targetID:String = activity.getDomOrSubID(leashTargetIndx) if leashTargetIndx is int else leashTargetIndx
			result[targetID] = whoID
		
	return result

func hasLeash(charIDWho:String, charIDTarget:String) -> bool:
	var theLeashes:Dictionary = gatherAllLeashes()
	if(theLeashes.has(charIDTarget) && theLeashes[charIDTarget] == charIDWho):
		return true
	return false

func getLeashedBy(charIDTarget:String) -> String:
	var theLeashes:Dictionary = gatherAllLeashes()
	if(theLeashes.has(charIDTarget)):
		return theLeashes[charIDTarget]
	return ""

func isLeashed(charIDTarget:String) -> bool:
	var theLeashes:Dictionary = gatherAllLeashes()
	if(theLeashes.has(charIDTarget)):
		return true
	return false

func getRevealedPartsAmount(_charID:String) -> int:
	if(!revealedBodyparts.has(_charID)):
		return 0
	return revealedBodyparts[_charID].size()

func saveData():
	var data = {
		"revealedBodyparts": revealedBodyparts,
		"trackedItems": trackedItems,
		"currentLastActivityID": currentLastActivityID,
		"sexEnded": sexEnded,
		"sexResult": sexResult.saveData(),
		"bondageDisabled": bondageDisabled,
		"subMustGoUnconscious": subMustGoUnconscious,
		"outputRaw": outputRaw,
		"pcTarget": pcTarget,
		"pcAllowsDomAutonomy": pcAllowsDomAutonomy,
		"participatedDoms": participatedDoms,
		"pcAllowsDynJoiners": pcAllowsDynJoiners,
		"noDynamicJoiners": noDynamicJoiners,
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
	trackedItems = SAVE.loadVar(data, "trackedItems", {})
	currentLastActivityID = SAVE.loadVar(data, "currentLastActivityID", 0)
	sexEnded = SAVE.loadVar(data, "sexEnded", false)
	sexResult.loadData(SAVE.loadVar(data, "sexResult", {}))
	bondageDisabled = SAVE.loadVar(data, "bondageDisabled", false)
	subMustGoUnconscious = SAVE.loadVar(data, "subMustGoUnconscious", false)
	outputRaw = SAVE.loadVar(data, "outputRaw", [])
	pcTarget = SAVE.loadVar(data, "pcTarget", "")
	pcAllowsDomAutonomy = SAVE.loadVar(data, "pcAllowsDomAutonomy", false)
	participatedDoms = SAVE.loadVar(data, "participatedDoms", {})
	pcAllowsDynJoiners = SAVE.loadVar(data, "pcAllowsDynJoiners", false)
	noDynamicJoiners = SAVE.loadVar(data, "noDynamicJoiners", false)
	
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
