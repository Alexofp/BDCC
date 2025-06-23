extends SexActivityBase
var gropeAmount:int = 0
var alsoCock:bool = false
var noticedSore:bool = false

func _init():
	id = "DomGropesSubsBreasts"
	
	activityName = "Grope breasts"
	activityDesc = "Give their breasts a good squeeze!"
	activityCategory = ["Breasts"]

func getGoals():
	return {
		SexGoal.GropeBreasts: 1.0,
	}

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(!_subInfo.getChar().hasNonFlatBreasts()):
		return 0.0
	
	if(_subInfo.getChar().canBeMilked()):
		return max(0.0, _domInfo.fetishScore({Fetish.Lactation: 0.02}))
	return max(0.0, _domInfo.fetishScore({Fetish.Lactation: 0.01}))

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func isActivityImpossibleShouldStop() -> bool:
	if(alsoCock):
		if(!getSub().hasReachablePenis()):
			return true
	return false

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return [SexActivityTag.HandsUsed, SexActivityTag.HavingSex]
	if(_indx == SUB_0):
		return [SexActivityTag.BreastsUsed, SexActivityTag.HavingSex]
	return []

func startActivity(_args):
	addText("{dom.You} {dom.youVerb('put')} {dom.yourHis} hands on {sub.your} {sub.breasts} and gets a feel for them"+getThroughClothingText(SUB_0, BodypartSlot.Breasts)+".")
	
	stimulate(DOM_0, S_HANDS, SUB_0, S_BREASTS, I_TEASE, Fetish.Lactation)
	
	noticedSore = getSub().hasEffect(StatusEffect.SoreNipplesAfterMilking)
	
	react(SexReaction.DomAboutToStartGropingSubsBreasts, [100, 50])

func getExtraSubText() -> String:
	var result:Array = []
	
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

func init_processTurn():
	addTextPick([
		"{dom.You} {dom.youVerb('hold')} {dom.yourHis} hands on {sub.your} chest.",
		"{dom.You} {dom.youVerb('hold')} {dom.yourHis} hands on {sub.your} {sub.breasts}.",
		"{dom.You} {dom.youVerb('rest')} {dom.yourHis} hands on {sub.your} chest.",
	])

