extends SkillBase
			
func _init():
	id = HK_Skill.HypnosisSkill
	var _e = connect("experienceChanged", self, "_on_experienceChanged")
	var _s = connect("levelChanged", self, "_on_levelChanged")

func getVisibleName():
	return "Hypnosis"

func getVisibleDescription():
	return "Shows the control you display over your own subconscious."

func getPerkTiers():
	return [
		[0],
		[2],
		[5],
	]
func _on_experienceChanged():
	checkDrawbacks()

func _on_levelChanged(idParam, _levelParam):
	if(id != idParam):
		return
	checkDrawbacks()
	
func checkDrawbacks():
	if(npc == null):
		return
	if(not GM.main.getFlag("HypnokinkModule.SoftOptIn", false)):
		return
	if(level >= 1):
		if(!npc.getSkillsHolder().hasPerkDisabledOrNot(HK_Perk.KeywordsDrawback)):
			npc.getSkillsHolder().addPerk(HK_Perk.KeywordsDrawback)
			flashDrawbackMessage(GlobalRegistry.getPerk(HK_Perk.KeywordsDrawback))
	if(level >= 3):
		if(!npc.getSkillsHolder().hasPerkDisabledOrNot(HK_Perk.FamousDrawback)):
			npc.getSkillsHolder().addPerk(HK_Perk.FamousDrawback)
			flashDrawbackMessage(GlobalRegistry.getPerk(HK_Perk.FamousDrawback))
	if(level >= 5):
		if(!npc.getSkillsHolder().hasPerkDisabledOrNot(HK_Perk.DeepTranceDrawback)):
			npc.getSkillsHolder().addPerk(HK_Perk.DeepTranceDrawback)
			flashDrawbackMessage(GlobalRegistry.getPerk(HK_Perk.DeepTranceDrawback))
			
func flashDrawbackMessage(drawbackPerk: PerkBase):
	if(npc != GM.pc):
		return;
	if(GM.ui):
		GM.main.addMessage("You have gained a new drawback: "+drawbackPerk.getVisibleName()+"!")
