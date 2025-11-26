extends SexGoalBase

func _init():
	id = SexGoal.TieUp

func getVisibleName():
	return "Tie up"

func generateData(_sexEngine, _domInfo, _subInfo):
	return [
		2,
	]

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_sexEngine.isBondageDisabled()):
		return false
	if(_domInfo.getChar().hasBoundArms() || _domInfo.getChar().hasBlockedHands()):
		return false
	var itemTagToUse = ItemTag.CanBeForcedByGuards
	if(_sexEngine.getSexTypeID() == SexType.StocksSex):#(isStocksSex()):
		itemTagToUse = ItemTag.CanBeForcedInStocks

	if(_subInfo.getChar().getInventory().getAmountOfRestraintsThatCanForceDuringSex(itemTagToUse) <= 0):
		return false
	
	return true

func isCompleted(_sexEngine, _domInfo, _subInfo, _data):
	#if(_subInfo.getChar().getInventory().getAmountOfRestraintsThatCanForceDuringSex(ItemTag.CanBeForcedByGuards) <= 0):
	#	return true
	
	return _data[0] <= 0

func progressGoal(_sexEngine, _domInfo, _subInfo, _data, _args = []):
	if(_data is Array && _data.size() > 0):
		_data[0] -= 1

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 0.3,
	}

func doFastSex(_sexEngine, _domInfo, _subInfo, _data):
	var sub = _subInfo.getChar()
	var dom = _domInfo.getChar()
	
	for _i in range(RNG.randi_range(0, 2)):
		var itemTagToUse = ItemTag.CanBeForcedByGuards
		if(_sexEngine.getSexTypeID() == SexType.StocksSex):
			itemTagToUse = ItemTag.CanBeForcedInStocks
		
		var possibleRestraints = sub.getInventory().getRestraintsThatCanBeForcedDuringSex(itemTagToUse)
		
		if(possibleRestraints.size() > 0):
			var randomRestraintID:String = RNG.pick(possibleRestraints)
		
			sub.getInventory().forceEquipByStoreOtherUnlessRestraint(GlobalRegistry.createItem(randomRestraintID), dom)
			sendSexEvent(_sexEngine, SexEvent.BondageGearForced, _domInfo, _subInfo, {itemID=randomRestraintID})

func canBegFor() -> bool:
	return true

func getBegName() -> String:
	return "Tie me up"

func getBegCategory() -> Array:
	return BegCategoryExotic

func getBegDesc() -> String:
	return "Beg the dom to make you wear bondage gear!"

func getBegMessage(_sexEngine, _domInfo, _subInfo) -> String:
	return "{sub.You} {sub.youVerb('beg')} {dom.you} to make {sub.youHim} wear bondage gear."

func getBegDialogue(_sexEngine, _domInfo, _subInfo) -> String:
	return RNG.pick([
		"I'm begging you, let me wear bondage gear. I want to be bound and completely helpless.",
		"Could you please lock stuff onto me? I need to feel completely helpless.",
		"Please, I want to be your bound toy. Will you put bondage gear on me?",
		"If you have any bondage gear.. you can lock it on me.. please?",
		"I could use some cuffs.. or ropes.. anything really.",
		"I love bondage gear.. make me wear as much as you want of it.",
	])

func getBegDomFetishes() -> Dictionary:
	return {
		Fetish.Rigging: 1.0,
	}
