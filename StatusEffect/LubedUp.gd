extends StatusEffectBase

func _init():
	id = StatusEffect.LubedUp
	isBattleOnly = false
	
func initArgs(_args = []):
	if(_args.size() > 0):
		turns = _args[0]
	else:
		turns = 4*60*60
	
func processBattleTurn():
	pass
	
func processTime(_secondsPassed: int):
	turns -= _secondsPassed
	if(turns <= 0):
		stop()

func getEffectName():
	return "Lubed up"

func getEffectDesc():
	return "Your orifices stretch less from insertions and recover faster for "+Util.getTimeStringHumanReadable(turns)

func getEffectImage():
	return "res://Images/StatusEffects/transparent-slime.png"

func getIconColor():
	return IconColorGreen

func combine(_args = []):
	if(_args.size() > 0):
		turns = max(_args[0], turns)

func getBuffs():
	return [
		buff(Buff.GenitalElasticityBuff, [300.0]),
		buff(Buff.GenitalResistanceBuff, [300.0]),
		buff(Buff.SensitivityRestoreBuff, [BodypartSlot.Vagina, 500.0]),
		buff(Buff.SensitivityRestoreBuff, [BodypartSlot.Anus, 500.0]),
		buff(Buff.OverstimulationThresholdBuff, [BodypartSlot.Vagina, 50.0]),
		buff(Buff.OverstimulationThresholdBuff, [BodypartSlot.Anus, 50.0]),
	]

func saveData():
	return {
		"turns": turns,
	}
	
func loadData(_data):
	turns = SAVE.loadVar(_data, "turns", 60*60)
