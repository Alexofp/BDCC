extends SexActivityBase
var waitTimer = 0

func _init():
	id = "DomOralSexOnSub"

func getGoals():
	return {
		SexGoal.DoOralOnSub: 1.0,
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
	if(state in ["blowjob", "deepthroat", "licking", "grinding"]):
		return [SexActivityTag.MouthUsed, SexActivityTag.HavingSex]
	return [SexActivityTag.HavingSex]

func getSubTags():
	var thetags = [SexActivityTag.PreventsSubTeasing, SexActivityTag.HavingSex, SexActivityTag.PenisUsed, SexActivityTag.VaginaUsed] #SexActivityTag.PreventsSubViolence

	return thetags

func getDomTagsCheck():
	return [SexActivityTag.OrderedToDoSomething, SexActivityTag.MouthUsed, SexActivityTag.HavingSex]

func getSubTagsCheck():
	return [SexActivityTag.OrderedToDoSomething, SexActivityTag.HavingSex, SexActivityTag.PenisUsed, SexActivityTag.VaginaUsed]

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
	
	return {
		text = text,
	}

func onSwitchFrom(_otherActivity, _args):
	return

func processTurn():
	if(state == "blowjob"):
		affectSub(subInfo.fetishScore({Fetish.OralSexReceiving: 1.0})+0.6, 0.1, -0.1, -0.01)
		affectDom(domInfo.fetishScore({Fetish.OralSexGiving: 0.5})+0.1, 0.1, 0.0)
		domInfo.addArousalForeplay(0.03)
		subInfo.addArousalSex(0.2)
		getDom().gotOrificeStretchedBy(BodypartSlot.Head, subID, 0.05)
		
		var text = RNG.pick([
			"{dom.You} {dom.youAre} sucking {sub.your} "+RNG.pick(["cock", "dick", "member"])+".",
			"{dom.You} {dom.youVerb('drag')} {dom.yourHis} lips over {sub.your} "+RNG.pick(["cock", "dick", "member", "length"])+", sucking it.",
		])
		
		if(!domInfo.isUnconscious()):
			if(RNG.chance(30)):
				text += RNG.pick([
					" Wet slurping noises can be heard from {dom.you}.",
					" {dom.You} {dom.youAre} making wet noises with {dom.yourHis} mouth.",
					" {dom.You} {dom.youVerb('work')} that tongue around the length to provide extra stimulation.",
				])
		
		if(subInfo.isReadyToCum()):
			text += RNG.pick([
				" {sub.YouHe} {sub.youAre} about to cum!",
				" {sub.YouHe} {sub.youAre} being edged by {dom.youHim}.",
				" {sub.YourHis} "+RNG.pick(["cock", "dick", "member"])+" is twitching a lot.",
				" {sub.YouHe} {sub.youAre} barely keeping {sub.yourself} from cumming.",
				" {sub.YouHe} reached {sub.yourHis} peak!",
			])
		elif(subInfo.isCloseToCumming()):
			text += RNG.pick([
				" {sub.YouHe} {sub.youAre} leaking "+RNG.pick(["pre", "precum"])+" directly into {dom.yourHis} mouth.",
				" {sub.YouHe} {sub.youAre} gonna cum soon!",
				" {sub.YourHis} "+RNG.pick(["cock", "dick", "member"])+" is twitching slightly.",
			])
		return {text = text}
		
	if(state == "lickingcock"):
		affectSub(subInfo.fetishScore({Fetish.OralSexReceiving: 1.0})+0.3, 0.1, -0.1, -0.01)
		affectDom(domInfo.fetishScore({Fetish.OralSexGiving: 0.5})+0.6, 0.1, 0.0)
		subInfo.addArousalSex(0.04)
		
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
		affectSub(subInfo.fetishScore({Fetish.OralSexReceiving: 1.0})+0.3, 0.1, -0.1, -0.01)
		affectDom(domInfo.fetishScore({Fetish.OralSexGiving: 0.5})+0.6, 0.1, 0.0)
		subInfo.addArousalSex(0.05)
		
		var clothingItem = getSub().getFirstItemThatCoversBodypart(BodypartSlot.Vagina)
		var throughTheClothing = ""
		if(clothingItem != null):
			throughTheClothing = " through the "+clothingItem.getCasualName()
		var text = RNG.pick([
			"{dom.You} {dom.youAre} licking {sub.yourHis} "+RNG.pick(["pussy", "pussy slit", "kitty", "petals", "slit", "folds"])+ throughTheClothing +".",
			"{dom.You} {dom.youAre} dragging {dom.yourHis} tongue over {sub.yourHis} "+RNG.pick(["pussy lips", "kitty", "slit", "petals", "folds", "clit and pussy"])+ throughTheClothing +".",
		])
		
		if(subInfo.isReadyToCum()):
			text += RNG.pick([
				" {sub.YouHe} {sub.youAre} about to cum!",
				" {sub.YouHe} {sub.youAre} being kept on edge by {dom.youHim}.",
				" {sub.YourHis} "+RNG.pick(["pussy", "pussy slit"])+" is twitching a lot.",
				" {sub.YourHis} "+RNG.pick(["pussy", "pussy slit"])+" is leaking arousal a lot.",
				" {sub.YouHe} {sub.youAre} barely keeping {sub.yourself} from cumming.",
				" {sub.YouHe} reached {sub.yourHis} peak!",
			])
		elif(subInfo.isCloseToCumming()):
			text += RNG.pick([
				" {sub.You} "+RNG.pick(["{sub.youVerb('let')} out some moans", "{sub.youVerb('let')} out a moan", "{sub.youVerb('breathe')} deeply"])+" while {sub.yourHis} pussy "+RNG.pick(["gets more wet", "leaks arousal", "becomes more aroused", "drips arousal", "lets out an aroused scent"])+"."
			])
		
		return {text = text}
	
	if(state == "tonguefucking"):
		affectSub(subInfo.fetishScore({Fetish.OralSexReceiving: 1.0})+0.1, 0.1, -0.1, -0.01)
		affectDom(domInfo.fetishScore({Fetish.OralSexGiving: 0.5})+0.6, 0.1, 0.0)
		subInfo.addArousalSex(0.1)
		
		var text = RNG.pick([
			"{dom.You} "+RNG.pick(["{dom.youVerb('push', 'pushes')}", "{dom.youVerb('slide')}"])+" {dom.yourHis} tongue in and out of {sub.your} "+RNG.pick(["pussy", "pussy slit", "flower", "slit", "kitty"])+".",
			"{dom.You} {dom.youVerb('tongue-fuck')} {sub.yourHis} "+RNG.pick(["pussy", "slit", "kitty"])+"!",
			"{dom.You} {dom.youVerb('slide')} {dom.yourHis} tongue inside {sub.yourHis} "+RNG.pick(["pussy", "slit", "kitty"])+", fucking it!",
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
	
	actions.append({
		"id": "stop",
		"score": getStopScore(),
		"name": "Stop oral",
		"desc": "Stop the oral sex activity",
	})

	return actions

func doDomAction(_id, _actionInfo):
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
			"{dom.You} {dom.youVerb('stick')} {dom.yourHis} tongue out and {dom.youVerb('press', 'presses')} it against {sub.your} "+RNG.pick(["pussy", "slit", "petals", "folds"])+" before proceeding to lick them"+throughTheClothing+".",
		])
		
		subInfo.addLust(10.0 + subInfo.fetishScore({Fetish.OralSexReceiving: 5.0}))
		subInfo.addArousalForeplay(0.05)
		affectSub(subInfo.fetishScore({Fetish.OralSexReceiving: 1.0}), 0.0, -0.3, -0.01)
		return {text = text}
	if(_id == "startblowjob"):
		state = "blowjob"

		var text = RNG.pick([
			"{dom.You} {dom.youVerb('open')} {dom.yourHis} mouth and {dom.youVerb('let')} {sub.your} "+RNG.pick(["cock", "dick", "member"])+" in before wrapping {dom.yourHis} lips around it.",
		])
		getDom().gotOrificeStretchedBy(BodypartSlot.Head, subID, 0.1)
		affectSub(subInfo.fetishScore({Fetish.OralSexReceiving: 1.0}), 0.1, -0.3, -0.01)
		return {text = text}
	if(_id == "starttonguefuck"):
		state = "tonguefucking"
		
		var text = RNG.pick([
			"{dom.You} "+RNG.pick(["{dom.youVerb('find')}", "{dom.youVerb('reach')}"])+" for {sub.yourHis} "+RNG.pick(["pussy hole", "pussy entering"])+" and {dom.youVerb('penetrate')} it before proceeding to slide {dom.yourHis} tongue in and out, fucking it that way!",
		])
		affectSub(subInfo.fetishScore({Fetish.OralSexReceiving: 1.0}), 0.1, -0.3, -0.01)
		return {text = text}
	
	if(_id == "bjcuminside"):
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('grunt')} while {dom.yourHis} "+RNG.pick(["cock", "dick", "member"])+" throbs and [b]shoots cum directly into {sub.your} mouth[/b].",
		])
		if(state == "deepthroat"):
			text = RNG.pick([
				"{dom.You} {dom.youVerb('ram')} {dom.yourHis} "+RNG.pick(["cock", "dick"])+" "+RNG.pick(["balls deep", "as deep as {sub.yourHis} throat allows", "deep down {sub.yourHis} throat"])+" before [b]stuffing {sub.yourHis} belly with lots of cum[/b]!",
			])
		
		var condom:ItemBase = getDom().getWornCondom()
		if(condom != null):
			var breakChance = condom.getCondomBreakChance()
			
			if(RNG.chance(breakChance)):
				text = "[b]The condom broke![/b] "+text
				condom.destroyMe()
			else:
				text = RNG.pick([
					"{dom.You} filled the condom inside {sub.your} "+RNG.pick(["mouth"])+"!",
					"{dom.You} stuffed the condom in {sub.your} "+RNG.pick(["mouth"])+" full of {dom.yourHis} "+RNG.pick(["cum", "seed", "jizz", "semen"])+"!",
				])
				getDom().cumOnFloor()
				domInfo.cum()
				satisfyGoals()
				state = ""
				text += RNG.pick([
					" {dom.You} {dom.youVerb('pull')} out and {dom.youVerb('dispose')} of the used condom.",
				])
				
				return {text=text}
		var beingBredScore = subInfo.fetishScore({Fetish.OralSexGiving: 1.0})
		if(beingBredScore < 0.0):
			subInfo.addResistance(1.0)
			subInfo.addFear(0.1)
		getSub().cummedInBodypartBy(BodypartSlot.Head, domID)
		domInfo.cum()
		satisfyGoals()
		state = ""
		
		if(condom != null):
			condom.destroyMe()
			text += RNG.pick([
				" {dom.You} {dom.youVerb('pull')} out and {dom.youVerb('dispose')} of the used condom.",
			])
		
		return {text = text}
	if(_id == "bjpullout"):
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('pull')} {dom.your} cock out and [b]cums all over {sub.your} face[/b]!",
			"{dom.You} {dom.youVerb('pull')} out, [b]cumming all over {sub.your} face[/b]!",
		])
		
		var condom:ItemBase = getDom().getWornCondom()
		if(condom != null):
			var breakChance = condom.getCondomBreakChance()
			
			if(RNG.chance(breakChance)):
				text = "[b]The condom broke![/b] "+text
				condom.destroyMe()
			else:
				text = RNG.pick([
					"{dom.You} {dom.youVerb('pull')} {dom.your} cock out and {dom.youVerb('fill')} {dom.yourHis} condom! {dom.You} {dom.youVerb('dispose')} of it.",
					"{dom.You} {dom.youVerb('pull')} out, stuffing {dom.yourHis} condom! {dom.You} {dom.youVerb('dispose')} of it.",
				])
				condom.destroyMe()
				getDom().cumOnFloor()
				domInfo.cum()
				satisfyGoals()
				state = ""
				
				return {text=text}
		
		getSub().cummedOnBy(domID)
		getDom().cumOnFloor()
		domInfo.cum()
		satisfyGoals()
		state = ""

		return {text=text}
	if(_id == "pussycum"):
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('shake')} and {dom.youVerb('shiver')} while {dom.yourHis} "+RNG.pick(["pulsating", "twitching"])+" "+RNG.pick(["pussy", "pussy", "slit", "kitty"])+" [b]"+RNG.pick(["cums", "squirts", "orgasms", "climaxes"])+" all over {sub.your} face[/b]!",
		])
		if(getDom().getFirstItemThatCoversBodypart(InventorySlot.Vagina) != null):
			text = RNG.pick([
				"{dom.You} {dom.youVerb('shake')} and {dom.youVerb('shiver')} while {dom.yourHis} "+RNG.pick(["pulsating", "twitching"])+" "+RNG.pick(["pussy", "pussy", "slit", "kitty"])+" [b]"+RNG.pick(["makes", "creates"])+" a wet spot on {dom.yourHis} clothing[/b]!",
			])
		else:
			getSub().cummedOnBy(domID)
		
		if(getDom().hasReachablePenis()):
			getDom().cumOnFloor()
			text += RNG.pick([
				" {dom.YourHis} "+RNG.pick(["cock", "dick"])+" throbs while shooting strings of "+RNG.pick(["cum", "seed", "semen"])+"!",
			])
		
		domInfo.cum()
		satisfyGoals()
		state = ""

		return {text=text}
	
	
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
		
		return {text = "{dom.You} {dom.youVerb('pull')} {dom.yourHis} "+genitalsText+" away from {sub.yourHis} lips."}

