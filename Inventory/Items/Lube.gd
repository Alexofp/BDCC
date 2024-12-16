extends ItemBase

func _init():
	id = "lube"

func getVisibleName():
	return "Lube"
	
func getDescription():
	return "Personal lubricant that is water-based, insuring no irritation. Works both for vaginal and anal use, your orifices recover faster and don't stretch as much"

func getA():
	return ""

func canUseInCombat():
	return true

func useInCombat(_attacker, _receiver):
	_attacker.addEffect(StatusEffect.LubedUp, [8*60*60])
	removeXOrDestroy(1)
	return _attacker.getName() + " applied lube!"

func getPossibleActions():
	return [
		{
			"name": "Apply",
			"scene": "UseItemLikeInCombatScene",
			"description": "Apply the lube",
		},
	]

func getPrice():
	return 1

func canSell():
	return true

func canCombine():
	return true

func getTags():
	return [
		ItemTag.SoldByMedicalVendomat,
		ItemTag.SexEngineCanApply,
		]

func getItemCategory():
	return ItemCategory.Medical

func getInventoryImage():
	return "res://Images/Items/medical/lubricant.png"

func getSexEngineInfo(_sexEngine, _domInfo, _subInfo):
	var sub:BaseCharacter = _subInfo.getChar()
	var dom:BaseCharacter = _domInfo.getChar()
	
	return {
		"name": "Lube",
		"usedName": "lube",
		"desc": "Makes your holes more sensitive.",
		"scoreOnSub": _sexEngine.hasGoalScore(_domInfo, SexGoal.SubOptionalApplyLubeOnSub, _subInfo)*(0.5-_domInfo.fetishScore({Fetish.Sadism: 0.5})),
		"scoreOnSelf": _sexEngine.hasGoalScore(_domInfo, SexGoal.SubOptionalApplyLubeOnDom, _subInfo)*(0.5-_domInfo.fetishScore({Fetish.Masochism: 0.5})),
		"scoreSubScore": _subInfo.getComplyScore(),
		"canUseOnDom": !dom.hasEffect(StatusEffect.LubedUp) && dom.getFirstItemThatCoversBodypart(BodypartSlot.Anus) == null,
		"canUseOnSub": !sub.hasEffect(StatusEffect.LubedUp) && sub.getFirstItemThatCoversBodypart(BodypartSlot.Anus) == null,
		"maxUsesByNPC": 2,
	}

func useInSex(_receiver):
	_receiver.addEffect(StatusEffect.LubedUp)
	return {
		text = "{USER.You} {USER.youVerb('feel')} ready.".replace("USER", _receiver.getID()),
	}
