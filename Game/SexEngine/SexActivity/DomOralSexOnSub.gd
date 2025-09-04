extends SexActivityBase
var waitTimer:int = 0

func _init():
	id = "DomOralSexOnSub"
	
	activityName = "Oral to sub"
	activityDesc = "Make them feel good with your mouth"
	activityCategory = ["Fuck"]

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

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		if(getState() in ["blowjob", "lickingcock", "licking", "grinding"]):
			return [SexActivityTag.MouthUsed, SexActivityTag.HavingSex]
		return [SexActivityTag.HavingSex]
	if(_indx == SUB_0):
		return [SexActivityTag.PreventsSubTeasing, SexActivityTag.HavingSex, SexActivityTag.PenisUsed, SexActivityTag.VaginaUsed] #SexActivityTag.PreventsSubViolence
	return []

func getCheckTagsDom() -> Array:
	return [SexActivityTag.OrderedToDoSomething, SexActivityTag.MouthUsed, SexActivityTag.HavingSex]

func getCheckTagsSub() -> Array:
	return [SexActivityTag.OrderedToDoSomething, SexActivityTag.HavingSex, SexActivityTag.PenisUsed, SexActivityTag.VaginaUsed]

func isActivityImpossibleShouldStop() -> bool:
	if(getState() in ["blowjob", "lickingcock"]):
		if(!getSub().hasReachablePenis() && !getSub().isWearingStrapon()):
			return true
	if(getState() in ["licking", "grinding"]):
		if(!getSub().hasReachableVagina()):
			return true
	return false

func startActivity(_args):
	var exposedThings:Array = []
	var genitalsText:String = "crotch"
	if(getSub().hasPenis() && getSub().getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
		exposedThings.append(RNG.pick(["dick", "cock", "member"]))
		if(RNG.chance(50)):
			exposedThings.append("balls")
	if(getSub().hasVagina() && getSub().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) == null):
		exposedThings.append(RNG.pick(["pussy", "pussy", "slit", "kitty"]))
	if(exposedThings.size() > 0):
		genitalsText = "exposed "+Util.humanReadableList(exposedThings)
	
	if(getSexType() != SexType.SlutwallSex):
		addText("{dom.You} {dom.youVerb('keep')} {sub.you} lying on the floor while bringing {dom.yourHis} mouth to {sub.yourHis} "+genitalsText+".")
	else:
		addText("{dom.You} {dom.youVerb('kneel')} down and {dom.youVerb('bring')} {dom.yourHis} mouth to {sub.yourHis} "+genitalsText+".")

func handjob_processTurn():
	stimulateStrokePenis(DOM_0, SUB_0, I_NORMAL, SPEED_SLOW)
	strokePenis(DOM_0, SUB_0)

func blowjob_processTurn():
	if(getSub().isWearingChastityCage()):
		setState("lickingcock")
		addText("{dom.You} {dom.youVerb('stop')} sucking {sub.yourHis} "+RNG.pick(["cock", "dick", "member"])+" when a chastity cage appears on it!")
		return
	
	doBlowjobTurn(DOM_0, SUB_0)
	
func lickingcock_processTurn():
	stimulateLick(DOM_0, SUB_0, S_PENIS, I_TEASE)
