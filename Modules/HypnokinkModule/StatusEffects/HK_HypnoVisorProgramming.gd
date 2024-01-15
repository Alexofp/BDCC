extends StatusEffectBase

var progress = 0

func _init():
	id = StatusEffect.HypnoVisorProgramming
	isBattleOnly = false
	
	alwaysCheckedForNPCs = false
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 50

func findProgrammedVisor(_npc: BaseCharacter) -> ItemBase:
	var visors = _npc.getInventory().getEquippedItemsWithTag(ItemTag.Hypnovisor)
	if(len(visors) < 1):
		return null
	for candidate in visors:
		if(candidate.has_method("programmedToSuppressPerk") and candidate.programmedToSuppressPerk() != ""):
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
	
func getRequiredProgressMult():
	var skills: SkillsHolder = character.getSkillsHolder()
	var mult = 1
	if(skills.hasPerkDisabledOrNot(Perk.HypnosisKeywordsDrawback) && skills.isPerkDisabled(Perk.HypnosisKeywordsDrawback)):
		mult *= 2
	if(skills.hasPerkDisabledOrNot(Perk.HypnosisFamousDrawback) && skills.isPerkDisabled(Perk.HypnosisFamousDrawback)):
		mult *= 2
	if(skills.hasPerkDisabledOrNot(Perk.HypnosisDeepTranceDrawback) && skills.isPerkDisabled(Perk.HypnosisDeepTranceDrawback)):
		mult *= 2
	return mult
	
func checkDone():
	var visor = findProgrammedVisor(character)
	if(visor == null):
		stop()
		return
		
	var skills: SkillsHolder = character.getSkillsHolder()
	
	var targetPerkId = visor.programmedToSuppressPerk()
	if(progress >= getRequiredProgressMult() * 100):
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
	return "Your visor is suppressing your "+targetPerk.getVisibleName()+" drawback.\n\nProgress: "+str(progress / getRequiredProgressMult())+"%"

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
