extends PerkBase

func _init():
	id = Perk.HypnosisGoodAtVisors
	skillGroup = Skill.Hypnosis

func getVisibleName():
	return "Visor Wise"

func getVisibleDescription():
	return "You have become intimately familiar with what wearing a hypnotic visor is like."
	
func getMoreDescription():
	return 	"You can attempt to remove hypnotic visors even in "+HypnokinkUtil.tranceIcon()+"Trance."+"\n\n"+\
			"When forcing an opponent to wear a hypnotic visor, their hypnosis level will immediately rise to 30% if it is lower."

func getSkillTier():
	return 1
	
func getCost():
	return 2

func getPicture():
	return "res://Modules/HypnokinkModule/Icons/Perks/visor2.png"
	
func runOnceWhenLearned():
	GM.main.setFlag("HypnokinkModule.SoftOptIn", true)
	GM.pc.getSkillsHolder().getSkill(Skill.Hypnosis).checkDrawbacks()
