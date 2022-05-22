extends StatusEffectBase

func _init():
	id = StatusEffect.ArtificialHeat
	isBattleOnly = true
	
func initArgs(_args = []):
	if(_args.size() > 0):
		turns = _args[0]
	else:
		turns = 3
	
func processBattleTurn():
	character.addLust(3)
	
	turns -= 1
	if(turns <= 0):
		stop()
	
func processTime(_secondsPassed: int):
	pass

func getEffectName():
	return "Artificial Heat"

func getEffectDesc():
	return "3 lust per turn. " + str(turns) + " more turns"

func getEffectImage():
	return "res://Images/StatusEffects/smoke-bomb.png"

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
