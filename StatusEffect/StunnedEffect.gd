extends StatusEffectBase

func _init():
	id = StatusEffect.Stunned
	isBattleOnly = true
	
func initArgs(_args = []):
	if(_args.size() > 0):
		turns = _args[0]
	else:
		turns = 1
	
func processBattleTurn():
	turns -= 1
	if(turns <= 0):
		stop()
	
func processTime(_secondsPassed: int):
	pass

func getEffectName():
	return "Stunned"

func getEffectDesc():
	return "You are stunned. " + str(turns) + " more turns"

func getEffectImage():
	return "res://Images/StatusEffects/knocked-out-stars.png"

func getIconColor():
	return IconColorRed

func getBuffs():
	return [
		buff(Buff.DodgeChanceBuff, [-50])
	]

func combine(_args = []):
	if(_args.size() > 0):
		turns = max(_args[0], turns)
	else:
		turns = max(1, turns)

func saveData():
	return {
		"turns": turns,
	}
	
func loadData(_data):
	turns = SAVE.loadVar(_data, "turns", 3)
