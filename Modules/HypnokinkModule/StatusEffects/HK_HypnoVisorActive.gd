extends StatusEffectBase

func _init():
	id = StatusEffect.HypnoVisorActive
	isBattleOnly = false
	
	alwaysCheckedForNPCs = true
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 50
	
func findVisor(_npc: BaseCharacter) -> ItemBase:
	if(_npc.getInventory().hasSlotEquipped(InventorySlot.Eyes)):
		var eyesItem =  _npc.getInventory().getEquippedItem(InventorySlot.Eyes)
		if(eyesItem.hasTag(ItemTag.Hypnovisor)):
			return eyesItem
	return null
	
func shouldApplyTo(_npc: BaseCharacter):
	var visor = findVisor(_npc)
	if(visor != null):
		return true
	return false
	
func initArgs(_args = []):
	pass
	
func addStacks(toAdd: int):
	var visor = findVisor(character)
	if(visor == null):
		return
		
	var diff = visor.maxHypnosisStacks() - HypnokinkUtil.getSuggestibleStacks(character)
	var change = min(diff, toAdd)
	if(change > 0):
		HypnokinkUtil.changeSuggestibilityBy(character, change)
		if(character.isPlayer()):
			var xpToday = GM.main.getFlag("HypnokinkModule.VisorXpToday", 0)
			#gain ~max one level per day
			var maxXp = SkillBase.getRequiredExperience(character.getSkillLevel(Skill.Hypnosis))
			var gainableXp = maxXp - xpToday
			var xpToGain = min(gainableXp, toAdd)
			if(xpToGain > 0):
				character.addSkillExperience(Skill.Hypnosis, xpToGain)
				GM.main.setFlag("HypnokinkModule.VisorXpToday", xpToday + xpToGain)
				
func processBattleTurn():
	addStacks(1)
	
func processTime(seconds: int):
	var minutes = (seconds / 60.0)
	if(minutes > 0 && minutes < 1.0):
		minutes = 1.0
	if(minutes > 1): #this is cheating, but I want walking around to generate visible amounts without longer times just filling up to max
		minutes /= 10
	
	addStacks(2 * minutes)
	
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
