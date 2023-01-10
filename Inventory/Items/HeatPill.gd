extends ItemBase

func _init():
	id = "HeatPill"

func getVisibleName():
	return "Heat Pill"
	
func getDescription():
	return "Forces females into heat and primes them ready for breeding."

func canUseInCombat():
	return true

func useInCombat(_attacker, _receiver):
	removeXOrDestroy(1)
	_attacker.forceIntoHeat()
	#_attacker.updateNonBattleEffects()
	return _attacker.getName() + " took the pill"

func getPossibleActions():
	return [
		{
			"name": "Consume",
			"scene": "UseItemLikeInCombatScene",
			"description": "Take the pill",
		},
	]

func getPrice():
	return 2

func canSell():
	return true

func canCombine():
	return true

func addsIntoxication():
	return 0.4

func getTimedBuffs():
	return [
	]

func getBuffsDurationSeconds():
	return 60*60*12

func getTimedBuffsTurns():
	return [
	]

func getBuffsDurationTurns():
	return 5

func getTags():
	return [
		ItemTag.SoldByMedicalVendomat,
		]

func getBuyAmount():
	return 1

func useInSex(_receiver):
	_receiver.forceIntoHeat()
	_receiver.addEffect(StatusEffect.SexHeatDrug)
	_receiver.removeEffect(StatusEffect.SexAnaphrodisiacDrug)
	return {
		text = "{USER.You} {USER.youVerb('feel')} incredibly lusty.".replace("USER", _receiver.getID()),
	}

func getItemCategory():
	return ItemCategory.Medical
