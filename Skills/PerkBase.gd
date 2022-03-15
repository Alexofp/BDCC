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

func getSkillGroup():
	return skillGroup

func getSkillTier():
	return 0

func getPicture():
	return "res://icon.png"

func getCost():
	return 1

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
