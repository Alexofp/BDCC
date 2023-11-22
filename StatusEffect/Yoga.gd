extends StatusEffectBase

func _init():
	id = StatusEffect.Yoga
	isBattleOnly = false
	
func initArgs(_args = []):
	if(_args.size() > 0):
		turns = _args[0]
	else:
		turns = 12*60*60
	
func processBattleTurn():
	pass
	
func processTime(_secondsPassed: int):
	turns -= _secondsPassed
	if(turns <= 0):
		stop()

func getEffectName():
	return "Yoga"

func getEffectDesc():
	return "Doing yoga exercises made you more agile for "+Util.getTimeStringHumanReadable(turns)

func getEffectImage():
	return "res://Images/StatusEffects/lotus.png"

func getIconColor():
	return IconColorGreen

func combine(_args = []):
	if(_args.size() > 0):
		turns = max(_args[0], turns)

func getBuffs():
	return [
		buff(Buff.StatBuff, [Stat.Agility, 5]),
		buff(Buff.StatBuff, [Stat.Sexiness, 2]),
		buff(Buff.DodgeChanceBuff, [20.0]),
		buff(Buff.SkillExperienceBuff, [Skill.Exhibitionism, 50.0])
	]

func saveData():
	return {
		"turns": turns,
	}
	
func loadData(_data):
	turns = SAVE.loadVar(_data, "turns", 60*60)
