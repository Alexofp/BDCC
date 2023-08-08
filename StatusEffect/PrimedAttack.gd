extends StatusEffectBase

var howMuchDamage:int

func _init():
	id = StatusEffect.PrimedAttack
	isBattleOnly = true
	
func initArgs(_args = []):
	if(_args.size() > 1):
		turns = _args[1]
	else:
		turns = 2
	if(_args.size() > 0):
		howMuchDamage = _args[0]
	else:
		howMuchDamage = 50
	
func processBattleTurn():
	turns -= 1
	if(turns <= 0):
		stop()
	
func processTime(_secondsPassed: int):
	pass

func getEffectName():
	return "Primed Attack"

func getEffectDesc():
	return "Your next attack is gonna do way more damage. Expires if not used in the next turn."

func getEffectImage():
	return "res://Images/StatusEffects/crosshair.png"

func getIconColor():
	return IconColorGreen

func getBuffs():
	return [
		buff(Buff.PhysicalDamageBuff, [howMuchDamage])
	]

func combine(_args = []):
	if(_args.size() > 0):
		turns = max(_args[0], turns)
	else:
		turns = max(1, turns)

func saveData():
	return {
		"turns": turns,
		"howMuchDamage": howMuchDamage,
	}
	
func loadData(_data):
	turns = SAVE.loadVar(_data, "turns", 3)
	howMuchDamage = SAVE.loadVar(_data, "howMuchDamage", 50)
