extends SexActivityBase
var gropeAmount:int = 0
var kneadBonus:int = 0
var noticedSore:bool = false

func _init():
	id = "DomBreastfeedsSub"
	
	activityName = "Breastfeed sub"
	activityDesc = "Feed them with your breasts!"
	activityCategory = ["Breasts"]

func getGoals():
	return {
		SexGoal.BreastFeedSub: 1.0,
	}

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return 0.0

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return [SexActivityTag.BreastsUsed, SexActivityTag.HavingSex]
	if(_indx == SUB_0):
		return [SexActivityTag.MouthUsed, SexActivityTag.HavingSex]
	return []

func startActivity(_args):
	addText("{dom.You} {dom.youVerb('sit')} on {sub.your} lap and {dom.youVerb('push', 'pushes')} {dom.yourHis}"+getThroughClothingTextCustom(DOM_0, BodypartSlot.Breasts, " clothed")+" chest into {sub.yourHis} face.")
	stimulateBreasts(SUB_0, DOM_0, S_MOUTH, I_TEASE)
	noticedSore = getDom().hasEffect(StatusEffect.SoreNipplesAfterMilking)
	react(SexReaction.DomBreastfeedsSubStart, [100, 50])

func onSwitchFrom(_otherActivity, _args):
	return

func getExtraDomText(hasMilk:bool) -> String:
	var result:Array = []
	
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

func feeding_processTurn():
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
			getDomInfo().addPain(1)
			sendSexEvent(SexEvent.PainInflicted, SUB_0, DOM_0, {pain=1,isDefense=false,intentional=false})
		
		var suddenlyLactating = false
		if(RNG.chance(30) && getDom().stimulateLactation()):
			suddenlyLactating = true
			text += RNG.pick([
				" {dom.You} suddenly began [b]lactating[/b]!",
				" {dom.Your} breasts suddenly began [b]lactating[/b]!",
				" {dom.Your} breasts suddenly began [b]producing {dom.milk}[/b]!",
			])
		
		stimulateBreasts(SUB_0, DOM_0, S_MOUTH, I_NORMAL, SPEED_SLOW)
