extends SexActivityBase

func _init():
	id = "DomUndressActions"
	startedByDom = true
	startedBySub = false

func getGoals():
	return {
		SexGoal.SubUndressDom: 1.0,
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		SexType.StocksSex: true,
		SexType.SlutwallSex: true,
	}

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return 0.05 + max(_domInfo.fetishScore({Fetish.Exhibitionism: 0.1}), 0.0)

func getStartActions(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var bodypartsToExpose = [BodypartSlot.Breasts, BodypartSlot.Penis, BodypartSlot.Vagina, BodypartSlot.Anus]
	var dom:BaseCharacter = _domInfo.getChar()
	var handledItems = {}
	var actions = []
	
	for bodypartToExpose in bodypartsToExpose:
		var firstItem = dom.getFirstItemThatCoversBodypart(bodypartToExpose)
		if(firstItem == null || handledItems.has(firstItem) || firstItem.isRestraint()):
			continue
		
		handledItems[firstItem] = true
		actions.append({
			name = "Take off "+str(firstItem.getCasualName()),
			args = [firstItem],
			score = getActivityScore(_sexEngine, _domInfo, _subInfo),
			category = ["Undress"],
		})
	
	return actions

func getVisibleName():
	return "Undress"

func getCategory():
	return ["Undress"]

func getDomTags():
	return []

func getSubTags():
	return []

func startActivity(_args):
	state = ""
	
	var theitem:ItemBase = _args[0]
	var itemState:ItemState = theitem.getItemState()
	if(itemState == null):
		getDom().getInventory().unequipItem(theitem)
	else:
		itemState.remove()
	
	endActivity()
	return {
		text = "{dom.You} {dom.youVerb('take')} off {dom.yourHis} "+str(theitem.getCasualName())+".",
	}
