extends SexActivityBase

var itemIDToRemove:String = ""
var displaceAction:Array = []
var tick:int = 0

func _init():
	id = "DomUndressesSub"
	startedByDom = true
	startedBySub = false
	
	activityName = "Undress sub"
	activityDesc = "Take off their clothes!"
	activityCategory = ["Undress"]

func getGoals():
	return {
		SexGoal.SubUndressSub: 1.0,
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		SexType.StocksSex: true,
		SexType.SlutwallSex: true,
		SexType.BitchsuitSex: true,
		SexType.TentaclesSex: true,
	}

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(_domInfo.goalsScoreMax({SexGoal.TieUp: 1.0}, _subInfo.charID) > 0.0):
		return 0.3 + max(_domInfo.getAngerScore(), 0.0)
	return 0.05 + max(_domInfo.getAngerScore(), 0.0)

func getActivityScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var theMult:float = 1.0
	if(_subInfo.isFunctionallyNaked()):
		theMult *= 0.1
	return .getActivityScore(_sexEngine, _domInfo, _subInfo)*theMult

func getTags(_indx:int) -> Array:
	if(_indx == SUB_0):
		return [SexActivityTag.BeingUndressed]
	return []

#func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
#	var itemToUndress = getItemToRemove(_subInfo.getChar())
#	if(itemToUndress == null):
#		return false
#
#	if(_sexEngine.hasTag(_subInfo.charID, SexActivityTag.OrderedToUndress)):
#		return false
#
#	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getStartActions(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var sub:BaseCharacter = _subInfo.getChar()
	var handledItems:Dictionary = {}
	
	if(_sexEngine.hasTag(_subInfo.charID, SexActivityTag.OrderedToUndress)):
		return
	
	var theScore:float = getActivityScore(_sexEngine, _domInfo, _subInfo)
	if(_subInfo.isFunctionallyNaked()):
		theScore *= 0.1
	var theContext:Dictionary = {sexEngine=_sexEngine, sexActivity=self, actorInfo=_domInfo, targretInfo=_subInfo}
	
	var itemToUndress = getItemToRemove(_subInfo.getChar())
	if(itemToUndress):
		addStartAction([], getVisibleName(), getVisibleDesc(), 0.0)
	
	#if(_domInfo.getChar().isPlayer()):
	var _inv:Inventory = sub.getInventory()
	for slot in _inv.getEquippedItems():
		addUndressButtonsForSlot(_inv, slot, handledItems, theContext, theScore)
	
func addUndressButtonsForSlot(_inv:Inventory, _slot:String, _handled:Dictionary, _context:Dictionary, _scoreMult:float):
	var theItem = _inv.getEquippedItem(_slot)
	if(!_handled.has(theItem) && _inv.canUndressSlotSexEngine(_slot)):
		_handled[theItem] = true
		addDisplaceActionsFor(theItem, _context, _scoreMult)
		#addStartAction([theItem], "Take off "+str(theItem.getCasualName()), "Take off this item from the sub", 0.0, {A_CATEGORY: ["Undress", "Sub (specific)"]})

func addDisplaceActionsFor(_item:ItemBase, _context:Dictionary, _scoreMult:float):
	var theActions:Array = _item.getDisplaceActionsFinal(_context)
	for theEntry in theActions:
		addStartAction([_item, theEntry], theEntry[1], theEntry[2], theEntry[3]*_scoreMult, {A_CATEGORY: ["Undress", "Sub (specific)"]})

