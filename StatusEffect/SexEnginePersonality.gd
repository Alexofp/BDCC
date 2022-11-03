extends StatusEffectBase

func _init():
	id = StatusEffect.SexEnginePersonality
	isBattleOnly = false
	
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
	return Util.join(texts, "\n")

func getEffectImage():
	return "res://Images/StatusEffects/recruitment.png"

func getIconColor():
	return IconColorPurple

func combine(_args = []):
	pass

func getBuffs():
	return []