#	affectSub(getSubInfo().fetishScore({Fetish.OralSexReceiving: 1.0})+0.3, 0.1, -0.1, -0.01)
#	affectDom(getDomInfo().fetishScore({Fetish.OralSexGiving: 0.5})+0.6, 0.1, 0.0)
#	getSubInfo().stimulateArousalZone(0.06, BodypartSlot.Penis, 0.25)
	
	var clothingItem = getSub().getFirstItemThatCoversBodypart(BodypartSlot.Penis)
	var throughTheClothing = ""
	if(clothingItem != null):
		throughTheClothing = " through the "+clothingItem.getCasualName()
	var text = RNG.pick([
		"{dom.You} {dom.youAre} licking {sub.yourHis} "+RNG.pick(["cock", "dick", "member"])+ throughTheClothing +".",
		"{dom.You} {dom.youAre} dragging {dom.yourHis} tongue over {sub.yourHis} "+RNG.pick(["cock", "dick", "member"])+ throughTheClothing +".",
	])
	
	if(getSubInfo().isReadyToCum()):
		text += RNG.pick([
			" {sub.YouHe} {sub.youAre} about to cum!",
			" {sub.YouHe} {sub.youAre} being kept on edge by {dom.youHim}.",
			" {sub.YourHis} "+RNG.pick(["cock", "dick", "member"])+" is twitching and throbbing.",
			" {sub.YourHis} "+RNG.pick(["cock", "dick", "member"])+" is leaking pre a lot.",
			" {sub.YouHe} {sub.youAre} barely keeping {sub.yourself} from cumming.",
			" {sub.YouHe} reached {sub.yourHis} peak!",
		])
	elif(getSubInfo().isCloseToCumming()):
		text += RNG.pick([
			" {sub.You} "+RNG.pick(["{sub.youVerb('let')} out some moans", "{sub.youVerb('let')} out a moan", "{sub.youVerb('breathe')} deeply"])+" while {sub.yourHis} "+RNG.pick(["cock", "dick", "member"])+" "+RNG.pick(["drips pre", "twitches slightly", "responds by twitching", "gets harder"])+"."
		])
	
	addText(text)
	
func licking_processTurn():
	doPussyLickingTurn(DOM_0, SUB_0)
	
func tonguefucking_processTurn():
	stimulateLick(DOM_0, SUB_0, S_VAGINA, I_LOW)
	#affectSub(getSubInfo().fetishScore({Fetish.OralSexReceiving: 1.0})+0.1, 0.1, -0.1, -0.01)
	#affectDom(getDomInfo().fetishScore({Fetish.OralSexGiving: 0.5})+0.6, 0.1, 0.0)
	#getSubInfo().stimulateArousalZone(0.1, BodypartSlot.Vagina, 0.5)
	
	var text = RNG.pick([
		"{dom.You} "+RNG.pick(["{dom.youVerb('push', 'pushes')}", "{dom.youVerb('slide')}"])+" {dom.yourHis} tongue in and out of {sub.your} "+RNG.pick(["pussy", "pussy slit", "flower", "slit", "kitty"])+".",
		"{dom.You} {dom.youVerb('tongue-fuck')} {sub.yourHis} "+RNG.pick(["pussy", "slit", "kitty"])+"!",
		"{dom.You} {dom.youVerb('slide')} {dom.yourHis} tongue inside {sub.yourHis} "+RNG.pick(["pussy", "slit", "kitty"])+", fucking it!",
	])
	
	if(getSub().hasEffect(StatusEffect.HasCumInsideVagina) && OPTIONS.isContentEnabled(ContentType.CumStealing)):
		if(RNG.chance(20)):
			if(getSub().bodypartTransferFluidsTo(BodypartSlot.Vagina, getDomID(), BodypartSlot.Head, 0.1, 20.0)):
				text += RNG.pick([ 
					" "+Util.capitalizeFirstLetter(getSub().getBodypartContentsStringList(BodypartSlot.Vagina))+" lands on {dom.yourHis} tongue, leaking out of {sub.yourHis} "+RNG.pick(["", "used ", "stuffed "])+RNG.pick(["pussy", "slit", "kitty"])+" and [b]{dom.you} {dom.youVerb('swallow')} it[/b].",
				])
	
	if(getSubInfo().isReadyToCum()):
		text += RNG.pick([
			" {sub.YouHe} {sub.youAre} about to cum!",
			" {sub.YouHe} {sub.youAre} being edged by {dom.youHim}.",
			" {sub.YourHis} "+RNG.pick(["pussy", "pussy slit"])+" is twitching a lot.",
			" {sub.YourHis} "+RNG.pick(["pussy", "pussy slit"])+" is leaking arousal a lot.",
			" {sub.YouHe} {sub.youAre} barely keeping {dom.yourself} from cumming.",
			" {sub.YouHe} reached {sub.yourHis} peak!",
		])
	elif(getSubInfo().isCloseToCumming()):
		text += RNG.pick([
			" {sub.You} "+RNG.pick(["{sub.youVerb('let')} out some moans", "{sub.youVerb('let')} out a moan", "{sub.youVerb('breathe')} deeply"])+" while {sub.yourHis} pussy "+RNG.pick(["drips juices", "leaks arousal", "becomes more aroused", "drips arousal", "produces an aroused scent"])+"."
		])
	
	addText(text)
	
