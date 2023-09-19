extends PerkBase

func _init():
	id = "NewTestBuffPerk"

func getVisibleName():
	return "New test buff perk"

func getVisibleDescription():
	return "New test buff perk"

func getPicture():
	return "res://Images/Perks/Skill_Icon_FertilityBetterOvulation.png"

func getBuffs():

	return [
		buff("NewTestBuff", [0])
	]
