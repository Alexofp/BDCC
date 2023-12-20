extends PerkBase

func _init():
	id = Perk.HypnosisVisorMastery
	skillGroup = Skill.Hypnosis

func getVisibleName():
	return "M1nd H4X"

func getVisibleDescription():
	return "You discovered where the config menu button is hidden on hypnotic visors."

func getMoreDescription():
	return 	"You can program hypnotic visors to suppress one of your hypnotic drawbacks."+"\n\n"+\
			"When forcing an opponent to wear a hypnotic visor, their hypnosis level will immediately rise to 50% if it is lower."

func getSkillTier():
	return 2
	
func getCost():
	return 3
	
func getRequiredPerks():
	return [Perk.HypnosisGoodAtVisors]

func getPicture():
	return "res://Modules/HypnokinkModule/Icons/Perks/visor3.png"
	
func runOnceWhenLearned():
	GM.main.setFlag("HypnokinkModule.SoftOptIn", true)
	GM.pc.getSkillsHolder().getSkill(Skill.Hypnosis).checkDrawbacks()
