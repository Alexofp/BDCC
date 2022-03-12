extends Reference
class_name LustInterests

var interests = {}
var playerKnows = {}

func _init():
#	addInterest(InterestTopic.FeminineBody, Interest.Loves)
#	addInterest(InterestTopic.AndroBody, Interest.Loves)
#	addInterest(InterestTopic.AverageMassBody, Interest.Loves)
	pass

func addInterest(topicID, reaction, lustMult = 1.0):
	interests[topicID] = [reaction, lustMult]

func customBestTopicComparison(a, b):
	return a[2] > b[2]

func receiveTease(_pc, _teaseType, _maxUnlocks = 1):
	var resultValue = 0.0
	
	var bestTopics = []
	
	for topicID in interests:
		var topicGroup: TopicBase = GlobalRegistry.getLustTopic(topicID)
		
		var teaseValue = topicGroup.getTeaseValue(topicID, _teaseType)
		
		if(teaseValue <= 0.01):
			continue
		
		var interestData = interests[topicID]
		var loveValue = Interest.getValue(interestData[0])
		var lustMult = interestData[1]
		
		var playerValue = topicGroup.getTopicValue(topicID, _pc)
		
		if(playerValue >= 0.1):
			bestTopics.append([topicID, interestData[0], playerValue])
		
		resultValue += teaseValue * loveValue * playerValue * lustMult
		#print(str(teaseValue * loveValue * playerValue * lustMult)+" "+topicID)
	
	#print(str(bestTopics))
	bestTopics.sort_custom(self, "customBestTopicComparison")
	#print(str(bestTopics))
	
	var pcLearned = []
	var i = 0
	for bestTopic in bestTopics:
		if(!playerKnows.has(bestTopic[0]) || playerKnows[bestTopic[0]] != bestTopic[1]):
			playerKnows[bestTopic[0]] = bestTopic[1]
			#print("PLAYER LEARNED THAT THE NPC "+str(bestTopic[1])+" "+str(bestTopic[0]))
			pcLearned.append([bestTopic[0], bestTopic[1]])
			i += 1
			if(i >= _maxUnlocks):
				break
	
	var result = {
		"value": resultValue,
		"learned": pcLearned,
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
