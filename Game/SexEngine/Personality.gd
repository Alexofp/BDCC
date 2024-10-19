extends Reference
class_name Personality

var character: WeakRef

var stats:Dictionary = {}

func _init():
	for statID in PersonalityStat.getAll():
		stats[statID] = 0.0#RNG.randf_range(-1.0, 1.0)

	#setStat(PersonalityStat.Mean, 1.0)

func setCharacter(newchar):
	character = weakref(newchar)
	
func getCharacter():
	if(character == null):
		return character
	return character.get_ref()

func clear():
	stats.clear()

func getStat(statID) -> float:
	if(!stats.has(statID)):
		return 0.0
	
	return stats[statID]

func setStat(statID, newvalue: float):
	stats[statID] = clamp(newvalue, -1.0, 1.0)

func addStat(statID, addvalue: float):
	if(!stats.has(statID)):
		stats[statID] = 0.0
	
	var oldValue = stats[statID]
	
	stats[statID] += addvalue
	stats[statID] = clamp(stats[statID], -1.0, 1.0)
	
	if(oldValue == stats[statID]):
		return false
	return true

func personalityScore(personalityStats = {}, onlyPositive:bool = false) -> float:
	var result = 0.0
	for personalityStatID in personalityStats:
		var personalityValue = getStat(personalityStatID)
		var addValue = personalityValue * personalityStats[personalityStatID]
		if(onlyPositive && addValue <= 0.0):
			continue
		result += addValue
	
	return result

func personalityScoreMax(personalityStats = {}, minValue:float = -999.9) -> float:
	var result = minValue
	for personalityStatID in personalityStats:
		var personalityValue = getStat(personalityStatID)
		var addValue = personalityValue * personalityStats[personalityStatID]
		if(addValue > result):
			result = addValue
	return result

func saveData():
	var data = {
		"stats": stats,
	}
	return data

func loadData(data):
	var newstats = SAVE.loadVar(data, "stats", null)
	if(newstats != null && (newstats is Dictionary)):
		var filteredStats = {}
		for statID in newstats:
			if(!PersonalityStat.statExists(statID)):
				Log.print("Personality stat with id "+str(statID) + " wasn't found, skipping")
				continue
			filteredStats[statID] = newstats[statID]
		newstats = filteredStats
			
		
		stats = newstats
