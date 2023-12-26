extends StatusEffectBase

func _init():
	id = StatusEffect.DrugStrong
	isBattleOnly = true
	
func initArgs(_args = []):
	if(_args.size() > 0):
		turns = _args[0]
	else:
		turns = 6
	
func processBattleTurn():
	turns -= 1
	if(turns <= 0):
		stop()
	
func processTime(_secondsPassed: int):
	pass

func getEffectName():
	return "Drug"

func getEffectDesc():
	return character.getName() + " is under an influence of a drug for " + str(turns) + " more turn"+("s" if turns != 1 else "")

func getEffectImage():
	return "res://Images/StatusEffects/overdose.png"

func getIconColor():
	return IconColorGreen

func combine(_args = []):
	if(_args.size() > 0):
		turns = max(_args[0], turns)
	else:
		turns = max(6, turns)

func saveData():
	return {
		"turns": turns,
	}
	
func loadData(_data):
	turns = SAVE.loadVar(_data, "turns", 6)

func getBuffs():
	return [
		buff(Buff.PhysicalDamageBuff, [50.0]),
		buff(Buff.ReceivedPhysicalDamageBuff, [-80.0]),
		buff(Buff.ReceivedLustDamageBuff, [-80.0]),
	]
