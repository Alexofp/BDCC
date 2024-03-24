extends SexActivityBase

var itemIDToRemove = ""
var tick = 0

func _init():
	id = "DomUndressesSub"
	startedByDom = true
	startedBySub = false

func getGoals():
	return {
		SexGoal.SubUndressSub: 1.0,
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		SexType.StocksSex: true,
		SexType.SlutwallSex: true,
	}

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(_domInfo.goalsScoreMax({SexGoal.TieUp: 1.0}, _subInfo.charID) > 0.0):
		return 0.3 + max(_domInfo.getAngerScore(), 0.0)
	return 0.0 + max(_domInfo.getAngerScore(), 0.0)

func getVisibleName():
	return "Undress sub"

func getCategory():
	return ["Undress"]

func getDomTags():
	return []

func getSubTags():
	return [SexActivityTag.BeingUndressed]

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var itemToUndress = getItemToRemove(_subInfo.getChar())
	if(itemToUndress == null):
		return false
	
	if(_sexEngine.hasTag(_subInfo.charID, SexActivityTag.OrderedToUndress)):
		return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func startActivity(_args):
	state = ""
	
	#affectSub(subInfo.fetishScore({Fetish.Bodywritings: 1.0}, -0.25), 0.01, 0.0, -0.2, -0.02)
	var itemToUndress = getItemToRemove(getSub())
	if(itemToUndress == null):
		endActivity()
		return
	var casualName = str(itemToUndress.getCasualName())
	itemIDToRemove = itemToUndress.id
	
	return {
		text = "{dom.You} {dom.youVerb('reach', 'reaches')} to take off {sub.yourHis} <ITEM>.".replace("<ITEM>", casualName),
		domSay = Util.replaceIfNotNull(domReaction(SexReaction.ForceUndress, 100), "<ITEM>", casualName),
		subSay = Util.replaceIfNotNull(subReaction(SexReaction.ForceUndress, 100), "<ITEM>", casualName),
	}

func checkRemoved():
	if(itemIDToRemove == null || itemIDToRemove == ""):
		return true
		
	var sub = getSub()
	var subDidIt = false
	var item = sub.getInventory().getEquippedItemByID(itemIDToRemove)
	if(item == null):
		subDidIt = true
	else:
		var itemState = item.getItemState()
		if(itemState != null && itemState.isRemoved()):
			subDidIt = true
	
	return subDidIt

func processTurn():
	if(state == ""):
		if(checkRemoved()):
			endActivity()
			return
			
		tick += 1

		if(tick > 1):
			var theitem:ItemBase = getSub().getInventory().getEquippedItemByID(itemIDToRemove)
			var itemState:ItemState = theitem.getItemState()
			if(itemState == null):
				getSub().getInventory().unequipItem(theitem)
			else:
				itemState.remove()
			
			endActivity()
			return {
				text = "{dom.You} {dom.youVerb('take')} off {sub.yourHis} "+str(theitem.getCasualName())+".",
			}

func reactActivityEnd(_otheractivity):
	if(checkRemoved()):
		endActivity()
	
func getDomActions():
	var actions = []

	return actions

func doDomAction(_id, _actionInfo):
	return null

func getSubActions():
	var actions = []
	if(!getSub().hasBoundArms()):
		actions.append({
				"id": "resist",
				"score": subInfo.getResistScore() * 1.0 - subInfo.fetishScore({Fetish.Exhibitionism: 1.0}) * subInfo.getComplyScore(),
				"name": "Resist undressing",
				"desc": "You don't wanna be undressed",
				"chance": 70.0 - domInfo.getAngerScore()*60.0,
			})
	return actions

func doSubAction(_id, _actionInfo):
	if(_id == "resist"):
		if(RNG.chance(70.0 - domInfo.getAngerScore()*60.0)):
			domInfo.addAnger(0.3)
			endActivity()
			var damageText = ""
			if(RNG.chance(20)):
				damageText = damageSubClothes()
			return {
				text = "{sub.You} {sub.youVerb('manage', 'managed')} to resist {dom.yourHis} attempt to undress."+((" Struggling leads to {dom.name} ripping {sub.your} clothes. "+damageText) if damageText != "" else ""),
				subSay=subReaction(SexReaction.ActivelyResisting, 50),
			}
		
		domInfo.addAnger(0.1)
		var damageText = ""
		if(RNG.chance(10)):
			damageText = damageSubClothes()
		return {text = "{sub.You} {sub.youVerb('try', 'tries')} to resist {dom.yourHis} hands but {sub.youVerb('fail')}."+((" Struggling leads to {dom.name} ripping {sub.your} clothes. "+damageText) if damageText != "" else ""),
		subSay=subReaction(SexReaction.Resisting, 50)}

func getItemToRemove(character):
	var bodypartsToExpose = [BodypartSlot.Breasts, BodypartSlot.Penis, BodypartSlot.Vagina, BodypartSlot.Anus]
	var canRemoveItems = []

	for bodypartToExpose in bodypartsToExpose:
		var firstItem = character.getFirstItemThatCoversBodypart(bodypartToExpose)
		if(firstItem != null && !canRemoveItems.has(firstItem) && !firstItem.isRestraint()):
			canRemoveItems.append(firstItem)
	return RNG.pick(canRemoveItems)

func saveData():
	var data = .saveData()
	
	data["itemIDToRemove"] = itemIDToRemove
	data["tick"] = tick

	return data
	
func loadData(data):
	.loadData(data)
	
	itemIDToRemove = SAVE.loadVar(data, "itemIDToRemove", "")
	tick = SAVE.loadVar(data, "tick", 0)
