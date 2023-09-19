extends SkillBase

func _init():
	id = Skill.Start

func getVisibleName():
	return "Inherent"

func getVisibleDescription():
	return "Shows your inherent perks"

func scripted() -> bool:
	return true

func getPerkTiers():
	return [
		[0]
	]
