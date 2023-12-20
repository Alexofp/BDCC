extends SceneBase

func onAwakener():
	processTime(10*60)
	GM.pc.removeEffect(HK_StatusEffect.UnderHypnosis)
	
	var currentStacks = HK_CharUtil.getSuggestibleStacks(GM.pc)
	
	if(getFlag("HypnokinkModule.VionMode") == HK_Consts.VionGood):
		HK_CharUtil.changeSuggestibilityBy(GM.pc, -currentStacks)
	if(getFlag("HypnokinkModule.VionMode") == HK_Consts.VionNeutral):
		HK_CharUtil.changeSuggestibilityBy(GM.pc, -currentStacks / 2)
	if(getFlag("HypnokinkModule.VionMode") == HK_Consts.VionEvil):
		pass #mean Vion just leaves you hypnotized
		
func afterAwakener():
	
	if(getFlag("HypnokinkModule.VionMode") == HK_Consts.VionGood):
		GM.pc.addSkillExperience(HK_Skill.HypnosisSkill, 40)
	if(getFlag("HypnokinkModule.VionMode") == HK_Consts.VionNeutral):
		GM.pc.addSkillExperience(HK_Skill.HypnosisSkill, 60)
	if(getFlag("HypnokinkModule.VionMode") == HK_Consts.VionEvil):
		GM.pc.addSkillExperience(HK_Skill.HypnosisSkill, 80)
		
	setFlag("HypnokinkModule.LastSessionTime", (GM.main.currentDay * 24*60*60) + GM.main.timeOfDay)
