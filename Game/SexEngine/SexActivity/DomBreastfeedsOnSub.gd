extends SexActivityBase
var gropeAmount = 0
var kneadBonus = 0

func _init():
	id = "DomBreastfeedsOnSub"

func getGoals():
	return {
		SexGoal.BreastFeedOnSub: 1.0,
	}

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return 0.0

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getVisibleName():
	return "Breastfeed on sub"

func getCategory():
	return ["Breasts"]

func getDomTags():
	var thetags = [SexActivityTag.MouthUsed]
	return thetags

func getSubTags():
	var thetags = [SexActivityTag.BreastsUsed, SexActivityTag.HavingSex]
	return thetags

func startActivity(_args):
	state = ""
	
	var clothingItem = getSub().getFirstItemThatCoversBodypart(BodypartSlot.Breasts)
	var throughTheClothing = ""
	if(clothingItem != null):
		throughTheClothing = " clothed"#" through the "+clothingItem.getCasualName()
	
	var text = RNG.pick([
		"{dom.You} {dom.youVerb('lean')} close to {sub.your} {sub.breasts}, {dom.yourHis} lips hovering near {sub.yourHis}"+throughTheClothing+" nipples.",
	])
	
	affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.1, -0.01)
	affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.03)
	
	return {
		text = text,
		#domSay = domReaction(SexReaction.AboutToRubPussiesTogether),
	}

func onSwitchFrom(_otherActivity, _args):
	return

func getExtraSubText(hasMilk):
	var result = []
	
	if(hasMilk && RNG.chance(30)):
		result.append(RNG.pick([
			"Lonely drops of {sub.milk} stream down {dom.yourHis} lips.",
			"{sub.YourHis} nipples are leaking {sub.milk}.",
			"{sub.YourHis} nipples are quite leaky.",
			"{sub.YourHis} hard nips are leaking {sub.milk}.",
			"{sub.YourHis} breasts seem to be full of {sub.milk}.",
		]))
		
	if(!hasMilk && RNG.chance(20)):
		result.append(RNG.pick([
			" {sub.YourHis} nipples are being stimulated.",
			" {sub.YourHis} nipples are hard from feeling {dom.yourHis} lips.",
			" {sub.YourHis} nipples are hard from being rubbed.",
		]))
		
	if(getSub().hasEffect(StatusEffect.SoreNipplesAfterMilking) && RNG.chance(50)):
		result.append(RNG.pick([
			"{sub.YourHis} nipples are sore!",
			"{sub.YourHis} nipples are sore which makes this painful.",
			"{sub.YourHis} nipples are sore which brings {sub.youHim} discomfort.",
			"{sub.YourHis} nipples are sore which brings {sub.youHim} pain.",
		]))
	
	if(result.size() > 0):
		return " "+Util.join(result, " ")
	return ""

func processTurn():
	if(kneadBonus > 0):
		kneadBonus -= 1
