extends SexActivityBase
var gropeAmount = 0
var alsoCock = false

func _init():
	id = "DomGropesSubsBreasts"

func getGoals():
	return {
		SexGoal.GropeBreasts: 1.0,
	}

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(!_subInfo.getChar().hasNonFlatBreasts()):
		return 0.0
	
	if(subInfo.getChar().canBeMilked()):
		return max(0.0, _domInfo.fetishScore({Fetish.Lactation: 0.02}))
	return max(0.0, _domInfo.fetishScore({Fetish.Lactation: 0.01}))

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getVisibleName():
	return "Grope breasts"

func getCategory():
	return ["Breasts"]

func getDomTags():
	var thetags = [SexActivityTag.HandsUsed]
	return thetags

func getSubTags():
	var thetags = [SexActivityTag.BreastsUsed, SexActivityTag.HavingSex]
	return thetags

func startActivity(_args):
	state = ""
	
	var clothingItem = getSub().getFirstItemThatCoversBodypart(BodypartSlot.Breasts)
	var throughTheClothing = ""
	if(clothingItem != null):
		throughTheClothing = " through the "+clothingItem.getCasualName()
	
	var text = RNG.pick([
		"{dom.You} {dom.youVerb('put')} {dom.yourHis} hands on {sub.your} {sub.breasts} and gets a feel for them"+throughTheClothing+".",
	])
	
	affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.1, -0.01)
	affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.03)
	
	return {
		text = text,
		domSay=domReaction(SexReaction.DomAboutToStartGropingSubsBreasts, 100),
		subSay=subReaction(SexReaction.DomAboutToStartGropingSubsBreasts, 30),
	}

func onSwitchFrom(_otherActivity, _args):
	return

