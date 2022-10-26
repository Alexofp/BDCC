extends SkillBase

func _init():
	id = Skill.BDSM

func getVisibleName():
	return "BDSM"

func getVisibleDescription():
	return "Shows how used you are to restraints"

func getPerkTiers():
	return [
		[0],
		[5],
		[10],
	]
