extends SexActivityBase
var gropeAmount = 0
var kneadBonus = 0

func _init():
	id = "DomBreastfeedsSub"

func getGoals():
	return {
		SexGoal.BreastFeedSub: 1.0,
	}

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return 0.0

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getVisibleName():
	return "Breastfeed sub"

func getCategory():
	return ["Breasts"]

func getDomTags():
	var thetags = [SexActivityTag.BreastsUsed]
	return thetags

func getSubTags():
	var thetags = [SexActivityTag.MouthUsed, SexActivityTag.HavingSex]
	return thetags

func startActivity(_args):
	state = ""
	
	var clothingItem = getDom().getFirstItemThatCoversBodypart(BodypartSlot.Breasts)
	var throughTheClothing = ""
	if(clothingItem != null):
		throughTheClothing = " clothed"#" through the "+clothingItem.getCasualName()
	
	var text = RNG.pick([
		"{dom.You} {dom.youVerb('sit')} on {sub.your} lap and {dom.youVerb('push', 'pushes')} {dom.yourHis}"+throughTheClothing+" chest into {sub.yourHis} face.",
	])
	
	affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.1, -0.01)
	affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.03)
	
	return {
		text = text,
		#domSay = domReaction(SexReaction.AboutToRubPussiesTogether),
	}

func onSwitchFrom(_otherActivity, _args):
	return

