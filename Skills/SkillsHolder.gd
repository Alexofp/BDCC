extends Node
class_name SkillsHolder

var stats = {}
var level: int = 0
var experience: int = 0
var npc = null
signal statChanged
signal levelChanged
signal experienceChanged

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
		"level": level,
		"experience": experience,
	}

func loadData(data):
	stats = SAVE.loadVar(data, "stats", {})
	level = SAVE.loadVar(data, "level", 0)
	experience = SAVE.loadVar(data, "experience", 0)

func setLevel(lvl: int):
	level = lvl
	emit_signal("levelChanged")

func getLevel() -> int:
	return level

func getAvailableStatPoints() -> int:
	return level * 3
	
static func getRequiredExperience(_level) -> int:
	return 100

func addExperience(addexp: int):
	if(npc == null || !npc.isPlayer()):
		return
	experience += addexp
	
	checkNewLevel()
	
	emit_signal("experienceChanged")

func getExperience():
	return experience

func getLevelProgress() -> float:
	var fexperience = float(experience)
	var fneedexperience = float(getRequiredExperience(level))
	return fexperience / fneedexperience

func checkNewLevel():
	var addedAnyLevels = false
	while(experience >= getRequiredExperience(level)):
		experience -= getRequiredExperience(level)
		level += 1
		addedAnyLevels = true
	
	if(addedAnyLevels):
		emit_signal("levelChanged")
		