#		affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.1, -0.01)
#		affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.03)
#		subInfo.addArousalForeplay(0.05)
#		domInfo.addArousalForeplay(0.05)
		
		if(!noticedSore && getDom().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
			noticedSore = true
			text += RNG.pick([
				" {dom.Your} nipples started to feel [b]sore[/b].",
			])
		
		sendSexEvent(SexEvent.BreastFeeding, SUB_0, DOM_0, {madeLactate=suddenlyLactating, loadSize=0.0, targetIsDom=true})
		
		addText(text)
		react(SexReaction.DomBreastfeedsSub, [30, 30])
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
		var howMuchCollected:float = getDom().getBodypart(BodypartSlot.Breasts).getFluids().transferTo(getSub().getBodypart(BodypartSlot.Head), minRatio, minAmount)
		var howMuchCollectedStr:String = str(Util.roundF(howMuchCollected, 1))+" ml"
		
		if(howMuchCollected > 0.0):
			for fluidID in fluidByAmount:
				var share:float = fluidByAmount[fluidID] / totalAmount
				
				var swallowData:Dictionary = getSub().doSwallow(fluidID, share*howMuchCollected*10.0)
				if(swallowData.has("text") && swallowData["text"] != ""):
					extraMessages.append(swallowData["text"])
		
		var text:String = RNG.pick([
			"{sub.You} {sub.youVerb('feed')} on {dom.your} "+RNG.pick(["leaky", "lactating"])+" nipples, consuming "+howMuchCollectedStr+".",
			"{sub.You} {sub.youVerb('suckle')} on {dom.your} nipples, feeling a taste of {dom.milk} on {sub.yourHis} tongue, consuming "+howMuchCollectedStr+" of it.",
			"{sub.You} {sub.youVerb('breastfeed')} on {dom.your} {dom.breasts}, consuming "+howMuchCollectedStr+".",
			"{dom.You} {dom.youAre} breastfeeding {sub.you}, making {sub.youHim} consume "+howMuchCollectedStr+".",
		])
		if(extraMessages.size() > 0):
			text += " "+Util.join(extraMessages)
		text += getExtraDomText(true)
		
		if(getDom().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
			getDomInfo().addPain(1)
			sendSexEvent(SexEvent.PainInflicted, SUB_0, DOM_0, {pain=1,isDefense=false,intentional=false})
		
#		affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.1, -0.01)
#		affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.03)
#		subInfo.addArousalForeplay(0.1)
#		domInfo.addArousalForeplay(0.1)
		stimulateBreasts(SUB_0, DOM_0, S_MOUTH, I_NORMAL, SPEED_SLOW)
		getDomInfo().stimulateArousalZone(0.1, BodypartSlot.Breasts, 1.0)
		
		if(gropeAmount > 20 && RNG.chance(2) && !getDom().hasPerk(Perk.MilkNoSoreNipples) && !getDom().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
			if(getDom().addEffect(StatusEffect.SoreNipplesAfterMilking)):
				text += RNG.pick([
					" {dom.Your} nipples started to feel [b]sore[/b] after so much feeding.",
				])
		
		sendSexEvent(SexEvent.BreastFeeding, SUB_0, DOM_0, {madeLactate=false, loadSize=howMuchCollected, targetIsDom=true})
		
		addText(text)
		react(SexReaction.DomBreastfeedsSub, [30, 30])

func getActions(_indx:int):
	if(_indx == DOM_0):
		if(getState() == ""):
			if(hasBodypartUncovered(DOM_0, BodypartSlot.Breasts) && !getSub().isOralBlocked()):
				addAction("forcefeed", 1.0, "Force feed", "Try to force them.", {A_CHANCE: 30})
		if(getState() == "feeding"):
			var moanScore:float = max(0.1, fetish(DOM_0, Fetish.Lactation)*0.5 + personality(DOM_0, PersonalityStat.Subby)*0.5)
			addAction("moan", moanScore, "Moan", "Show how much you like it")
			var praiseScore:float = -getDomInfo().getAngerScore() + max(0.0, fetish(DOM_0, Fetish.Lactation)*0.5 - personality(DOM_0, PersonalityStat.Subby)*0.5)
			addAction("praise", praiseScore, "Praise", "Tell them how well they do")
		if(isReadyToCumHandled(DOM_0)):
			addAction("cum", 1.0, "Cum!", "You gonna cum.", {A_PRIORITY: 1001})
		
		var stopScore:float = 1.0
		var breasts:BodypartBreasts = getDom().getBodypart(BodypartSlot.Breasts)
		if(breasts):
			var milkProduciton:FluidProduction = breasts.getFluidProduction()
			stopScore = (0.35 if ((gropeAmount > 5 && milkProduciton.getFluidAmount() < 5.0) || gropeAmount > 10) else 0.0)
		addAction("stop", stopScore, "Stop feeding", "Enough feeding")
	if(_indx == SUB_0):
		addAction("pullaway", getResistScore(SUB_0), "Resist feeding", "Try to pull away", {A_CHANCE: getResistChance(SUB_0, DOM_0, RESIST_BREASTS_FOCUS, 30.0, 25.0)})
		if(getState() == ""):
			if(hasBodypartUncovered(DOM_0, S_BREASTS) && !getSub().isOralBlocked()):
				var startFeedScore:float = getSubInfo().getComplyScore()*0.5 + fetish(SUB_0, Fetish.Lactation)*0.3 + personality(SUB_0, PersonalityStat.Subby)*0.3
				addAction("startfeed", startFeedScore, "Start feeding", "Feed on their breasts!")
		if(getState() == "feeding"):
			if(!getSub().hasBoundArms()):
				var kneadScore:float = fetish(SUB_0, Fetish.Lactation) * (0.5 / float(Util.maxi(1, kneadBonus+1)))
				addAction("knead", kneadScore, "Knead breasts", "Knead their breasts to increase the flow")
		
		
func doAction(_indx:int, _actionID:String, _action:Dictionary):
	if(_actionID == "cum"):
		getDom().cumOnFloor()
		getDomInfo().cum()
		
		var extraText:String = ""
		if(getDom().isLactating()):
			extraText = ", {dom.yourHis} {dom.breasts} squirt {dom.milk} out from this nipple orgasm"
		
		getDomInfo().stimulateArousalZone(0.0, BodypartSlot.Breasts, 2.0)
		sendSexEvent(SexEvent.UniqueOrgasm, SUB_0, DOM_0, {orgasmType="breasts"})
		addGenericOrgasmText(DOM_0, extraText)
	if(_actionID == "praise"):
		addTextPick([
			"{dom.You} {dom.youVerb('praise')} {sub.you}!",
			"{dom.You} {dom.youVerb('praise')} {sub.you} for feeding on {dom.yourHis} {dom.breasts}!",
			"{sub.You} {sub.youAre} being praised by {dom.youHim}.",
		])
		getSubInfo().addFear(-0.02)
		getSubInfo().addLust(5)
		getDomInfo().addArousalForeplay(0.02)
		react(SexReaction.DomBreastfeedPraise)
	if(_actionID == "moan"):
		var moanText:String = RNG.pick([
			"{dom.youVerb('moan')}"
		])
		if(getDom().isGagged()):
			moanText = RNG.pick([
				"{dom.youVerb('let')} out muffled moans",
				"{dom.youVerb('let')} out a muffled moan",
				"{dom.youVerb('let')} out a muffled noise of pleasure",
			])
		
		addTextPick([
			"{dom.You} "+moanText+" while breastfeeding {sub.you}!",
			"{dom.You} "+moanText+" while having {dom.yourHis} nipples fed on!",
			"{dom.You} "+moanText+" eagerly!",
		])
		moan(DOM_0)
	if(_actionID == "forcefeed"):
		if(RNG.chance(30)):
			setState("feeding")
			addText("{dom.You} {dom.youVerb('force')} {sub.you} to start feeding on {dom.yourHis} {dom.breasts}!")
			
			stimulateBreasts(SUB_0, DOM_0, S_MOUTH, I_TEASE)
#			affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.02, -0.1, -0.01)
#			affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.02, -0.03)
#			subInfo.addArousalForeplay(0.05)
#			domInfo.addArousalForeplay(0.05)
		else:
			addTextPick([
				"{dom.You} {dom.youVerb('try', 'tries')} to force {sub.you} to start feeding on {dom.yourHis} {dom.breasts}.",
				"{dom.You} {dom.youVerb('pull')} {sub.your} head close to {dom.yourHis} breasts, trying to start feeding {sub.youHim}.",
			])
			
			stimulateBreasts(SUB_0, DOM_0, S_MOUTH, I_TEASE, SPEED_VERYSLOW)
			#affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.02, -0.1, -0.01)
			#affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.02, -0.03)
	if(_actionID == "stop"):
		endActivity()
		satisfyGoals()
		addText("{dom.You} {dom.youVerb('quit')} feeding {sub.youHim}.")

	if(_actionID == "startfeed"):
		setState("feeding")
		addText("{sub.You} began actively feeding on {dom.your} {dom.breasts}!")
		
		stimulateBreasts(SUB_0, DOM_0, S_MOUTH, I_TEASE)
		#affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.02, -0.1, -0.01)
		#affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.02, -0.03)
		#subInfo.addArousalForeplay(0.05)
		#domInfo.addArousalForeplay(0.05)
	if(_actionID == "knead"):
		if(getDom().canBeMilked()):
			kneadBonus += 2
			addTextPick([
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
					addTextPick([
						"The stimulation causes the breasts to get heavier.",
						"Stimulating the breasts is making them produce more {dom.milk}.",
						"{dom.YourHis} breasts are producing more {dom.milk}.",
					])
			if(getDom().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
				getDomInfo().addPain(3)
				sendSexEvent(SexEvent.PainInflicted, SUB_0, DOM_0, {pain=3,isDefense=false,intentional=false})
			
			stimulateBreasts(SUB_0, DOM_0, S_HANDS, I_NORMAL)
			#domInfo.stimulateArousalZone(0.2, BodypartSlot.Breasts, 1.0)
			#affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.1, -0.01)
			#affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.1, -0.03)
		else:
			addTextPick([
				"{sub.You} {sub.youVerb('knead')} {dom.yourHis} {dom.breasts}, stimulating them.",
				"{sub.You} {sub.youVerb('massage')} {dom.yourHis} {dom.breasts}, stimulating them.",
				"{sub.You} {sub.youVerb('knead')} {dom.yourHis} {dom.breasts} with {sub.yourHis} hands.",
			])
			stimulateBreasts(SUB_0, DOM_0, S_HANDS, I_NORMAL)
			#domInfo.stimulateArousalZone(0.2, BodypartSlot.Breasts, 1.0)
			#affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0}), 0.02, -0.1, -0.01)
			#affectDom(domInfo.fetishScore({Fetish.Lactation: 1.0}), 0.02, -0.03)
			
			if(getDom().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
				getDomInfo().addPain(3)
				sendSexEvent(SexEvent.PainInflicted, SUB_0, DOM_0, {pain=3,isDefense=false,intentional=false})
			
			if(RNG.chance(70) && getDom().stimulateLactation()):
				addTextPick([
					"{dom.You} suddenly began [b]lactating[/b]!",
					"{dom.Your} breasts suddenly began [b]lactating[/b]!",
					"{dom.Your} breasts suddenly began [b]producing {dom.milk}[/b]!",
				])
	if(_actionID == "pullaway"):
		var successChance:float = getResistChance(SUB_0, DOM_0, RESIST_BREASTS_FOCUS, 30.0, 25.0)
		if(RNG.chance(successChance)):
			addText("{sub.You} {sub.youVerb('pull')} away from {dom.your} breasts.")
			getDomInfo().addAnger(0.3)
			if(getState() != ""):
				setState("")
			else:
				failGoals()
				endActivity()
		else:
			addText("{sub.You} {sub.youVerb('try', 'tries')} to pull away from {dom.you} but {sub.youVerb('fail')}.")
			getDomInfo().addAnger(0.1)
			reactSub(SexReaction.ActivelyResisting, [50])

func getOrgasmHandlePriority(_indx:int) -> int:
	if(_indx == DOM_0):
		return 3
	return -1

func getAnimationPriority():
	return 1

func getAnimation():
	if(state in [""]):
		return [StageScene.BreastFeeding, "teasealt", {pc=DOM_0, npc=SUB_0}]
	return [StageScene.BreastFeeding, "feedalt", {pc=DOM_0, npc=SUB_0}]

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
