extends PerkBase

func _init():
	id = Perk.HypnosisLucidTrance
	skillGroup = Skill.Hypnosis

func getVisibleName():
	return "Lucid Trance"

func getVisibleDescription():
	return "You've become so accustomed to being hypnotized that a casual observer might not even be able to tell."

func getMoreDescription():
	return "Reduces the penalties of being hypnotized by an additional 30%.\n\nWhile in "+HypnokinkUtil.tranceIcon()+"Trance, you gain a 10% chance to dodge attacks."
	

func getSkillTier():
	return 2
	
func getCost():
	return 3
	
func getRequiredPerks():
	return [Perk.HypnosisDetachment]

func getPicture():
	return "res://Modules/HypnokinkModule/Icons/Perks/mask.png"
	
func getBuffs():
	if(HypnokinkUtil.isInTrance(npc)):
		return [
			buff(Buff.DodgeChanceBuff, [10]),
		]
	else:
		return []
	
func runOnceWhenLearned():
	GM.main.setFlag("HypnokinkModule.SoftOptIn", true)
	GM.pc.getSkillsHolder().getSkill(Skill.Hypnosis).checkDrawbacks()
