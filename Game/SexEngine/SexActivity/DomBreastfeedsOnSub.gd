extends SexActivityBase
var gropeAmount:int = 0
var kneadBonus:int = 0
var noticedSore:bool = false

func _init():
	id = "DomBreastfeedsOnSub"
	
	activityName = "Breastfeed on sub"
	activityDesc = "Try to feed on their breasts!"
	activityCategory = ["Breasts"]

func getGoals():
	return {
		SexGoal.BreastFeedOnSub: 1.0,
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		SexType.TentaclesSex: true,
	}

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return 0.0

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return [SexActivityTag.MouthUsed, SexActivityTag.HavingSex]
	if(_indx == SUB_0):
		return [SexActivityTag.BreastsUsed, SexActivityTag.HavingSex]
	return []

func startActivity(_args):
	if(isTentaclesSex()):
		addTextPick([
			"The tentacles grab and lift {sub.you}, one of the thick tentacles begins to hover near {sub.yourHis}"+getThroughClothingTextCustom(SUB_0, S_BREASTS, " clothed")+" nipples."
		])
	else:
		addTextPick([
			"{dom.You} {dom.youVerb('lean')} close to {sub.your} {sub.breasts}, {dom.yourHis} lips hovering near {sub.yourHis}"+getThroughClothingTextCustom(SUB_0, S_BREASTS, " clothed")+" nipples.",
		])
	
	stimulateBreasts(DOM_0, SUB_0, S_MOUTH, I_TEASE)
	#affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.1, -0.01)
	#affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.03)
	
	noticedSore = getSub().hasEffect(StatusEffect.SoreNipplesAfterMilking)
	react(SexReaction.DomBreastfeedsOnSubStart, [100, 50])

func onSwitchFrom(_otherActivity, _args):
	return

func getExtraSubText(hasMilk:bool) -> String:
	var result:Array = []
	
	if(hasMilk && RNG.chance(30)):
		if(isTentaclesSex()):
			result.append(RNG.pick([
				"Lonely drops of {sub.milk} stream down {sub.yourHis} {sub.breasts}.",
				"{sub.YourHis} nipples are leaking {sub.milk}.",
				"{sub.YourHis} nipples are quite leaky.",
				"{sub.YourHis} hard nips are leaking {sub.milk}.",
				"{sub.YourHis} breasts seem to be full of {sub.milk}.",
			]))
		else:
			result.append(RNG.pick([
				"Lonely drops of {sub.milk} stream down {dom.yourHis} lips.",
				"{sub.YourHis} nipples are leaking {sub.milk}.",
				"{sub.YourHis} nipples are quite leaky.",
				"{sub.YourHis} hard nips are leaking {sub.milk}.",
				"{sub.YourHis} breasts seem to be full of {sub.milk}.",
			]))
		
	if(!hasMilk && RNG.chance(20)):
		if(isTentaclesSex()):
			result.append(RNG.pick([
				" {sub.YourHis} nipples are being stimulated.",
				" {sub.YourHis} nipples are hard from being pumped so much.",
				" {sub.YourHis} nipples are hard from being rubbed.",
			]))
		else:
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

