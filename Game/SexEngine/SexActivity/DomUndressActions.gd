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
	
	for bodypartToExpose in bodypartsToExpose:
		var firstItem:ItemBase = dom.getFirstItemThatCoversBodypart(bodypartToExpose)
		if(firstItem == null || handledItems.has(firstItem) || firstItem.isRestraint()):
			continue
		
		handledItems[firstItem] = true
		addStartAction([firstItem], "Take off "+str(firstItem.getCasualName()), "Take off a certain item from yourself", theScore)

	if(dom.isPlayer()):
		var _inv:Inventory = dom.getInventory()
		for slot in _inv.getEquippedItems():
			if _inv.hasSlotEquipped(slot):
				addUndressButtonsForSlot(_inv, slot, handledItems)
	
func addUndressButtonsForSlot(_inv:Inventory, _slot:String, _handled:Dictionary):
	if _inv.canUndressSlot(_slot):
		var theItem = _inv.getEquippedItem(_slot)
		_handled[theItem] = true
		addStartAction([theItem], "Take off "+str(theItem.getCasualName()), "Take off this item", 0.0)
	

func startActivity(_args):
	var theitem:ItemBase = _args[0]
	var itemState:ItemState = theitem.getItemState()
	if(itemState == null):
		getDom().getInventory().unequipItem(theitem)
	else:
		itemState.remove()
	
	endActivity()
	addText("{dom.You} {dom.youVerb('take')} off {dom.yourHis} "+str(theitem.getCasualName())+".")
