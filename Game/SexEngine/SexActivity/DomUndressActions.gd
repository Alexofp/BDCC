extends SexActivityBase

func _init():
	id = "DomUndressActions"
	startedByDom = true
	startedBySub = false
	
	activityName = "Undress"
	activityDesc = "Take off something."
	activityCategory = ["Undress"]

func getGoals():
	return {
		SexGoal.SubUndressDom: 1.0,
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		SexType.StocksSex: true,
		SexType.SlutwallSex: true,
		SexType.BitchsuitSex: true,
	}

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var baseMod:float = 0.01
	if(_sexEngine.hasTag(_domInfo.charID, SexActivityTag.PenisUsed) || _sexEngine.hasTag(_domInfo.charID, SexActivityTag.VaginaUsed) || _sexEngine.hasTag(_domInfo.charID, SexActivityTag.AnusUsed)):
		baseMod = 1.0
	
	return baseMod + max(_domInfo.fetishScore({Fetish.Exhibitionism: 0.1}), 0.0)

func getStartActions(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var bodypartsToExpose:Array = [BodypartSlot.Breasts, BodypartSlot.Penis, BodypartSlot.Vagina, BodypartSlot.Anus]
	var dom:BaseCharacter = _domInfo.getChar()
	var handledItems:Dictionary = {}
	
	var theScore:float = getActivityScore(_sexEngine, _domInfo, _subInfo)
	if(_domInfo.isFunctionallyNaked()):
		theScore *= 0.1
	var theContext:Dictionary = {sexEngine=_sexEngine, sexActivity=self, actorInfo=_domInfo, targretInfo=_domInfo}
	
	for bodypartToExpose in bodypartsToExpose:
		var firstItem:ItemBase = dom.getFirstItemThatCoversBodypart(bodypartToExpose)
		if(firstItem == null || handledItems.has(firstItem) || firstItem.isRestraint()):
			continue
		
		handledItems[firstItem] = true
		addDisplaceActionsFor(firstItem, theContext, theScore)
		#addStartAction([firstItem], "Take off "+str(firstItem.getCasualName()), "Take off a certain item from yourself", theScore)

	#if(dom.isPlayer()):
	var _inv:Inventory = dom.getInventory()
	for slot in _inv.getEquippedItems():
		addUndressButtonsForSlot(_inv, slot, handledItems, theContext, theScore)
	
func addUndressButtonsForSlot(_inv:Inventory, _slot:String, _handled:Dictionary, _context:Dictionary, _scoreMult:float):
	var theItem = _inv.getEquippedItem(_slot)
	if(!_handled.has(theItem) && _inv.canUndressSlotSexEngine(_slot)):
		_handled[theItem] = true
		addDisplaceActionsFor(theItem, _context, _scoreMult)
		#addStartAction([theItem], "Take off "+str(theItem.getCasualName()), "Take off this item", 0.0)

func addDisplaceActionsFor(_item:ItemBase, _context:Dictionary, _scoreMult:float):
	var theActions:Array = _item.getDisplaceActionsFinal(_context)
	for theEntry in theActions:
		addStartAction([_item, theEntry], theEntry[1], theEntry[2], theEntry[3]*_scoreMult)

func startActivity(_args):
	var theitem:ItemBase = _args[0]
	var theDisplaceAction:Array = _args[1] if _args.size() > 1 else ["", "", "", 1.0]
	var itemState:ItemState = theitem.getItemState()
	if(!itemState):
		getDom().getInventory().unequipItem(theitem)
		endActivity()
		addText("{dom.You} {dom.youVerb('take')} off {dom.yourHis} "+str(theitem.getCasualName())+".")
		return
	
	var theResult:Dictionary = theitem.doDisplaceActionFinal(theDisplaceAction[0], theDisplaceAction, {sexEngine=getSexType(), sexActivity=self, actorInfo=getDomInfo(), targretInfo=getDomInfo()})
	#itemState.remove()
	endActivity()
	if(theResult.has("text")):
		var theText:String = theResult["text"]
		theText=theText.replace("<ACTOR>", getDomID()).replace("<TARGET>", getDomID())
		addTextRaw(theText)
	else:
		addText("{dom.You} {dom.youVerb('take')} off {dom.yourHis} "+str(theitem.getCasualName())+".")
