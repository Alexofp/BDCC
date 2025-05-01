extends ItemBase

func _init():
	id = "TFUndoPill"
# MorphIn
# QuickShift
# MorphAway

func getVisibleName():
	return "MorphAway Pill"
	
func getDescription():
	return "A pill that's claiming to be able to [color=#"+Color.cyan.to_html()+"]undo any temporary transformation effects and return your body to its old self.[/color]"

func canUseInCombat():
	return true

func useInCombat(_attacker, _receiver):
	removeXOrDestroy(1)
	_attacker.undoAllTransformations()
	return "You swallow the MorphAway pill!"

func getPossibleActions():
	return [
		{
			"name": "Consume",
			"scene": "UseItemLikeInCombatScene",
			"description": "Take the pill",
		},
	]

func getPrice():
	return 30

func canSell():
	return true

func canCombine():
	return true

func addsIntoxication():
	return 0.0

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
		"name": "MorphAway",
		"usedName": "a MorphAway pill",
		"desc": getDescription(),
		"scoreOnSub": 0.0,#_domInfo.goalsScoreMax({SexGoal.FuckVaginal: 1.0, SexGoal.FuckAnal: 0.5}, _subInfo.charID)*_domInfo.fetishScore({Fetish.Breeding: 1.0}),
		"scoreOnSelf": 0.0,
		"scoreSubScore": 0.0,
		"canUseOnDom": dom.hasActiveTransformations(),
		"canUseOnSub": sub.hasActiveTransformations(),
		"maxUsesByNPC": 1,
	}

func useInSex(_receiver):
	_receiver.undoAllTransformations()
	return {
		text = "{USER.You} {USER.youVerb('feel')} like {USER.yourHis} old self.".replace("USER", _receiver.getID()),
	}

func getItemCategory():
	return ItemCategory.Medical

func getInventoryImage():
	return "res://Images/Items/medical/bluepill.png"
