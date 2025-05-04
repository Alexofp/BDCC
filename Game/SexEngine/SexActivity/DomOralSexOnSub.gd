extends SexActivityBase
var waitTimer = 0

func _init():
	id = "DomOralSexOnSub"

func getGoals():
	return {
		SexGoal.DoOralOnSub: 1.0,
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		SexType.SlutwallSex: true,
	}

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(!_subInfo.getChar().hasReachablePenis() && !_subInfo.getChar().hasReachableVagina()):
		return false
	if(_domInfo.getChar().isOralBlocked()):
		return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getVisibleName():
	return "Oral to sub"

func getCategory():
	return ["Fuck"]

func getDomTags():
	if(state in ["blowjob", "lickingcock", "licking", "grinding"]):
		return [SexActivityTag.MouthUsed, SexActivityTag.HavingSex]
	return [SexActivityTag.HavingSex]

func getSubTags():
	var thetags = [SexActivityTag.PreventsSubTeasing, SexActivityTag.HavingSex, SexActivityTag.PenisUsed, SexActivityTag.VaginaUsed] #SexActivityTag.PreventsSubViolence

	return thetags

func getDomTagsCheck():
	return [SexActivityTag.OrderedToDoSomething, SexActivityTag.MouthUsed, SexActivityTag.HavingSex]

func getSubTagsCheck():
	return [SexActivityTag.OrderedToDoSomething, SexActivityTag.HavingSex, SexActivityTag.PenisUsed, SexActivityTag.VaginaUsed]

func isActivityImpossibleShouldStop() -> bool:
	if(state in ["blowjob", "lickingcock"]):
		if(!getSub().hasReachablePenis() && !getSub().isWearingStrapon()):
			return true
	if(state in ["licking", "grinding"]):
		if(!getSub().hasReachableVagina()):
			return true
	return false

func startActivity(_args):
	state = ""
	
	var exposedThings = []
	var genitalsText = "crotch"
	if(getSub().hasPenis() && getSub().getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
		exposedThings.append(RNG.pick(["dick", "cock", "member"]))
		if(RNG.chance(50)):
			exposedThings.append("balls")
	if(getSub().hasVagina() && getSub().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) == null):
		exposedThings.append(RNG.pick(["pussy", "pussy", "slit", "kitty"]))
	if(exposedThings.size() > 0):
		genitalsText = "exposed "+Util.humanReadableList(exposedThings)
	
	var text = RNG.pick([
		"{dom.You} {dom.youVerb('keep')} {sub.you} lying on the floor while bringing {dom.yourHis} mouth to {sub.yourHis} "+genitalsText+".",
	])
	if(getSexType() == SexType.SlutwallSex):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('kneel')} down and {dom.youVerb('bring')} {dom.yourHis} mouth to {sub.yourHis} "+genitalsText+".",
		])
	
	return {
		text = text,
	}

func onSwitchFrom(_otherActivity, _args):
	return

