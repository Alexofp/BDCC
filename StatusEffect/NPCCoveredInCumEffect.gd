extends StatusEffectBase

var cumName = "cum"

func _init():
	id = StatusEffect.NPCCoveredInCum
	isBattleOnly = true
	
func initArgs(_args = []):
	if(_args.size() > 0):
		turns = _args[0]
		if(_args.size() > 1):
			cumName = _args[1]
	else:
		turns = 3
	
func processBattleTurn():
	turns -= 1
	if(turns <= 0):
		stop()
	
func processTime(_secondsPassed: int):
	pass

func getEffectName():
	return "Covered with "+cumName

func getEffectDesc():
	return character.getName()+" is covered with "+cumName+" for " + str(turns) + " more turns"

func getBuffs():
	return [
		buff(Buff.ReceivedLustDamageBuff, [10]),
	]

func getEffectImage():
	return "res://Images/StatusEffects/splurt.png"

func getIconColor():
	return IconColorPurple

func combine(_args = []):
	pass

func saveData():
	return {
		"turns": turns,
		"cumName": cumName,
	}
	
func loadData(_data):
	turns = SAVE.loadVar(_data, "turns", 3)
	cumName = SAVE.loadVar(_data, "cumName", "cum")
