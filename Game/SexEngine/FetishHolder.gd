extends Reference
class_name FetishHolder

var character: WeakRef
var fetishMap: Dictionary = {}
var maxInterest = 4
var minInterest = -4

func _init():
	for fetishID in GlobalRegistry.getFetishes():
		#setFetish(fetishID, RNG.pick(FetishInterest.getAll()))
		#setFetish(fetishID, FetishInterest.Loves)
		#setFetish(fetishID, FetishInterest.Hates)
		setFetish(fetishID, FetishInterest.Likes)
	
	maxInterest = FetishInterest.getMaxPossibleInterestNumber()
	minInterest = FetishInterest.getMinPossibleInterestNumber()
	#setFetish(Fetish.OralSexReceiving, FetishInterest.Loves)
	#setFetish(Fetish.VaginalSexGiving, FetishInterest.Loves)
	#setFetish(Fetish.DrugUse, FetishInterest.Loves)
	#setFetish(Fetish.VaginalSexGiving, FetishInterest.Loves)
	#setFetish(Fetish.Breeding, FetishInterest.Hates)
	#setFetish(Fetish.BeingBred, FetishInterest.Hates)
	#setFetish(Fetish.VaginalSexReceiving, FetishInterest.Hates)

func clear():
	fetishMap.clear()

func clearToInterest(theInterest):
	for fetishID in GlobalRegistry.getFetishes():
		setFetish(fetishID, theInterest)

func getCharacter():
	if(character == null):
		return character
	return character.get_ref()

func setCharacter(newchar):
	character = weakref(newchar)

func setFetish(fetishID, interest):
	fetishMap[fetishID] = interest

# Increase or decrease fetish by 1 or more tiers, for example if we use "numTiers = 3" on the fetish that have 
# "SlightlyDislikes" level it will become "Likes"
func adjustFetishInterestByTier(fetishID, numTiers: int = 1) -> bool:
	var currentInterestValueNum = FetishInterest.interestToNumber(getFetishInterest(fetishID))
	var projectedInterestValueNum = int(clamp((currentInterestValueNum + numTiers), minInterest, maxInterest))
	if(currentInterestValueNum != projectedInterestValueNum): #return true only if interest has changed
		fetishMap[fetishID] = FetishInterest.numberToInterest(projectedInterestValueNum)
		return true
	else:
		return false
	
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

func setFetishValue(fetishID, newVal:float):
	newVal = clamp(newVal, -1.0, 1.0)
	newVal *= 4.0
	
	setFetish(fetishID, FetishInterest.numberToInterest(int(newVal)))

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
			var goals = fetish.getGoals(_sexEngine, self, getCharacter(), _sub)
			
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

func scoreFetish(fetishes:Dictionary, onlyPositive:bool = false) -> float:
	var maxPossibleValue = 0.0
	var result = 0.0
	for fetishID in fetishes:
		var fetishValue = getFetishValue(fetishID)
		var addValue = fetishValue * fetishes[fetishID]
		if(!onlyPositive || (onlyPositive && addValue > 0.0)):
			result += addValue
		maxPossibleValue += 1.0
	
	var forcedObedience = clamp(getCharacter().getForcedObedienceLevel(), 0.0, 1.0)
	if(forcedObedience > 0.0):
		result = result * (1.0 - forcedObedience) + maxPossibleValue * forcedObedience
	
	return result

func scoreFetishMax(fetishes:Dictionary, minValue:float = -999.9) -> float:
	var result = minValue
	for fetishID in fetishes:
		var fetishValue = getFetishValue(fetishID)
		
		var newValue = fetishValue * fetishes[fetishID]
		if(newValue > result):
			result = newValue
	
	var forcedObedience = clamp(getCharacter().getForcedObedienceLevel(), 0.0, 1.0)
	if(forcedObedience > 0.0):
		result = result * (1.0 - forcedObedience) + forcedObedience
	
	return result

func saveData():
	var data = {
		"fetishMap": fetishMap,
	}
	return data

func loadData(data):
	var newfetishMap = SAVE.loadVar(data, "fetishMap", null)
	if(newfetishMap != null && (newfetishMap is Dictionary)):
		# Removing fetishes that the game doesn't have in its database
		var filteredNewFetishMap = {}
		for fetishID in newfetishMap:
			var fetishObject = GlobalRegistry.getFetish(fetishID)
			if(fetishObject == null):
				Log.printerr("Removing fetish that doesn't exist: "+str(fetishID))
				continue
			filteredNewFetishMap[fetishID] = newfetishMap[fetishID]
		newfetishMap = filteredNewFetishMap
		
		fetishMap = newfetishMap
	
	# Adds missing fetishes
	var thechar = getCharacter()
	if(thechar != null):
		if(!thechar.isDynamicCharacter()):
			for fetishID in GlobalRegistry.getFetishes():
				if(!fetishMap.has(fetishID)):
					fetishMap[fetishID] = GlobalRegistry.getFetish(fetishID).getInitialInterest(thechar)
		else:
			# A bit too random but eh
			for fetishID in GlobalRegistry.getFetishes():
				if(!fetishMap.has(fetishID)):
					if(GlobalRegistry.getFetish(fetishID).isPossibleFor(thechar)):
						fetishMap[fetishID] = RNG.pick(FetishInterest.getAll())
