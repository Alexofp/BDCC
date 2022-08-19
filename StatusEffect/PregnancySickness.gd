extends StatusEffectBase

func _init():
	id = StatusEffect.PregnancySickness
	isBattleOnly = false

func initArgs(_args = []):
	if(_args.size() > 0):
		turns = _args[0]
	else:
		turns = 2*60*60 + RNG.randi_range(0, 60*60)

func processTime(_secondsPassed: int):
	turns -= _secondsPassed
	if(turns <= 0):
		stop()

func getEffectName():
	return "Morning sickness"

func getEffectDesc():
	return "You feel dizzy.. "+Util.getTimeStringHumanReadable(turns)

func getEffectImage():
	return "res://Images/StatusEffects/headache.png"

func getIconColor():
	return IconColorRed

func combine(_args = []):
	if(_args.size() > 0):
		turns = max(_args[0], turns)

func getBuffs():
	return [
		buff(Buff.AmbientPainBuff, [20.0]),
	]

func saveData():
	return {
		"turns": turns,
	}
	
func loadData(_data):
	turns = SAVE.loadVar(_data, "turns", 60*60)
