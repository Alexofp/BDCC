extends Node
class_name SkillsHolder

var stats = {}
var level: int = 0
var experience: int = 0
var npc = null

var skills = {}
var perks = {}
var disabledPerks = {}

signal statChanged
signal levelChanged
signal experienceChanged
signal skillLevelChanged(skillID)

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
		"disabledPerks": disabledPerks,
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
	disabledPerks = SAVE.loadVar(data, "disabledPerks", {})
	
	var loadedSkills = SAVE.loadVar(data, "skills", [])
	for loadedSkill in loadedSkills:
		var skillID = SAVE.loadVar(loadedSkill, "id", "")
		var skillData = SAVE.loadVar(loadedSkill, "skillData", {})
		
		var newskill = GlobalRegistry.createSkill(skillID)
		if(newskill == null):
			Log.printerr("Skill with id "+skillID+" couldn't be loaded because it wasn't found in the registry")
			continue
		
		newskill.setCharacter(npc)
		newskill.loadData(skillData)
		skills[skillID] = newskill
		var _ok = newskill.connect("levelChanged", self, "onSkillLevelChanged")
		
	var loadedPerks = SAVE.loadVar(data, "perks", [])
	for loadedPerk in loadedPerks:
		var perkID = SAVE.loadVar(loadedPerk, "id", "")
		var perkData = SAVE.loadVar(loadedPerk, "perkData", {})
		
		var newperk = GlobalRegistry.createPerk(perkID)
		if(newperk == null):
			Log.printerr("Perk with id "+perkID+" couldn't be loaded because it wasn't found in the registry")
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
	return 100 + _level * 10 + int(sqrt(max(0,_level))) * 10

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
		
	ensureSkillExists(skillID)
	
	skills[skillID].addExperience(amount, activityID)
	
func ensureSkillExists(skillID):
	if(!skills.has(skillID)):
		var newskill = GlobalRegistry.createSkill(skillID)
		if(newskill == null):
			assert(false)
			return
		newskill.setCharacter(npc)
		skills[skillID] = newskill
		var _ok = newskill.connect("levelChanged", self, "onSkillLevelChanged")
	
func onNewDay():
	for skillID in skills:
		skills[skillID].onNewDay()
	
func getSkills():
	return skills

func getVisibleBasePerksIDs():
	var result = []
	var allPerks = GlobalRegistry.getPerksIDsBySkill(Skill.Start) + GlobalRegistry.getPerksIDsBySkill(Skill.Inherent)
	
	for perkID in allPerks:
		var perk: PerkBase = GlobalRegistry.getPerk(perkID)
		if(hasPerkDisabledOrNot(perk.id)):
			if(perk.hiddenWhenUnlocked()):
				continue
		else:
			if(perk.hiddenWhenLocked()):
				continue
		
		result.append(perkID)
	return result

func getSkill(skillID):
	if(!skills.has(skillID)):
		return null
	return skills[skillID]
	
func hasPerk(perkID):
	if(!perks.has(perkID)):
		return false
	if(disabledPerks.has(perkID) && disabledPerks[perkID]):
		return false
	return true

func hasPerkDisabledOrNot(perkID):
	if(!perks.has(perkID)):
		return false
	return true
	
func togglePerk(perkID):
	if(!perks.has(perkID)):
		return
	
	if(disabledPerks.has(perkID) && disabledPerks[perkID]):
		# make sure all the required perks are enabled
		var perk = perks[perkID]
		var requiredPerks = perk.getRequiredPerks()
		for requiredPerkID in requiredPerks:
			if(isPerkDisabled(requiredPerkID)):
				return
		
		disabledPerks.erase(perkID)
	else:
		disabledPerks[perkID] = true
	
		for childperkID in perks:
			var perk = perks[childperkID]
			
			# Automatically disabling perks that depend on this perk
			var requiredPerks = perk.getRequiredPerks()
			for requiredPerkID in requiredPerks:
				if(requiredPerkID == perkID):
					disabledPerks[childperkID] = true
					break

func isPerkDisabled(perkID):
	if(!perks.has(perkID)):
		return false
	
	if(disabledPerks.has(perkID) && disabledPerks[perkID]):
		return true
	return false
	