func getActions(_indx:int):
	if(_indx == DOM_0):
		if(getSub().hasPenis()):
			addAction("cupballs", 0.2, "Cup balls", "Play with the their balls a bit")
		if(getSub().hasVagina()):
			addAction("rubclit", 0.2, "Rub clit", "Play with the their clit a bit")
		if(getState() == ""):
			if(getSub().hasReachablePenis()):
				addAction("startcocklick", 1.0, "Lick cock", "Start licking their cock")
				if(hasBodypartUncovered(SUB_0, S_PENIS)):
					addAction("startHandjob", 1.0, "Stroke cock", "Get their cock ready by stroking it")
			if(getSub().hasReachableVagina()):
				addAction("startpussylick", 1.0, "Lick pussy", "Start licking their pussy")
		if(getState() == "lickingcock" || state == "handjob"):
			if(getSub().isReadyToPenetrate() && hasBodypartUncovered(SUB_0, BodypartSlot.Penis)):
				addAction("startblowjob", 1.0 if state != "handjob" else 0.1, "Blowjob", "Let that cock into your mouth")
		if(getState() == "licking"):
			if(hasBodypartUncovered(SUB_0, BodypartSlot.Vagina)):
				addAction("starttonguefuck", 1.0, "Tonguefuck", "Fuck that pussy with your tongue")
		if(getState() in ["licking", "tonguefucking"]):
			if(getDom().hasEffect(StatusEffect.HasCumInsideMouth) && getSub().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) == null && !getDom().isOralBlocked() && OPTIONS.isContentEnabled(ContentType.CumStealing)):
				addAction("spitcumintosubspussy", 0.01 + getDomInfo().fetishScore({Fetish.Breeding: 0.1}), "Spit cum into pussy", "Force some cum into their slit")

		if(getState() in ["subabouttocum", "subabouttocumcock", "subabouttocumHandjob"] || ((getState() in ["licking", "tonguefucking", "lickingcock", "blowjob", "handjob"]) && getSubInfo().isReadyToCum() && !getSubInfo().canDoActions())):
			addAction("letsubcuminside", 1.0, "Inside", "Let the sub cum inside your mouth", {A_PRIORITY: 1001})
			addAction("letsubcumoutside", 1.0, "Facial", "Let the sub cum on you", {A_PRIORITY: 1001})
			addAction("makesubcumavoidmess", 1.0, "Avoid mess", "Let the sub cum but avoid getting messy", {A_PRIORITY: 1001})
		
		addAction("stop", getStopScore(), "Stop oral", "Stop the oral sex activity")
	
	if(_indx == SUB_0):
		addAction("pullaway", getResistScore(SUB_0), "Pull away", "Try to pull away", {A_CHANCE: getResistChance(SUB_0, DOM_0, RESIST_ORAL_FOCUS, 30.0, 25.0)})
		if(getState() in ["blowjob", "lickingcock", "licking", "tonguefucking", "handjob"]):
			addAction("moan", getComplyScore(SUB_0)/3.0, "Moan", "Show how much you like it")
			
			if(isReadyToCumHandled(SUB_0)):
				if(getSexType() == SexType.SlutwallSex):
					addAction("cumondom", 1.0, "Cum!", "You're about to cum and there is nothing you can do about it", {A_PRIORITY: 1001})
				else:
					addAction("warndom", 0.5+getComplyScore(SUB_0)*0.5, "Warn dom", "Let them know that you're about to cum", {A_PRIORITY: 1001})
					addAction("cumondom", 1.0, "Cum!", "Cum without letting the dom know", {A_PRIORITY: 1001})

func doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "spitcumintosubspussy"):
		doSpitCumIntoHoleDom(BodypartSlot.Vagina)
	if(_id == "makesubcumavoidmess"):
		satisfyGoals()
		var text:String = ""
		if(getState() in ["subabouttocum", "licking", "tonguefucking"]):
			text = RNG.pick([
				"{dom.You} {dom.youVerb('lean')} to the side a bit and {dom.youVerb('let')} {sub.you} [b]cum all over the floor[/b]. {sub.YourHis} pussy squirts, leaving quite a mess! But luckily {dom.you} dodged all of it.",
			])
			getSub().cumOnFloor(getDomID())
			getSubInfo().cum()
		else:
			text = RNG.pick([
				"{dom.You} {dom.youVerb('lean')} to the side a bit and {dom.youVerb('let')} {sub.you} [b]cum all over the floor[/b]. Many "+RNG.pick(["strings of cum", "strands of seed"])+" land on it while {sub.yourHis} cock throbs and cums, leaving quite a mess! But luckily {dom.you} dodged all of it."
			])
			var condom:ItemBase = getSub().getWornCondom()
			if(condom != null):
				var breakChance:float = condom.getCondomBreakChance()
				
				if(RNG.chance(breakChance)):
					text = "[b]The condom broke![/b] "+text
					condom.destroyMe()
					fetishUp(SUB_0, Fetish.Condoms, -15.0)
					fetishUp(DOM_0, Fetish.Condoms, -20.0)
				else:
					fetishAffect(SUB_0, Fetish.Condoms, 3.0)
					fetishAffect(DOM_0, Fetish.Condoms, 3.0)
					text = RNG.pick([
						"{dom.You} {dom.youVerb('hold')} {dom.yourHis} face slightly to the side of {sub.yourHis} "+RNG.pick(["cock", "dick", "shaft"])+" as it starts throbbing and [b]filling the condom with "+RNG.pick(["cum", "seed", "semen"])+"[/b]!",
					])
					getSub().cumInItem(condom)
					getSubInfo().cum()
					setState("")
					
					addText(text)
					return
			
			getSub().cumOnFloor(getDomID())
			getSubInfo().cum()
		
		setState("")
		addText(text)
	if(_id == "letsubcumoutside"):
		satisfyGoals()
		var text:String = ""
		if(getState() in ["subabouttocum", "licking", "tonguefucking"]):
			text = RNG.pick([
				"{dom.You} {dom.youVerb('shift')} away a bit and {dom.youVerb('let')} {sub.you} [b]cum all over {dom.yourHis} face[/b]. Lots of "+RNG.pick(["pussy juices", "juices", "femcum", "female juices"])+" land on it while {sub.yourHis} pussy squirts, leaving quite a mess!",
			])
			if(getDom().isOralBlocked()):
				getDom().cummedOnBy(getSubID(), FluidSource.Vagina)
			else:
				getDom().cummedInMouthBy(getSubID(), FluidSource.Vagina, 0.5)
				getDom().cummedOnBy(getSubID(), FluidSource.Vagina, 0.5)
			getSubInfo().cum()
		else:
			text = RNG.pick([
				"{dom.You} {dom.youVerb('shift')} away a bit and {dom.youVerb('let')} {sub.you} [b]give {dom.youHim} a facial[/b]. Many "+RNG.pick(["strings of cum", "strands of seed"])+" land on {dom.youHim} while {sub.yourHis} cock throbs and cums, leaving quite a mess!"
			])
			var condom:ItemBase = getSub().getWornCondom()
			if(condom != null):
				var breakChance:float = condom.getCondomBreakChance()
				
				if(RNG.chance(breakChance)):
					text = "[b]The condom broke![/b] "+text
					condom.destroyMe()
					fetishUp(SUB_0, Fetish.Condoms, -15.0)
					fetishUp(DOM_0, Fetish.Condoms, -20.0)
				else:
					fetishAffect(SUB_0, Fetish.Condoms, 3.0)
					fetishAffect(DOM_0, Fetish.Condoms, 3.0)
					text = RNG.pick([
						"{dom.You} {dom.youVerb('hold')} {dom.yourHis} face near {sub.yourHis} "+RNG.pick(["cock", "dick", "shaft"])+" as it starts throbbing and [b]filling the condom with "+RNG.pick(["cum", "seed", "semen"])+"[/b]!",
					])
					getSub().cumInItem(condom)
					getSubInfo().cum()
					setState("")
					
					addText(text)
					return
			
			getDom().cummedOnBy(getSubID(), FluidSource.Penis)
			getSubInfo().cum()
		
		setState("")
		addText(text)
		return
	if(_id == "letsubcuminside"):
		satisfyGoals()
		var text:String = ""
		var condomBroke:bool = false
		if(getState() in ["subabouttocum", "licking", "tonguefucking"]):
			text = RNG.pick([
				"{dom.You} {dom.youVerb('press', 'presses')} {dom.yourHis} lips against {sub.yourHis} "+RNG.pick(["pussy", "slit", "sensitive folds", "petals"])+" and keep lapping up the arousal until [b]{sub.you} {sub.youVerb('cum')}[/b]! {sub.YourHis} juices rush into {dom.yourHis} mouth as {sub.youHe} squirts!",
			])
			getDom().cummedInMouthBy(getSubID(), FluidSource.Vagina)
			getSubInfo().cum()
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
					fetishUp(SUB_0, Fetish.Condoms, -15.0)
					fetishUp(DOM_0, Fetish.Condoms, -20.0)
				else:
					fetishAffect(SUB_0, Fetish.Condoms, 3.0)
					fetishAffect(DOM_0, Fetish.Condoms, 3.0)
					text = RNG.pick([
						"{dom.You} {dom.youVerb('hold')} {dom.yourHis} lips wrapped around {sub.yourHis} "+RNG.pick(["cock", "dick", "shaft"])+" as it starts throbbing and [b]filling the condom inside {dom.your} mouth with "+RNG.pick(["cum", "seed", "semen"])+"[/b]!",
					])
					getSub().cumInItem(condom)
					getSubInfo().cum()
					setState("")
					
					addText(text)
					return
			
			getDom().cummedInMouthByAdvanced(getSubID(), {condomBroke=condomBroke}, FluidSource.Penis)
			getSubInfo().cum()
		
		setState("")
		addText(text)
		return
	if(_id == "cupballs"):
		cupballs(DOM_0, SUB_0)
		stimulate(DOM_0, S_MOUTH, SUB_0, S_PENIS, I_TEASE, Fetish.OralSexGiving, SPEED_SLOW)
		#affectSub(getSubInfo().fetishScore({Fetish.OralSexReceiving: 1.0}), 0.1, -0.05, -0.01)
		
		return
	if(_id == "rubclit"):
		var text = RNG.pick([
			"{dom.You} "+RNG.pick(["{dom.youVerb('rub')}", "{dom.youVerb('tease')}", "{dom.youVerb('play')} with"])+" {sub.yourHis} clit a bit, providing some extra stimulation.",
		])
		stimulate(DOM_0, S_HANDS, SUB_0, S_VAGINA, I_HIGH, Fetish.OralSexGiving, SPEED_VERYSLOW)
		#getSubInfo().stimulateArousalZone(0.05, BodypartSlot.Vagina, 0.2)
		#affectSub(getSubInfo().fetishScore({Fetish.OralSexReceiving: 1.0}), 0.0, -0.05, -0.01)
		
		addText(text)
		return
	if(_id == "startHandjob"):
		setState("handjob")
		addTextPick([
			"{dom.You} {dom.youVerb('wrap')} {dom.yourHis} digits around {sub.yourHis} {sub.penisShort}!",
		])
		stimulate(DOM_0, S_MOUTH, SUB_0, S_PENIS, I_TEASE, Fetish.OralSexGiving, SPEED_SLOW)
		react(SexReaction.AboutToHandjobSub)
		return
	if(_id == "startcocklick"):
		setState("lickingcock")
		var clothingItem = getSub().getFirstItemThatCoversBodypart(BodypartSlot.Penis)
		var throughTheClothing:String = ""
		if(clothingItem != null):
			throughTheClothing = " through the "+clothingItem.getCasualName()
		
		var text:String = RNG.pick([
			"{dom.You} {dom.youVerb('bring')} {dom.yourHis} tongue to {sub.yourHis} "+RNG.pick(["dick", "cock", "member", "shaft"])+" and {dom.youVerb('proceed')} to lick it"+throughTheClothing+".",
		])
		
		stimulateLick(DOM_0, SUB_0, S_PENIS, I_TEASE, SPEED_SLOW)
		#getSubInfo().addLust(10.0 + getSubInfo().fetishScore({Fetish.OralSexReceiving: 5.0}))
		#getSubInfo().addArousalForeplay(0.05)
		#affectSub(getSubInfo().fetishScore({Fetish.OralSexReceiving: 1.0}), 0.0, -0.3, -0.01)
		
		if(getSubInfo().isReadyToPenetrate() && clothingItem == null):
			text += RNG.pick([
				" {sub.Your} hard cock is leaking "+RNG.pick(["pre", "precum", "arousal"])+".",
				" {sub.Your} cock seems "+RNG.pick(["ready", "hard enough"])+" for a blowjob.",
			])
		
		addText(text)
		return
	if(_id == "startpussylick"):
		setState("licking")
		var clothingItem = getSub().getFirstItemThatCoversBodypart(BodypartSlot.Vagina)
		var throughTheClothing = ""
		if(clothingItem != null):
			throughTheClothing = " through the "+clothingItem.getCasualName()
		
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('stick')} {dom.yourHis} tongue out and {dom.youVerb('press', 'presses')} it against {sub.your} "+RNG.pick(["pussy", "slit", "petals", "folds"])+" before proceeding to lick {sub.youHim} out"+throughTheClothing+".",
		])
		
		stimulateLick(DOM_0, SUB_0, S_VAGINA, I_TEASE, SPEED_SLOW)
		#getSubInfo().addLust(10.0 + getSubInfo().fetishScore({Fetish.OralSexReceiving: 5.0}))
		#getSubInfo().addArousalForeplay(0.05)
		#affectSub(getSubInfo().fetishScore({Fetish.OralSexReceiving: 1.0}), 0.0, -0.3, -0.01)
		addText(text)
		react(SexReaction.AboutToLickPussy)
		return
	if(_id == "startblowjob"):
		setState("blowjob")

		var text:String = RNG.pick([
			"{dom.You} {dom.youVerb('open')} {dom.yourHis} mouth and {dom.youVerb('let')} {sub.your} "+RNG.pick(["cock", "dick", "member"])+" in before wrapping {dom.yourHis} lips around it.",
		])
		getDom().gotOrificeStretchedBy(BodypartSlot.Head, getSubID(), true, 0.1)
		stimulateLick(DOM_0, SUB_0, S_PENIS, I_TEASE, SPEED_SLOW)
		#affectSub(getSubInfo().fetishScore({Fetish.OralSexReceiving: 1.0}), 0.1, -0.3, -0.01)
		sendSexEvent(SexEvent.HolePenetrated, SUB_0, DOM_0, {hole=BodypartSlot.Head,engulfed=true,strapon=false})
		addText(text)
		react(SexReaction.AboutToSuckSubOff)
		return
	if(_id == "starttonguefuck"):
		setState("tonguefucking")
		
		var text = RNG.pick([
			"{dom.You} "+RNG.pick(["{dom.youVerb('find')}", "{dom.youVerb('reach', 'reaches')}"])+" for {sub.yourHis} "+RNG.pick(["pussy hole", "pussy entering"])+" and {dom.youVerb('penetrate')} it before proceeding to slide {dom.yourHis} tongue in and out, fucking it that way!",
		])
		stimulateLick(DOM_0, SUB_0, S_VAGINA, I_TEASE, SPEED_SLOW)
		#affectSub(getSubInfo().fetishScore({Fetish.OralSexReceiving: 1.0}), 0.1, -0.3, -0.01)
		addText(text)
		return
	if(_id == "stop"):
		endActivity()
		
		var exposedThings:Array = []
		var genitalsText:String = "crotch"
		if(getSub().hasPenis() && getSub().getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
			exposedThings.append(RNG.pick(["dick", "cock", "member"]))
			if(RNG.chance(50)):
				exposedThings.append("balls")
		if(getSub().hasVagina() && getSub().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) == null):
			exposedThings.append(RNG.pick(["pussy", "pussy", "slit", "kitty"]))
		if(exposedThings.size() > 0):
			genitalsText = "exposed "+Util.humanReadableList(exposedThings)
			
		addText("{dom.You} {dom.youVerb('pull')} {dom.yourHis} lips away from {sub.yourHis} "+genitalsText+".")

	if(_id == "warndom"):
		if(state == "handjob"):
			setState("subabouttocumHandjob")
		elif(getState() in ["licking", "tonguefucking"]):
			setState("subabouttocum")
		else:
			setState("subabouttocumcock")
		addText("{sub.You} {sub.youVerb('warn')} {dom.youHim} that {sub.youHe} {sub.youAre} "+RNG.pick(["about to cum", "close", "very close"])+".")
		getDomInfo().addAnger(-0.05)
		reactSub(SexReaction.WarnAboutToCum)
		return
	if(_id == "cumondom"):
		satisfyGoals()
		
		if(getState() in ["licking", "tonguefucking"]):
			doCumPussyLickSub(true)
			setState("")
			return
		if(getState() == "lickingcock" || state == "handjob"):
			doCumBJFacialsSub(true)
			setState("")
			return
		if(getState() == "blowjob"):
			doCumBJSub(true)
			setState("")
			return
		
		#addText("SOMETHING WENT WRONG")
		return
	if(_id == "pullaway"):
		var successChance:float = getResistChance(SUB_0, DOM_0, RESIST_ORAL_FOCUS, 30.0, 25.0)
		if(RNG.chance(successChance)):
			addText("{sub.You} {sub.youVerb('pull')} away from {dom.you}.")
			getDomInfo().addAnger(0.3)
			if(getState() != ""):
				setState("")
			else:
				endActivity()
			return
		else:
			addText("{sub.You} {sub.youVerb('try', 'tries')} to pull away from {dom.you} but {sub.youVerb('fail')}.")
			getDomInfo().addAnger(0.1)
			reactSub(SexReaction.ActivelyResisting, [50])
			return
	if(_id == "moan"):
		if(state in ["licking", "tonguefucking", "lickingcock", "blowjob"]):
			var text:String = RNG.pick([
				"{sub.You} "+RNG.pick(["{sub.youVerb('let')} out a moan", "{sub.youVerb('moan')}", "{sub.youVerb('produce')} a moan", "{sub.youVerb('make')} a noise of pleasure"])+" while ",
			])
			if(getSub().isGagged()):
				text = RNG.pick([
					"{sub.You} "+RNG.pick(["{sub.youVerb('let')} out a muffled moan", "{sub.youVerb('try', 'tries')} to moan", "{sub.youVerb('produce')} a muffled moan", "{sub.youVerb('make')} a muffled noise of pleasure"])+" while ",
				])
			if(getState() == "licking"):
				text += RNG.pick([
					"{dom.you} {dom.youAre} licking {sub.yourHis} "+RNG.pick(["pussy", "sensitive folds", "kitty", "petals", "wet pussy"])+".",
				])
			if(getState() == "tonguefucking"):
				text += RNG.pick([
					"{dom.you} {dom.youAre} tongue-fucking {sub.yourHis} "+RNG.pick(["pussy", "sensitive folds", "kitty", "petals", "wet pussy"])+".",
				])
			if(getState() == "lickingcock"):
				text += RNG.pick([
					"{dom.you} {dom.youAre} "+RNG.pick(["licking", "teasing", "preparing"])+" {sub.yourHis} "+RNG.pick(["cock", "dick", "member"])+".",
				])
			if(getState() == "blowjob"):
				text += RNG.pick([
					"{dom.you} {dom.youAre} "+RNG.pick(["sucking"])+" {sub.yourHis} "+RNG.pick(["cock", "dick", "member"])+".",
				])
			addText(text)
		else:
			if(getSub().isGagged()):
				addTextPick([
					"{sub.You} "+RNG.pick(["{sub.youVerb('let')} out a muffled moan","{sub.youVerb('moan')}", "{sub.youVerb('produce')} a muffled moan", "{sub.youVerb('make')} a muffled noise of pleasure"])+".",
				])
			else:
				addTextPick([
					"{sub.You} "+RNG.pick(["{sub.youVerb('let')} out a moan","{sub.youVerb('moan')}", "{sub.youVerb('produce')} a moan", "{sub.youVerb('make')} a noise of pleasure"])+".",
				])
		moan(SUB_0)
		return


