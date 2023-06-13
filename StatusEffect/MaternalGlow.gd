extends StatusEffectBase

func _init():
	id = StatusEffect.MaternalGlow
	isBattleOnly = false
	
func initArgs(_args = []):
	if(_args.size() > 0):
		turns = _args[0]
	else:
		turns = 48*60*60
	
func processBattleTurn():
	pass
	
func processTime(_secondsPassed: int):
	turns -= _secondsPassed
	if(turns <= 0):
		stop()

func getEffectName():
	return "Maternal glow"

func getEffectDesc():
	return "Giving birth made you feel more accomplished and worthy for "+Util.getTimeStringHumanReadable(turns)

func getEffectImage():
	return "res://Images/StatusEffects/Invigoration.png"

func getIconColor():
	return IconColorGreen

func combine(_args = []):
	if(_args.size() > 0):
		turns = max(_args[0], turns)

func getBuffs():
	return [
		buff(Buff.MaxLustBuff, [30.0]),
		buff(Buff.MaxPainBuff, [30.0]),
		buff(Buff.MaxStaminaBuff, [30.0])
	]

func saveData():
	return {
		"turns": turns,
	}
	
func loadData(_data):
	turns = SAVE.loadVar(_data, "turns", 60*60)
