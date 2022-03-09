extends Node
class_name SkillsHolder

var stats = {}
var level: int = 0
var experience: int = 0
var npc = null

var skills = {}
var perks = {}

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

func increaseStatIfCan(statID: String, amount = 1):
	amount = min(amount, getFreeStatPoints())
	if(amount <= 0):
		return
	setStat(statID, getBaseStat(statID) + amount)

func getBaseStat(statID: String) -> int:
	assert(GlobalRegistry.getStat(statID) != null)
	if(!stats.has(statID)):
		return 0
	return stats[statID]

func getStat(statID: String) -> int:
	return getBaseStat(statID)

func saveData():
	var data = {
		"stats": stats,
		"level": level,
		"experience": experience,
	}
	data["skills"] = []
	for skillID in skills:
		var skillData = {
			"id": skillID,
			"skillData": skills[skillID].saveData(),
		}
		data["skills"].append(skillData)
		
	data["perks"] = []
	for perkID in perks:
		var perkData = {
			"id": perkID,
			"perkData": perks[perkID].saveData(),
		}
		data["perks"].append(perkData)
	
	
	return data

func loadData(data):
	skills.clear()
	perks.clear()
	stats = SAVE.loadVar(data, "stats", {})
	level = SAVE.loadVar(data, "level", 0)
	experience = SAVE.loadVar(data, "experience", 0)
	
	var loadedSkills = SAVE.loadVar(data, "skills", [])
	for loadedSkill in loadedSkills:
		var skillID = SAVE.loadVar(loadedSkill, "id", "")
		var skillData = SAVE.loadVar(loadedSkill, "skillData", {})
		
		var newskill = GlobalRegistry.createSkill(skillID)
		if(newskill == null):
			printerr("Skill with id "+skillID+" couldn't be loaded because it wasn't found in the registry")
			continue
		
		newskill.setCharacter(npc)
		newskill.loadData(skillData)
		skills[skillID] = newskill
		
	var loadedPerks = SAVE.loadVar(data, "perks", [])
	for loadedPerk in loadedPerks:
		var perkID = SAVE.loadVar(loadedPerk, "id", "")
		var perkData = SAVE.loadVar(loadedPerk, "perkData", {})
		
		var newperk = GlobalRegistry.createPerk(perkID)
		if(newperk == null):
			printerr("Perk with id "+perkID+" couldn't be loaded because it wasn't found in the registry")
			continue
		
		newperk.setCharacter(npc)
		newperk.loadData(perkData)
		perks[perkID] = newperk

func setLevel(lvl: int):
	level = lvl
	emit_signal("levelChanged")

func getLevel() -> int:
	return level

func getTotalStatPoints() -> int:
	return level * 3
	
func getFreeStatPoints() -> int:
	var res = getTotalStatPoints()
	for statID in stats:
		res -= stats[statID]
	return res
	
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

func getRequiredExperienceNextLevel():
	return getRequiredExperience(level)

func getLevelProgress() -> float:
	var fexperience = float(experience)
	var fneedexperience = float(getRequiredExperience(level))
	return fexperience / fneedexperience

func checkNewLevel():
	var addedAnyLevels = false
	while(experience >= getRequiredExperienceNextLevel()):
		experience -= getRequiredExperienceNextLevel()
		level += 1
		addedAnyLevels = true
	
	if(addedAnyLevels):
		emit_signal("levelChanged")
		
func addSkillExperience(skillID, amount, activityID = null):
	if(npc == null || !npc.isPlayer()):
		return
	
	if(!skills.has(skillID)):
		var newskill = GlobalRegistry.createSkill(skillID)
		if(newskill == null):
			assert(false)
			return
		newskill.setCharacter(npc)
		skills[skillID] = newskill
	
	skills[skillID].addExperience(amount, activityID)
	
func onNewDay():
	for skillID in skills:
		skills[skillID].onNewDay()
	
func getSkills():
	return skills

func getSkill(skillID):
	if(!skills.has(skillID)):
		return null
	return skills[skillID]
	
func hasPerk(perkID):
	if(!perks.has(perkID)):
		return false
	return true
	
func addPerk(perkID):
	if(hasPerk(perkID)):
		return
	
	var newperk = GlobalRegistry.createPerk(perkID)
	newperk.setCharacter(npc)
	perks[perkID] = newperk

func getPerkPoints(skillID):
	if(!skills.has(skillID)):
		return 0
	return skills[skillID].getLevel()
	
func getFreePerkPoints(skillID):
	if(!skills.has(skillID)):
		return 0
	
	var result = getPerkPoints(skillID)
	for perkID in perks:
		var perk = perks[perkID]
		if(perk.getSkillGroup() == skillID):
			result -= 1
	
	return result

func canUnlockPerk(perkID):
	var perk: PerkBase = GlobalRegistry.getPerk(perkID)
	var perkSkill = perk.getSkillGroup()
	if(!skills.has(perkSkill)):
		return false
	
	var skill: SkillBase = skills[perkSkill]
	
	var freePerkPoints = getFreePerkPoints(perk.getSkillGroup())
	if(perk.getCost() > freePerkPoints):
		return false
	
	var tierData = skill.getPerkTiers()[perk.getSkillTier()]
	var requiredLevel = tierData[0]
	
	if(skill.getLevel() < requiredLevel):
		return false
	return true
	