func getAnimation():
	if(getSexType() == SexType.SlutwallSex):
		if(getState() in [""]):
			return [StageScene.SlutwallSexOral, "tease", {pc=SUB_0, npc=DOM_0}]
		if(state == "handjob" || state == "subabouttocumHandjob"):
			return [StageScene.SlutwallSexOral, "handjob", {pc=SUB_0, npc=DOM_0, bodyState={hard=true}}]
		
		if(getState() in ["licking", "subabouttocum"]):
			return [StageScene.SlutwallSexOral, "lick", {pc=SUB_0, npc=DOM_0}]
		if(getState() in ["tonguefucking"]):
			return [StageScene.SlutwallSexOral, "lick", {pc=SUB_0, npc=DOM_0}]
		
		if(getState() in ["blowjob", "subabouttocumcock"]):
			if(getDomInfo().isCloseToCumming()):
				return [StageScene.SlutwallSexOral, "blowjob", {pc=SUB_0, npc=DOM_0}]
			return [StageScene.SlutwallSexOral, "blowjob", {pc=SUB_0, npc=DOM_0}]
		
		if(getState() in ["lickingcock"]):
			return [StageScene.SlutwallSexOral, "lick", {pc=SUB_0, npc=DOM_0}]
		
	
	if(getState() in [""]):
		return [StageScene.SexOral, "start", {pc=SUB_0, npc=DOM_0}]
	if(state == "handjob" || state == "subabouttocumHandjob"):
		if(isCloseToCumming(SUB_0)):
			return [StageScene.SexHandjob, "fast", {pc=SUB_0, npc=DOM_0, bodyState={hard=true}}]
		return [StageScene.SexHandjob, "sex", {pc=SUB_0, npc=DOM_0, bodyState={hard=true}}]
	
	
	if(getState() in ["licking", "subabouttocum"]):
		return [StageScene.SexOral, "lick", {pc=SUB_0, npc=DOM_0}]
	if(getState() in ["tonguefucking"]):
		return [StageScene.SexOral, "lick", {pc=SUB_0, npc=DOM_0}]
	
	if(getState() in ["blowjob", "subabouttocumcock"]):
		if(getDomInfo().isCloseToCumming()):
			return [StageScene.SexOral, "fast", {pc=SUB_0, npc=DOM_0}]
		return [StageScene.SexOral, "sex", {pc=SUB_0, npc=DOM_0}]
	
	if(getState() in ["lickingcock"]):
		return [StageScene.SexOral, "tease", {pc=SUB_0, npc=DOM_0}]
		
func getOrgasmHandlePriority(_indx:int) -> int:
	if(_indx == SUB_0):
		return 10
	return -1

func saveData():
	var data = .saveData()
	
	data["waitTimer"] = waitTimer

	return data
	
func loadData(data):
	.loadData(data)
	
	waitTimer = SAVE.loadVar(data, "waitTimer", 0)
