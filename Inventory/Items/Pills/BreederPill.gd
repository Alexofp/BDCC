extends ItemBase

func _init():
	id = "BreederPill"

func getVisibleName():
	return "Breeder Pill"
	
func getDescription():
	return "A very strong drug that alters your body's hormone balance, increasing pregnancy chance. Also significantly increases the quality of your semen"

func canUseInCombat():
	return true

func useInCombat(_attacker, _receiver):
	removeXOrDestroy(1)
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
	return 1

func canSell():
	return true

func canCombine():
	return true

func addsIntoxication():
	return 0.5

func getTimedBuffs():
	return [
		#buff(Buff.ExposureBuff, [100])
		buff(Buff.FertilityBuff, [100]),
		buff(Buff.VirilityBuff, [100]),
		buff(Buff.CrossSpeciesCompatibilityBuff, [20]),
	]

func getBuffsDurationSeconds():
	return 60*60*12

func getTimedBuffsTurns():
	return [
		#buff(Buff.MaxLustBuff, [-20]),
		#buff(Buff.MaxPainBuff, [20]),
	]

func getBuffsDurationTurns():
	return 5

func getTags():
	return [
		ItemTag.SoldByMedicalVendomat,
		ItemTag.SexEngineDrug,
		]

func getBuyAmount():
	return 3

func getSexEngineInfo(_sexEngine, _domInfo, _subInfo):
	#var sub:BaseCharacter = _subInfo.getChar()
	#var dom:BaseCharacter = _domInfo.getChar()
	
	return {
		"name": "Breeder pill",
		"usedName": "a breeder pill",
		"desc": "Makes you more fertile and your cum more virile.",
		"scoreOnSub": _domInfo.goalsScoreMax({SexGoal.ReceiveVaginal: 1.0, SexGoal.ReceiveAnal: 0.2}, _subInfo.charID)*_domInfo.fetishScore({Fetish.BeingBred: 1.0}),
		"scoreOnSelf": _domInfo.goalsScoreMax({SexGoal.FuckVaginal: 1.0, SexGoal.FuckAnal: 0.2}, _subInfo.charID)*_domInfo.fetishScore({Fetish.Breeding: 1.0}),
		"scoreSubScore": _subInfo.fetishScore({Fetish.Breeding: 1.0}),
		"canUseOnDom": true,
		"canUseOnSub": true,
		"maxUsesByNPC": 1,
	}

func useInSex(_receiver):
	_receiver.addTimedBuffs(getTimedBuffs(), getBuffsDurationSeconds())
	#return {
	#	text = "{USER.You} {USER.youVerb('feel')} like {USER.youHe} became more fertile and virile.".replace("USER", _receiver.getID()),
	#}

func getItemCategory():
	return ItemCategory.Medical
