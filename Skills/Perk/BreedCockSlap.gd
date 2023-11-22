extends PerkBase

func _init():
	id = Perk.BreedCockSlap
	skillGroup = Skill.Breeder

func getVisibleName():
	return "Size Matters"

func getVisibleDescription():
	return "Harness the strength of your cock to slap enemies into submission! You get a new Special 'Cock Slap' attack that scales depending on how heavy your cock is (how much cum is in it)!"

func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/cockslap.png"

func getBuffs():
	return [
	]

func addsAttacks():
	return ["CockSlapPCAttack"]
