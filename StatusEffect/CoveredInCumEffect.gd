extends StatusEffectBase

func _init():
	id = StatusEffect.CoveredInCum
	isBattleOnly = false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_secondsPassed: int):
	pass

func getEffectName():
	return "Messy"

func getEffectDesc():
	if(!character.isPlayer()):
		return character.getName()+" is covered with cum"
	
	var messLevel = character.getOutsideMessinessLevel()
	var messFluids = character.getOutsideMessinessFluidList()
	
	var message = BodilyFluids.getOutsideMessinessMessage(messLevel, messFluids)

	return message

func getBuffs():
	if(!character.isPlayer()):
		return [
			buff(Buff.LustDamageBuff, [5]),
			buff(Buff.ReceivedLustDamageBuff, [10]),
		]
	
	var messLevel = character.getOutsideMessinessLevel()
	messLevel = min(messLevel, BodilyFluids.MaxMessinessLevel)

	if(messLevel <= 1):
		return []
		
	if(character.hasPerk(Perk.CumSlut)):
		return [
			buff(Buff.LustDamageBuff, [5 * messLevel]),
		]
		
	return [
		buff(Buff.LustDamageBuff, [5 * messLevel]),
		buff(Buff.ReceivedLustDamageBuff, [10 * messLevel]),
	]

func getEffectImage():
	return "res://UI/StatusEffectsPanel/images/mess.png"

func getIconColor():
	return IconColorPurple

func combine(_args = []):
	pass