func getSubActions():
	var actions = []
	if(state in ["askingtosuck"]):
		if(getDom().hasReachablePenis() && domInfo.isReadyToPenetrate() && getDom().getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
			actions.append({
				"id": "openmouth",
				"score": subInfo.getComplyScore() * subInfo.fetishScore({Fetish.OralSexGiving: 1.0}, 0.5),
				"name": "Open mouth",
				"desc": "Let that cock into your mouth",
			})
			actions.append({
				"id": "notopenmouth",
				"score": subInfo.getResistScore(),
				"name": "Shake head",
				"desc": "You're not gonna suck their cock",
			})
	if(state in ["askingtolick"]):
		actions.append({
			"id": "startlicking",
			"score": subInfo.getComplyScore() * subInfo.fetishScore({Fetish.OralSexGiving: 1.0}, 0.5),
			"name": "Lick pussy",
			"desc": "Obey their orders and start licking them out",
		})
		actions.append({
			"id": "refusetolick",
			"score": subInfo.getResistScore(),
			"name": "Refuse to lick",
			"desc": "You're not gonna lick their pussy",
		})

	if(state in ["", "blowjob", "askingtosuck", "licking", "askingtolick"]):
		if(!getSub().isBitingBlocked()):
			actions.append({
				"id": "bite",
				"score": subInfo.getResistScore()/4.0,
				"name": "Bite",
				"desc": "Bite them! Will be very painful",
				"chance": getSubBiteChance(50.0, 30.0),
			})
		actions.append({
			"id": "pullaway",
			"score": subInfo.getResistScore(),
			"name": "Pull away",
			"desc": "Try to pull away",
			"chance": getSubResistChance(30.0, 25.0),
		})
	if(state in ["licking"]):
		actions.append({
			"id": "prodpussy",
			"score": subInfo.getComplyScore()/2.0,
			"name": "Prod with tongue",
			"desc": "Use your tongue more",
		})
	if(state in ["grinding"]):
		actions.append({
			"id": "grindtongue",
			"score": subInfo.getComplyScore()/2.0,
			"name": "Use tongue",
			"desc": "Use your tongue more",
		})
	if(state in [""]):
		if(getDom().hasReachablePenis()):
			actions.append({
				"id": "teasecock",
				"score": subInfo.getComplyScore() * 0.5 + subInfo.fetishScore({Fetish.OralSexGiving: 0.5}),
				"name": "Tease cock",
				"desc": "Show their cock some love",
			})
		if(getDom().hasReachableVagina()):
			actions.append({
				"id": "teasevagina",
				"score": subInfo.getComplyScore() * 0.5 + subInfo.fetishScore({Fetish.OralSexGiving: 0.5}),
				"name": "Tease pussy",
				"desc": "Show their pussy some love",
			})
	if(state in ["blowjob"]):
		actions.append({
			"id": "startdeepthroating",
			"score": subInfo.getComplyScore() * subInfo.fetishScore({Fetish.OralSexGiving: 1.0}, -0.5) * 0.1 ,
			"name": "Deepthroat",
			"desc": "Let that cock stretch your throat",
		})
	if(state in ["deepthroat"]):
		actions.append({
			"id": "stopdeepthroating",
			"score": subInfo.getComplyScore() * subInfo.fetishScore({Fetish.OralSexGiving: 1.0}, -0.5) * 0.1 ,
			"name": "Stop deepthroating",
			"desc": "Enough throat stretching!",
			"chance": getSubStopDeepthroatChance(),
		})
	
	return actions

func getSubStopDeepthroatChance():
	if(!domInfo.isAngry()):
		return 100.0
	var theChance = 40.0 - domInfo.getAngerScore()*20.0
	if(getSub().hasBlockedHands()):
		theChance *= 0.8
	if(getSub().hasBoundArms()):
		theChance *= 0.8
	if(getSub().isBitingBlocked()):
		theChance *= 0.5
	return max(theChance, 5.0)

func getSubResistChance(baseChance, domAngerRemoval):
	var theChance = baseChance - domInfo.getAngerScore()*domAngerRemoval
	if(getSub().hasBlockedHands()):
		theChance *= 0.5
	if(getSub().hasBoundArms()):
		theChance *= 0.5
	if(getSub().isBlindfolded()):
		theChance *= 0.8
	
	return max(theChance, 5.0)

func getSubBiteChance(baseChance, domAngerRemoval):
	if(state in ["blowjob", "licking"]):
		return 100.0
	var theChance = baseChance - domInfo.getAngerScore()*domAngerRemoval
	if(getSub().hasBlockedHands()):
		theChance *= 0.9
	if(getSub().hasBoundArms()):
		theChance *= 0.9
	if(getSub().isBlindfolded()):
		theChance *= 0.5
	
	return max(theChance, 5.0)

func doSubAction(_id, _actionInfo):
	if(_id == "teasecock"):
		var clothingItem = getDom().getFirstItemThatCoversBodypart(BodypartSlot.Penis)
		var throughTheClothing = ""
		if(clothingItem != null):
			throughTheClothing = " through the "+clothingItem.getCasualName()
		
		var text
		if(getSub().isOralBlocked()):
			text = RNG.pick([
				"{sub.You} {sub.youVerb('nuzzle')} {dom.your} "+RNG.pick(["cock", "dick", "member"])+throughTheClothing+".",
			])
		else:
			text = RNG.pick([
				"{sub.You} "+RNG.pick(["{sub.youVerb('nuzzle')}", "{sub.youVerb('lick')}"])+" {dom.your} "+RNG.pick(["cock", "dick", "member"])+throughTheClothing+".",
			])
			
		domInfo.addLust(10.0 + domInfo.fetishScore({Fetish.OralSexReceiving: 5.0}))
		domInfo.addArousalForeplay(0.05)
		
		if(domInfo.isReadyToPenetrate() && clothingItem == null):
			text += RNG.pick([
				" {dom.Your} hard cock is leaking "+RNG.pick(["pre", "precum", "arousal"])+".",
				" {dom.Your} cock is "+RNG.pick(["ready", "hard enough"])+" to be shoved into {sub.yourHis} mouth.",
			])
			
		return {text = text}
	if(_id == "teasevagina"):
		var clothingItem = getDom().getFirstItemThatCoversBodypart(BodypartSlot.Penis)
		var throughTheClothing = ""
		if(clothingItem != null):
			throughTheClothing = " through the "+clothingItem.getCasualName()
		
		var text
		if(getSub().isOralBlocked()):
			text = RNG.pick([
				"{sub.You} {sub.youVerb('nuzzle')} {dom.your} "+RNG.pick(["pussy", "slit", "petals", "pussy folds"])+throughTheClothing+".",
			])
		else:
			text = RNG.pick([
				"{sub.You} "+RNG.pick(["{sub.youVerb('nuzzle')}", "{sub.youVerb('lick')}"])+" {dom.your} "+RNG.pick(["pussy", "slit", "petals", "pussy folds"])+throughTheClothing+".",
			])
			
		domInfo.addLust(10.0 + domInfo.fetishScore({Fetish.OralSexReceiving: 5.0}))
		domInfo.addArousalForeplay(0.05)
		
		if(domInfo.isReadyToPenetrate() && clothingItem == null):
			text += RNG.pick([
				" {dom.Your} pussy is looking "+RNG.pick(["wet", "moist", "needy", "very wet"])+".",
			])
			
		return {text = text}
		
	if(_id == "openmouth"):
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('open')} {sub.yourHis} mouth and {sub.youVerb('let')} {dom.your} "+RNG.pick(["cock", "dick", "member"])+" in before wrapping {sub.yourHis} lips around it.",
		])
		state = "blowjob"
		return {text = text}
	if(_id == "notopenmouth"):
		state = ""
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('refuse')} to open {sub.yourHis} mouth.",
		])
		domInfo.addAnger(0.2)
		return {text = text}
	if(_id == "startlicking"):
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('stick')} {sub.yourHis} tongue out and {sub.youVerb('press', 'presses')} it against {dom.your} "+RNG.pick(["pussy", "slit", "petals", "folds"])+" before proceeding to lick them.",
		])
		state = "licking"
		return {text = text}
	if(_id == "refusetolick"):
		state = ""
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('refuse')} to lick {dom.yourHis} pussy.",
		])
		domInfo.addAnger(0.2)
		return {text = text}
	if(_id == "prodpussy"):
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('use')} {sub.yourHis} tongue to "+RNG.pick(["prod {dom.yourHis} pussy entrance and lap up all the juices", "prod at the wet pussy entrance", "lap at the wet pussy hole"])+".",
		])
		domInfo.addArousalSex(0.05)
		return {text = text}
	if(_id == "grindtongue"):
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('stick')} {sub.yourHis} tongue out and {sub.youVerb('catch', 'catches')} some "+RNG.pick(["arousal", "juices"])+RNG.pick([" from that wet pussy","", " onto it"," while {sub.yourHis} face is being grinded"])+".",
		])
		domInfo.addArousalSex(0.05)
		return {text = text}
	if(_id == "bite"):
		var successChance = getSubBiteChance(50.0, 30.0)
		if(RNG.chance(successChance)):
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('bite')} {dom.your} genitals! {dom.YouHe} {dom.youVerb('cry', 'cries')} from pain and {dom.youVerb('pull')} away.",
			])
			domInfo.addPain(10)
			domInfo.addAnger(1.0 - domInfo.fetishScore({Fetish.Masochism: 0.5}))
			domInfo.addLust(-5 + 10 * domInfo.fetishScore({Fetish.Masochism: 1.0}))
			endActivity()
			return {text = text}
		else:
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('try', 'tries')} to bite {dom.you} but {dom.youHe} {dom.youVerb('avoid')} it!",
			])
			domInfo.addAnger(0.4)
			return {text = text}
	if(_id == "pullaway"):
		var successChance = getSubResistChance(30.0, 25.0)
		if(RNG.chance(successChance)):
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('pull')} away from {dom.you}.",
			])
			domInfo.addAnger(0.3)
			if(state in ["blowjob", "licking", "deepthroat"]):
				state = ""
			else:
				endActivity()
			return {text = text}
		else:
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('try', 'tries')} to pull away from {dom.you} but {sub.youVerb('fail')}.",
			])
			domInfo.addAnger(0.1)
			return {text = text}
	if(_id == "startdeepthroating"):
		if(!RNG.chance(getSub().getPenetrateChanceBy(BodypartSlot.Head, domID))):
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('try', 'tries')} to get {dom.yourHis} "+RNG.pick(["dick", "cock", "member"])+" into {sub.yourHis} throat but "+RNG.pick(["it's too big", "{sub.youHe} {sub.youVerb('struggle')}", "{sub.youVerb('fail')}"])+".",
			])
			getSub().gotOrificeStretchedBy(BodypartSlot.Head, domID, 0.1)
			affectDom(domInfo.fetishScore({Fetish.OralSexReceiving: 1.0}), 0.2, -0.03)
			return {text = text}
		else:
			state = "deepthroat"
			var text = RNG.pick([
				"{sub.You} willingly {sub.youVerb('let')} {dom.yourHis} "+RNG.pick(["dick", "cock", "member"])+" deep down {sub.yourHis} throat and {sub.youVerb('start')} deepthroating it!",
			])
			getSub().gotOrificeStretchedBy(BodypartSlot.Head, domID, 0.2)
			affectDom(domInfo.fetishScore({Fetish.OralSexReceiving: 1.0}), 0.2, -0.03)
			domInfo.addArousalForeplay(0.05)
			return {text=text}
	if(_id == "stopdeepthroating"):
		if(RNG.chance(getSubStopDeepthroatChance())):
			state = "blowjob"
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('stop')} deepthroating that "+RNG.pick(["cock", "dick"])+", instead just sucking it off normally.",
			])
			return {text = text}
		else:
			domInfo.addAnger(0.05)
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('try', 'tries')} to pull away but {sub.youVerb('fail')}. {dom.You} {dom.youVerb('keep')} forcing {sub.youHim} to deepthroat {dom.youHim}!",
			])
			if(domInfo.isAngry() && RNG.chance(50)):
				subInfo.addPain(5)
				text += RNG.pick([
					" {sub.You} {sub.youVerb('receive')} a painful slap on the cheek from {dom.youHim}.",
				])
			return {text = text}
	return

func getAnimation():
	return [StageScene.Duo, "kneel", {pc=subID, npc=domID, npcAction="stand"}]

func getDomOrgasmHandlePriority():
	return 10

func getSubOrgasmHandlePriority():
	return -1
