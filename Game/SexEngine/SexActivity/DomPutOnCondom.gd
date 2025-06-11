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
	
	if(!_sexEngine.hasTag(_domInfo.charID, SexActivityTag.PenisInside) && dom.hasReachablePenis()):
		var wearCondomScore:float = getActivityScoreCustomGoals({SexGoal.SubOptionalCondomOnDom: 1.0}, _sexEngine, _domInfo, _subInfo) * (_domInfo.fetishScore({Fetish.Condoms:1.0}) - _domInfo.fetishScore({Fetish.Breeding:1.0}))
		if(!dom.getInventory().hasSlotEquipped(InventorySlot.Penis) && dom.getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
			addStartAction(["dom"], "Wear condom", "Put on your best condom", wearCondomScore, {A_CATEGORY: ["Wear"]})
		if(dom.getWornCondom() != null && dom.getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
			var domremCondomScore:float = 1.0
			if(wearCondomScore > 0.0 && !dom.isWearingNonEmptyCondom()):
				domremCondomScore = 0.0
			addStartAction(["domrem"], "Remove condom", "Take off your condom", domremCondomScore, {A_CATEGORY: ["Wear"]})
			
		
	if(!_sexEngine.hasTag(_subInfo.charID, SexActivityTag.PenisInside) && sub.hasReachablePenis()):
		var condomOnSubScore:float = getActivityScoreCustomGoals({SexGoal.SubOptionalCondomOnSub: 1.0}, _sexEngine, _domInfo, _subInfo) * (_domInfo.fetishScore({Fetish.Condoms:1.0}) - _domInfo.fetishScore({Fetish.BeingBred:1.0}))
		if(!sub.getInventory().hasSlotEquipped(InventorySlot.Penis) && sub.getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
			addStartAction(["sub"], "Put condom on sub", "Put on your best condom on the sub", condomOnSubScore, {A_CATEGORY: ["Wear"]})
		if(sub.getWornCondom() != null && sub.getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
			var subremCondomScore:float = 1.0
			if(condomOnSubScore > 0.0 && !sub.isWearingNonEmptyCondom()):
				subremCondomScore = 0.0
			addStartAction(["subrem"], "Remove sub's condom", "Take off the sub's condom", subremCondomScore, {A_CATEGORY: ["Wear"]})
			
func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return [SexActivityTag.HandsUsed]
	return []

func startActivity(_args):
	if(_args[0] == "domrem"):
		endActivity()
		var theCondom = getDom().getWornCondom()
		if(!theCondom):
			return
		theCondom.destroyMe()
		getSexEngine().saveCondomToLootIfPerk(theCondom)
		
		addText("{dom.You} {dom.youVerb('pull')} off a used condom from {sub.yourHis} {dom.penisShort} and {dom.youVerb('dispose')} of it.")
		return
	if(_args[0] == "subrem"):
		endActivity()
		var theCondom = getSub().getWornCondom()
		if(!theCondom):
			return
		theCondom.destroyMe()
		getSexEngine().saveCondomToLootIfPerk(theCondom)
		
		addText("{dom.You} {dom.youVerb('pull')} off a used condom from {sub.your} {sub.penisShort} and {dom.youVerb('dispose')} of it.")
		return
	
	var breakChance:float = 20
	if(getDom().isPlayer()):
		breakChance = getDom().useBestCondom()
	
	var condomItem:ItemBase = GlobalRegistry.createItem("UsedCondom")
	condomItem.breakChance = breakChance
	
	endActivity()
	
	if(_args[0] == "dom"):
		getDom().getInventory().equipItem(condomItem)
		
		addText("{dom.You} {dom.youVerb('put')} a condom on {dom.yourHis} cock.")
		react(SexReaction.DomPutsOnACondom)
		return
	if(_args[0] == "sub"):
		getSub().getInventory().equipItem(condomItem)
	
		addText("{dom.You} {dom.youVerb('put')} a condom on {sub.your} cock.")
		react(SexReaction.DomPutsOnACondomOnSub)
		return
