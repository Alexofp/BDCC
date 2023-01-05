extends StatusEffectBase

var stacks = 0

func _init():
	id = StatusEffect.Wounded
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
	return "Wounded x"+str(stacks)

func getEffectDesc():
	if(stacks <= 1):
		return "Your chest kinda hurts.."
	if(stacks <= 2):
		return "Something inside your chest kinda hurts. And you think it won't heal on its own.."
	
	return "Something inside your chest hurts a lot. And you think it won't heal on its own.."

func getEffectImage():
	return "res://Images/StatusEffects/open-wound.png"

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
	if(stacks > 5):
		return [
			buff(Buff.AmbientPainBuff, [stacks*5]),
			buff(Buff.MaxStaminaBuff, [(stacks-5)*-5]),
		]
	
	return [
		buff(Buff.AmbientPainBuff, [stacks*5]),
	]
