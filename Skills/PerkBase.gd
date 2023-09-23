extends Reference
class_name PerkBase

var npc = null
var id = "error"
var skillGroup = Skill.Combat

func getVisibleName():
	return "Error"

func getVisibleDescription():
	return "Error bad"

func getMoreDescription():
	return ""

func runOnceWhenLearned():
	pass

func getSkillGroup():
	return skillGroup

func getSkillTier():
	return 0
	
func hiddenWhenLocked() -> bool:
	return false
	
func hiddenWhenUnlocked() -> bool:
	return false

func toggleable() -> bool:
	return true
	
func unlockable() -> bool:
	return true

func getPicture():
	return "res://Images/Perks/upgrade.png"

func getCost():
	return Util.maxi(int(getSkillTier() + 1), 0)

func getRequiredPerks():
	return []

func setCharacter(newnpc):
	npc = newnpc

func addsAttacks():
	return []

func processBattleTurn():
	pass
	
func getBuffs():
	return []

func buff(buffid, args = []):
	var buff: BuffBase = GlobalRegistry.createBuff(buffid)
	buff.initBuff(args)
	return buff

func saveData():
	return {
	}

func loadData(_data):
	#level = SAVE.loadVar(data, "level", 0)
	pass
