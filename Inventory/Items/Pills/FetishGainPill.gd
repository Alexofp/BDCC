extends ItemBase

func _init():
	id = "FetishGainPill"

func getVisibleName():
	return "Fetish Pill"
	
func getDescription():
	return "A very strong drug that alters your mind's hormone balance, making it gain and lose fetishes quicker"

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
	return 0.3

func getTimedBuffs():
	return [
		buff(Buff.FetishGainBuff, [200]),
	]

func getBuffsDurationSeconds():
	return 60*60*1

func getTimedBuffsTurns():
	return [
	]

func getBuffsDurationTurns():
	return 5

func getTags():
	return [
		ItemTag.SexEngineDrug,
		]

func getBuyAmount():
	return 1

func getSexEngineInfo(_sexEngine, _domInfo, _subInfo):
	#var sub:BaseCharacter = _subInfo.getChar()
	#var dom:BaseCharacter = _domInfo.getChar()
	
	return {
		"name": "Fetish Pill",
		"usedName": "a fetish pill",
		"desc": "Makes you gain/lose fetishes faster.",
		"scoreOnSub": 0.0,
		"scoreOnSelf": 0.0,
		"scoreSubScore": _subInfo.fetishScore({Fetish.DrugUse: 1.0}),
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
