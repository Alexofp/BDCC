extends SexActivityBase

func _init():
	id = "DomPutOnCondom"
	startedByDom = true
	startedBySub = false

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
	var actions = []
	
	if(dom.isPlayer() && !dom.hasCondoms()):
		return []
	
	if(!_sexEngine.hasTag(_domInfo.charID, SexActivityTag.PenisInside) && dom.hasReachablePenis() && !dom.getInventory().hasSlotEquipped(InventorySlot.Penis) && dom.getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
		actions.append({
			name = "Wear condom",
			desc = "Put on your best condom",
			args = ["dom"],
			score = getActivityScoreCustomGoals({SexGoal.SubOptionalCondomOnDom: 1.0}, _sexEngine, _domInfo, _subInfo) * (_domInfo.fetishScore({Fetish.Condoms:1.0}) - _domInfo.fetishScore({Fetish.Breeding:1.0})),
			category = ["Wear"],
		})
	if(!_sexEngine.hasTag(_subInfo.charID, SexActivityTag.PenisInside) && sub.hasReachablePenis() && !sub.getInventory().hasSlotEquipped(InventorySlot.Penis) && sub.getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
		actions.append({
			name = "Put condom on sub",
			desc = "Put on your best condom on the sub",
			args = ["sub"],
			score = getActivityScoreCustomGoals({SexGoal.SubOptionalCondomOnSub: 1.0}, _sexEngine, _domInfo, _subInfo) * (_domInfo.fetishScore({Fetish.Condoms:1.0}) - _domInfo.fetishScore({Fetish.BeingBred:1.0})),
			category = ["Wear"],
		})
	
	return actions

func getVisibleName():
	return "Wear condom"

func getCategory():
	return ["Wear"]

func getDomTags():
	return [SexActivityTag.HandsUsed]

func getSubTags():
	return []

func startActivity(_args):
	state = ""
	
	var breakChance = 20
	if(getDom().isPlayer()):
		breakChance = getDom().useBestCondom()
	
	var condomItem:ItemBase = GlobalRegistry.createItem("UsedCondom")
	condomItem.breakChance = breakChance
	
	endActivity()
	
	if(_args[0] == "dom"):
		getDom().getInventory().equipItem(condomItem)
		
		return {
			text = "{dom.You} {dom.youVerb('put')} a condom on {dom.yourHis} cock.",
			domSay = domReaction(SexReaction.DomPutsOnACondom),
		}
	
	if(_args[0] == "sub"):
		getSub().getInventory().equipItem(condomItem)
	
		return {
			text = "{dom.You} {dom.youVerb('put')} a condom on {sub.your} cock.",
			domSay = domReaction(SexReaction.DomPutsOnACondomOnSub),
		}