#	if(state == ""):
#		var text = RNG.pick([
#			"{dom.You} {dom.youVerb('hold')} {dom.yourHis} hands on {sub.your} chest.",
#			"{dom.You} {dom.youVerb('hold')} {dom.yourHis} hands on {sub.your} {sub.breasts}.",
#			"{dom.You} {dom.youVerb('rest')} {dom.yourHis} hands on {sub.your} chest.",
#		])
#
#		return {text = text}
	if(state == "feeding"):
		gropeAmount += 1
		var breasts:BodypartBreasts = getSub().getBodypart(BodypartSlot.Breasts)
		var milkProduciton:FluidProduction = breasts.getFluidProduction()
		var fluids:Fluids = breasts.getFluids()
		
		if(milkProduciton.getFluidAmount() < 5.0):
			var text = RNG.pick([
				"{dom.You} {dom.youVerb('try', 'tries')} to feed on {sub.your} breasts but no milk comes out.",
				"{dom.You} {dom.youVerb('suckle')} on {sub.your} nipples but no milk comes out.",
				"{dom.You} {dom.youVerb('suckle')} on {sub.your} nipples, chasing the aftertaste of {sub.yourHis} milk.",
				"{dom.You} {dom.youVerb('lick')} and {dom.youVerb('put')} pressure on {sub.your} nipples, trying to milk them.",
			])
			text += getExtraSubText(false)
			
			if(getSub().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
				subInfo.addPain(1)
			
			if(RNG.chance(30) && getSub().stimulateLactation()):
				text += RNG.pick([
					" {sub.You} suddenly began [b]lactating[/b]!",
					" {sub.Your} breasts suddenly began [b]lactating[/b]!",
					" {sub.Your} breasts suddenly began [b]producing {sub.milk}[/b]!",
				])
			
			affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.1, -0.01)
			affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.03)
			subInfo.addArousalForeplay(0.05)
			domInfo.addArousalForeplay(0.05)
			
			if(gropeAmount > 20 && RNG.chance(5) && !getSub().hasPerk(Perk.MilkNoSoreNipples) && !getSub().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
				if(getSub().addEffect(StatusEffect.SoreNipplesAfterMilking)):
					text += RNG.pick([
						" {sub.Your} nipples started to feel [b]sore[/b] after {dom.yourHis} attempts.",
					])
			return {
				text = text,
				domSay = domReaction(SexReaction.DomBreastfeedsOnSub, 5),
				subSay = subReaction(SexReaction.DomBreastfeedsOnSub, 30),
			}
		else:
			var extraMessages = []
			var fluidByAmount = fluids.getFluidAmountByType()
			var totalAmount = fluids.getFluidAmount()

			var minAmount = RNG.randf_range(1.0, 10.0)
			var minRatio = 0.001
			if(kneadBonus > 0):
				if(kneadBonus == 1):
					minAmount = RNG.randf_range(10.0, 20.0)
					minRatio = 0.02
				else:
					minAmount = RNG.randf_range(5.0, 50.0)
					minRatio = 0.01
			var howMuchCollected = getSub().getBodypart(BodypartSlot.Breasts).getFluids().transferTo(getDom().getBodypart(BodypartSlot.Head), minRatio, minAmount)
			var howMuchCollectedStr = str(Util.roundF(howMuchCollected, 1))+" ml"
			
			if(howMuchCollected > 0.0):
				for fluidID in fluidByAmount:
					var fluidObject:FluidBase = GlobalRegistry.getFluid(fluidID)
					if(fluidObject == null):
						continue
					
					var share = fluidByAmount[fluidID] / totalAmount
					var resultMessage = fluidObject.onSwallow(getDom(), share*howMuchCollected*10.0)
					if(resultMessage != null && resultMessage != ""):
						extraMessages.append(resultMessage)
			
			var text = RNG.pick([
				"{dom.You} actively {dom.youVerb('feed')} on {sub.your} leaky nipples, consuming "+howMuchCollectedStr+".",
				"{dom.You} {dom.youVerb('suckle')} on {sub.your} nipples, feeling a taste of {sub.milk} on {dom.yourHis} tongue, consuming "+howMuchCollectedStr+" of it.",
				"{dom.You} {dom.youVerb('breastfeed')} on {sub.your} {sub.breasts}, consuming "+howMuchCollectedStr+".",
				
			])
			if(extraMessages.size() > 0):
				text += " "+Util.join(extraMessages)
			text += getExtraSubText(true)
			
			if(getSub().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
				subInfo.addPain(1)
			
			affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.1, -0.01)
			affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.03)
			subInfo.addArousalForeplay(0.1)
			domInfo.addArousalForeplay(0.1)
			subInfo.addArousalSex(0.06)
			
			if(gropeAmount > 20 && RNG.chance(2) && !getSub().hasPerk(Perk.MilkNoSoreNipples) && !getSub().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
				if(getSub().addEffect(StatusEffect.SoreNipplesAfterMilking)):
					text += RNG.pick([
						" {sub.Your} nipples started to feel [b]sore[/b] after so much feeding.",
					])
			
			return {
				text = text,
				domSay = domReaction(SexReaction.DomBreastfeedsOnSub, 5),
				subSay = subReaction(SexReaction.DomBreastfeedsOnSub, 30),
			}
		
	return
	
func getDomActions():
	var actions = []

	if(state in [""]):
		if(getSub().getFirstItemThatCoversBodypart(BodypartSlot.Breasts) == null):
			actions.append({
				"id": "startfeed",
				"score": 1.0,
				"name": "Start feeding",
				"desc": "Begin to feed on them!",
			})

	if(state in ["feeding"]):
		actions.append({
			"id": "knead",
			"score": (0.5 / float(Util.maxi(1, kneadBonus+1))),
			"name": "Knead breasts",
			"desc": "Knead their breasts to increase the flow",
		})
		
	var breasts:BodypartBreasts = getSub().getBodypart(BodypartSlot.Breasts)
	var milkProduciton:FluidProduction = breasts.getFluidProduction()
	
	actions.append({
		"id": "stop",
		"score": (0.35 if ((gropeAmount > 5 && milkProduciton.getFluidAmount() < 5.0) || gropeAmount > 20) else 0.0),
		"name": "Stop feeding",
		"desc": "Enough feeding",
	})

	return actions

func doDomAction(_id, _actionInfo):
	if(_id == "knead"):
		if(getSub().canBeMilked()):
			kneadBonus += 2
			var text = RNG.pick([
				"{dom.You} {dom.youVerb('knead')} {sub.yourHis} {sub.breasts} and the flow of {sub.milk} increases!",
				"{dom.You} {dom.youVerb('knead')} {sub.yourHis} {sub.breasts} at the same time as breastfeeding.",
				"{dom.You} {dom.youVerb('knead')} {sub.yourHis} {sub.breasts}.",
				"{dom.You} {dom.youVerb('massage')} {sub.yourHis} {sub.breasts}.",
			])
				
			if(RNG.chance(10) && getSub().isLactating() && !getSub().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
				var breasts:BodypartBreasts = getSub().getBodypart(BodypartSlot.Breasts)
				var milkProduciton:FluidProduction = breasts.getFluidProduction()
				if(milkProduciton != null):
					milkProduciton.fillPercent(RNG.randf_rangeX2(0.05, 0.5))
					text += RNG.pick([
						" The stimulation causes the breasts to get heavier.",
						" Stimulating the breasts is making them produce more {sub.milk}.",
						" {sub.YourHis} breasts are producing more {sub.milk}.",
					])
			if(getSub().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
				subInfo.addPain(3)
			
			subInfo.addArousalSex(0.03)
			affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.1, -0.01)
			affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.03)
			return {text = text}
		else:
			var text = RNG.pick([
				"{dom.You} {dom.youVerb('knead')} {sub.yourHis} {sub.breasts}, stimulating them.",
				"{dom.You} {dom.youVerb('massage')} {sub.yourHis} {sub.breasts}, stimulating them.",
				"{dom.You} {dom.youVerb('knead')} {sub.yourHis} {sub.breasts} with {dom.yourHis} hands.",
			])
			subInfo.addArousalSex(0.01)
			affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.02, -0.1, -0.01)
			affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.02, -0.03)
			
			if(getSub().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
				subInfo.addPain(3)
			
			if(RNG.chance(70) && getSub().stimulateLactation()):
				text += RNG.pick([
					" {sub.You} suddenly began [b]lactating[/b]!",
					" {sub.Your} breasts suddenly began [b]lactating[/b]!",
					" {sub.Your} breasts suddenly began [b]producing {sub.milk}[/b]!",
				])
			
			return {text = text}
	
	if(_id == "startfeed"):
		state = "feeding"
		var text = RNG.pick([
			"{dom.You} began actively feeding on {sub.your} {sub.breasts}!",
		])
		
		affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.02, -0.1, -0.01)
		affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.02, -0.03)
		subInfo.addArousalForeplay(0.05)
		domInfo.addArousalForeplay(0.05)
		
		return {text = text}

	if(_id == "stop"):
		endActivity()
		satisfyGoals()

		var text = RNG.pick([
			"{dom.You} {dom.youVerb('quit')} feedng on {sub.yourHis} chest.",
		])

		return {text = text}