func processTurn():
	if(state == "blowjob"):
		if(getSub().isWearingChastityCage()):
			state = "lickingcock"
			
			var text = RNG.pick([
				"{dom.You} {dom.youVerb('stop')} sucking {sub.yourHis} "+RNG.pick(["cock", "dick", "member"])+" when a chastity cage appears on it!",
			])
			return {text = text}
		
		return doBlowjobTurnSub()
		
	if(state == "lickingcock"):
		affectSub(subInfo.fetishScore({Fetish.OralSexReceiving: 1.0})+0.3, 0.1, -0.1, -0.01)
		affectDom(domInfo.fetishScore({Fetish.OralSexGiving: 0.5})+0.6, 0.1, 0.0)
		subInfo.stimulateArousalZone(0.06, BodypartSlot.Penis, 0.25)
		
		var clothingItem = getSub().getFirstItemThatCoversBodypart(BodypartSlot.Penis)
		var throughTheClothing = ""
		if(clothingItem != null):
			throughTheClothing = " through the "+clothingItem.getCasualName()
		var text = RNG.pick([
			"{dom.You} {dom.youAre} licking {sub.yourHis} "+RNG.pick(["cock", "dick", "member"])+ throughTheClothing +".",
			"{dom.You} {dom.youAre} dragging {dom.yourHis} tongue over {sub.yourHis} "+RNG.pick(["cock", "dick", "member"])+ throughTheClothing +".",
		])
		
		if(subInfo.isReadyToCum()):
			text += RNG.pick([
				" {sub.YouHe} {sub.youAre} about to cum!",
				" {sub.YouHe} {sub.youAre} being kept on edge by {dom.youHim}.",
				" {sub.YourHis} "+RNG.pick(["cock", "dick", "member"])+" is twitching and throbbing.",
				" {sub.YourHis} "+RNG.pick(["cock", "dick", "member"])+" is leaking pre a lot.",
				" {sub.YouHe} {sub.youAre} barely keeping {sub.yourself} from cumming.",
				" {sub.YouHe} reached {sub.yourHis} peak!",
			])
		elif(subInfo.isCloseToCumming()):
			text += RNG.pick([
				" {sub.You} "+RNG.pick(["{sub.youVerb('let')} out some moans", "{sub.youVerb('let')} out a moan", "{sub.youVerb('breathe')} deeply"])+" while {sub.yourHis} "+RNG.pick(["cock", "dick", "member"])+" "+RNG.pick(["drips pre", "twitches slightly", "responds by twitching", "gets harder"])+"."
			])
		
		return {text = text}
	
	if(state == "licking"):
		return doPussyLickingTurnSub()
	
	if(state == "tonguefucking"):
		affectSub(subInfo.fetishScore({Fetish.OralSexReceiving: 1.0})+0.1, 0.1, -0.1, -0.01)
		affectDom(domInfo.fetishScore({Fetish.OralSexGiving: 0.5})+0.6, 0.1, 0.0)
		subInfo.stimulateArousalZone(0.1, BodypartSlot.Vagina, 0.5)
		
		var text = RNG.pick([
			"{dom.You} "+RNG.pick(["{dom.youVerb('push', 'pushes')}", "{dom.youVerb('slide')}"])+" {dom.yourHis} tongue in and out of {sub.your} "+RNG.pick(["pussy", "pussy slit", "flower", "slit", "kitty"])+".",
			"{dom.You} {dom.youVerb('tongue-fuck')} {sub.yourHis} "+RNG.pick(["pussy", "slit", "kitty"])+"!",
			"{dom.You} {dom.youVerb('slide')} {dom.yourHis} tongue inside {sub.yourHis} "+RNG.pick(["pussy", "slit", "kitty"])+", fucking it!",
		])
		
		if(getSub().hasEffect(StatusEffect.HasCumInsideVagina) && OPTIONS.isContentEnabled(ContentType.CumStealing)):
			if(RNG.chance(20)):
				if(getSub().bodypartTransferFluidsTo(BodypartSlot.Vagina, domID, BodypartSlot.Head, 0.1, 20.0)):
					text += RNG.pick([ 
						" "+Util.capitalizeFirstLetter(getSub().getBodypartContentsStringList(BodypartSlot.Vagina))+" lands on {dom.yourHis} tongue, leaking out of {sub.yourHis} "+RNG.pick(["", "used ", "stuffed "])+RNG.pick(["pussy", "slit", "kitty"])+" and [b]{dom.you} {dom.youVerb('swallow')} it[/b].",
					])
		
		if(subInfo.isReadyToCum()):
			text += RNG.pick([
				" {sub.YouHe} {sub.youAre} about to cum!",
				" {sub.YouHe} {sub.youAre} being edged by {dom.youHim}.",
				" {sub.YourHis} "+RNG.pick(["pussy", "pussy slit"])+" is twitching a lot.",
				" {sub.YourHis} "+RNG.pick(["pussy", "pussy slit"])+" is leaking arousal a lot.",
				" {sub.YouHe} {sub.youAre} barely keeping {dom.yourself} from cumming.",
				" {sub.YouHe} reached {sub.yourHis} peak!",
			])
		elif(subInfo.isCloseToCumming()):
			text += RNG.pick([
				" {sub.You} "+RNG.pick(["{sub.youVerb('let')} out some moans", "{sub.youVerb('let')} out a moan", "{sub.youVerb('breathe')} deeply"])+" while {sub.yourHis} pussy "+RNG.pick(["drips juices", "leaks arousal", "becomes more aroused", "drips arousal", "produces an aroused scent"])+"."
			])
		
		return {text = text}
	
