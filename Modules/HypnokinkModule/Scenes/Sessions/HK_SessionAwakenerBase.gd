extends SceneBase
class_name HK_SessionAwakenerBase

func onAwakener():
	processTime(10*60)
	GM.pc.removeEffect(StatusEffect.UnderHypnosis)
	
	var currentStacks = HK_Utils.getSuggestibleStacks(GM.pc)
	
	if(getFlag("HypnokinkModule.VionMode") == HK_Utils.VionGood):
		HypnokinkModule.changeSuggestibilityBy(GM.pc, -currentStacks)
	if(getFlag("HypnokinkModule.VionMode") == HK_Utils.VionNeutral):
		HypnokinkModule.changeSuggestibilityBy(GM.pc, -currentStacks / 2)
	if(getFlag("HypnokinkModule.VionMode") == HK_Utils.VionEvil):
		pass #mean Vion just leaves you hypnotized
		
func afterAwakener():
	
	if(getFlag("HypnokinkModule.VionMode") == HK_Utils.VionGood):
		GM.pc.addSkillExperience(Skill.Hypnosis, 40)
	if(getFlag("HypnokinkModule.VionMode") == HK_Utils.VionNeutral):
		GM.pc.addSkillExperience(Skill.Hypnosis, 60)
	if(getFlag("HypnokinkModule.VionMode") == HK_Utils.VionEvil):
		GM.pc.addSkillExperience(Skill.Hypnosis, 80)
		
	setFlag("HypnokinkModule.LastSessionTime", (GM.main.currentDay * 24*60*60) + GM.main.timeOfDay)
