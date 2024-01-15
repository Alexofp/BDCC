extends SceneBase

func onAwakener():
	processTime(10*60)
	GM.pc.removeEffect(StatusEffect.UnderHypnosis)
	
	var currentStacks = HypnokinkUtil.getSuggestibleStacks(GM.pc)
	
	if(getFlag("HypnokinkModule.VionMode") == HypnokinkUtil.VionGood):
		HypnokinkUtil.changeSuggestibilityBy(GM.pc, -currentStacks)
	if(getFlag("HypnokinkModule.VionMode") == HypnokinkUtil.VionNeutral):
		HypnokinkUtil.changeSuggestibilityBy(GM.pc, -currentStacks / 2)
	if(getFlag("HypnokinkModule.VionMode") == HypnokinkUtil.VionEvil):
		pass #mean Vion just leaves you hypnotized
		
func afterAwakener():
	
	if(getFlag("HypnokinkModule.VionMode") == HypnokinkUtil.VionGood):
		GM.pc.addSkillExperience(Skill.Hypnosis, 40)
	if(getFlag("HypnokinkModule.VionMode") == HypnokinkUtil.VionNeutral):
		GM.pc.addSkillExperience(Skill.Hypnosis, 60)
	if(getFlag("HypnokinkModule.VionMode") == HypnokinkUtil.VionEvil):
		GM.pc.addSkillExperience(Skill.Hypnosis, 80)
		
	setFlag("HypnokinkModule.LastSessionTime", (GM.main.currentDay * 24*60*60) + GM.main.timeOfDay)
