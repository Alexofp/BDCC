extends Reference
class_name LustInterests

var interests = {}
var playerKnows = {}

func _init():
#	addInterest(InterestTopic.FeminineBody, Interest.Loves)
#	addInterest(InterestTopic.AndroBody, Interest.Loves)
#	addInterest(InterestTopic.AverageMassBody, Interest.Loves)
	pass

func clear():
	interests = {}
	playerKnows = {}

func learnRandomInterest():
	var possible = []
	
	for interest in interests:
		if(!playerKnows.has(interest) || playerKnows[interest] != interests[interest]):
			possible.append(interest)
	
	if(possible.size() <= 0):
		return false
	var randInterest = RNG.pick(possible)
	playerKnows[randInterest] = interests[randInterest]
	return true

func learnRandomInterestFromList(_actionInterests):
	var possible = []
	
	for interest in _actionInterests:
		if(!interests.has(interest)):
			continue
		if(!playerKnows.has(interest) || playerKnows[interest] != interests[interest]):
			possible.append(interest)
	
	if(possible.size() <= 0):
		return false
	var randInterest = RNG.pick(possible)
	playerKnows[randInterest] = interests[randInterest]
	return true

func addInterest(topicID, reaction):
	interests[topicID] = reaction

func customBestTopicComparison(a, b):
	return a[2] > b[2]

func getInterestValue(topicID):
	if(interests.has(topicID)):
		var interestLikes = interests[topicID]
		return Interest.getValue(interestLikes)
	return 0.0

func getTopicValue(topicID, _pc):
	var topicGroup: TopicBase = GlobalRegistry.getLustTopic(topicID)
	if(!topicGroup):
		return 0.0
	
	var loveValue = 0.0
	if(interests.has(topicID)):
		var interestLikes = interests[topicID]
		loveValue = Interest.getValue(interestLikes)
	
	var playerValue = topicGroup.getTopicValue(topicID, _pc)
	return loveValue * playerValue

func getOverallLikeness(_pc, isClamped:bool = false) -> float:
	var resultValue:float = 0.0
	var maxPossble:float = 0.0
	
	for topicID in interests:
		var topicGroup: TopicBase = GlobalRegistry.getLustTopic(topicID)
		if(!topicGroup):
			continue
		var loveValue:float = Interest.getValue(interests[topicID])
		
		var playerValue:float = topicGroup.getTopicValue(topicID, _pc)
		
		var addValue:float = loveValue * topicGroup.getHowMuchAddsToLikeness(topicID)
		
		maxPossble += abs(addValue)
		resultValue += addValue * playerValue
	if(isClamped):
		if(maxPossble <= 0.0):
			return 0.0
		return clamp(resultValue / maxPossble, 0.0, 1.0)
	return resultValue

func getFocusedLikenessSummary(_pc, _focus, isClamped:bool = false) -> Dictionary:
	var summaryDict:Dictionary = {
		"resultValue": 0.0,
		"topicsLikedPresence": [],
		"topicsLikedAbsence": [],
		"topicsDislikedPresence": [],
		"topicsDislikedAbsence": [],
	}

	var resultValue:float = 0.0
	var maxPossible:float = 0.0

	for topicID in interests:
		var topicGroup: TopicBase = GlobalRegistry.getLustTopic(topicID)
		if(!topicGroup):
			continue
		var loveValue:float = Interest.getValue(interests[topicID]) # -2 to 1
		var loveValueRatio:float = clamp((loveValue + 1.0) / 2.0, 0.0, 1.0)

		var playerValue:float = topicGroup.getTopicValue(topicID, _pc) # 0 to 1

		var addsToFocus:float = topicGroup.getAddsToFocus(topicID, _focus)
		var interestImportanceWithFocus:float = abs(loveValue * addsToFocus)

		var goodMatchRatio:float = 1.0 - min(abs(loveValueRatio - playerValue), 1.0)
		var goodMatchRatioWithFocus:float = (goodMatchRatio * addsToFocus)

		if(interestImportanceWithFocus >= 0.5 && (playerValue < 0.3 || playerValue > 0.7)):
			var summaryKeySuffix:String = "Presence" if(playerValue > 0.5) else "Absence"
			if(goodMatchRatio >= 0.7):
				summaryDict["topicsLiked" + summaryKeySuffix].append(topicID)
			elif(goodMatchRatio < 0.3):
				summaryDict["topicsDisliked" + summaryKeySuffix].append(topicID)

		maxPossible += interestImportanceWithFocus
		resultValue += goodMatchRatioWithFocus

	if(isClamped):
		if(maxPossible <= 0.0):
			resultValue = 0.0
		else:
			resultValue = clamp(resultValue / maxPossible, 0.0, 1.0)

	summaryDict["resultValue"] = resultValue

	return summaryDict

func getFocusedLikeness(_pc, _focus, isClamped:bool = false) -> float:
	var summaryDict:Dictionary = getFocusedLikenessSummary(_pc, _focus, isClamped)
	return summaryDict["resultValue"]

func getFocussedLikeness(_pc, _focus, isClamped:bool = false) -> float:
	return getFocusedLikeness(_pc, _focus, isClamped)

func reactLustAction(_pc, _actionInterests, _maxUnlocks = 1):
	var resultValue = 0.0
	var positiveValue = 0.0
	var negativeValue = 0.0
	
	var bestTopics = []
	for topicID in _actionInterests:
		if(!interests.has(topicID)):
			continue
		var topicGroup: TopicBase = GlobalRegistry.getLustTopic(topicID)
		if(!topicGroup):
			continue
		
		var actionValue = _actionInterests[topicID]
		
		var interestLikes = interests[topicID]
		var loveValue = Interest.getValue(interestLikes)
		
		var playerValue = topicGroup.getTopicValue(topicID, _pc)
		
		var addValue = actionValue * loveValue * playerValue
		resultValue += addValue
		if(addValue > 0.0):
			positiveValue += addValue
		if(addValue < 0.0):
			negativeValue += addValue
		
		if(playerValue >= 0.01):
			bestTopics.append([topicID, interestLikes, abs(addValue)])
		
	bestTopics.sort_custom(self, "customBestTopicComparison")
	#print(bestTopics)
	
	var pcLearned = []
	var i = 0
	var alreadyKnownTopics = 0
	for bestTopic in bestTopics:
		if(!playerKnows.has(bestTopic[0]) || playerKnows[bestTopic[0]] != bestTopic[1]):
			if(i < _maxUnlocks):
				playerKnows[bestTopic[0]] = bestTopic[1]
				pcLearned.append([bestTopic[0], bestTopic[1]])
				i += 1
				#print("PLAYER LEARNED THAT THE NPC "+str(bestTopic[1])+" "+str(bestTopic[0]))
		else:
			alreadyKnownTopics += 1
			
	var result = {
		"value": resultValue,
		"positiveValue": positiveValue,
		"negativeValue": negativeValue,
		"learned": pcLearned,
		"alreadyKnownTopics": alreadyKnownTopics,
	}
	
	return result

func getPlayerKnowledge():
	return playerKnows

func hasAnyInterests():
	return interests.size() > 0

func saveData():
	var data = {
		"playerKnows": playerKnows,
	}
	
	return data

func loadData(data):
	playerKnows = SAVE.loadVar(data, "playerKnows", {})

func saveDataDynamicNpc():
	var data = {
		"playerKnows": playerKnows,
		"interests": interests,
	}
	
	return data

func loadDataDynamicNpc(data):
	playerKnows = SAVE.loadVar(data, "playerKnows", {})
	interests = SAVE.loadVar(data, "interests", {})