func getExtraDomText(hasMilk):
	var result = []
	
	if(hasMilk && RNG.chance(30)):
		result.append(RNG.pick([
			"Lonely drops of {dom.milk} stream down {sub.yourHis} lips.",
			"{dom.YourHis} nipples are leaking {dom.milk}.",
			"{dom.YourHis} nipples are quite leaky.",
			"{dom.YourHis} hard nips are leaking {dom.milk}.",
			"{dom.YourHis} breasts seem to be full of {dom.milk}.",
		]))
		
	if(!hasMilk && RNG.chance(20)):
		result.append(RNG.pick([
			" {dom.YourHis} nipples are being stimulated.",
			" {dom.YourHis} nipples are hard from feeling {sub.yourHis} lips.",
			" {dom.YourHis} nipples are hard from being rubbed.",
		]))
		
	if(getDom().hasEffect(StatusEffect.SoreNipplesAfterMilking) && RNG.chance(50)):
		result.append(RNG.pick([
			"{dom.YourHis} nipples are sore!",
			"{dom.YourHis} nipples are sore which makes this painful.",
			"{dom.YourHis} nipples are sore which brings {dom.youHim} discomfort.",
			"{dom.YourHis} nipples are sore which brings {dom.youHim} pain.",
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
		var breasts:BodypartBreasts = getDom().getBodypart(BodypartSlot.Breasts)
		var milkProduciton:FluidProduction = breasts.getFluidProduction()
		var fluids:Fluids = breasts.getFluids()
		
		if(milkProduciton.getFluidAmount() < 5.0):
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('try', 'tries')} to feed on {dom.your} breasts but no milk comes out.",
				"{sub.You} {sub.youVerb('suckle')} on {dom.your} nipples but no milk comes out.",
				"{sub.You} {sub.youVerb('suckle')} on {dom.your} nipples, chasing the aftertaste of {dom.yourHis} milk.",
				"{sub.You} {sub.youVerb('lick')} and {sub.youVerb('put')} pressure on {dom.your} nipples, trying to milk them.",
				"{dom.You} {dom.youAre} trying to breastfeed {sub.you} but {dom.youHe} {dom.youAre} not lactating.",
			])
			text += getExtraDomText(false)
			
			if(getDom().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
				domInfo.addPain(1)
			
			if(RNG.chance(30) && getDom().stimulateLactation()):
				text += RNG.pick([
					" {dom.You} suddenly began [b]lactating[/b]!",
					" {dom.Your} breasts suddenly began [b]lactating[/b]!",
					" {dom.Your} breasts suddenly began [b]producing {dom.milk}[/b]!",
				])
			
			affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.1, -0.01)
			affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.03)
			subInfo.addArousalForeplay(0.05)
			domInfo.addArousalForeplay(0.05)
			
			if(gropeAmount > 20 && RNG.chance(5) && !getDom().hasPerk(Perk.MilkNoSoreNipples) && !getDom().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
				if(getDom().addEffect(StatusEffect.SoreNipplesAfterMilking)):
					text += RNG.pick([
						" {dom.Your} nipples started to feel [b]sore[/b].",
					])
			return {
				text = text,
				domSay = domReaction(SexReaction.DomBreastfeedsSub, 30),
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
			var howMuchCollected = getDom().getBodypart(BodypartSlot.Breasts).getFluids().transferTo(getSub().getBodypart(BodypartSlot.Head), minRatio, minAmount)
			var howMuchCollectedStr = str(Util.roundF(howMuchCollected, 1))+" ml"
			
			if(howMuchCollected > 0.0):
				for fluidID in fluidByAmount:
					var fluidObject:FluidBase = GlobalRegistry.getFluid(fluidID)
					if(fluidObject == null):
						continue
					
					var share = fluidByAmount[fluidID] / totalAmount
					var resultMessage = fluidObject.onSwallow(getSub(), share*howMuchCollected*10.0)
					if(resultMessage != null && resultMessage != ""):
						extraMessages.append(resultMessage)
			
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('feed')} on {dom.your} "+RNG.pick(["leaky", "lactating"])+" nipples, consuming "+howMuchCollectedStr+".",
				"{sub.You} {sub.youVerb('suckle')} on {dom.your} nipples, feeling a taste of {dom.milk} on {sub.yourHis} tongue, consuming "+howMuchCollectedStr+" of it.",
				"{sub.You} {sub.youVerb('breastfeed')} on {dom.your} {dom.breasts}, consuming "+howMuchCollectedStr+".",
				"{dom.You} {dom.youAre} breastfeeding {sub.you}, making {sub.youHim} consume "+howMuchCollectedStr+".",
			])
			if(extraMessages.size() > 0):
				text += " "+Util.join(extraMessages)
			text += getExtraDomText(true)
			
			if(getDom().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
				domInfo.addPain(1)
			
			affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.1, -0.01)
			affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.03)
			subInfo.addArousalForeplay(0.1)
			domInfo.addArousalForeplay(0.1)
			domInfo.addArousalSex(0.06)
			
			if(gropeAmount > 20 && RNG.chance(2) && !getDom().hasPerk(Perk.MilkNoSoreNipples) && !getDom().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
				if(getDom().addEffect(StatusEffect.SoreNipplesAfterMilking)):
					text += RNG.pick([
						" {dom.Your} nipples started to feel [b]sore[/b] after so much feeding.",
					])
			
			return {
				text = text,
				domSay = domReaction(SexReaction.DomBreastfeedsSub, 30),
			}
		
	return
	
func getDomActions():
	var actions = []

	if(state in [""]):
		if(getDom().getFirstItemThatCoversBodypart(BodypartSlot.Breasts) == null && !getSub().isOralBlocked()):
			actions.append({
				"id": "forcefeed",
				"score": 1.0,
				"name": "Force feed",
				"desc": "Try to force them.",
				"chance": 30,
			})

	if(state in ["feeding"]):
		actions.append({
				"id": "moan",
				"score": max(0.1, domFetishScore({Fetish.Lactation: 0.5}) + domPersonalityScore({PersonalityStat.Subby: 0.5})),
				"name": "Moan",
				"desc": "Show how much you like it",
			})
		actions.append({
				"id": "praise",
				"score": -domInfo.getAngerScore() + max(0.0, domFetishScore({Fetish.Lactation: 0.5}) - domPersonalityScore({PersonalityStat.Subby: 0.5})),
				"name": "Praise",
				"desc": "Tell them how well they do",
			})
	if(domInfo.isReadyToCum() && isHandlingDomOrgasms()):
		actions.append({
			"id": "cum",
			"score": 1.0,
			"name": "Cum!",
			"desc": "You gonna cum.",
			"priority": 1001,
		})
		
	var breasts:BodypartBreasts = getDom().getBodypart(BodypartSlot.Breasts)
	var milkProduciton:FluidProduction = breasts.getFluidProduction()
	
	actions.append({
		"id": "stop",
		"score": (0.35 if ((gropeAmount > 5 && milkProduciton.getFluidAmount() < 5.0) || gropeAmount > 10) else 0.0),
		"name": "Stop feeding",
		"desc": "Enough feeding",
	})

	return actions

func doDomAction(_id, _actionInfo):
	if(_id == "cum"):
		getDom().cumOnFloor()
		domInfo.cum()
		
		var extraText = ""
		if(getDom().isLactating()):
			extraText = ", {dom.yourHis} {dom.breasts} squirt {dom.milk} out from this nipple orgasm"
		
		if(RNG.chance(30) && !getDom().hasPerk(Perk.MilkNoSoreNipples) && !getDom().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
			getDom().addEffect(StatusEffect.SoreNipplesAfterMilking)
		
		return getGenericDomOrgasmData(extraText)
	
	if(_id == "praise"):
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('praise')} {sub.you}!",
			"{dom.You} {dom.youVerb('praise')} {sub.you} for feeding on {dom.yourHis} {dom.breasts}!",
			"{sub.You} {sub.youAre} being praised by {dom.youHim}.",
		])
		subInfo.addFear(-0.02)
		subInfo.addLust(5)
		domInfo.addArousalSex(0.02)
		return {
			text = text,
			domSay = domReaction(SexReaction.DomBreastfeedPraise),
		}
	
	if(_id == "moan"):
		var moanText = RNG.pick([
			"{dom.youVerb('moan')}"
		])
		if(getDom().isGagged()):
			moanText = RNG.pick([
				"{dom.youVerb('let')} out muffled moans",
				"{dom.youVerb('let')} out a muffled moan",
				"{dom.youVerb('let')} out a muffled noise of pleasure",
			])
		
		var text = RNG.pick([
			"{dom.You} "+moanText+" while breastfeeding {sub.you}!",
			"{dom.You} "+moanText+" while having {dom.yourHis} nipples fed on!",
			"{dom.You} "+moanText+" eagerly!",
		])
		subInfo.addFear(-0.02)
		subInfo.addLust(5)
		domInfo.addArousalSex(0.02)
		return {text = text}
	
	if(_id == "forcefeed"):
		if(RNG.chance(30)):
			state = "feeding"
			var text = RNG.pick([
				"{dom.You} {dom.youVerb('force')} {sub.you} to start feeding on {dom.yourHis} {dom.breasts}!",
			])
			
			affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.02, -0.1, -0.01)
			affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.02, -0.03)
			subInfo.addArousalForeplay(0.05)
			domInfo.addArousalForeplay(0.05)
		
			return {text = text}
		else:
			var text = RNG.pick([
				"{dom.You} {dom.youVerb('try', 'tries')} to force {sub.you} to start feeding on {dom.yourHis} {dom.breasts}.",
				"{dom.You} {dom.youVerb('pull')} {sub.your} head close to {dom.yourHis} breasts, trying to start feeding {sub.youHim}.",
			])
			
			affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.02, -0.1, -0.01)
			affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.02, -0.03)
		
			return {text = text}

	if(_id == "stop"):
		endActivity()
		satisfyGoals()

		var text = RNG.pick([
			"{dom.You} {dom.youVerb('quit')} feedng {sub.youHim}.",
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

	if(state in [""]):
		if(getDom().getFirstItemThatCoversBodypart(BodypartSlot.Breasts) == null && !getSub().isOralBlocked()):
			actions.append({
				"id": "startfeed",
				"score": subInfo.getComplyScore() / 2.0 + subInfo.fetishScore({Fetish.Lactation: 0.3}) + subInfo.personalityScore({PersonalityStat.Subby: 0.3}),
				"name": "Start feeding",
				"desc": "Try to force them.",
			})

	if(state in ["feeding"]):
		if(!getSub().hasBoundArms()):
			actions.append({
				"id": "knead",
				"score": subInfo.fetishScore({Fetish.Lactation: 1.0}) * (0.5 / float(Util.maxi(1, kneadBonus+1))),
				"name": "Knead breasts",
				"desc": "Knead their breasts to increase the flow",
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
	
	if(_id == "startfeed"):
		state = "feeding"
		var text = RNG.pick([
			"{sub.You} began actively feeding on {dom.your} {dom.breasts}!",
		])
		
		affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.02, -0.1, -0.01)
		affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.02, -0.03)
		subInfo.addArousalForeplay(0.05)
		domInfo.addArousalForeplay(0.05)
		
		return {text = text}
	
	if(_id == "knead"):
		if(getDom().canBeMilked()):
			kneadBonus += 2
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('knead')} {dom.yourHis} {dom.breasts} and the flow of {dom.milk} increases!",
				"{sub.You} {sub.youVerb('knead')} {dom.yourHis} {dom.breasts} at the same time as breastfeeding.",
				"{sub.You} {sub.youVerb('knead')} {dom.yourHis} {dom.breasts}.",
				"{sub.You} {sub.youVerb('massage')} {dom.yourHis} {dom.breasts}.",
			])
				
			if(RNG.chance(10) && getDom().isLactating() && !getDom().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
				var breasts:BodypartBreasts = getDom().getBodypart(BodypartSlot.Breasts)
				var milkProduciton:FluidProduction = breasts.getFluidProduction()
				if(milkProduciton != null):
					milkProduciton.fillPercent(RNG.randf_rangeX2(0.05, 0.5))
					text += RNG.pick([
						" The stimulation causes the breasts to get heavier.",
						" Stimulating the breasts is making them produce more {dom.milk}.",
						" {dom.YourHis} breasts are producing more {dom.milk}.",
					])
			if(getDom().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
				domInfo.addPain(3)
			
			domInfo.addArousalSex(0.03)
			affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.1, -0.01)
			affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.03)
			return {text = text}
		else:
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('knead')} {dom.yourHis} {dom.breasts}, stimulating them.",
				"{sub.You} {sub.youVerb('massage')} {dom.yourHis} {dom.breasts}, stimulating them.",
				"{sub.You} {sub.youVerb('knead')} {dom.yourHis} {dom.breasts} with {sub.yourHis} hands.",
			])
			domInfo.addArousalSex(0.01)
			affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.02, -0.1, -0.01)
			affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.02, -0.03)
			
			if(getDom().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
				domInfo.addPain(3)
			
			if(RNG.chance(70) && getDom().stimulateLactation()):
				text += RNG.pick([
					" {dom.You} suddenly began [b]lactating[/b]!",
					" {dom.Your} breasts suddenly began [b]lactating[/b]!",
					" {dom.Your} breasts suddenly began [b]producing {dom.milk}[/b]!",
				])
			
			return {text = text}
	
	if(_id == "pullaway"):
		var successChance = getSubResistChance(30.0, 25.0)
		if(RNG.chance(successChance)):
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('pull')} away from {dom.your} breasts.",
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


	return

func getDomOrgasmHandlePriority():
	return 3

func getAnimationPriority():
	return 1

func getAnimation():
	if(state in [""]):
		return [StageScene.BreastFeeding, "teasealt", {pc=domID, npc=subID}]
	return [StageScene.BreastFeeding, "feedalt", {pc=domID, npc=subID}]
	

func saveData():
	var data = .saveData()
	
	data["gropeAmount"] = gropeAmount
	data["kneadBonus"] = kneadBonus

	return data
	
func loadData(data):
	.loadData(data)
	
	gropeAmount = SAVE.loadVar(data, "gropeAmount", 0)
	kneadBonus = SAVE.loadVar(data, "kneadBonus", 0)
