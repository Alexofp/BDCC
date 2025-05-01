extends ItemBase

func _init():
	id = "TFAcceleratePill"

func getVisibleName():
	return "QuickShift Pill"
	
func getDescription():
	return "A pill that's claiming to be able to [color=#"+Color.cyan.to_html()+"]accelerate the progression of any transformation.[/color]"

func canUseInCombat():
	return true

func useInCombat(_attacker, _receiver):
	removeXOrDestroy(1)
	#_attacker.undoAllTransformations()
	return "You swallow the QuickShift pill!"

func getPossibleActions():
	return [
		{
			"name": "Consume",
			"scene": "UseItemLikeInCombatScene",
			"description": "Take the pill",
		},
	]

func getPrice():
	return 10

func canSell():
	return true

func canCombine():
	return true

func addsIntoxication():
	return 0.0

func getTimedBuffs():
	return [
		buff(Buff.TransformationSpeedBuff, [5000.0]),
	]

func getBuffsDurationSeconds():
	return 60*20

func getTimedBuffsTurns():
	return [
	]

func getBuffsDurationTurns():
	return 5

func getTags():
	return [
		#ItemTag.SoldByMedicalVendomat,
		ItemTag.SexEngineDrug,
		ItemTag.KeptAfterDrugDenRun,
		]

func getBuyAmount():
	return 1

func getSexEngineInfo(_sexEngine, _domInfo, _subInfo):
	var sub:BaseCharacter = _subInfo.getChar()
	var dom:BaseCharacter = _domInfo.getChar()
	
	return {
		"name": "QuickShift",
		"usedName": "a QuickShift pill",
		"desc": getDescription(),
		"scoreOnSub": 0.5 if sub.hasActiveTransformations() else 0.0,#_domInfo.goalsScoreMax({SexGoal.FuckVaginal: 1.0, SexGoal.FuckAnal: 0.5}, _subInfo.charID)*_domInfo.fetishScore({Fetish.Breeding: 1.0}),
		"scoreOnSelf": 0.0,
		"scoreSubScore": 0.0,
		"canUseOnDom": dom.hasActiveTransformations(),
		"canUseOnSub": sub.hasActiveTransformations(),
		"maxUsesByNPC": 1,
	}

func useInSex(_receiver):
	_receiver.addTimedBuffs(getTimedBuffs(), getBuffsDurationSeconds())
	
	return {
		text = "{USER.You} {USER.youVerb('feel')} like something inside {USER.youHim} is changing fast..".replace("USER", _receiver.getID()),
	}

func getItemCategory():
	return ItemCategory.Medical

func getInventoryImage():
	return "res://Images/Items/medical/purplepill.png"
