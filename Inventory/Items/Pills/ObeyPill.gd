extends ItemBase

func _init():
	id = "ObeyPill"

func getVisibleName():
	return "Slave Candy"
	
func getDescription():
	return "A glossy, pastel-colored pill that melts on the tongue. Designed to override willpower and force submission. [color=red]Avoid overdosing[/color].\n\nForcefully breaks anyone that you are trying to enslave, allowing you to skip the manual process. Can only be used during sex."

func canUseInCombat():
	return false

#func useInCombat(_attacker, _receiver):
#	removeXOrDestroy(1)
#	_attacker.addLust(-_attacker.getLust())
#	return _attacker.getName() + " took the pill"

func getPossibleActions():
	return [
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
	var didUnlockThese := false
	if(GM.main != null && GM.main.getFlag("SlaveAuctionModule.repLevel", 0) >= 3):
		didUnlockThese = true
	
	if(didUnlockThese):
		return [
			ItemTag.SoldByMirri,
			ItemTag.SexEngineDrug,
			ItemTag.Illegal,
			]
	return [
		ItemTag.SexEngineDrug,
		ItemTag.Illegal,
	]

func getBuyAmount():
	return 1

func getSexEngineInfo(_sexEngine, _domInfo:SexDomInfo, _subInfo):
	var sub:BaseCharacter = _subInfo.getChar()
	#var dom:BaseCharacter = _domInfo.getChar()
	
	var didUnlockThese := false
	if(GM.main != null && GM.main.getFlag("SlaveAuctionModule.repLevel", 0) >= 3):
		didUnlockThese = true
	
	return {
		"name": "Slave Candy",
		"usedName": "a suspicious pill",
		"desc": "Forces submission. Auto-completes any slave-breaking tasks. Has a potential bad effect on the mind.",
		"scoreOnSub": _domInfo.personalityScore({PersonalityStat.Subby:-0.2}) if didUnlockThese else 0.0,
		"scoreOnSelf": 0.0,
		"scoreSubScore": _subInfo.fetishScore({Fetish.DrugUse: 1.0}) - 0.5,
		
		"canUseOnDom": false,
		"canUseOnSub": !sub.hasEffect("SexSpacedOut"),
		"maxUsesByNPC": 2,
	}

func useInSex(_receiver):
	if(_receiver.isSlaveToPlayer()):
		var npcSlavery:NpcSlave = _receiver.getNpcSlavery()
		npcSlavery.addObedience(0.4)
		npcSlavery.addBrokenSpirit(0.4)
		npcSlavery.addSpoiling(-0.7)
		npcSlavery.addAwareness(0.2)
		npcSlavery.addDespair(RNG.randf_range(0.1, 0.3) + 0.05 * npcSlavery.tiredness)
		npcSlavery.addTired(1.0)
		if(npcSlavery.isReadyToBeLeveledUp()):
			npcSlavery.doLevelup()
	elif(_receiver.hasEnslaveQuest()):
		var enslaveQuest:NpcEnslavementQuest = _receiver.getEnslaveQuest()
		enslaveQuest.forceComplete()
	
	
	if(_receiver.hasEffect("SexObeyDrug")):
		_receiver.addEffect("SexSpacedOut")
		
		return {
			text = "{USER.Your} mind goes bye-bye, {USER.yourHis} expression spaced out.".replace("USER", _receiver.getID()),
		}
	else:
		_receiver.addEffect("SexObeyDrug")
	return {
		text = "{USER.You} suddenly {USER.youVerb('feel')} extremely subby.".replace("USER", _receiver.getID()),
	}

func getItemCategory():
	return ItemCategory.Medical

func getInventoryImage():
	return "res://Images/Items/medical/candy.png"
