extends Reference
class_name FetishHolder

var character: WeakRef
var fetishMap: Dictionary = {}

func _init():
	for fetishID in GlobalRegistry.getFetishes():
		addFetish(fetishID, RNG.pick(FetishInterest.getAll()))
		#addFetish(fetishID, FetishInterest.Loves)
		#addFetish(fetishID, FetishInterest.Hates)
	
	addFetish(Fetish.OralSexReceiving, FetishInterest.Loves)
	addFetish(Fetish.VaginalSexGiving, FetishInterest.Loves)
	addFetish(Fetish.DrugUse, FetishInterest.Loves)
	#addFetish(Fetish.VaginalSexGiving, FetishInterest.Loves)
	#addFetish(Fetish.Breeding, FetishInterest.Hates)
	#addFetish(Fetish.BeingBred, FetishInterest.Hates)
	#addFetish(Fetish.VaginalSexReceiving, FetishInterest.Hates)

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

func getFetishValue(fetishID):
	if(!fetishMap.has(fetishID)):
		return 0.0
	return FetishInterest.getScore(fetishMap[fetishID])

func getFetishes():
	return fetishMap

func getGoals(_sexEngine, _sub):
	var result = []
	
	for fetishID in fetishMap:
		var fetishInterest = fetishMap[fetishID]
		var fetishInterestValue = FetishInterest.getScore(fetishInterest)
		
		if(fetishInterestValue >= 0.0):
			var fetish:FetishBase = GlobalRegistry.getFetish(fetishID)
			var goals = fetish.getGoals(_sexEngine, getCharacter(), _sub)
			
			for goal in goals:
				result.append([goal, max(0.1, fetishInterestValue)])

	return result