func getDomActions():
	var actions = []

	if(getSub().hasPenis()):
		actions.append({
			"id": "cupballs",
			"score": 0.2,
			"name": "Cup balls",
			"desc": "Play with the their balls a bit",
		})

	if(getSub().hasVagina()):
		actions.append({
			"id": "rubclit",
			"score": 0.2,
			"name": "Rub clit",
			"desc": "Play with the their clit a bit",
		})

	if(state in [""]):
		if(getSub().hasReachablePenis()):
			actions.append({
				"id": "startcocklick",
				"score": 1.0,
				"name": "Lick cock",
				"desc": "Start licking their cock",
			})
		if(getSub().hasReachableVagina()):
			actions.append({
				"id": "startpussylick",
				"score": 1.0,
				"name": "Lick pussy",
				"desc": "Start licking their pussy",
			})
			
	if(state in ["lickingcock"]):
		if(getSub().isReadyToPenetrate() && getSub().getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
			actions.append({
				"id": "startblowjob",
				"score": 1.0,
				"name": "Blowjob",
				"desc": "Let that cock into your mouth",
			})
	if(state in ["licking"]):
		if(getSub().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) == null):
			actions.append({
				"id": "starttonguefuck",
				"score": 1.0,
				"name": "Tonguefuck",
				"desc": "Fuck that pussy with your tongue",
			})

	if(state in ["licking", "tonguefucking"]):
		if(getDom().hasEffect(StatusEffect.HasCumInsideMouth) && getSub().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) == null && !getDom().isOralBlocked() && OPTIONS.isContentEnabled(ContentType.CumStealing)):
			actions.append({
				"id": "spitcumintosubspussy",
				"score": 0.01 + domInfo.fetishScore({Fetish.Breeding: 0.1}),
				"name": "Spit cum into pussy",
				"desc": "Force some cum into their slit",
			})

	if(state in ["subabouttocum", "subabouttocumcock"] || ((state in ["licking", "tonguefucking", "lickingcock", "blowjob"]) && subInfo.isReadyToCum() && !subInfo.canDoActions())):
		actions.append({
			"id": "letsubcuminside",
			"score": 1.0,
			"name": "Inside",
			"desc": "Let the sub cum inside your mouth",
			"priority" : 1001,
		})
		actions.append({
			"id": "letsubcumoutside",
			"score": 1.0,
			"name": "Facial",
			"desc": "Let the sub cum on you",
			"priority" : 1001,
		})
		actions.append({
			"id": "makesubcumavoidmess",
			"score": 1.0,
			"name": "Avoid mess",
			"desc": "Let the sub cum but avoid getting messy",
			"priority" : 1001,
		})
	
	actions.append({
		"id": "stop",
		"score": getStopScore(),
		"name": "Stop oral",
		"desc": "Stop the oral sex activity",
	})

	return actions

