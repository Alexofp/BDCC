extends PerkBase

func _init():
	id = Perk.CumSwallower
	skillGroup = Skill.CumLover

func getVisibleName():
	return "Swallower"

func getVisibleDescription():
	return "You love cum so much you can lick-clean yourself during a battle and swallow it all!"

func getMoreDescription():
	return "You unlock a new ability 'Lick self clean' that you can use during fights. Swallowing different fluids will provide different effects. For example, licking cum will restore some stamina back depending on the amount."

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/stomach.png"
