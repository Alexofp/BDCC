extends StatusEffectBase

func _init():
	id = StatusEffect.Intoxicated
	isBattleOnly = false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Intoxicated"

func getEffectDesc():
	if(!character.isPlayer()):
		return "You're intoxicated"
	
	var intoxication: float = character.getIntoxicationLevel()

	return "You are "+str(round(intoxication*100.0))+"% intoxicated"

func getEffectImage():
	return "res://UI/StatusEffectsPanel/images/mouth.png"

func getIconColor():
	return IconColorRed

func combine(_args = []):
	pass

func getBuffs():
	var intoxication: float = character.getIntoxicationLevel()
	
	if(intoxication >= 0.8):
		return [
			buff(Buff.ExposureBuff, [100]),
			buff(Buff.ReceivedLustDamageBuff, [40]),
		]
	
	if(intoxication >= 0.4):
		return [
			buff(Buff.ExposureBuff, [50]),
		]
	
	return [
	]
