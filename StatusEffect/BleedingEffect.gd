extends StatusEffectBase

func _init():
	id = StatusEffect.Bleeding
	isBattleOnly = true
	
func initArgs(_args = []):
	if(_args.size() > 0):
		turns = _args[0]
	else:
		turns = 3
	
func processBattleTurn():
	character.addPain(3)
	
	turns -= 1
	if(turns <= 0):
		stop()
	
func processTime(_secondsPassed: int):
	pass

func getEffectName():
	return "Bleeding"

func getEffectDesc():
	return "I'm losing 3 health a turn. " + str(turns) + " more turns"

func getEffectImage():
	return "res://Images/StatusEffects/bleeding-wound.png"

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
