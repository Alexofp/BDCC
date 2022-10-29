extends Reference
class_name FetishHolder

var character: WeakRef
var fetishMap: Dictionary = {}

func _init():
	addFetish(Fetish.VaginalSexTop, FetishInterest.Loves)

func getCharacter():
	if(character == null):
		return character
	return character.get_ref()

func setCharacter(newchar):
	character = weakref(newchar)

func addFetish(fetishID, interest):
	fetishMap[fetishID] = interest

func getFetishInterest(fetishID):
	if(!fetishMap.has(fetishID)):
		return FetishInterest.Neutral
	return fetishMap[fetishID]

func getGoals(_sexEngine, _sub):
	var result = []
	
	for fetishID in fetishMap:
		var fetishInterest = fetishMap[fetishID]
		var fetishInterestValue = FetishInterest.getScore(fetishInterest)
		
		if(fetishInterestValue > 0.0):
			var fetish:FetishBase = GlobalRegistry.getFetish(fetishID)
			var goals = fetish.getGoals(_sexEngine, getCharacter(), _sub)
			
			for goal in goals:
				result.append([goal, fetishInterestValue])

	return result
