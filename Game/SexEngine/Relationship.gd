extends Reference
class_name Relationship

var character: WeakRef

var stats:Dictionary = {}

func _init():
	for statID in RelationshipStat.getAll():
		stats[statID] = 0

func setCharacter(newchar):
	character = weakref(newchar)
	
func getCharacter():
	if character == null:
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

func setRawStat(statID, newvalue: float):
	stats[statID] = newvalue


func addStat(statID, addvalue: float):
	if !stats.has(statID):
		stats[statID] = 0.0
	
	var oldValue = stats[statID]
	
	stats[statID] += addvalue
	stats[statID] = clamp(stats[statID], -1.0, 1.0)
	
	if(oldValue == stats[statID]):
		return false
	return true

func saveData():
	var data = {
		"stats": stats,
	}
	return data

func loadData(data):
	var newstats = SAVE.loadVar(data, "stats", null)
	if(newstats != null && (newstats is Dictionary)):
		stats = newstats
