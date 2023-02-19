extends StatusEffectBase

func _init():
	id = StatusEffect.SoreNipplesAfterMilking
	isBattleOnly = false

func initArgs(_args = []):
	if(_args.size() > 0):
		turns = _args[0]
	else:
		turns = 4*60*60

func processTime(_secondsPassed: int):
	turns -= _secondsPassed
	if(turns <= 0):
		stop()

func getEffectName():
	return "Sore nipples"

func getEffectDesc():
	return "Your nips feel sore.. "+Util.getTimeStringHumanReadable(turns)

func getEffectImage():
	return "res://Images/StatusEffects/breasts-pain.png"

func getIconColor():
	return IconColorRed

func combine(_args = []):
	if(_args.size() > 0):
		turns = max(_args[0], turns)

func getBuffs():
	return [
		buff(Buff.AmbientPainBuff, [30.0]),
		buff(Buff.BreastsMilkProductionBuff, [-50.0]),
	]

func saveData():
	return {
		"turns": turns,
	}
	
func loadData(_data):
	turns = SAVE.loadVar(_data, "turns", 60*60)
