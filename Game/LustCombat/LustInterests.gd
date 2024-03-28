extends Reference
class_name LustInterests

var interests = {}
var playerKnows = {}

func _init():
#	addInterest(InterestTopic.FeminineBody, Interest.Loves)
#	addInterest(InterestTopic.AndroBody, Interest.Loves)
#	addInterest(InterestTopic.AverageMassBody, Interest.Loves)
	pass

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
	
	var loveValue = 0.0
	if(interests.has(topicID)):
		var interestLikes = interests[topicID]
		loveValue = Interest.getValue(interestLikes)
	
	var playerValue = topicGroup.getTopicValue(topicID, _pc)
	return loveValue * playerValue

func reactLustAction(_pc, _actionInterests, _maxUnlocks = 1):
	var resultValue = 0.0
	var positiveValue = 0.0
	var negativeValue = 0.0
	
	var bestTopics = []
	for topicID in _actionInterests:
		if(!interests.has(topicID)):
			continue
		var topicGroup: TopicBase = GlobalRegistry.getLustTopic(topicID)
		
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
