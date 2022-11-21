extends Reference
class_name Personality

var character: WeakRef

var stats:Dictionary = {}

func _init():
	for statID in PersonalityStat.getAll():
		stats[statID] = RNG.randf_range(-1.0, 1.0)

	setStat(PersonalityStat.Mean, 1.0)

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
	
	stats[statID] += addvalue
	stats[statID] = clamp(stats[statID], -1.0, 1.0)

func saveData():
	var data = {
		"stats": stats,
	}
	return data

func loadData(data):
	stats = SAVE.loadVar(data, "stats", {})
