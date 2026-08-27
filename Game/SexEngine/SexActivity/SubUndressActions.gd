extends SexActivityBase

func _init():
	id = "SubUndressActions"
	startedByDom = false
	startedBySub = true
	
	activityName = "Undress"
	activityDesc = "Take off something."
	activityCategory = ["Undress"]

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		SexType.TentaclesSex: true,
	}

func getGoals():
	return {
	}

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(_sexEngine.hasTag(_subInfo.charID, SexActivityTag.OrderedToUndress)):
		return 1.0 - _subInfo.getResistScore()
	return 0.0 + max(_subInfo.fetishScore({Fetish.Exhibitionism: 0.2}), 0.0) * _subInfo.getComplyScore()

const bodypartsToExpose:Array = [BodypartSlot.Breasts, BodypartSlot.Penis, BodypartSlot.Vagina, BodypartSlot.Anus]

func getStartActions(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var sub:BaseCharacter = _subInfo.getChar()
	var handledItems:Dictionary = {}
	
	if(sub.hasBoundArms() || sub.hasBlockedHands()):
		return
	
	var theScore:float = getActivityScore(_sexEngine, _domInfo, _subInfo)
	if(_subInfo.isFunctionallyNaked()):
		theScore *= 0.1
	var theContext:Dictionary = {sexEngine=_sexEngine, sexActivity=self, actorInfo=_subInfo, targretInfo=_subInfo}
	
	for bodypartToExpose in bodypartsToExpose:
		var firstItem = sub.getFirstItemThatCoversBodypart(bodypartToExpose)
		if(firstItem == null || handledItems.has(firstItem) || firstItem.isRestraint()):
			continue
		
		handledItems[firstItem] = true
		addDisplaceActionsFor(firstItem, theContext, theScore)
		#addStartAction([firstItem], "Take off "+str(firstItem.getCasualName()), "Take off this item", theActivityScore)
	
	#if(sub.isPlayer()):
	var _inv:Inventory = sub.getInventory()
	for slot in _inv.getEquippedItems():
		addUndressButtonsForSlot(_inv, slot, handledItems, theContext, theScore)
		#if _inv.hasSlotEquipped(slot):
		#	addUndressButtonsForSlot(_inv, slot, handledItems)
	
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

func getTags(_indx:int) -> Array:
	if(_indx == SUB_0):
		return [SexActivityTag.HandsUsed]
	return []

func startActivity(_args):
	var theitem:ItemBase = _args[0]
	var theDisplaceAction:Array = _args[1] if _args.size() > 1 else ["", "", "", 1.0]
	var itemState:ItemState = theitem.getItemState()
	if(!itemState):
		getSub().getInventory().unequipItem(theitem)
		endActivity()
		addText("{sub.You} {sub.youVerb('take')} off {sub.yourHis} "+str(theitem.getCasualName())+".")
		fetishAffect(SUB_0, Fetish.Exhibitionism, 1.0)
		return
	
	var theResult:Dictionary = theitem.doDisplaceActionFinal(theDisplaceAction[0], theDisplaceAction, {sexEngine=getSexType(), sexActivity=self, actorInfo=getSubInfo(), targretInfo=getSubInfo()})
	#itemState.remove()
	endActivity()
	if(theResult.has("text")):
		var theText:String = theResult["text"]
		theText=theText.replace("<ACTOR>", getSubID()).replace("<TARGET>", getSubID())
		addTextRaw(theText)
	else:
		addText("{sub.You} {sub.youVerb('take')} off {sub.yourHis} "+str(theitem.getCasualName())+".")

	fetishAffect(SUB_0, Fetish.Exhibitionism, 1.0)
