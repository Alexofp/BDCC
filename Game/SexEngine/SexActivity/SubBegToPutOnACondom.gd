extends SexActivityBase

func _init():
	id = "SubBegToPutOnACondom"
	startedByDom = false
	startedBySub = true
	
	activityName = "Beg condom"
	activityDesc = "Beg them to put on a condom"
	activityCategory = ["Beg"]

func getGoals():
	return {
		SexGoal.SubOptionalCondomOnDom: 0.2,
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
	var sub:BaseCharacter = _subInfo.getChar()
	var dom:BaseCharacter = _domInfo.getChar()
	if(dom.getWornCondom() != null):
		return
	
	if(!dom.hasReachablePenis() || dom.getInventory().hasSlotEquipped(InventorySlot.Penis) || dom.getFirstItemThatCoversBodypart(BodypartSlot.Penis) != null):
		return
	
	if(_subInfo.shouldFullyObey()):
		return
	
	var begScore:float = getActivityScore(_sexEngine, _domInfo, _subInfo) * _subInfo.fetishScore({Fetish.BeingBred: -1.0})
	addStartAction(["beg"], "Beg to use condom", "Ask the dom to put on a condom", begScore, {A_CATEGORY: getCategory(), A_CHANCE: calculateSuccessChance(_domInfo, _subInfo, 100.0)})
	if(sub.isPlayer() && sub.hasCondoms() && !sub.hasBlockedHands()):
		addStartAction(["offer"], "Offer a condom", "Beg the dom to use your condom", begScore, {A_CATEGORY: getCategory(), A_CHANCE: calculateSuccessChance(_domInfo, _subInfo, 130.0, 0.5)})

func calculateSuccessChance(_domInfo: SexDomInfo, _subInfo: SexSubInfo, baseChance:float = 100.0, angerMult:float = 1.0) -> float:
	var successChance = 0.1 -_domInfo.fetishScore({Fetish.Breeding: 0.5}) + _domInfo.fetishScore({Fetish.Condoms: 1.0})
	successChance = successChance * baseChance
	if(successChance > 0.0):
		successChance *= max(0.0, 1.0 - _domInfo.getAngerScore() * angerMult)
	if(_subInfo.getChar().isGagged()):
		successChance *= 0.5
	return max(successChance, 5.0)

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return [SexActivityTag.PenisInside]
	return []

func startActivity(_args):
	if(_args[0] in ["beg", "offer"]):
		var condomBeggingReaction = SexReaction.BeggingForCondom
		endActivity()
		var text:String = ""
		if(_args[0] == "beg"):
			text = RNG.pick([
				"{sub.You} {sub.youVerb('beg')} {dom.youHim} to put on a condom.",
			])
		else:
			condomBeggingReaction = SexReaction.OfferingACondom
			text = RNG.pick([
				"{sub.You} {sub.youVerb('offer')} {dom.youHim} to put on one of {sub.yourHis} condoms.",
			])
		if(getDomInfo().getChar().isPlayer()):
			addText(text)
			reactSub(condomBeggingReaction)
			return
		
		if(getDomInfo().hasMemory("TiredOfCondomOffers")):
			text += RNG.pick([
				" {dom.You} {dom.youVerb('ignore')} {sub.yourHis} begging.",
			])
			getDomInfo().addAnger(0.05)
			addText(text)
			reactSub(condomBeggingReaction)
			return
		
		var successChance:float
		if(_args[0] == "beg"):
			successChance = calculateSuccessChance(getDomInfo(), getSubInfo(), 100.0)
		else:
			successChance = calculateSuccessChance(getDomInfo(), getSubInfo(), 130.0, 0.5)
		
		if(RNG.chance(successChance)):
			if(_args[0] == "beg"):
				text += RNG.pick([
					" {dom.You} {dom.youVerb('nod')} and {dom.youVerb('put')} on one of {dom.yourHis} condoms onto {dom.yourHis} cock.",
				])
			else:
				text += RNG.pick([
					" {dom.You} {dom.youVerb('nod')} and {dom.youVerb('put')} on {sub.yourHis} condom onto {dom.yourHis} cock.",
				])
			
			var condomItem:ItemBase = GlobalRegistry.createItem("UsedCondom")
			getDom().getInventory().forceEquipStoreOther(condomItem)
			if(getSub().isPlayer() && _args[0] == "offer"):
				condomItem.breakChance = getSub().useBestCondom()
			
			addText(text)
			reactSub(condomBeggingReaction)
			return
		else:
			var superFailChance:float = getDomInfo().getAngerScore() * 30.0
			if(RNG.chance(superFailChance)):
				getDomInfo().remember("TiredOfCondomOffers")
				text += RNG.pick([
					" {dom.You} {dom.youVerb('get')} very annoyed with {sub.yourHis} begging.",
				])
				getDomInfo().addAnger(0.2)
				addText(text)
				reactSub(condomBeggingReaction)
				return
			
			getDomInfo().addAnger(0.1)
			text += RNG.pick([
				" {dom.You} {dom.youVerb('shake')} {dom.yourHis} head.",
			])
			
			addText(text)
			reactSub(condomBeggingReaction)
			return

