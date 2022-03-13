extends Reference
class_name PerkBase

var npc = null
var id = "error"
var skillGroup = Skill.Fighting

func getVisibleName():
	return "Error"

func getVisibleDescription():
	return "Error bad"

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

func saveData():
	return {
	}

func loadData(_data):
	#level = SAVE.loadVar(data, "level", 0)
	pass
