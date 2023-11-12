extends StatusEffectBase

func _init():
	id = StatusEffect.RapidConception
	isBattleOnly = false

func initArgs(_args = []):
	if(_args.size() > 0):
		turns = _args[0]
	else:
		turns = 12*60*60

func processTime(_secondsPassed: int):
	turns -= _secondsPassed
	if(turns <= 0):
		stop()

func getEffectName():
	return "Rapid Conception"

func getEffectDesc():
	return "You are more fertile and any pregnancies now progress faster! "+Util.getTimeStringHumanReadable(turns)

func getEffectImage():
	return "res://Images/StatusEffects/nested-hearts2.png"

func getIconColor():
	return IconColorGreen

func combine(_args = []):
	if(_args.size() > 0):
		turns = max(_args[0], turns)

func getBuffs():
	return [
		buff(Buff.FertilityBuff, [50.0]),
		buff(Buff.PregnancySpeedBuff, [100.0]),
	]

func saveData():
	return {
		"turns": turns,
	}
	
func loadData(_data):
	turns = SAVE.loadVar(_data, "turns", 60*60)
