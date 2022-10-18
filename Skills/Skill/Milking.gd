extends SkillBase

func _init():
	id = Skill.Milking

func getVisibleName():
	return "Milking"

func getVisibleDescription():
	return "Shows how much you like being milked"

func getPerkTiers():
	return [
		[0],
		[5],
		[10],
	]
