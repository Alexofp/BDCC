extends StatusEffectBase

func _init():
	id = "MirriStealth"
	isBattleOnly = true
	
func initArgs(_args = []):
	if(_args.size() > 0):
		turns = _args[0]
	else:
		turns = 2
	
func processBattleTurn():
	turns -= 1
	if(turns <= 0):
		stop()
	
func processTime(_secondsPassed: int):
	pass

func getEffectName():
	return "Stealth suit"

func getEffectDesc():
	return "Stealth suit activated for " + str(turns) + " more turn"+("s" if turns != 1 else "")

func getEffectImage():
	return "res://Images/StatusEffects/invisible.png"

func getIconColor():
	return IconColorGreen

func combine(_args = []):
	if(_args.size() > 0):
		turns = max(_args[0], turns)
	else:
		turns = max(3, turns)

func saveData():
	return {
		"turns": turns,
	}
	
func loadData(_data):
	turns = SAVE.loadVar(_data, "turns", 3)

func getBuffs():
	return [
		buff(Buff.DodgeChanceBuff, [80.0]),
	]
