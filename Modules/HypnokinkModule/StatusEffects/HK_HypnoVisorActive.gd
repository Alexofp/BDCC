extends StatusEffectBase

func _init():
	id = HK_StatusEffect.HypnoVisorActive
	isBattleOnly = false
	
	alwaysCheckedForNPCs = true
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 50
	
func findVisor(_npc: BaseCharacter) -> ItemBase:
	var visors = _npc.inventory.getEquippedItemsWithTag("HK_HypnoVisor")
	if(len(visors) < 1):
		return null
	for candidate in visors:
		return candidate
	return null
	
func shouldApplyTo(_npc: BaseCharacter):
	var visor = findVisor(_npc)
	if(visor == null):
		return false
	return true
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	character.addEffect(HK_StatusEffect.Suggestible, [0.5])
	
func processTime(seconds: int):
	var minutes = (seconds / 60.0)
	if(minutes > 0 && minutes < 1.0):
		minutes = 1.0
	if(minutes > 1): #this is cheating, but I want walking around to generate visible amounts without longer times just filling up to max
		minutes /= 10
	character.addEffect(HK_StatusEffect.Suggestible, [2 * minutes])
	if(character.isPlayer()):
		var xpToday = GM.main.getFlag("HypnokinkModule.VisorXpToday", 0)
		#gain max one level per day
		var maxXp = SkillBase.getRequiredExperience(character.getSkillLevel(HK_Skill.HypnosisSkill))
		var gainableXp = maxXp - xpToday
		var xpToGain = min(gainableXp, minutes)
		if(xpToGain > 0):
			character.addSkillExperience(HK_Skill.HypnosisSkill, xpToGain)
			GM.main.setFlag("HypnokinkModule.VisorXpToday", xpToday + xpToGain)
			

func getEffectName():
	return "Under hypnosis"

func getEffectDesc():
	return "Your will is being eroded by a hypnotic device."

func getEffectImage():
	return "res://Modules/HypnokinkModule/Icons/StatusEffects/hypno_active.png"

func getIconColor():
	return IconColorPurple

func combine(_args = []):
	pass
