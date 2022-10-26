extends SkillBase

func _init():
	id = Skill.Combat

func getVisibleName():
	return "Combat"

func getVisibleDescription():
	return "Shows how well you are at a physical hand-to-hand combat"

func getPerkTiers():
	return [
		[0],
		[5],
		[10],
	]
