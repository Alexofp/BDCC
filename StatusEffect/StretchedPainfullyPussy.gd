extends StatusEffectBase

var stacks = 0

func _init():
	id = StatusEffect.StretchedPainfullyPussy
	isBattleOnly = false
	isSexEngineOnly = false
	
func initArgs(_args = []):
	if(_args.size() > 0):
		stacks = _args[0]
	else:
		stacks = 1
	
func processBattleTurn():
	pass
	
func processTime(_secondsPassed: int):
	pass

func onSleeping():
	if(stacks <= 1):
		stop()

func getEffectName():
	return "Pussy painfully stretched x"+str(stacks)

func getEffectDesc():
	if(stacks <= 1):
		return "Your pussy looks bruised and kinda hurts.. A day of rest might help"
	if(stacks <= 2):
		return "Your pussy got so bruised that it won't heal on its own.. You should find a doctor"
	
	return "Your pussy sustained a lot of damage and won't heal on its own.. You should find a doctor"

func getEffectImage():
	return "res://Images/StatusEffects/vulva.png"

func getIconColor():
	return IconColorRed

func combine(_args = []):
	if(_args.size() > 0):
		stacks += _args[0]
	else:
		stacks += 1

	if(stacks <= 0):
		stop()

func saveData():
	return {
		"stacks": stacks,
	}
	
func loadData(_data):
	stacks = SAVE.loadVar(_data, "stacks", 1)

func getBuffs():
	if(stacks <= 1):
		return [
			buff(Buff.AmbientPainBuff, [5]),
			buff(Buff.NoRecoverVaginaBuff),
			buff(Buff.SensitivityRestoreBuff, [BodypartSlot.Vagina, -100.0]),
			buff(Buff.SensitivityGainBuff, [BodypartSlot.Vagina, -20.0 - (stacks-1)*30.0]),
			buff(Buff.OverstimulationThresholdBuff, [BodypartSlot.Vagina, -10.0 - (stacks-1)*20.0]),
		]
	
	return [
		buff(Buff.AmbientPainBuff, [4+stacks*2]),
		buff(Buff.NoRecoverVaginaBuff),
		buff(Buff.SensitivityRestoreBuff, [BodypartSlot.Vagina, -100.0]),
		buff(Buff.SensitivityGainBuff, [BodypartSlot.Vagina, -100.0]),
		buff(Buff.OverstimulationThresholdBuff, [BodypartSlot.Vagina, -50.0]),
	]
