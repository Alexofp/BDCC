extends SexActivityBase

var itemIDToRemove:String = ""
var tick:int = 0

func _init():
	id = "OrderToUndress"
	
	activityName = "Order to undress"
	activityDesc = "Order the sub to take something off"
	activityCategory = ["Undress"]

func getGoals():
	return {
		SexGoal.SubUndressSub: 1.0,
	}

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return [SexActivityTag.OrderedToDoSomething]
	if(_indx == SUB_0):
		return [SexActivityTag.OrderedToDoSomething, SexActivityTag.OrderedToUndress]
	return []

func getCheckTagsSub() -> Array:
	return [SexActivityTag.OrderedToDoSomething, SexActivityTag.BeingUndressed]

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(_domInfo.goalsScoreMax({SexGoal.TieUp: 1.0}, _subInfo.charID) > 0.0):
		return 0.3
	return 0.0

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var itemToUndress = getItemToRemove(_subInfo.getChar())
	if(itemToUndress == null):
		return false
	
	if(_subInfo.getChar().hasBoundArms() || _subInfo.getChar().hasBlockedHands()):
		return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func startActivity(_args):
	var itemToUndress = getItemToRemove(getSub())
	if(itemToUndress == null):
		endActivity()
		return
	var casualName:String = str(itemToUndress.getCasualName())
	itemIDToRemove = itemToUndress.id
	
	addText("{dom.You} {dom.youVerb('order')} {sub.you} to undress {sub.yourHis} <ITEM>.".replace("<ITEM>", casualName))
	react(SexReaction.OrderToUndress, [100, 100], [DOM_0, SUB_0], [casualName])

func checkRemoved() -> bool:
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
	if(checkRemoved()):
		getDomInfo().addAnger(-0.1)
		endActivity()
		addText("{dom.You} {dom.youVerb('nod')}.")
		return
		
	tick += 1
	if(tick > 3):
		endActivity()
		addText("{dom.You} gave up waiting.")
		return
	
	if(tick > 1):
		getDomInfo().addAnger(0.1 + 0.02 * tick)
		addText("{dom.You} {dom.youAre} losing patience.")
		return
	
func reactActivityEnd(_otheractivity):
	if(checkRemoved()):
		getDomInfo().addAnger(-0.1)
		endActivity()
		addText("{dom.You} {dom.youVerb('nod')}.")
	

func getActions(_indx:int):
	if(_indx == SUB_0):
		if(!getSub().hasBoundArms()):
			var saynoScore:float = getResistScore(SUB_0) - fetish(SUB_0, Fetish.Exhibitionism)
			addAction("sayno", saynoScore, "Refuse to undress", "You're not gonna undress")


func doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "sayno"):
		getDomInfo().addAnger(0.7)
		endActivity()
		addText("{sub.You} {sub.youVerb('refuse')} to undress.")

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