func getSubActions():
	var actions = []

	actions.append({
		"id": "pullaway",
		"score": subInfo.getResistScore(),
		"name": "Resist feeding",
		"desc": "Try to pull away",
		"chance": getSubResistChance(30.0, 25.0),
	})
	if(state in ["feeding"]):
		actions.append({
				"id": "moan",
				"score": max(0.1, subFetishScore({Fetish.Lactation: 0.5}) + subPersonalityScore({PersonalityStat.Subby: 0.5})),
				"name": "Moan",
				"desc": "Show how much you like it",
			})
	if(subInfo.isReadyToCum() && isHandlingSubOrgasms()):
		actions.append({
			"id": "cum",
			"score": 1.0,
			"name": "Cum!",
			"desc": "You gonna cum.",
			"priority": 1001,
		})

	return actions

func getSubResistChance(baseChance, domAngerRemoval):
	var theChance = baseChance - domInfo.getAngerScore()*domAngerRemoval
	if(getSub().hasBlockedHands()):
		theChance *= 0.5
	if(getSub().hasBoundArms()):
		theChance *= 0.5
	if(getSub().isBlindfolded()):
		theChance *= 0.8
	if(getSub().hasBoundLegs()):
		theChance *= 0.5
	
	return max(theChance, 5.0)

