extends PerkBase

func _init():
	id = HK_Perk.AmateurHypnotist
	skillGroup = HK_Skill.HypnosisSkill

func getVisibleName():
	return "Amateur Hypnotist"

func getVisibleDescription():
	return "You've learned the basics of the hypnotic arts."

func getMoreDescription():
	return """You can hypnotize a willing or adequately subdued subject. You can implant posthypnotic suggestions and trigger them in later encounters to affect the subject with one of the following effects:
	
Pleasure (increasing  [color="""+DamageType.getColorString(DamageType.Lust)+"""]Lust[/color])
Tiredness (reducing  [color="""+DamageType.getColorString(DamageType.Stamina)+"""]Stamina[/color])
Kneeling (dropping prone)
Blackout (stun)"""

func getSkillTier():
	return 1
	
func getCost():
	return 2

func getPicture():
	return "res://Modules/HypnokinkModule/Icons/Perks/watch.png"

func addsAttacks():
	return [
		HK_Attack.TriggerPleasure,
		HK_Attack.TriggerTiredness,
		HK_Attack.TriggerKneel,
		HK_Attack.TriggerStun
	]
