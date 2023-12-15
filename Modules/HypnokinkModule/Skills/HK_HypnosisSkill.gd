extends SkillBase
			
func _init():
	id = Skill.Hypnosis
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
	if(levelParam >= 1):
		if(!npc.hasPerk(Perk.KeywordsDrawback)):
			npc.skillsHolder.addPerk(Perk.KeywordsDrawback)
			flashDrawbackMessage(GlobalRegistry.getPerk(Perk.KeywordsDrawback))
	if(levelParam >= 3):
		if(!npc.hasPerk(Perk.FamousDrawback)):
			npc.skillsHolder.addPerk(Perk.FamousDrawback)
			flashDrawbackMessage(GlobalRegistry.getPerk(Perk.FamousDrawback))
	if(levelParam >= 5):
		if(!npc.hasPerk(Perk.DeepTranceDrawback)):
			npc.skillsHolder.addPerk(Perk.DeepTranceDrawback)
			flashDrawbackMessage(GlobalRegistry.getPerk(Perk.DeepTranceDrawback))
			
func flashDrawbackMessage(drawbackPerk: PerkBase):
	if(npc != GM.pc):
		return;
	if(GM.ui):
		GM.main.addMessage("You have gained a new drawback: "+drawbackPerk.getVisibleName()+"!")
