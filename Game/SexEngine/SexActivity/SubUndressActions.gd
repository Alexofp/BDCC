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
	
	var theActivityScore:float = getActivityScore(_sexEngine, _domInfo, _subInfo)
	for bodypartToExpose in bodypartsToExpose:
		var firstItem = sub.getFirstItemThatCoversBodypart(bodypartToExpose)
		if(firstItem == null || handledItems.has(firstItem) || firstItem.isRestraint()):
			continue
		
		handledItems[firstItem] = true
		addStartAction([firstItem], "Take off "+str(firstItem.getCasualName()), "Take off this item", theActivityScore)
	
	if(sub.isPlayer()):
		var _inv:Inventory = sub.getInventory()
		for theChain in InventorySlot.getUndressChains():
			addUndressButtonsForChain(_inv, theChain, handledItems)
	
func addUndressButtonsForChain(_inv:Inventory, _slotChain:Array, _handled:Dictionary):
	for theSlot in _slotChain:
		var theItem:ItemBase = _inv.getEquippedItem(theSlot)
		if(!theItem || theItem.isRemoved()):
			continue
		if(_handled.has(theItem) || theItem.isRestraint() || !theItem.itemState):
			return
		_handled[theItem] = true
		addStartAction([theItem], "Take off "+str(theItem.getCasualName()), "Take off this item", 0.0)
		return
		
func getTags(_indx:int) -> Array:
	if(_indx == SUB_0):
		return [SexActivityTag.HandsUsed]
	return []

func startActivity(_args):
	var theitem:ItemBase = _args[0]
	if(theitem == null):
		endActivity()
		return
	var itemState:ItemState = theitem.getItemState()
	if(itemState == null):
		getSub().getInventory().unequipItem(theitem)
	else:
		itemState.remove()
	
	endActivity()
	addText("{sub.You} {sub.youVerb('take')} off {sub.yourHis} "+str(theitem.getCasualName())+".")
	fetishAffect(SUB_0, Fetish.Exhibitionism, 1.0)
