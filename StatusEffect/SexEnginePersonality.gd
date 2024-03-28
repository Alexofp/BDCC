extends StatusEffectBase

func _init():
	id = StatusEffect.SexEnginePersonality
	isBattleOnly = false
	
	alwaysCheckedForNPCs = true
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 49
	
func shouldApplyTo(_npc):
	if(GM.main != null && GM.main.supportsSexEngine()):
		return true
	if(_npc.hasEnslaveQuest()):
		return true
	if(_npc.isSlaveToPlayer()):
		var npcSlave:NpcSlave = _npc.getNpcSlavery()
		if(npcSlave.isReadyToBeLeveledUp()):
			return true
	return false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Personality"

func getEffectDesc():
	var personality: Personality = character.getPersonality()
	if(personality == null):
		return "Error"
	
	var texts = []
	for statID in PersonalityStat.getAll():
		var value = personality.getStat(statID)
		var statName = PersonalityStat.getVisibleName(statID)
		var statValue = PersonalityStat.getVisibleDesc(statID, value)
		
		texts.append(statName+": "+statValue)
	var result = Util.join(texts, "\n")

	if(character.hasEnslaveQuest()):
		var enslaveQuest:NpcEnslavementQuest = character.getEnslaveQuest()
		var isQuestCompleted = enslaveQuest.isEverythingCompleted()
		
		result += "\n\n[color="+("yellow" if !isQuestCompleted else "green")+"]Enslavement progress:[/color]\n"
		result += enslaveQuest.getQuestProgressText()
		if(isQuestCompleted):
			result += "\nReady to be enslaved!"

	if(character.isSlaveToPlayer()):
		var npcSlave:NpcSlave = character.getNpcSlavery()
		if(npcSlave.isReadyToBeLeveledUp()):
			result += "\n\n[color=yellow]Slave level-up progress:[/color]\n"
			result += npcSlave.getLevelupTaskProgressText()

	return result

func getEffectImage():
	return "res://Images/StatusEffects/recruitment.png"

func getIconColor():
	return IconColorPurple

func combine(_args = []):
	pass

func getBuffs():
	return []
