extends SexActivityBase

func _init():
	id = "SubBegToPutOnACondom"
	startedByDom = false
	startedBySub = true

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
	var actions = []
	
	if(dom.getWornCondom() != null):
		return []
	
	if(!dom.hasReachablePenis() || dom.getInventory().hasSlotEquipped(InventorySlot.Penis) || dom.getFirstItemThatCoversBodypart(BodypartSlot.Penis) != null):
		return []
	
	if(_subInfo.shouldFullyObey()):
		return []
	
	actions.append({
		name = "Beg to use condom",
		desc = "Ask the dom to put on a condom",
		args = ["beg"],
		score = getActivityScore(_sexEngine, _domInfo, _subInfo) * _subInfo.fetishScore({Fetish.BeingBred: -1.0}),
		category = getCategory(),
		chance = calculateSuccessChance(_domInfo, _subInfo, 100.0),
	})
	if(sub.isPlayer() && sub.hasCondoms() && !sub.hasBlockedHands()):
		actions.append({
			name = "Offer a condom",
			desc = "Beg the dom to use your condom",
			args = ["offer"],
			score = getActivityScore(_sexEngine, _domInfo, _subInfo) * _subInfo.fetishScore({Fetish.BeingBred: -1.0}),
			category = getCategory(),
			chance = calculateSuccessChance(_domInfo, _subInfo, 130.0, 0.5),
		})
	
	return actions

func calculateSuccessChance(_domInfo: SexDomInfo, _subInfo: SexSubInfo, baseChance = 100.0, angerMult = 1.0):
	var successChance = 0.1 -_domInfo.fetishScore({Fetish.Breeding: 0.5}) + _domInfo.fetishScore({Fetish.Condoms: 1.0})
	successChance = successChance * baseChance
	if(successChance > 0.0):
		successChance *= max(0.0, 1.0 - _domInfo.getAngerScore() * angerMult)
	if(_subInfo.getChar().isGagged()):
		successChance *= 0.5
	return max(successChance, 5.0)

func getVisibleName():
	return "Beg condom"

func getCategory():
	return ["Beg"]

func getDomTags():
	return [SexActivityTag.PenisInside]

func getSubTags():
	return []

func startActivity(_args):
	state = ""
	
	if(_args[0] in ["beg", "offer"]):
		var condomBeggingReaction = SexReaction.BeggingForCondom
		endActivity()
		var text
		if(_args[0] == "beg"):
			text = RNG.pick([
				"{sub.You} {sub.youVerb('beg')} {dom.youHim} to put on a condom.",
			])
		else:
			condomBeggingReaction = SexReaction.OfferingACondom
			text = RNG.pick([
				"{sub.You} {sub.youVerb('offer')} {dom.youHim} to put on one of {sub.yourHis} condoms.",
			])
		if(domInfo.getChar().isPlayer()):
			return {
				text = text,
				subSay = subReaction(condomBeggingReaction),
			}
		
		if(domInfo.hasMemory("TiredOfCondomOffers")):
			text += RNG.pick([
				" {dom.You} {dom.youVerb('ignore')} {sub.yourHis} begging.",
			])
			domInfo.addAnger(0.05)
			return {
				text = text,
				subSay = subReaction(condomBeggingReaction),
			}
		
		var successChance
		if(_args[0] == "beg"):
			successChance = calculateSuccessChance(domInfo, subInfo, 100.0)
		else:
			successChance = calculateSuccessChance(domInfo, subInfo, 130.0, 0.5)
		
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
			
			return {text = text, subSay = subReaction(condomBeggingReaction)}
		else:
			var superFailChance = domInfo.getAngerScore() * 30.0
			if(RNG.chance(superFailChance)):
				domInfo.remember("TiredOfCondomOffers")
				text += RNG.pick([
					" {dom.You} {dom.youVerb('get')} very annoyed with {sub.yourHis} begging.",
				])
				domInfo.addAnger(0.2)
				return {
					text = text,
					subSay = subReaction(condomBeggingReaction),
				}
			
			domInfo.addAnger(0.1)
			text += RNG.pick([
				" {dom.You} {dom.youVerb('shake')} {dom.yourHis} head.",
			])
			
			return {
				text = text,
				subSay = subReaction(condomBeggingReaction),
			}

