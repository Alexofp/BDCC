extends StatusEffectBase

var howMuchBlock:int

func _init():
	id = StatusEffect.Blocking
	isBattleOnly = true
	
func initArgs(_args = []):
	if(_args.size() > 0):
		turns = _args[0]
	else:
		turns = 1
	if(_args.size() > 1):
		howMuchBlock = _args[1]
	else:
		howMuchBlock = 80
	
func processBattleTurn():
	turns -= 1
	if(turns <= 0):
		stop()
	
func processTime(_secondsPassed: int):
	pass

func getEffectName():
	return "Blocking"

func getEffectDesc():
	return "You are actively blocking any physical attacks. " + str(turns) + " more turns"

func getEffectImage():
	return "res://Images/StatusEffects/blocking.png"

func getIconColor():
	return IconColorGreen

func getBuffs():
	return [
		buff(Buff.ReceivedPhysicalDamageBuff, [-howMuchBlock])
	]

func combine(_args = []):
	if(_args.size() > 0):
		turns = max(_args[0], turns)
	else:
		turns = max(1, turns)

func saveData():
	return {
		"turns": turns,
		"howMuchBlock": howMuchBlock,
	}
	
func loadData(_data):
	turns = SAVE.loadVar(_data, "turns", 3)
	howMuchBlock = SAVE.loadVar(_data, "howMuchBlock", 80)
