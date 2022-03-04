extends Node
class_name SkillsHolder

var stats = {}
var npc = null
signal statChanged

func _ready():
	name = "Skills"

func setCharacter(newnpc):
	npc = newnpc

func setStat(statID: String, value: int):
	assert(GlobalRegistry.getStat(statID) != null)
	stats[statID] = value
	emit_signal("statChanged")

func getBaseStat(statID: String) -> int:
	assert(GlobalRegistry.getStat(statID) != null)
	if(!stats.has(statID)):
		return 0
	return stats[statID]

func getStat(statID: String) -> int:
	return getBaseStat(statID)

func saveData():
	return {
		"stats": stats,
	}

func loadData(data):
	stats = SAVE.loadVar(data, "stats", {})
