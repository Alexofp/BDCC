extends StatusEffectBase

var progress = 0

func _init():
	id = HK_StatusEffect.HypnoVisorProgramming
	isBattleOnly = false
	
	alwaysCheckedForNPCs = false
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 50

func findProgrammedVisor(_npc: BaseCharacter) -> ItemBase:
	var visors = _npc.inventory.getEquippedItemsWithTag("HK_HypnoVisor")
	if(len(visors) < 1):
		return null
	for candidate in visors:
		if(candidate.programmedToSuppressPerk() != ""):
			return candidate
	return null
	
func shouldApplyTo(_npc: BaseCharacter):
	var visor = findProgrammedVisor(_npc)
	if(visor != null):
		return true
	return false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	progress += 0.5
	checkDone()
	
func processTime(seconds: int):
	var minutes = (seconds / 60.0)
	if(minutes > 1): #this is cheating, but I want walking around to generate visible amounts without longer times just filling up to max
		minutes /= 10
	progress += 5 * minutes
	checkDone()
	
func checkDone():
	var visor = findProgrammedVisor(character)
	if(visor == null):
		stop()
		return
		
	var skills: SkillsHolder = character.skillsHolder
	#ensure perks are enabled
	if(skills.hasPerkDisabledOrNot(HK_Perk.KeywordsDrawback) && skills.isPerkDisabled(HK_Perk.KeywordsDrawback)):
		skills.togglePerk(HK_Perk.KeywordsDrawback)
	if(skills.hasPerkDisabledOrNot(HK_Perk.FamousDrawback) && skills.isPerkDisabled(HK_Perk.FamousDrawback)):
		skills.togglePerk(HK_Perk.FamousDrawback)
	if(skills.hasPerkDisabledOrNot(HK_Perk.DeepTranceDrawback) && skills.isPerkDisabled(HK_Perk.DeepTranceDrawback)):
		skills.togglePerk(HK_Perk.DeepTranceDrawback)
		
		
	var targetPerkId = visor.programmedToSuppressPerk()
	if(progress >= 100):
		if(skills.hasPerkDisabledOrNot(targetPerkId) && !skills.isPerkDisabled(targetPerkId)):
			skills.togglePerk(targetPerkId)
		visor.programToSuppressPerk("")
		stop()
		return

func getEffectName():
	return "Reprogramming"

func getEffectDesc():
	var visor = findProgrammedVisor(character)
	if(visor == null):
		return "ERROR: This status effect should have dissapeared!"
	var targetPerk: PerkBase = GlobalRegistry.getPerk(visor.programmedToSuppressPerk())
	return "Your visor is suppressing your "+targetPerk.getVisibleName()+" drawback.\n\nProgress: "+str(progress)+"%"

func getEffectImage():
	return "res://Modules/HypnokinkModule/Icons/Perks/visor3.png"

func getIconColor():
	return IconColorPurple

func saveData():
	return {
		"progress": progress,
	}
	
func loadData(_data):
	progress = SAVE.loadVar(_data, "progress", 0)
