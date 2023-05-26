extends SkillBase

func _init():
	id = Skill.Pregnancy

func getVisibleName():
	return "Pregnancy"

func getVisibleDescription():
	return "Shows how much you are used to being bred by local inhabitants"

func getPerkTiers():
	return [
		[0],
		[5],
		[10],
	]
