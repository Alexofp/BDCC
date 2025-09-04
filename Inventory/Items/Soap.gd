extends ItemBase

func _init():
	id = "Soap"

func getVisibleName():
	return "Bio-Scrub Soap"
	
func getDescription():
	return "A small soap brick, good for one use. It turns into liquid when you rub it on skin, meaning you don’t need access to water. Some inmates call it liquid gold.\n- Removes any fluids that are covering your body.\n- Removes any bodywritings and tallymarks.\n- Removes all [b]PERMANENT[/b] bodywritings.\n- Provides a refreshing effect."

func getA():
	return "a"

func canUseInCombat():
	return true

func useInCombat(_attacker, _receiver):
	_attacker.clearBodywritings(true, true)
	_attacker.afterTakingAShower()
	removeXOrDestroy(1)
	return _attacker.getName() + " applied the bio-scrub soap!"

func getPossibleActions():
	if(GM.pc.getLocation() in ["main_shower1", "main_shower2"]): #Tshhh
		return [
			{
				"name": "Use",
				"scene": "UseItemLikeInCombatScene",
				"description": "Use the soap",
			},
			{
				"name": "Drop",
				"scene": "DropSoapScene",
				"description": "Drop the soap",
			},
		]
	return [
		{
			"name": "Use",
			"scene": "UseItemLikeInCombatScene",
			"description": "Use the soap",
		},
	]

func getPrice():
	return 100

func getSellPrice():
	return 5

func canSell():
	return true

func canCombine():
	return true

func getTags():
	return [
		#ItemTag.SoldByMedicalVendomat,
		ItemTag.SexEngineCanApply,
		]

func getItemCategory():
	return ItemCategory.Medical

func getInventoryImage():
	return "res://Images/Items/generic/soap.png"

func getSexEngineInfo(_sexEngine, _domInfo, _subInfo):
	#var sub:BaseCharacter = _subInfo.getChar()
	#var dom:BaseCharacter = _domInfo.getChar()
	
	return {
		"name": "Bio-Scrub Soap",
		"usedName": "soap",
		"desc": "Cleans the body. Is able to get rid of permanent writings.",
		"scoreOnSub": 0.0,
		"scoreOnSelf": 0.0,
		"scoreSubScore": 0.5 + _subInfo.getComplyScore(),
		"canUseOnDom": true,
		"canUseOnSub": true,
		"maxUsesByNPC": 2,
	}

func useInSex(_receiver):
	_receiver.clearBodywritings(true, true)
	_receiver.afterTakingAShower()
	return {
		text = "{USER.You} {USER.youVerb('feel')} clean.".replace("USER", _receiver.getID()),
	}
