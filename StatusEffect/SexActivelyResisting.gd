extends StatusEffectBase

func _init():
	id = "SexActivelyResisting"
	isSexEngineOnly = true
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processSexTurnContex(_contex = {}):
	if(character.getCustomAttribute(BuffAttribute.ForcedObedience) > 0.0):
		stop()
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Actively Resisting"

func getEffectDesc():
	return "This person will actively resist during sex."

func getEffectImage():
	return "res://Images/StatusEffects/shattered-heart.png"

func getIconColor():
	return IconColorRed

func combine(_args = []):
	pass

func getBuffs():
	return [
		buff(Buff.ActiveResistanceInSexBuff, [100])
	]
