extends SkillBase
			
func _init():
	id = Skill.Hypnosis
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
		if(!npc.getSkillsHolder().hasPerkDisabledOrNot(Perk.HypnosisKeywordsDrawback)):
			npc.getSkillsHolder().addPerk(Perk.HypnosisKeywordsDrawback)
			flashDrawbackMessage(GlobalRegistry.getPerk(Perk.HypnosisKeywordsDrawback))
	if(level >= 3):
		if(!npc.getSkillsHolder().hasPerkDisabledOrNot(Perk.HypnosisFamousDrawback)):
			npc.getSkillsHolder().addPerk(Perk.HypnosisFamousDrawback)
			flashDrawbackMessage(GlobalRegistry.getPerk(Perk.HypnosisFamousDrawback))
	if(level >= 5):
		if(!npc.getSkillsHolder().hasPerkDisabledOrNot(Perk.HypnosisDeepTranceDrawback)):
			npc.getSkillsHolder().addPerk(Perk.HypnosisDeepTranceDrawback)
			flashDrawbackMessage(GlobalRegistry.getPerk(Perk.HypnosisDeepTranceDrawback))
			
func flashDrawbackMessage(drawbackPerk: PerkBase):
	if(npc != GM.pc):
		return;
	if(GM.ui):
		GM.main.addMessage("You have gained a new drawback: "+drawbackPerk.getVisibleName()+"!")
