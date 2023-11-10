extends StatusEffectBase

func _init():
	id = StatusEffect.WorkOut
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
	return "Work out"

func getEffectDesc():
	return "Doing weights exercises made you more powerful for "+Util.getTimeStringHumanReadable(turns)

func getEffectImage():
	return "res://Images/StatusEffects/biceps.png"

func getIconColor():
	return IconColorGreen

func combine(_args = []):
	if(_args.size() > 0):
		turns = max(_args[0], turns)

func getBuffs():
	return [
		buff(Buff.StatBuff, [Stat.Strength, 5]),
		buff(Buff.StatBuff, [Stat.Vitality, 2]),
		buff(Buff.PhysicalArmorBuff, [20]),
		buff(Buff.SkillExperienceBuff, [Skill.Combat, 100.0])
	]

func saveData():
	return {
		"turns": turns,
	}
	
func loadData(_data):
	turns = SAVE.loadVar(_data, "turns", 60*60)
