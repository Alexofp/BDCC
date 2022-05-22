extends StatusEffectBase

func _init():
	id = StatusEffect.Weakness
	isBattleOnly = true
	
func initArgs(_args = []):
	if(_args.size() > 0):
		turns = _args[0]
	else:
		turns = 3
	
func processBattleTurn():
	turns -= 1
	if(turns <= 0):
		stop()
	
func processTime(_secondsPassed: int):
	pass

func getEffectName():
	return "Weakness"

func getEffectDesc():
	return "You feel weak. " + str(turns) + " more turns"

func getEffectImage():
	return "res://Images/StatusEffects/kneeling.png"

func getIconColor():
	return IconColorRed

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
		buff(Buff.PhysicalDamageBuff, [-50.0]),
		buff(Buff.ReceivedPhysicalDamageBuff, [20.0]),
	]