func feeding_processTurn():
	gropeAmount += 1
	var breasts:BodypartBreasts = getSub().getBodypart(BodypartSlot.Breasts)
	var milkProduciton:FluidProduction = breasts.getFluidProduction()
	var fluids:Fluids = breasts.getFluids()
	
	if(milkProduciton.getFluidAmount() < 5.0):
		var text:String
		if(isTentaclesSex()):
			text = RNG.pick([
				"The tentacles pump and knead at {sub.your} breasts, but no milk gets pulled out.",
				"The tentacle tighten rhythmically around {sub.your} chest, suckling at {sub.your} nipples but only fruitlessly.",
				"Slick tendrils work over {sub.your} each nipple, pressing and pulling in an attempt to extract milk.",
				"The tentacles pump and kneed {sub.your} {sub.breasts}, relentless suction tugs at {sub.yourHis} nipples.",
				"The tentacles keep trying to milk {sub.you}, pulsing around {sub.yourHis} {sub.breasts}.",
			])
			text += getExtraSubText(false)
		else:
			text = RNG.pick([
				"{dom.You} {dom.youVerb('try', 'tries')} to feed on {sub.your} breasts but no milk comes out.",
				"{dom.You} {dom.youVerb('suckle')} on {sub.your} nipples but no milk comes out.",
				"{dom.You} {dom.youVerb('suckle')} on {sub.your} nipples, chasing the aftertaste of {sub.yourHis} milk.",
				"{dom.You} {dom.youVerb('lick')} and {dom.youVerb('put')} pressure on {sub.your} nipples, trying to milk them.",
			])
			text += getExtraSubText(false)
		
		if(getSub().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
			getSubInfo().addPain(1)
			sendSexEvent(SexEvent.PainInflicted, DOM_0, SUB_0, {pain=1,isDefense=false,intentional=false})
		
		var suddenlyLactating = false
		if(RNG.chance(30) && getSub().stimulateLactation()):
			suddenlyLactating = true
			text += RNG.pick([
				" {sub.You} suddenly began [b]lactating[/b]!",
				" {sub.Your} breasts suddenly began [b]lactating[/b]!",
				" {sub.Your} breasts suddenly began [b]producing {sub.milk}[/b]!",
			])
		
		#stimulate(DOM_0, S_MOUTH, SUB_0, S_BREASTS, I_TEASE, Fetish.Lactation)
		stimulateBreasts(DOM_0, SUB_0, S_MOUTH, I_NORMAL, SPEED_SLOW)
#		affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.1, -0.01)
#		affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.03)
#		subInfo.addArousalForeplay(0.05)
#		domInfo.addArousalForeplay(0.05)
		
		if(!noticedSore && getSub().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
			noticedSore = true
			if(isTentaclesSex()):
				text += RNG.pick([
					" {sub.Your} nipples started to feel [b]sore[/b] after all the attemps at milking.",
				])
			else:
				text += RNG.pick([
					" {sub.Your} nipples started to feel [b]sore[/b] after {dom.yourHis} attempts.",
				])
		
		sendSexEvent(SexEvent.BreastFeeding, DOM_0, SUB_0, {madeLactate=suddenlyLactating, loadSize=0.0, targetIsDom=false})
		
		addText(text)
		react(SexReaction.DomBreastfeedsOnSub, [10, 30])
	else:
		var extraMessages:Array = []
		var fluidByAmount:Dictionary = fluids.getFluidAmountByType()
		var totalAmount:float = fluids.getFluidAmount()

		var minAmount:float = RNG.randf_range(1.0, 10.0)
		var minRatio:float = 0.001
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
				var share:float = fluidByAmount[fluidID] / totalAmount
				
				var swallowData:Dictionary = getDom().doSwallow(fluidID, share*howMuchCollected*10.0)
				if(swallowData.has("text") && swallowData["text"] != ""):
					extraMessages.append(swallowData["text"])
		
		var text:String
		if(isTentaclesSex()):
			text = RNG.pick([
				"Tentacles milk {sub.your} breasts, their suckling tips drawing out and consuming "+howMuchCollectedStr+" of {sub.yourHis} {sub.milk}.",
				"Tentacles stimulate {sub.your} milky nips with a pulsating rhythm, collecting "+howMuchCollectedStr+" of {sub.milk}.",
				"Tentacles feed on {sub.your} perky nips, kneading and milking them, collecting "+howMuchCollectedStr+" of {sub.milk} in the process.",
			])
		else:
			text = RNG.pick([
				"{dom.You} actively {dom.youVerb('feed')} on {sub.your} leaky nipples, consuming "+howMuchCollectedStr+".",
				"{dom.You} {dom.youVerb('suckle')} on {sub.your} nipples, feeling a taste of {sub.milk} on {dom.yourHis} tongue, consuming "+howMuchCollectedStr+" of it.",
				"{dom.You} {dom.youVerb('breastfeed')} on {sub.your} {sub.breasts}, consuming "+howMuchCollectedStr+".",
			])
		if(extraMessages.size() > 0):
			text += " "+Util.join(extraMessages)
		text += getExtraSubText(true)
		
		if(getSub().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
			getSubInfo().addPain(1)
			sendSexEvent(SexEvent.PainInflicted, DOM_0, SUB_0, {pain=1,isDefense=false,intentional=false})
		
#		affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.1, -0.01)
#		affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.03)
#		subInfo.addArousalForeplay(0.1)
#		domInfo.addArousalForeplay(0.1)
#		subInfo.stimulateArousalZone(0.1, BodypartSlot.Breasts, 1.0)
		stimulateBreasts(DOM_0, SUB_0, S_MOUTH, I_NORMAL, SPEED_SLOW)
		
		if(gropeAmount > 20 && RNG.chance(2) && !getSub().hasPerk(Perk.MilkNoSoreNipples) && !getSub().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
			if(getSub().addEffect(StatusEffect.SoreNipplesAfterMilking)):
				text += RNG.pick([
					" {sub.Your} nipples started to feel [b]sore[/b] after so much feeding.",
				])
		
		sendSexEvent(SexEvent.BreastFeeding, DOM_0, SUB_0, {madeLactate=false, loadSize=howMuchCollected, targetIsDom=false})
		
		addText(text)
		react(SexReaction.DomBreastfeedsOnSub, [10, 30])
	
func getActions(_indx:int):
	if(_indx == DOM_0):
		if(getState() == ""):
			if(hasBodypartUncovered(SUB_0, BodypartSlot.Breasts)):
				addAction("startfeed", 1.0, "Start feeding", "Begin to feed on them!")
		
		if(getState() == "feeding"):
			addAction("knead", (0.5 / float(Util.maxi(1, kneadBonus+1))), "Knead breasts", "Knead their breasts to increase the flow")
		
		var breasts:BodypartBreasts = getSub().getBodypart(BodypartSlot.Breasts)
		var stopScore:float = 1.0
		if(breasts):
			var milkProduciton:FluidProduction = breasts.getFluidProduction()
			stopScore = (0.35 if ((gropeAmount > 5 && milkProduciton.getFluidAmount() < 5.0) || gropeAmount > 20) else 0.0)
			
		addAction("stop", stopScore, "Stop feeding", "Enough feeding")
	
	if(_indx == SUB_0):
		addAction("pullaway", getResistScore(SUB_0), "Resist feeding", "Try to pull away", {A_CHANCE: getResistChance(SUB_0, DOM_0, RESIST_BREASTS_FOCUS, 30.0, 25.0)})
		
		if(getState() == "feeding"):
			var moanScore:float = max(0.1, fetish(SUB_0, Fetish.Lactation)*0.5 + personality(SUB_0, PersonalityStat.Subby)*0.5)
			addAction("moan", moanScore, "Moan", "Show how much you like it")
		
		if(isReadyToCumHandled(SUB_0)):
			addAction("cum", 1.0, "Cum!", "You're gonna cum.", {A_PRIORITY: 1001})
		
func doAction(_indx:int, _actionID:String, _action:Dictionary):
	if(_actionID == "knead"):
		if(getSub().canBeMilked()):
			kneadBonus += 2
			if(isTentaclesSex()):
				addTextPick([
					"The tentacles wrap around {sub.yourHis} {sub.breasts} and knead them, trying to increase the flow of {sub.milk}.",
					"The tentacles grope and massage {sub.yourHis} {sub.breasts}.",
					"The tentacles knead {sub.yourHis} {sub.breasts} while also pumping them.",
					"The tentacles knead {sub.yourHis} {sub.breasts}.",
				])
			else:
				addTextPick([
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
					addTextPick([
						"The stimulation causes the breasts to get heavier.",
						"Stimulating the breasts is making them produce more {sub.milk}.",
						"{sub.YourHis} breasts are producing more {sub.milk}.",
					])
			if(getSub().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
				getSubInfo().addPain(3)
				sendSexEvent(SexEvent.PainInflicted, DOM_0, SUB_0, {pain=3,isDefense=false,intentional=false})
			
			stimulateBreasts(DOM_0, SUB_0, S_HANDS, I_NORMAL)
			#subInfo.stimulateArousalZone(0.2, BodypartSlot.Breasts, 1.0)
			#affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.1, -0.01)
			#affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.03)
		else:
			if(isTentaclesSex()):
				addTextPick([
					"The tentacles wrap around {sub.yourHis} {sub.breasts} and knead them, adding extra stimulation.",
					"Extra tentacles join to massage {sub.yourHis} {sub.breasts}, stimulating them.",
					"The tentacles knead {sub.yourHis} {sub.breasts}, occasionalyl squeezing them hard.",
				])
			else:
				addTextPick([
					"{dom.You} {dom.youVerb('knead')} {sub.yourHis} {sub.breasts}, stimulating them.",
					"{dom.You} {dom.youVerb('massage')} {sub.yourHis} {sub.breasts}, stimulating them.",
					"{dom.You} {dom.youVerb('knead')} {sub.yourHis} {sub.breasts} with {dom.yourHis} hands.",
				])
			stimulateBreasts(DOM_0, SUB_0, S_HANDS, I_NORMAL)
			#subInfo.stimulateArousalZone(0.2, BodypartSlot.Breasts, 1.0)
			#affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.02, -0.1, -0.01)
			#affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.02, -0.03)
			
			if(getSub().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
				getSubInfo().addPain(3)
				sendSexEvent(SexEvent.PainInflicted, DOM_0, SUB_0, {pain=3,isDefense=false,intentional=false})
			
			if(RNG.chance(70) && getSub().stimulateLactation()):
				addTextPick([
					"{sub.You} suddenly began [b]lactating[/b]!",
					"{sub.Your} breasts suddenly began [b]lactating[/b]!",
					"{sub.Your} breasts suddenly began [b]producing {sub.milk}[/b]!",
				])
	if(_actionID == "startfeed"):
		setState("feeding")
		if(isTentaclesSex()):
			addText("The tentacles begin actively feeding on {sub.your} {sub.breasts}!")
		else:
			addText("{dom.You} began actively feeding on {sub.your} {sub.breasts}!")
		
		stimulateBreasts(DOM_0, SUB_0, S_MOUTH, I_TEASE)
		#affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.02, -0.1, -0.01)
		#affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.02, -0.03)
		#subInfo.addArousalForeplay(0.05)
		#domInfo.addArousalForeplay(0.05)
	if(_actionID == "stop"):
		satisfyGoals()
		endActivity()
		addText("{dom.You} {dom.youVerb('quit')} feeding on {sub.yourHis} chest.")

	if(_actionID == "cum"):
		getSub().cumOnFloor(getDomID())
		getSubInfo().cum()
		
		var extraText:String = ""
		if(getSub().isLactating()):
			extraText = ", {sub.yourHis} {sub.breasts} squirt {sub.milk} out from this nipple orgasm"
		
		getSubInfo().stimulateArousalZone(0.0, BodypartSlot.Breasts, 2.0)
		sendSexEvent(SexEvent.UniqueOrgasm, DOM_0, SUB_0, {orgasmType="breasts"})
		addGenericOrgasmText(SUB_0, extraText)
	if(_actionID == "pullaway"):
		var successChance:float = getResistChance(SUB_0, DOM_0, RESIST_BREASTS_FOCUS, 30.0, 25.0)
		if(RNG.chance(successChance)):
			if(isTentaclesSex()):
				addText("{sub.You} {sub.youVerb('pull')} away from the hungry tentacles.")
			else:
				addText("{sub.You} {sub.youVerb('pull')} away from {dom.your} lips.")
			getDomInfo().addAnger(0.3)
			if(getState() != ""):
				setState("")
			else:
				failGoals()
				endActivity()
		else:
			if(isTentaclesSex()):
				addText("{sub.You} {sub.youVerb('try', 'tries')} to pull away from the tentacles but {sub.youVerb('fail')}.")
			else:
				addText("{sub.You} {sub.youVerb('try', 'tries')} to pull away from {dom.you} but {sub.youVerb('fail')}.")
			getDomInfo().addAnger(0.1)
			reactSub(SexReaction.ActivelyResisting, [50])
	if(_actionID == "moan"):
		var moanText = RNG.pick([
			"{sub.youVerb('moan')}"
		])
		if(getSub().isGagged()):
			moanText = RNG.pick([
				"{sub.youVerb('let')} out muffled moans",
				"{sub.youVerb('let')} out a muffled moan",
				"{sub.youVerb('let')} out a muffled noise of pleasure",
			])
		
		if(isTentaclesSex()):
			addTextPick([
				"{sub.You} "+moanText+" while getting milked by tentacles!",
				"{sub.You} "+moanText+" while having {sub.yourHis} nipples fed on by tentacles!",
				"{sub.You} "+moanText+" eagerly!",
			])
		else:
			addTextPick([
				"{sub.You} "+moanText+" while breastfeeding {dom.you}!",
				"{sub.You} "+moanText+" while having {sub.yourHis} nipples fed on!",
				"{sub.You} "+moanText+" eagerly!",
			])
		moan(SUB_0)
#		getDomInfo().addAnger(-0.02)
#		getDomInfo().addLust(5)
#		getSubInfo().addArousalForeplay(0.02)

func getOrgasmHandlePriority(_indx:int) -> int:
	if(_indx == SUB_0):
		return 3
	return -1

func getAnimationPriority():
	return 1

func getAnimation():
	if(isTentaclesSex()):
		if(state in [""]):
			return [StageScene.TentaclesCuddle, "breaststease", {pc=SUB_0}]
		return [StageScene.TentaclesCuddle, "breasts", {pc=SUB_0}]
	
	if(state in [""]):
		return [StageScene.BreastFeeding, "tease", {npc=DOM_0, pc=SUB_0}]
	return [StageScene.BreastFeeding, "feed", {npc=DOM_0, pc=SUB_0}]
	
func saveData():
	var data = .saveData()
	
	data["gropeAmount"] = gropeAmount
	data["kneadBonus"] = kneadBonus
	data["noticedSore"] = noticedSore

	return data
	
func loadData(data):
	.loadData(data)
	
	gropeAmount = SAVE.loadVar(data, "gropeAmount", 0)
	kneadBonus = SAVE.loadVar(data, "kneadBonus", 0)
	noticedSore = SAVE.loadVar(data, "noticedSore", false)
