extends StatusEffectBase

func _init():
	id = StatusEffect.CoveredInCum
	isBattleOnly = false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
#	character.addPain(3)
	
#	turns -= 1
#	if(turns <= 0):
#		stop()
	
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
	
	if(messLevel > 1):
		messLevel = min(messLevel, BodilyFluids.MaxMessinessLevel)
		var damageBonus = 5 * messLevel
		var recievedDamageBonus = 10 * messLevel
		message += "\n[color=green]Lust damage: +"+str(damageBonus)+"%[/color]"
		message += "\n[color=red]Recieved lust damage: +"+str(recievedDamageBonus)+"%[/color]"
	
	return message

func getDamageMultiplierMod(_damageType):
	if(!character.isPlayer()):
		return 1
	
	if(_damageType == DamageType.Lust):
		var messLevel = character.getOutsideMessinessLevel()
		messLevel = min(messLevel, BodilyFluids.MaxMessinessLevel)
		if(messLevel > 1):
			return 1 + 0.05 * messLevel
	return 1

func getRecievedDamageMod(_damageType):
	if(!character.isPlayer()):
		return 1
	
	if(_damageType == DamageType.Lust):
		var messLevel = character.getOutsideMessinessLevel()
		messLevel = min(messLevel, BodilyFluids.MaxMessinessLevel)
		if(messLevel > 1):
			return 1 + 0.10 * messLevel
	return 1

func getEffectImage():
	return "res://UI/StatusEffectsPanel/images/mess.png"

func getEffectVisibleType():
	return StatusEffectsPanel.EffectType.Purple

func combine(_args = []):
	pass

#func saveData():
#	return {
#		"turns": turns,
#	}
#
#func loadData(_data):
#	turns = SAVE.loadVar(_data, "turns", 3)
