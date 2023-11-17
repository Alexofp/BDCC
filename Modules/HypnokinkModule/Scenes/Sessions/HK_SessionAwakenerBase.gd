extends SceneBase
class_name HK_SessionAwakenerBase

func onAwakener():
	processTime(10*60)
	GM.pc.removeEffect(HK_StatusEffect.UnderHypnosis)
	
	var currentStacks = HK_CharUtil.getSuggestibleStacks(GM.pc)
	
	if(getFlag("HypnokinkModule.VionMode") == HK_Enums.VionMode.GOOD):
		HK_CharUtil.changeSuggestibilityBy(GM.pc, -currentStacks)
	if(getFlag("HypnokinkModule.VionMode") == HK_Enums.VionMode.NEUTRAL):
		HK_CharUtil.changeSuggestibilityBy(GM.pc, -currentStacks / 2)
	if(getFlag("HypnokinkModule.VionMode") == HK_Enums.VionMode.EVIL):
		pass #mean Vion just leaves you hypnotized
		
func afterAwakener():
	
	if(getFlag("HypnokinkModule.VionMode") == HK_Enums.VionMode.GOOD):
		GM.pc.addSkillExperience(HK_Skill.HypnosisSkill, 40)
	if(getFlag("HypnokinkModule.VionMode") == HK_Enums.VionMode.NEUTRAL):
		GM.pc.addSkillExperience(HK_Skill.HypnosisSkill, 60)
	if(getFlag("HypnokinkModule.VionMode") == HK_Enums.VionMode.EVIL):
		GM.pc.addSkillExperience(HK_Skill.HypnosisSkill, 80)
		
	setFlag("HypnokinkModule.LastSessionTime", (GM.main.currentDay * 24*60*60) + GM.main.timeOfDay)