func getExtraSubText():
	var result = []
	
	if(getSub().canBeMilked() && RNG.chance(30)):
		result.append(RNG.pick([
			"Lonely drops of {sub.milk} stream down {dom.yourHis} fingers.",
			"{sub.YourHis} nipples are leaking {sub.milk}.",
			"{sub.YourHis} nipples are quite leaky.",
			"{sub.YourHis} hard nips are leaking {sub.milk}.",
			"{sub.YourHis} breasts seem to be full of {sub.milk}.",
			"{sub.YourHis} breasts are lactating.",
		]))
	if(!getSub().canBeMilked() && RNG.chance(10)):
		result.append(RNG.pick([
			"{sub.YourHis} nipples are being stimulated.",
			"{sub.YourHis} nipples are hard from being touched.",
			"{sub.YourHis} nipples are hard from being rubbed.",
			"Nothing comes out from {sub.yourHis} nipples.",
			"{sub.YourHis} breasts get groped but nothing comes out.",
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
	gropeAmount += 1
	if(state == ""):
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('hold')} {dom.yourHis} hands on {sub.your} chest.",
			"{dom.You} {dom.youVerb('hold')} {dom.yourHis} hands on {sub.your} {sub.breasts}.",
			"{dom.You} {dom.youVerb('rest')} {dom.yourHis} hands on {sub.your} chest.",
		])
		
		return {text = text}
		
	if(state == "groping"):
		var clothingItem = getSub().getFirstItemThatCoversBodypart(BodypartSlot.Breasts)
		var throughTheClothing = ""
		if(clothingItem != null):
			throughTheClothing = " through the "+clothingItem.getCasualName()
		
		var text = RNG.pick([
			"{dom.You} actively {dom.youVerb('grope')} {sub.your} chest"+throughTheClothing+".",
			"{dom.You} actively {dom.youVerb('rub')} {sub.your} chest"+throughTheClothing+".",
			"{dom.You} {dom.youVerb('grope')} {sub.your} {sub.breasts}"+throughTheClothing+".",
			"{dom.You} {dom.youVerb('massage')} {sub.your} {sub.breasts}"+throughTheClothing+".",
			"{dom.You} {dom.youVerb('knead')} {sub.your} {sub.breasts}"+throughTheClothing+".",
			"{dom.You} {dom.youVerb('rub')} and {dom.youVerb('knead')} {sub.your} {sub.breasts}"+throughTheClothing+".",
			"{dom.You} {dom.youVerb('play')} with {sub.your} {sub.breasts}"+throughTheClothing+".",
		])
		text += getExtraSubText()
		
		if(getSub().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
			subInfo.addPain(1)
		
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
		
		if(getSub().stimulateLactation()):
			text += RNG.pick([
				" {sub.You} suddenly began [b]lactating[/b]!",
				" {sub.Your} breasts suddenly began [b]lactating[/b]!",
				" {sub.Your} breasts suddenly began [b]producing {sub.milk}[/b]!",
			])
		
		affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.1, -0.01)
		affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.03)
		subInfo.addArousalForeplay(0.1)
		domInfo.addArousalForeplay(0.1)
		subInfo.addArousalSex(0.01)
		
		if(gropeAmount > 20 && RNG.chance(2) && !getSub().hasPerk(Perk.MilkNoSoreNipples) && !getSub().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
			if(getSub().addEffect(StatusEffect.SoreNipplesAfterMilking)):
				text += RNG.pick([
					" {sub.Your} nipples started to feel [b]sore[/b] after so much groping.",
				])
		
		if(alsoCock):
			if(!subInfo.isReadyToPenetrate()):
				alsoCock = false
			else:
				subInfo.addArousalSex(0.03)
				text += RNG.pick([
					" {dom.yourHis} free hand is stroking {sub.yourHis} {sub.penis}.",
					" {dom.yourHis} free hand is stroking {sub.youHim}.",
					" {dom.yourHis} is also stroking {sub.youHim}.",
					" {dom.yourHis} is also stroking {sub.youHim} at the same time.",
				])
		
		return {
			text = text,
			domSay=domReaction(SexReaction.DomGropesSubsBreasts, 10),
			subSay=subReaction(SexReaction.DomGropesSubsBreasts, 20),
		}
		
	return
	
func getDomActions():
	var actions = []

	if(state in [""]):
		actions.append({
			"id": "startgrope",
			"score": 1.0,
			"name": "Start groping",
			"desc": "Begin to grope them!",
		})

	if(state in ["groping"]):
		actions.append({
			"id": "squeeze",
			"score": 0.2,
			"name": "Squeeze breasts",
			"desc": "Squeeze their breasts tightly!",
		})
		
		if(!alsoCock && subInfo.isReadyToPenetrate() && getSub().hasReachablePenis() && getSub().getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
			actions.append({
				"id": "startstrokecock",
				"score": 0.3,
				"name": "Stroke cock",
				"desc": "Stroke their cock as well",
			})
		
	actions.append({
		"id": "stop",
		"score": (0.15 if gropeAmount > 7 else 0.0),
		"name": "Stop groping",
		"desc": "Enough groping",
	})

	return actions

func doDomAction(_id, _actionInfo):
	if(_id == "startstrokecock"):
		alsoCock = true
		
		var text = RNG.pick([
			"{dom.You} began stroking {sub.your} {sub.penis} as well!",
		])
		return {text = text}
	
	if(_id == "squeeze"):
		if(getSub().canBeMilked()):
			var howMuchCollected = getSub().getBodypart(BodypartSlot.Breasts).getFluids().drainPercent(0.1)
			var howMuchCollectedStr = str(Util.roundF(howMuchCollected, 1))+" ml"
					
			var text = RNG.pick([
				"{dom.You} {dom.youVerb('squeeze')} {sub.yourHis} {sub.breasts} tightly and "+howMuchCollectedStr+" of {sub.milk} leaks out.",
			])
			subInfo.addArousalSex(0.05)
			affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.1, -0.01)
			affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.03)
			return {text = text}
		else:
			var text = RNG.pick([
				"{dom.You} {dom.youVerb('squeeze')} {sub.yourHis} {sub.breasts} tightly.",
				"{dom.You} {dom.youVerb('squeeze')} {sub.yourHis} {sub.breasts} tightly but nothing leaks out.",
			])
			subInfo.addArousalSex(0.01)
			affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.02, -0.1, -0.01)
			affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.02, -0.03)
			return {text = text}
	
	if(_id == "startgrope"):
		var clothingItem = getSub().getFirstItemThatCoversBodypart(BodypartSlot.Vagina)
		var throughTheClothing = ""
		if(clothingItem != null):
			throughTheClothing = " through {sub.yourHis} "+clothingItem.getCasualName()
		
		state = "groping"
		var text = RNG.pick([
			"{dom.You} began actively groping {sub.you}"+throughTheClothing+"!",
		])
		
		affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.02, -0.1, -0.01)
		affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.02, -0.03)
		subInfo.addArousalForeplay(0.05)
		domInfo.addArousalForeplay(0.05)
		
		return {
			text = text,
			domSay=domReaction(SexReaction.DomStartsGropingSubsBreasts, 100),
			subSay=subReaction(SexReaction.DomStartsGropingSubsBreasts, 50),
		}

	if(_id == "stop"):
		endActivity()
		satisfyGoals()

		var text = RNG.pick([
			"{dom.You} {dom.youVerb('quit')} groping {sub.yourHis} chest.",
		])

		return {text = text}

func getSubActions():
	var actions = []

	actions.append({
		"id": "pullaway",
		"score": subInfo.getResistScore(),
		"name": "Resist groping",
		"desc": "Try to pull away",
		"chance": getSubResistChance(30.0, 25.0),
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
				"{sub.You} {sub.youVerb('pull')} away from {dom.your} hands.",
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

func getSubOrgasmHandlePriority():
	return 3

func getAnimationPriority():
	return 1

func getAnimation():
	if(state in [""]):
		return [StageScene.BreastGroping, "tease", {pc=domID, npc=subID}]
	if(alsoCock):
		return [StageScene.BreastGroping, "stroke", {pc=domID, npc=subID}]
	return [StageScene.BreastGroping, "grope", {pc=domID, npc=subID}]
	

func saveData():
	var data = .saveData()
	
	data["gropeAmount"] = gropeAmount
	data["alsoCock"] = alsoCock

	return data
	
func loadData(data):
	.loadData(data)
	
	gropeAmount = SAVE.loadVar(data, "gropeAmount", 0)
	alsoCock = SAVE.loadVar(data, "alsoCock", false)
