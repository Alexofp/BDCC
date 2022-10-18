extends SkillBase

func _init():
	id = Skill.SexSlave

func getVisibleName():
	return "Sex Slave"

func getVisibleDescription():
	return "Shows how skilled you are at sex with others"

func getPerkTiers():
	return [
		[0],
		[5],
		[10],
	]