func startActivity(_args):
	if(_args.empty()):
		displaceAction = ["def_takeoff", "", "", 1.0]
		var itemToUndress = getItemToRemove(getSub())
		if(itemToUndress == null):
			endActivity()
			return
		var casualName:String = str(itemToUndress.getCasualName())
		itemIDToRemove = itemToUndress.id
		
		addText("{dom.You} {dom.youVerb('reach', 'reaches')} to take off {sub.yourHis} <ITEM>.".replace("<ITEM>", casualName))
		react(SexReaction.ForceUndress, [100, 100], [DOM_0, SUB_0], [casualName])
		return
	
	#affectSub(getSubInfo().fetishScore({Fetish.Bodywritings: 1.0}, -0.25), 0.01, 0.0, -0.2, -0.02)
	var itemToUndress = _args[0]
	displaceAction = _args[1] if _args.size() > 1 else []
	if(!itemToUndress || displaceAction.empty()):
		endActivity()
		return
	var casualName:String = str(itemToUndress.getCasualName())
	itemIDToRemove = itemToUndress.id
	
	var _isTakeOff:bool = (displaceAction[0] == "def_takeoff") # It's fineeeeeee
	addText("{dom.You} {dom.youVerb('reach', 'reaches')} to "+ ("take off" if _isTakeOff else "displace") + " {sub.yourHis} <ITEM>.".replace("<ITEM>", casualName))
	react(SexReaction.ForceUndress, [100, 100], [DOM_0, SUB_0], [casualName])
	return

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

func init_processTurn():
	if(checkRemoved()):
		endActivity()
		return
		
	tick += 1

	if(tick > 1):
		var theitem:ItemBase = getSub().getInventory().getEquippedItemByID(itemIDToRemove)
		var itemState:ItemState = theitem.getItemState()
		if(!itemState):
			getSub().getInventory().unequipItem(theitem)
			endActivity()
			addText("{dom.You} {dom.youVerb('take')} off {sub.yourHis} "+str(theitem.getCasualName())+".")
			return
		
		var theResult:Dictionary = theitem.doDisplaceActionFinal(displaceAction[0], displaceAction, {sexEngine=getSexType(), sexActivity=self, actorInfo=getDomInfo(), targretInfo=getSubInfo()})
		#itemState.remove()
		endActivity()
		if(theResult.has("text")):
			var theText:String = theResult["text"]
			theText=theText.replace("<ACTOR>", getDomID()).replace("<TARGET>", getSubID())
			addTextRaw(theText)
		else:
			addText("{dom.You} {dom.youVerb('take')} off {sub.yourHis} "+str(theitem.getCasualName())+".")

func reactActivityEnd(_otheractivity):
	if(checkRemoved()):
		endActivity()


func getActions(_indx:int):
	if(_indx == SUB_0):
		if(!getSub().hasBoundArms()):
			var resistScore:float = getSubInfo().getResistScore() * 1.0 - fetish(SUB_0, Fetish.Exhibitionism) * getSubInfo().getComplyScore()
			addAction("resist", resistScore, "Resist undressing", "You don't wanna be undressed", {A_CHANCE: 70.0 - getDomInfo().getAngerScore()*60.0})

func doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "resist"):
		if(RNG.chance(70.0 - getDomInfo().getAngerScore()*60.0)):
			getDomInfo().addAnger(0.3)
			endActivity()
			var damageText:String = ""
			if(RNG.chance(20)):
				damageText = damageClothes(SUB_0)
			addText("{sub.You} {sub.youVerb('manage', 'managed')} to resist {dom.yourHis} attempt to undress."+((" Struggling leads to {dom.name} ripping {sub.your} clothes. "+damageText) if damageText != "" else ""))
			reactSub(SexReaction.ActivelyResisting, [50])
			fetishUp(SUB_0, Fetish.Exhibitionism, -3.0)
			return
		
		getDomInfo().addAnger(0.1)
		var damageText:String = ""
		if(RNG.chance(10)):
			damageText = damageClothes(SUB_0)
		addText("{sub.You} {sub.youVerb('try', 'tries')} to resist {dom.yourHis} hands but {sub.youVerb('fail')}."+((" Struggling leads to {dom.name} ripping {sub.your} clothes. "+damageText) if damageText != "" else ""))
		reactSub(SexReaction.Resisting, [50])
		fetishUp(SUB_0, Fetish.Exhibitionism, -5.0)
		return

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
	data["displaceAction"] = displaceAction

	return data
	
func loadData(data):
	.loadData(data)
	
	itemIDToRemove = SAVE.loadVar(data, "itemIDToRemove", "")
	tick = SAVE.loadVar(data, "tick", 0)
	displaceAction = SAVE.loadVar(data, "displaceAction", [])