func doDomAction(_id, _actionInfo):
	if(_id == "spitcumintosubspussy"):
		return doSpitCumIntoHoleDom(BodypartSlot.Vagina)
	
	if(_id == "makesubcumavoidmess"):
		satisfyGoals()
		var text = ""
		if(state in ["subabouttocum", "licking", "tonguefucking"]):
			text = RNG.pick([
				"{dom.You} {dom.youVerb('lean')} to the side a bit and {dom.youVerb('let')} {sub.you} [b]cum all over the floor[/b]. {sub.YourHis} pussy squirts, leaving quite a mess! But luckily {dom.you} dodged all of it.",
			])
			getSub().cumOnFloor(domID)
			subInfo.cum()
		else:
			text = RNG.pick([
				"{dom.You} {dom.youVerb('lean')} to the side a bit and {dom.youVerb('let')} {sub.you} [b]cum all over the floor[/b]. Many "+RNG.pick(["strings of cum", "strands of seed"])+" land on it while {sub.yourHis} cock throbs and cums, leaving quite a mess! But luckily {dom.you} dodged all of it."
			])
			var condom:ItemBase = getSub().getWornCondom()
			if(condom != null):
				var breakChance = condom.getCondomBreakChance()
				
				if(RNG.chance(breakChance)):
					text = "[b]The condom broke![/b] "+text
					condom.destroyMe()
				else:
					text = RNG.pick([
						"{dom.You} {dom.youVerb('hold')} {dom.yourHis} face slightly to the side of {sub.yourHis} "+RNG.pick(["cock", "dick", "shaft"])+" as it starts throbbing and [b]filling the condom with "+RNG.pick(["cum", "seed", "semen"])+"[/b]!",
					])
					getSub().cumInItem(condom)
					subInfo.cum()
					state = ""
					text += RNG.pick([
						" {dom.You} {dom.youVerb('dispose')} of the used condom.",
					])
					condom.destroyMe()
					getSexEngine().saveCondomToLootIfPerk(condom)
					
					return {text=text}
			
			getSub().cumOnFloor(domID)
			subInfo.cum()
		
		state = ""
		return {text = text}
	
	if(_id == "letsubcumoutside"):
		satisfyGoals()
		var text = ""
		if(state in ["subabouttocum", "licking", "tonguefucking"]):
			text = RNG.pick([
				"{dom.You} {dom.youVerb('shift')} away a bit and {dom.youVerb('let')} {sub.you} [b]cum all over {dom.yourHis} face[/b]. Lots of "+RNG.pick(["pussy juices", "juices", "femcum", "female juices"])+" land on it while {sub.yourHis} pussy squirts, leaving quite a mess!",
			])
			if(getDom().isOralBlocked()):
				getDom().cummedOnBy(subID, FluidSource.Vagina)
			else:
				getDom().cummedInMouthBy(subID, FluidSource.Vagina, 0.5)
				getDom().cummedOnBy(subID, FluidSource.Vagina, 0.5)
			subInfo.cum()
		else:
			text = RNG.pick([
				"{dom.You} {dom.youVerb('shift')} away a bit and {dom.youVerb('let')} {sub.you} [b]give {dom.youHim} a facial[/b]. Many "+RNG.pick(["strings of cum", "strands of seed"])+" land on {dom.youHim} while {sub.yourHis} cock throbs and cums, leaving quite a mess!"
			])
			var condom:ItemBase = getSub().getWornCondom()
			if(condom != null):
				var breakChance = condom.getCondomBreakChance()
				
				if(RNG.chance(breakChance)):
					text = "[b]The condom broke![/b] "+text
					condom.destroyMe()
				else:
					text = RNG.pick([
						"{dom.You} {dom.youVerb('hold')} {dom.yourHis} face near {sub.yourHis} "+RNG.pick(["cock", "dick", "shaft"])+" as it starts throbbing and [b]filling the condom with "+RNG.pick(["cum", "seed", "semen"])+"[/b]!",
					])
					getSub().cumInItem(condom)
					subInfo.cum()
					state = ""
					text += RNG.pick([
						" {dom.You} {dom.youVerb('dispose')} of the used condom.",
					])
					condom.destroyMe()
					getSexEngine().saveCondomToLootIfPerk(condom)
					
					return {text=text}
			
			getDom().cummedOnBy(subID, FluidSource.Penis)
			subInfo.cum()
		
		state = ""
		return {text = text}
	
	if(_id == "letsubcuminside"):
		satisfyGoals()
		var text = ""
		var condomBroke = false
		if(state in ["subabouttocum", "licking", "tonguefucking"]):
			text = RNG.pick([
				"{dom.You} {dom.youVerb('press', 'presses')} {dom.yourHis} lips against {sub.yourHis} "+RNG.pick(["pussy", "slit", "sensitive folds", "petals"])+" and keep lapping up the arousal until [b]{sub.you} {sub.youVerb('cum')}[/b]! {sub.YourHis} juices rush into {dom.yourHis} mouth as {sub.youHe} squirts!",
			])
			getDom().cummedInMouthBy(subID, FluidSource.Vagina)
			subInfo.cum()
		else:
			text = RNG.pick([
				"{dom.You} {dom.youVerb('hold')} {dom.yourHis} lips wrapped around {sub.yourHis} "+RNG.pick(["cock", "dick", "shaft"])+" as it starts throbbing and [b]stuffing {dom.your} mouth with "+RNG.pick(["cum", "seed", "semen"])+"[/b]."
			])
			
			var condom:ItemBase = getSub().getWornCondom()
			if(condom != null):
				var breakChance = condom.getCondomBreakChance()
				condomBroke = getSub().shouldCondomBreakWhenFucking(getDom(), breakChance)
				if(condomBroke):
					text = "[b]The condom broke![/b] "+text
					condom.destroyMe()
				else:
					text = RNG.pick([
						"{dom.You} {dom.youVerb('hold')} {dom.yourHis} lips wrapped around {sub.yourHis} "+RNG.pick(["cock", "dick", "shaft"])+" as it starts throbbing and [b]filling the condom inside {dom.your} mouth with "+RNG.pick(["cum", "seed", "semen"])+"[/b]!",
					])
					getSub().cumInItem(condom)
					subInfo.cum()
					state = ""
					text += RNG.pick([
						" {dom.You} {dom.youVerb('dispose')} of the used condom.",
					])
					condom.destroyMe()
					getSexEngine().saveCondomToLootIfPerk(condom)
					
					return {text=text}
			
			getDom().cummedInMouthByAdvanced(subID, {condomBroke=condomBroke}, FluidSource.Penis)
			subInfo.cum()
		
		state = ""
		return {text = text}
	
	if(_id == "cupballs"):
		var penis:BodypartPenis = getSub().getBodypart(BodypartSlot.Penis)
		if(penis == null):
			return
		var cumProduction:FluidProduction = penis.getFluidProduction()
		if(cumProduction == null):
			return
		
		var level = cumProduction.getFluidLevel()
		var text
		if(level <= 0.3):
			text = RNG.pick([
				"{dom.You} "+RNG.pick(["{dom.youVerb('grope')}", "{dom.youVerb('fondle')}", "{dom.youVerb('play')} with"])+" {sub.your} balls and {dom.youVerb('feel')} them "+RNG.pick(["getting heavier", "becoming more heavy", "producing more seed", "producing cum"])+".",
			])
		elif(level <= 0.7):
			text = RNG.pick([
				"{dom.You} "+RNG.pick(["{dom.youVerb('grope')}", "{dom.youVerb('fondle')}", "{dom.youVerb('play')} with"])+" {sub.your} balls and {dom.youVerb('feel')} quite some weight to them. But they still "+RNG.pick(["get even more heavy", "produce even more seed", "produce more cum"])+" as {dom.youHe} {dom.youVerb('tease')} them.",
			])
		else:
			text = RNG.pick([
				"{dom.You} "+RNG.pick(["{dom.youVerb('grope')}", "{dom.youVerb('fondle')}", "{dom.youVerb('play')} with"])+" {sub.your} balls and {dom.youVerb('realize')} "+RNG.pick(["that they are full", "how heavy they are", "how much cum is stored in them"])+". They "+RNG.pick(["tense up slightly"])+" as {dom.youHe} {dom.youVerb('tease')} them.",
			])
		cumProduction.fillPercent(0.2)
		affectSub(subInfo.fetishScore({Fetish.OralSexReceiving: 1.0}), 0.1, -0.05, -0.01)
		
		return {text = text}
	
	if(_id == "rubclit"):
		var text = RNG.pick([
			"{dom.You} "+RNG.pick(["{dom.youVerb('rub')}", "{dom.youVerb('tease')}", "{dom.youVerb('play')} with"])+" {sub.yourHis} clit a bit, providing some extra stimulation.",
		])
		subInfo.stimulateArousalZone(0.05, BodypartSlot.Vagina, 0.2)
		affectSub(subInfo.fetishScore({Fetish.OralSexReceiving: 1.0}), 0.0, -0.05, -0.01)
		
		return {text = text}
	
	if(_id == "startcocklick"):
		state = "lickingcock"
		var clothingItem = getSub().getFirstItemThatCoversBodypart(BodypartSlot.Penis)
		var throughTheClothing = ""
		if(clothingItem != null):
			throughTheClothing = " through the "+clothingItem.getCasualName()
		
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('bring')} {dom.yourHis} tongue to {sub.yourHis} "+RNG.pick(["dick", "cock", "member", "shaft"])+" and {dom.youVerb('proceed')} to lick it"+throughTheClothing+".",
		])
		
		subInfo.addLust(10.0 + subInfo.fetishScore({Fetish.OralSexReceiving: 5.0}))
		subInfo.addArousalForeplay(0.05)
		affectSub(subInfo.fetishScore({Fetish.OralSexReceiving: 1.0}), 0.0, -0.3, -0.01)
		
		if(subInfo.isReadyToPenetrate() && clothingItem == null):
			text += RNG.pick([
				" {sub.Your} hard cock is leaking "+RNG.pick(["pre", "precum", "arousal"])+".",
				" {sub.Your} cock seems "+RNG.pick(["ready", "hard enough"])+" for a blowjob.",
			])
		
		return {text = text}
	if(_id == "startpussylick"):
		state = "licking"
		var clothingItem = getSub().getFirstItemThatCoversBodypart(BodypartSlot.Vagina)
		var throughTheClothing = ""
		if(clothingItem != null):
			throughTheClothing = " through the "+clothingItem.getCasualName()
		
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('stick')} {dom.yourHis} tongue out and {dom.youVerb('press', 'presses')} it against {sub.your} "+RNG.pick(["pussy", "slit", "petals", "folds"])+" before proceeding to lick {sub.youHim} out"+throughTheClothing+".",
		])
		
		subInfo.addLust(10.0 + subInfo.fetishScore({Fetish.OralSexReceiving: 5.0}))
		subInfo.addArousalForeplay(0.05)
		affectSub(subInfo.fetishScore({Fetish.OralSexReceiving: 1.0}), 0.0, -0.3, -0.01)
		return {text = text, domSay=domReaction(SexReaction.AboutToLickPussy)}
	if(_id == "startblowjob"):
		state = "blowjob"

		var text = RNG.pick([
			"{dom.You} {dom.youVerb('open')} {dom.yourHis} mouth and {dom.youVerb('let')} {sub.your} "+RNG.pick(["cock", "dick", "member"])+" in before wrapping {dom.yourHis} lips around it.",
		])
		getDom().gotOrificeStretchedBy(BodypartSlot.Head, subID, true, 0.1)
		affectSub(subInfo.fetishScore({Fetish.OralSexReceiving: 1.0}), 0.1, -0.3, -0.01)
		sendSexEvent(SexEvent.HolePenetrated, subID, domID, {hole=BodypartSlot.Head,engulfed=true,strapon=false})
		return {text = text, domSay=domReaction(SexReaction.AboutToSuckSubOff)}
	if(_id == "starttonguefuck"):
		state = "tonguefucking"
		
		var text = RNG.pick([
			"{dom.You} "+RNG.pick(["{dom.youVerb('find')}", "{dom.youVerb('reach', 'reaches')}"])+" for {sub.yourHis} "+RNG.pick(["pussy hole", "pussy entering"])+" and {dom.youVerb('penetrate')} it before proceeding to slide {dom.yourHis} tongue in and out, fucking it that way!",
		])
		affectSub(subInfo.fetishScore({Fetish.OralSexReceiving: 1.0}), 0.1, -0.3, -0.01)
		return {text = text}
	
	
	if(_id == "stop"):
		endActivity()
		
	var exposedThings = []
	var genitalsText = "crotch"
	if(getDom().hasPenis() && getDom().getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
		exposedThings.append(RNG.pick(["dick", "cock", "member"]))
		if(RNG.chance(50)):
			exposedThings.append("balls")
	if(getDom().hasVagina() && getDom().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) == null):
		exposedThings.append(RNG.pick(["pussy", "pussy", "slit", "kitty"]))
	if(exposedThings.size() > 0):
		genitalsText = "exposed "+Util.humanReadableList(exposedThings)
		
		return {text = "{dom.You} {dom.youVerb('pull')} {dom.yourHis} lips away from {sub.yourHis} "+genitalsText+"."}

