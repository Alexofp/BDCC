extends PerkBase

func _init():
	id = Perk.HypnosisDetachment
	skillGroup = Skill.Hypnosis

func getVisibleName():
	return "Detachment"

func getVisibleDescription():
	return "You've become good enough at being a hypnotic subject to partially disassociate even from physical pain."
	
func getMoreDescription():
	return  "Reduces the penalties of being hypnotized by an additional 20%." + "\n\n" + \
			"While "+HypnokinkUtil.hypnosisIcon()+"Hypnotized or in "+HypnokinkUtil.tranceIcon()+"Trance, you gain +10% resistance to pain."

func getSkillTier():
	return 1
	
func getCost():
	return 2
	
func getRequiredPerks():
	return [Perk.HypnosisMantraMinded]

func getPicture():
	return "res://Modules/HypnokinkModule/Icons/Perks/stoic.png"
	
func getBuffs():
	if(HypnokinkUtil.isHypnotized(npc)):
		return [
			buff(Buff.ReceivedPhysicalDamageBuff, [-10]),
		]
	else:
		return []
		
func runOnceWhenLearned():
	GM.main.setFlag("HypnokinkModule.SoftOptIn", true)
	GM.pc.getSkillsHolder().getSkill(Skill.Hypnosis).checkDrawbacks()
