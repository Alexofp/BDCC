extends StatusEffectBase

var howMuchDodge = 95

func _init():
	id = StatusEffect.Evading
	isBattleOnly = true
	
func initArgs(_args = []):
	if(_args.size() > 0):
		turns = _args[0]
	else:
		turns = 1
	if(_args.size() > 1):
		howMuchDodge = _args[1]
	
func processBattleTurn():
	turns -= 1
	if(turns <= 0):
		stop()
	
func processTime(_secondsPassed: int):
	pass

func getEffectName():
	return "Evading"

func getEffectDesc():
	return "You are focused on dodging enemy attacks. " + str(turns) + " more turns"

func getEffectImage():
	return "res://Images/StatusEffects/dodging.png"

func getIconColor():
	return IconColorGreen

func getBuffs():
	return [
		buff(Buff.DodgeChanceBuff, [howMuchDodge])
	]

func combine(_args = []):
	if(_args.size() > 0):
		turns = max(_args[0], turns)
	else:
		turns = max(1, turns)

func saveData():
	return {
		"turns": turns,
		"howMuchDodge": howMuchDodge,
	}
	
func loadData(_data):
	turns = SAVE.loadVar(_data, "turns", 3)
	howMuchDodge = SAVE.loadVar(_data, "howMuchDodge", 95)