func getSubActions():
	var actions = []

	actions.append({
		"id": "pullaway",
		"score": subInfo.getResistScore(),
		"name": "Pull away",
		"desc": "Try to pull away",
		"chance": getSubResistChance(30.0, 25.0),
	})

	if(state in ["blowjob", "lickingcock", "licking", "tonguefucking"]):
		actions.append({
			"id": "moan",
			"score": subInfo.getComplyScore()/3.0,
			"name": "Moan",
			"desc": "Show how much you like it",
		})
		
		if(subInfo.isReadyToCum() && isHandlingSubOrgasms()):
			if(getSexType() == SexType.SlutwallSex):
				actions.append({
					"id": "cumondom",
					"score": 1.0,
					"name": "Cum!",
					"desc": "You're about to cum and there is nothing you can do about it",
					"priority": 1001,
				})
			else:
				actions.append({
					"id": "warndom",
					"score": 0.5 + subInfo.getComplyScore()*0.5,
					"name": "Warn dom",
					"desc": "Let them know that you're about to cum",
					"priority": 1001,
				})
				actions.append({
					"id": "cumondom",
					"score": subInfo.getResistScore(),
					"name": "Cum!",
					"desc": "Cum without letting the dom know",
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
	if(getSexType() == SexType.SlutwallSex):
		theChance *= 0.5
	
	return max(theChance, 5.0)

func doSubAction(_id, _actionInfo):
	if(_id == "warndom"):
		if(state in ["licking", "tonguefucking"]):
			state = "subabouttocum"
		else:
			state = "subabouttocumcock"
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('warn')} {dom.youHim} that {sub.youHe} {sub.youAre} "+RNG.pick(["about to cum", "close", "very close"])+".",
		])
		domInfo.addAnger(-0.05)
		return {
			text = text,
			domSay = domReaction(SexReaction.WarnAboutToCum, 100),
			subSay = subReaction(SexReaction.WarnAboutToCum, 100),
			}
	if(_id == "cumondom"):
		satisfyGoals()
		endActivity()
		
		if(state in ["licking", "tonguefucking"]):
			return doCumPussyLickSub(true)
		if(state == "lickingcock"):
			return doCumBJFacialsSub(true)
		if(state == "blowjob"):
			return doCumBJSub(true)
		
		return {text = "SOMETHING WENT WRONG"}
	
	if(_id == "pullaway"):
		var successChance = getSubResistChance(30.0, 25.0)
		if(RNG.chance(successChance)):
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('pull')} away from {dom.you}.",
			])
			domInfo.addAnger(0.3)
			if(state != ""):
				state = ""
			else:
				endActivity()
			return {text = text}
		else:
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('try', 'tries')} to pull away from {dom.you} but {sub.youVerb('fail')}.",
			])
			domInfo.addAnger(0.1)
			return {text = text, subSay=subReaction(SexReaction.ActivelyResisting, 50)}
	if(_id == "moan"):
		var text = RNG.pick([
			"{sub.You} "+RNG.pick(["{sub.youVerb('let')} out a moan", "{sub.youVerb('moan')}", "{sub.youVerb('produce')} a moan", "{sub.youVerb('make')} a noise of pleasure"])+" while ",
		])
		if(getSub().isGagged()):
			text = RNG.pick([
				"{sub.You} "+RNG.pick(["{sub.youVerb('let')} out a muffled moan", "{sub.youVerb('try', 'tries')} to moan", "{sub.youVerb('produce')} a muffled moan", "{sub.youVerb('make')} a muffled noise of pleasure"])+" while ",
			])
		if(state == "licking"):
			text += RNG.pick([
				"{dom.You} {dom.youAre} licking {sub.yourHis} "+RNG.pick(["pussy", "sensitive folds", "kitty", "petals", "wet pussy"])+".",
			])
		if(state == "tonguefucking"):
			text += RNG.pick([
				"{dom.You} {dom.youAre} tongue-fucking {sub.yourHis} "+RNG.pick(["pussy", "sensitive folds", "kitty", "petals", "wet pussy"])+".",
			])
		if(state == "lickingcock"):
			text += RNG.pick([
				"{dom.You} {dom.youAre} "+RNG.pick(["licking", "teasing", "preparing"])+" {sub.yourHis} "+RNG.pick(["cock", "dick", "member"])+".",
			])
		if(state == "blowjob"):
			text += RNG.pick([
				"{dom.You} {dom.youAre} "+RNG.pick(["sucking"])+" {sub.yourHis} "+RNG.pick(["cock", "dick", "member"])+".",
			])
		domInfo.addAnger(-0.02)
		domInfo.addLust(5)
		return {text = text}

	return

