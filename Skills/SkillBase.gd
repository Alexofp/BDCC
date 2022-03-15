extends Reference
class_name SkillBase

var npc = null
var id = "error"
var level = 0
var experience = 0
var activities = {}
signal levelChanged(id, newlevel)
signal experienceChanged

func setCharacter(newnpc):
	npc = newnpc

func getVisibleName():
	return "Error"

func getShortName():
	return getVisibleName()

func getVisibleDescription():
	return "Error, bad description"

static func getRequiredExperience(_level) -> int:
	return 100

func setLevel(lvl: int):
	if(lvl > getLevelCap()):
		lvl = getLevelCap()
	
	level = lvl
	emit_signal("levelChanged", id, level)

func getLevel() -> int:
	return level

func addExperience(addexp: int, activityID = null):
	if(npc == null || !npc.isPlayer()):
		return
	if(activityID != null && activityID != "" && activities.has(activityID)):
		return
	experience += addexp
	if(activityID != null && activityID != ""):
		activities[activityID] = 1
	
	checkNewLevel()
	
	emit_signal("experienceChanged")

func getExperience():
	return experience

func getRequiredExperienceNextLevel():
	return getRequiredExperience(level)

func getLevelProgress() -> float:
	var fexperience = float(experience)
	var fneedexperience = float(getRequiredExperience(level))
	return fexperience / fneedexperience

func checkNewLevel():
	var addedAnyLevels = false
	while(experience >= getRequiredExperienceNextLevel()):
		if(level >= getLevelCap()):
			level = getLevelCap()
			experience = getRequiredExperienceNextLevel()
			return
		
		experience -= getRequiredExperienceNextLevel()
		level += 1
		addedAnyLevels = true
	
	if(addedAnyLevels):
		emit_signal("levelChanged", id, level)

func getLevelCap():
	return 10

func onNewDay():
	activities.clear()

func saveData():
	return {
		"level": level,
		"experience": experience,
		"activities": activities,
	}

func loadData(data):
	level = SAVE.loadVar(data, "level", 0)
	experience = SAVE.loadVar(data, "experience", 0)
	activities = SAVE.loadVar(data, "activities", {})

func getPerkTiers():
	return [
		[0],
		[5],
	]
