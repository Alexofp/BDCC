extends PerkBase

func _init():
	id = HK_Perk.FastAsleep
	skillGroup = HK_Skill.HypnosisSkill

func getVisibleName():
	return "Fast Asleep"

func getVisibleDescription():
	return "You can quickly fall into a deep slumber."
	
func getMoreDescription():
	return 	"Resting in your cell is now twice as effective."+"\n\n"+\
			"Buffs gained from hypnosis sessions are stronger and last longer."

func getSkillTier():
	return 0
	
func getCost():
	return 1

func getPicture():
	return "res://Modules/HypnokinkModule/Icons/Perks/zzz.png"

func getBuffs():
	return [
		buff(HK_Buff.RestEffectivenessBuff, [1.0]),
	]