func getAnimation():
	if(getSexType() == SexType.SlutwallSex):
		if(state in [""]):
			return [StageScene.SlutwallSexOral, "tease", {pc=subID, npc=domID}]
		
		if(state in ["licking", "subabouttocum"]):
			return [StageScene.SlutwallSexOral, "lick", {pc=subID, npc=domID}]
		if(state in ["tonguefucking"]):
			return [StageScene.SlutwallSexOral, "lick", {pc=subID, npc=domID}]
		
		if(state in ["blowjob", "subabouttocumcock"]):
			if(domInfo.isCloseToCumming()):
				return [StageScene.SlutwallSexOral, "blowjob", {pc=subID, npc=domID}]
			return [StageScene.SlutwallSexOral, "blowjob", {pc=subID, npc=domID}]
		
		if(state in ["lickingcock"]):
			return [StageScene.SlutwallSexOral, "lick", {pc=subID, npc=domID}]
		
	
	if(state in [""]):
		return [StageScene.SexOral, "start", {pc=subID, npc=domID}]
	
	if(state in ["licking", "subabouttocum"]):
		return [StageScene.SexOral, "lick", {pc=subID, npc=domID}]
	if(state in ["tonguefucking"]):
		return [StageScene.SexOral, "lick", {pc=subID, npc=domID}]
	
	if(state in ["blowjob", "subabouttocumcock"]):
		if(domInfo.isCloseToCumming()):
			return [StageScene.SexOral, "fast", {pc=subID, npc=domID}]
		return [StageScene.SexOral, "sex", {pc=subID, npc=domID}]
	
	if(state in ["lickingcock"]):
		return [StageScene.SexOral, "tease", {pc=subID, npc=domID}]
		
func getDomOrgasmHandlePriority():
	return -1

func getSubOrgasmHandlePriority():
	return 10

func saveData():
	var data = .saveData()
	
	data["waitTimer"] = waitTimer

	return data
	
func loadData(data):
	.loadData(data)
	
	waitTimer = SAVE.loadVar(data, "waitTimer", 0)
