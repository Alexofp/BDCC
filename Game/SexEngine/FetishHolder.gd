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

func clearToInterest(theInterestValue:float):
	for fetishID in GlobalRegistry.getFetishes():
		setFetish(fetishID, theInterestValue)

func getCharacter():
	if(character == null):
		return character
	return character.get_ref()

func setCharacter(newchar):
	character = weakref(newchar)

func setFetish(fetishID:String, interest:float):
	fetishMap[fetishID] = clamp(interest, -1.0, 1.0)

func getFetish(fetishID:String) -> float:
	if(!fetishMap.has(fetishID)):
		return 0.0
	return fetishMap[fetishID]

func getFetishValue(fetishID:String) -> float:
	if(!fetishMap.has(fetishID)):
		return 0.0
	return fetishMap[fetishID]

func addFetish(fetishID:String, theVal:float):
	var newVal:float = clamp(getFetish(fetishID) + theVal, -1.0, 1.0)
	fetishMap[fetishID] = newVal

func getFetishes() -> Dictionary:
	return fetishMap

func getGoals(_sexEngine, _sub) -> Array:
	var result:Array = []
	
	for fetishID in GlobalRegistry.getFetishes():
		var fetishInterestValue:float = 0.0
		if(fetishMap.has(fetishID)):
			fetishInterestValue = fetishMap[fetishID]
		
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
		var fetishValue:float = getFetishValue(fetishID)
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
			var theValue = newfetishMap[fetishID]
			if(theValue is String):
				theValue = FetishInterest.textToNumber(theValue)
			filteredNewFetishMap[fetishID] = theValue
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
						#TODO: Better missing fetish generation?
						fetishMap[fetishID] = RNG.randf_range(-1.0, 1.0)#RNG.pick(FetishInterest.getAll())