func doSubAction(_id, _actionInfo):
	if(_id == "cum"):
		getSub().cumOnFloor()
		subInfo.cum()
		
		var extraText = ""
		if(getSub().isLactating()):
			extraText = ", {sub.yourHis} {sub.breasts} squirt {sub.milk} out from this nipple orgasm"
		
		if(RNG.chance(30) && !getSub().hasPerk(Perk.MilkNoSoreNipples) && !getSub().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
			getSub().addEffect(StatusEffect.SoreNipplesAfterMilking)
		
		return getGenericSubOrgasmData(extraText)
	
	if(_id == "pullaway"):
		var successChance = getSubResistChance(30.0, 25.0)
		if(RNG.chance(successChance)):
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('pull')} away from {dom.your} lips.",
			])
			domInfo.addAnger(0.3)
			if(state != ""):
				state = ""
			else:
				satisfyGoals()
				endActivity()
			return {text = text}
		else:
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('try', 'tries')} to pull away from {dom.you} but {sub.youVerb('fail')}.",
			])
			domInfo.addAnger(0.1)
			return {text = text,subSay=subReaction(SexReaction.ActivelyResisting, 50)}
	if(_id == "moan"):
		var moanText = RNG.pick([
			"{sub.youVerb('moan')}"
		])
		if(getSub().isGagged()):
			moanText = RNG.pick([
				"{sub.youVerb('let')} out muffled moans",
				"{sub.youVerb('let')} out a muffled moan",
				"{sub.youVerb('let')} out a muffled noise of pleasure",
			])
		
		var text = RNG.pick([
			"{sub.You} "+moanText+" while breastfeeding {dom.you}!",
			"{sub.You} "+moanText+" while having {sub.yourHis} nipples fed on!",
			"{sub.You} "+moanText+" eagerly!",
		])
		domInfo.addAnger(-0.02)
		domInfo.addLust(5)
		subInfo.addArousalSex(0.02)
		return {text = text}

	return

func getSubOrgasmHandlePriority():
	return 3

func getAnimationPriority():
	return 1

func getAnimation():
	if(state in [""]):
		return [StageScene.BreastFeeding, "tease", {npc=domID, pc=subID}]
	return [StageScene.BreastFeeding, "feed", {npc=domID, pc=subID}]
	

func saveData():
	var data = .saveData()
	
	data["gropeAmount"] = gropeAmount
	data["kneadBonus"] = kneadBonus

	return data
	
func loadData(data):
	.loadData(data)
	
	gropeAmount = SAVE.loadVar(data, "gropeAmount", 0)
	kneadBonus = SAVE.loadVar(data, "kneadBonus", 0)
