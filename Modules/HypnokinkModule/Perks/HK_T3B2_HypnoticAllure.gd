extends PerkBase

func _init():
	id = Perk.HypnosisHypnoticAllure
	skillGroup = Skill.Hypnosis

func getVisibleName():
	return "Hypnotic Allure"

func getVisibleDescription():
	return "You can make yourself alluring to the point of ensnaring minds."
	
func getMoreDescription():
	return "Swaying your hips will now have a truly hypnotic effect, increasing your opponent's hypnosis level with a chance equal to your own hypnosis level."

func getSkillTier():
	return 2
	
func getCost():
	return 3

func getPicture():
	return "res://Modules/HypnokinkModule/Icons/Perks/hips.png"
	
func runOnceWhenLearned():
	GM.main.setFlag("HypnokinkModule.SoftOptIn", true)
	GM.pc.getSkillsHolder().getSkill(Skill.Hypnosis).checkDrawbacks()
