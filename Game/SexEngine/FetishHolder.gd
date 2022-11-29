extends Reference
class_name FetishHolder

var character: WeakRef
var fetishMap: Dictionary = {}

func _init():
	for fetishID in GlobalRegistry.getFetishes():
		#setFetish(fetishID, RNG.pick(FetishInterest.getAll()))
		#setFetish(fetishID, FetishInterest.Loves)
		#setFetish(fetishID, FetishInterest.Hates)
		setFetish(fetishID, FetishInterest.Likes)
	
	#setFetish(Fetish.OralSexReceiving, FetishInterest.Loves)
	#setFetish(Fetish.VaginalSexGiving, FetishInterest.Loves)
	#setFetish(Fetish.DrugUse, FetishInterest.Loves)
	#setFetish(Fetish.VaginalSexGiving, FetishInterest.Loves)
	#setFetish(Fetish.Breeding, FetishInterest.Hates)
	#setFetish(Fetish.BeingBred, FetishInterest.Hates)
	#setFetish(Fetish.VaginalSexReceiving, FetishInterest.Hates)

func clear():
	fetishMap.clear()

func getCharacter():
	if(character == null):
		return character
	return character.get_ref()

func setCharacter(newchar):
	character = weakref(newchar)

func setFetish(fetishID, interest):
	fetishMap[fetishID] = interest

func addFetish(fetishID, interest):
	var currentInterest = getFetishInterest(fetishID)
	var newvalue = FetishInterest.interestToNumber(currentInterest) + FetishInterest.interestToNumber(interest)
	fetishMap[fetishID] = FetishInterest.numberToInterest(newvalue)

func getFetishInterest(fetishID):
	if(!fetishMap.has(fetishID)):
		return FetishInterest.Neutral
	return fetishMap[fetishID]

func getFetishValue(fetishID):
	if(!fetishMap.has(fetishID)):
		return 0.0
	return FetishInterest.getScore(fetishMap[fetishID])

func getFetishes():
	return fetishMap

func getGoals(_sexEngine, _sub):
	var result = []
	
	for fetishID in GlobalRegistry.getFetishes():
		var fetishInterestValue = 0.0
		if(fetishMap.has(fetishID)):
			var fetishInterest = fetishMap[fetishID]
			fetishInterestValue = FetishInterest.getScore(fetishInterest)
		
		if(fetishInterestValue >= 0.0):
			var fetish:FetishBase = GlobalRegistry.getFetish(fetishID)
			var goals = fetish.getGoals(_sexEngine, getCharacter(), _sub)
			
			for goal in goals:
				result.append([goal, max(0.1, fetishInterestValue)])

	return result

func removeImpossibleFetishes():
	var thecharacter = getCharacter()
	if(thecharacter == null):
		return
	
	for fetishID in fetishMap.keys():
		var fetish:FetishBase = GlobalRegistry.getFetish(fetishID)
		if(!fetish.isPossibleFor(thecharacter)):
			var _ok = fetishMap.erase(fetishID)

func saveData():
	var data = {
		"fetishMap": fetishMap,
	}
	return data

func loadData(data):
	var newfetishMap = SAVE.loadVar(data, "fetishMap", null)
	if(newfetishMap != null && (newfetishMap is Array)):
		fetishMap = newfetishMap
