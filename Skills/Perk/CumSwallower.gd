extends PerkBase

func _init():
	id = Perk.CumSwallower
	skillGroup = Skill.CumLover

func getVisibleName():
	return "Swallower"

func getVisibleDescription():
	return "You love cum so much you can lick-clean yourself during a battle and swallow it all, gaining stamina!"

func getMoreDescription():
	return "You unlock a new ability 'Lick self clean' that you can use during fights. It removes any cum you might have on you and gives you 10 stamina for each layer that there was with the maximum being 50 stamina"

func getCost():
	return 1
func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/stomach.png"

func addsAttacks():
	return ["lickSelfPerkAttack"]
