extends ItemBase

func _init():
	id = "EggGrowthPill"

func getVisibleName():
	return "EggBoost Pill"
	
func getDescription():
	return "A pill that will greatly speed up the growth of eggs in your body. Be ready to lay them soon after! The pharmacist who called this pill 'Eggcelerator' got fired the same day."

func canUseInCombat():
	return true

func useInCombat(_attacker, _receiver):
	removeXOrDestroy(1)
	
	# Ovipositor penis eggs
	if(_attacker.hasPenis()):
		var thePenis = _attacker.getBodypart(BodypartSlot.Penis)
		if(thePenis.fluidProduction):
			thePenis.fluidProduction.boostEggProduction()
	
	var theCycle = _attacker.getMenstrualCycle()
	if(theCycle):
		theCycle.boostBigEggs()
	
	return "You swallow the EggBoost pill!"

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
		#ItemTag.KeptAfterDrugDenRun,
		#ItemTag.TFItem,
		]

func getBuyAmount():
	return 1

func getSexEngineInfo(_sexEngine, _domInfo, _subInfo):
	#var sub:BaseCharacter = _subInfo.getChar()
	#var dom:BaseCharacter = _domInfo.getChar()
	
	return {
		"name": "EggBoost",
		"usedName": "an EggBoost pill",
		"desc": getDescription(),
		"scoreOnSub": 0.0,
		"scoreOnSelf": 0.0,
		"scoreSubScore": _subInfo.fetishScore({Fetish.BeingBred: 1.0})+0.20,
		"canUseOnDom": true,
		"canUseOnSub": true,
		"maxUsesByNPC": 1,
	}

func useInSex(_receiver):
	
	if(_receiver.hasPenis()):
		var thePenis = _receiver.getBodypart(BodypartSlot.Penis)
		if(thePenis.fluidProduction):
			thePenis.fluidProduction.boostEggProduction()
	
	var theCycle = _receiver.getMenstrualCycle()
	if(theCycle):
		theCycle.boostBigEggs()
	return {
		text = "{USER.You} {USER.youVerb('feel')} boosted!".replace("USER", _receiver.getID()),
	}

func getItemCategory():
	return ItemCategory.Medical

func getInventoryImage():
	return "res://Images/Items/medical/pill.png"

func getInventoryImageColor():
	return Color.darkgreen
