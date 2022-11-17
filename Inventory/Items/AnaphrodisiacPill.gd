extends ItemBase

func _init():
	id = "AnaphrodisiacPill"

func getVisibleName():
	return "Anaphrodisiac Pill"
	
func getDescription():
	return "Kills your libido. Removes any lust you might have."

func canUseInCombat():
	return true

func useInCombat(_attacker, _receiver):
	removeXOrDestroy(1)
	_attacker.addLust(-_attacker.getLust())
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
	return 4

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
	_receiver.addEffect(StatusEffect.SexAnaphrodisiacDrug)
	_receiver.removeEffect(StatusEffect.SexHeatDrug)
	return {
		text = "{USER.You} {USER.youVerb('feel')} like {USER.youHe} lost passion for sex.".replace("USER", _receiver.getID()),
	}