func groping_processTurn():
	var throughTheClothing:String = getThroughClothingText(SUB_0, BodypartSlot.Breasts)
	
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
		getSubInfo().addPain(1)
		sendSexEvent(SexEvent.PainInflicted, DOM_0, SUB_0, {pain=1,isDefense=false,intentional=false})
	
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
	
	var suddenlyLactating:bool = false
	if(getSub().stimulateLactation()):
		suddenlyLactating = true
		text += RNG.pick([
			" {sub.You} suddenly began [b]lactating[/b]!",
			" {sub.Your} breasts suddenly began [b]lactating[/b]!",
			" {sub.Your} breasts suddenly began [b]producing {sub.milk}[/b]!",
		])
	
	stimulate(DOM_0, S_HANDS, SUB_0, S_BREASTS, I_NORMAL, Fetish.Lactation, SPEED_SLOW)
	
	if(!noticedSore && getSub().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
		noticedSore = true
		text += RNG.pick([
			" {sub.Your} nipples started to feel [b]sore[/b] after so much groping.",
		])
	
	if(alsoCock):
		if(!getSubInfo().isReadyToPenetrate()):
			alsoCock = false
		else:
			stimulate(DOM_0, S_HANDS, SUB_0, S_PENIS, I_LOW, Fetish.SeedMilking, SPEED_VERYSLOW)
			#subInfo.stimulateArousalZone(0.05, BodypartSlot.Penis, 0.25)
			text += RNG.pick([
				" {dom.YourHis} free hand is stroking {sub.yourHis} {sub.penis}.",
				" {dom.YourHis} free hand is stroking {sub.youHim}.",
				" {dom.YouHe} {dom.youAre} also stroking {sub.youHim}.",
				" {dom.YouHe} {dom.youAre} also stroking {sub.youHim} at the same time.",
			])
	
	sendSexEvent(SexEvent.BreastsGroped, DOM_0, SUB_0, {madeLactate=suddenlyLactating})
	
	addText(text)
	react(SexReaction.DomGropesSubsBreasts, [10, 20])
	
	
func getActions(_indx:int):
	if(_indx == DOM_0):
		if(getState() == ""):
			addAction("startgrope", 1.0, "Start groping", "Begin to grope them!")
		if(getState() == "groping"):
			addAction("squeeze", 0.2, "Squeeze breasts", "Squeeze their breasts tightly!")
			if(!alsoCock && getSubInfo().isReadyToPenetrate() && getSub().hasReachablePenis() && hasBodypartUncovered(SUB_0, BodypartSlot.Penis)):
				addAction("startstrokecock", 0.3, "Stroke cock", "Stroke their cock as well")
		addAction("stop", (0.15 if gropeAmount > 7 else 0.0), "Stop groping", "Enough groping")
	
	if(_indx == SUB_0):
		addAction("pullaway", getResistScore(SUB_0), "Resist groping", "Try to pull away", {A_CHANCE: getResistChance(SUB_0, DOM_0, RESIST_BREASTS_FOCUS, 30.0, 25.0)})
		if(isReadyToCumHandled(SUB_0)):
			addAction("cum", 1.0, "Cum!", "You gonna cum.", {A_PRIORITY:1001})
		
func doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "startstrokecock"):
		alsoCock = true
		addText("{dom.You} began stroking {sub.your} {sub.penis} as well!")
	if(_id == "squeeze"):
		if(getSub().canBeMilked()):
			var howMuchCollected:float = getSub().getBodypart(BodypartSlot.Breasts).getFluids().drainPercent(0.1)
			var howMuchCollectedStr:String = str(Util.roundF(howMuchCollected, 1))+" ml"
					
			addText("{dom.You} {dom.youVerb('squeeze')} {sub.yourHis} {sub.breasts} tightly and "+howMuchCollectedStr+" of {sub.milk} leaks out.")
			
			stimulate(DOM_0, S_HANDS, SUB_0, S_BREASTS, I_NORMAL, Fetish.Lactation)
		else:
			addTextPick([
				"{dom.You} {dom.youVerb('squeeze')} {sub.yourHis} {sub.breasts} tightly.",
				"{dom.You} {dom.youVerb('squeeze')} {sub.yourHis} {sub.breasts} tightly but nothing leaks out.",
			])
			stimulate(DOM_0, S_HANDS, SUB_0, S_BREASTS, I_NORMAL, Fetish.Lactation)
	if(_id == "startgrope"):
		var throughTheClothing:String = getThroughClothingText(SUB_0, BodypartSlot.Breasts)
		setState("groping")
		addText("{dom.You} began actively groping {sub.you}"+throughTheClothing+"!")
		
		stimulate(DOM_0, S_HANDS, SUB_0, S_BREASTS, I_TEASE, Fetish.Lactation)
		
		react(SexReaction.DomStartsGropingSubsBreasts, [100, 50])
	if(_id == "stop"):
		endActivity()
		satisfyGoals()
		addText("{dom.You} {dom.youVerb('quit')} groping {sub.yourHis} chest.")
	
	if(_id == "cum"):
		getSub().cumOnFloor(getDomID())
		getSubInfo().cum()
		var extraText:String = ""
		if(getSub().isLactating()):
			extraText = ", {sub.yourHis} {sub.breasts} squirt {sub.milk} out from this nipple orgasm"
		getSubInfo().stimulateArousalZone(0.0, BodypartSlot.Breasts, 2.0)
		sendSexEvent(SexEvent.UniqueOrgasm, DOM_0, SUB_0, {orgasmType="breasts"})
		addGenericOrgasmText(SUB_0, extraText)
	
	if(_id == "pullaway"):
		var successChance:float = getResistChance(SUB_0, DOM_0, RESIST_BREASTS_FOCUS, 30.0, 25.0)
		if(RNG.chance(successChance)):
			addText("{sub.You} {sub.youVerb('pull')} away from {dom.your} hands.")
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
	if(_indx == SUB_0):
		return 3
	return -1

func getAnimationPriority():
	return 1

func getAnimation():
	if(state in [""]):
		return [StageScene.BreastGroping, "tease", {pc=DOM_0, npc=SUB_0}]
	if(alsoCock):
		return [StageScene.BreastGroping, "stroke", {pc=DOM_0, npc=SUB_0}]
	return [StageScene.BreastGroping, "grope", {pc=DOM_0, npc=SUB_0}]
	

func saveData():
	var data = .saveData()
	
	data["gropeAmount"] = gropeAmount
	data["alsoCock"] = alsoCock
	data["noticedSore"] = noticedSore

	return data
	
func loadData(data):
	.loadData(data)
	
	gropeAmount = SAVE.loadVar(data, "gropeAmount", 0)
	alsoCock = SAVE.loadVar(data, "alsoCock", false)
	noticedSore = SAVE.loadVar(data, "noticedSore", false)
