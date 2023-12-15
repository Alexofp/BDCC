extends PerkBase

func _init():
	id = Perk.HypnosisMantraMinded
	skillGroup = Skill.Hypnosis

func getVisibleName():
	return "Mantra Minded"

func getVisibleDescription():
	return "You've learned a set of short, relaxing mantras."
	
func getMoreDescription():
	return "Reduces the penalties of being hypnotized by 10%.\n\nYou gain an ability to regain stamina up to half of your hypnosis level.\nUsable once per combat."

func getSkillTier():
	return 0
	
func getCost():
	return 1

func getPicture():
	return "res://Modules/HypnokinkModule/Icons/Perks/peace.png"

func addsAttacks():
	return ["ReciteMantra"]
	
func runOnceWhenLearned():
	GM.main.setFlag("HypnokinkModule.SoftOptIn", true)
