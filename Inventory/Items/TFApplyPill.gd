extends ItemBase

func _init():
	id = "TFApplyPill"

func getVisibleName():
	return "MorphIn Pill"
	
func getDescription():
	return "A pill that's claiming to be able to [color=#"+Color.cyan.to_html()+"]turn any temporary transformation effects into permanent ones, meaning there will be no way to undo them anymore![/color]"

func canUseInCombat():
	return true

func useInCombat(_attacker, _receiver):
	removeXOrDestroy(1)
	_attacker.makeAllTransformationsPermanent()
	return "You swallow the MorphIn pill!"

func getPossibleActions():
	return [
		{
			"name": "Consume",
			"scene": "UseItemLikeInCombatScene",
			"description": "Take the pill",
		},
	]

func getPrice():
	return 20

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
		"name": "MorphIn",
		"usedName": "a [b][color=#"+Color.cyan.to_html()+"]MorphIn[/color][/b] pill",
		"desc": getDescription(),
		"scoreOnSub": 0.1*sqrt(float(sub.getTFTotalStagesSum())) if OPTIONS.isContentEnabled(ContentType.ForcedPermanentTFs) && sub.hasActiveTransformations() else 0.0,
		"scoreOnSelf": 0.0,
		"scoreSubScore": _subInfo.fetishScore({Fetish.TFReceiving: 1.0}),
		"canUseOnDom": dom.hasActiveTransformations(),
		"canUseOnSub": sub.hasActiveTransformations(),
		"maxUsesByNPC": 1,
	}

func useInSex(_receiver):
	_receiver.makeAllTransformationsPermanent()
	return {
		text = "{USER.You} {USER.youVerb('feel')} different..".replace("USER", _receiver.getID()),
	}

func getItemCategory():
	return ItemCategory.Medical

func getInventoryImage():
	return "res://Images/Items/medical/redpill.png"