func addPerk(perkID):
	if(hasPerk(perkID)):
		return
	
	var newperk = GlobalRegistry.createPerk(perkID)
	newperk.setCharacter(npc)
	perks[perkID] = newperk

func removePerk(perkID):
	if(!hasPerk(perkID)):
		return
	
	perks[perkID].npc = null
	perks.erase(perkID)
	
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
			result -= perk.getCost()
	
	return result

func getLearnedPerkAmount(skillID):
	var result = 0
	for perkID in perks:
		var perk = perks[perkID]
		if(perk.getSkillGroup() == skillID):
			result += 1
	return result

func canUnlockPerk(perkID):
	if(hasPerkDisabledOrNot(perkID)):
		return false
	
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
	
	var requiredPerks = perk.getRequiredPerks()
	for requiredPerkID in requiredPerks:
		if(!hasPerk(requiredPerkID)):
			return false
		
	return true
	
func canUnlockAnyPerkInSkill(skillID):
	for perkID in GlobalRegistry.getPerksIDsBySkill(skillID):
		if(perks.has(perkID)):
			continue
		
		if(canUnlockPerk(perkID)):
			return true
	return false
	
func getPerkAttacks():
	var extraAttacks = []
	
	for perkID in perks:
		var perk = perks[perkID]
		
		var attacks = perk.addsAttacks()
		extraAttacks.append_array(attacks)
		
	extraAttacks.sort()
	return extraAttacks

func getPerks():
	return perks

func processBattleTurn():
	for perkID in perks:
		var perk = perks[perkID]
		perk.processBattleTurn()

func onSkillLevelChanged(skillID, _skillLevel):
	emit_signal("skillLevelChanged", skillID)

func getBuffs():
	var result = []
	
	for perkID in perks:
		var perk = perks[perkID]
		result.append_array(perk.getBuffs())
	
	return result

func getExtraPainThreshold():
	return int(pow(getStat(Stat.Vitality), 0.8) * 5)

func getExtraLustThreshold():
	var sexiness = getStat(Stat.Sexiness)
	#warning-ignore:integer_division
	var step: int = int(int(sexiness) / int(10))
	
	return step * 5

func getExtraStamina():
	return int(pow(getStat(Stat.Agility), 0.95) * 4)

func getDamageMultiplier(_damageType):
	if(_damageType == DamageType.Physical):
		return getStat(Stat.Strength)/50.0
	if(_damageType == DamageType.Lust):
		return getStat(Stat.Sexiness)/50.0
	return 0

func giveSkillExperienceBattleTurn():
	var pc = npc
	
	if(pc.hasEffect(StatusEffect.Naked)):
		pc.addSkillExperience(Skill.Exhibitionism, 2)
	
	if(pc.getInventory().hasRemovableRestraints()):
		pc.addSkillExperience(Skill.BDSM, 1)

func hoursPassed(_howmuch):
	var pc = npc
	
	# Don't award any experience if we're just sleeping/idling
	if(_howmuch >= 3):
		return
	
	if(pc.getInventory().hasRemovableRestraints()):
		pc.addSkillExperience(Skill.BDSM, 5)

	if(pc.hasEffect(StatusEffect.Naked)):
		pc.addSkillExperience(Skill.Exhibitionism, 5)

	if(pc.hasEffect(StatusEffect.HasCumInsideAnus) || pc.hasEffect(StatusEffect.HasCumInsideVagina) || pc.hasEffect(StatusEffect.HasCumInsideMouth)):
		pc.addSkillExperience(Skill.CumLover, 20)

	if(pc.hasEffect(StatusEffect.CoveredInCum)):
		pc.addSkillExperience(Skill.CumLover, 5)

func receivedCreampie(_charID):
	if(npc != null && npc.isPlayer()):
		npc.addSkillExperience(Skill.CumLover, 30)
		
func cameInsideSomeone(_charID):
	if(npc != null && npc.isPlayer()):
		npc.addSkillExperience(Skill.CumLover, 50)

func resetPickedPerks():
	for perkID in perks.keys():
		var perk : PerkBase = perks[perkID]
		
		if(perk.getSkillGroup() == Skill.Start):
			continue
			
		var _ok = perks.erase(perkID)

func resetStats():
	stats.clear()
