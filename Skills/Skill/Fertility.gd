extends SkillBase

func _init():
	id = Skill.Fertility

func getVisibleName():
	return "Fertility"

func getVisibleDescription():
	return "Shows how much you are used to being impregnated by local inhabitants"

func getPerkTiers():
	return [
		[0],
		[5],
		[10],
	]
