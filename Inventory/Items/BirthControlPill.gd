extends ItemBase

func _init():
	id = "BirthControlPill"

func getVisibleName():
	return "Birth Control Pill"
	
func getDescription():
	return "Alters the hormone balance of your body, significantly reducing pregnancy chance. Take one every 24 hours for the best effect."

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
	return 2

func canSell():
	return true

func canCombine():
	return true

func addsIntoxication():
	return 0.0

func getTimedBuffs():
		
	return [
		#buff(Buff.ExposureBuff, [100])
		buff(Buff.FinalFertilityModifierBuff, [-99]),
		buff(Buff.FinalVirilityModifierBuff, [-99]),
	]

func getBuffsDurationSeconds():
	return 60*60*24

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
	return 5

func getSexEngineInfo(_sexEngine, _domInfo, _subInfo):
	#var sub:BaseCharacter = _subInfo.getChar()
	#var dom:BaseCharacter = _domInfo.getChar()
	
	return {
		"name": "Birth control pill",
		"usedName": "a birth control pill",
		"desc": "Makes you mostly sterile for a while.",
		"scoreOnSub": _domInfo.goalsScoreMax({SexGoal.FuckVaginal: 1.0, SexGoal.FuckAnal: 0.1}, _subInfo.charID)*_domInfo.fetishScore({Fetish.Breeding: -1.0}),
		"scoreOnSelf": _domInfo.goalsScoreMax({SexGoal.ReceiveVaginal: 1.0, SexGoal.ReceiveAnal: 0.1}, _subInfo.charID)*_domInfo.fetishScore({Fetish.BeingBred: -1.0}),
		"scoreSubScore": _subInfo.fetishScore({Fetish.BeingBred: -1.0}),
		"canUseOnDom": true,
		"canUseOnSub": true,
		"maxUsesByNPC": 1,
	}

func useInSex(_receiver):
	_receiver.addTimedBuffs(getTimedBuffs(), getBuffsDurationSeconds())

func getItemCategory():
	return ItemCategory.Medical
