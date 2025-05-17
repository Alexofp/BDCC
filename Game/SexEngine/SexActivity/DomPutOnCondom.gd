extends SexActivityBase

func _init():
	id = "DomPutOnCondom"
	startedByDom = true
	startedBySub = false
	
	activityName = "Wear condom"
	activityDesc = "Condom manipulation"
	activityCategory = ["Wear"]

func getGoals():
	return {
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		SexType.StocksSex: true,
		SexType.SlutwallSex: true,
	}

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return 0.0

func getStartActions(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var dom:BaseCharacter = _domInfo.getChar()
	var sub:BaseCharacter = _subInfo.getChar()
	
	if(dom.isPlayer() && !dom.hasCondoms()):
		return []
	
	if(!_sexEngine.hasTag(_domInfo.charID, SexActivityTag.PenisInside) && dom.hasReachablePenis() && !dom.getInventory().hasSlotEquipped(InventorySlot.Penis) && dom.getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
		var wearCondomScore:float = getActivityScoreCustomGoals({SexGoal.SubOptionalCondomOnDom: 1.0}, _sexEngine, _domInfo, _subInfo) * (_domInfo.fetishScore({Fetish.Condoms:1.0}) - _domInfo.fetishScore({Fetish.Breeding:1.0}))
		addStartAction(["dom"], "Wear condom", "Put on your best condom", wearCondomScore, {A_CATEGORY: ["Wear"]})

	if(!_sexEngine.hasTag(_subInfo.charID, SexActivityTag.PenisInside) && sub.hasReachablePenis() && !sub.getInventory().hasSlotEquipped(InventorySlot.Penis) && sub.getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
		var condomOnSubScore:float = getActivityScoreCustomGoals({SexGoal.SubOptionalCondomOnSub: 1.0}, _sexEngine, _domInfo, _subInfo) * (_domInfo.fetishScore({Fetish.Condoms:1.0}) - _domInfo.fetishScore({Fetish.BeingBred:1.0}))
		addStartAction(["sub"], "Put condom on sub", "Put on your best condom on the sub", condomOnSubScore, {A_CATEGORY: ["Wear"]})

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return [SexActivityTag.HandsUsed]
	return []

func startActivity(_args):
	var breakChance:float = 20
	if(getDom().isPlayer()):
		breakChance = getDom().useBestCondom()
	
	var condomItem:ItemBase = GlobalRegistry.createItem("UsedCondom")
	condomItem.breakChance = breakChance
	
	endActivity()
	
	if(_args[0] == "dom"):
		getDom().getInventory().equipItem(condomItem)
		
		addText("{dom.You} {dom.youVerb('put')} a condom on {dom.yourHis} cock.")
		talk(DOM_0, SUB_0, SexReaction.DomPutsOnACondom)
		return
	if(_args[0] == "sub"):
		getSub().getInventory().equipItem(condomItem)
	
		addText("{dom.You} {dom.youVerb('put')} a condom on {sub.your} cock.")
		talk(DOM_0, SUB_0, SexReaction.DomPutsOnACondomOnSub)
		return
