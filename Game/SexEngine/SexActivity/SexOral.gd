extends SexActivityBase
var waitTimer = 0

func _init():
	id = "SexOral"

func getGoals():
	return {
		SexGoal.FuckOral: 1.0,
	}

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(!_domInfo.getChar().hasReachablePenis() && !_domInfo.getChar().hasReachableVagina()):
		return false
	if(_subInfo.getChar().isOralBlocked()):
		return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getVisibleName():
	return "Oral"

func getCategory():
	return ["Fuck"]

func getDomTags():
	return [SexActivityTag.PenisUsed, SexActivityTag.VaginaUsed]

func getSubTags():
	var thetags = [SexActivityTag.PreventsSubViolence, SexActivityTag.PreventsSubTeasing]
	return thetags

func getDomTagsCheck():
	return [SexActivityTag.OrderedToDoSomething, SexActivityTag.PenisUsed, SexActivityTag.VaginaUsed]

func getSubTagsCheck():
	return [SexActivityTag.OrderedToDoSomething, SexActivityTag.MouthUsed]

func startActivity(_args):
	state = ""
	
	var exposedThings = []
	var genitalsText = "crotch"
	if(getDom().hasPenis() && getDom().getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
		exposedThings.append(RNG.pick(["dick", "cock", "member"]))
		if(RNG.chance(50)):
			exposedThings.append("balls")
	if(getDom().hasVagina() && getDom().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) == null):
		exposedThings.append(RNG.pick(["pussy", "pussy", "slit", "kitty"]))
	if(exposedThings.size()):
		genitalsText = "exposed "+Util.humanReadableList(exposedThings)
	
	var text = RNG.pick([
		"{dom.You} {dom.youVerb('make')} {sub.you} kneel and then "+RNG.pick(["{dom.youVerb('pull')}", "{dom.youVerb('bring')}"])+" {sub.yourHis} mouth to {dom.yourHis} "+genitalsText+".",
	])
	
	return {
		text = text,
	}

func onSwitchFrom(_otherActivity, _args):
	return

func processTurn():
	if(state == "askingtosuck"):
		if(waitTimer > 2):
			domInfo.addAnger(0.3)
			state = ""
			return {text="{dom.You} gave up waiting."}
		elif(waitTimer > 0):
			var text = RNG.pick([
				"{dom.You} {dom.youAre} losing patience.",
			])
			domInfo.addAnger(0.2)
			waitTimer += 1
			return {text = text}
		waitTimer += 1
		return
	if(state == "blowjob"):
		affectSub(subInfo.fetishScore({Fetish.OralSexGiving: 1.0})+0.5, 0.1, -0.1, -0.01)
		affectDom(domInfo.fetishScore({Fetish.OralSexReceiving: 1.0})+0.3, 0.0, 0.0)
		subInfo.addArousalForeplay(0.03)
		domInfo.addArousalSex(0.2)
		
		var text = RNG.pick([
			"{dom.Your} "+RNG.pick(["cock", "dick", "member"])+" is being sucked by {sub.youHim}.",
			"{sub.You} {sub.youAre} "+RNG.pick(["sucking", "blowing"])+" {dom.yourHis} "+RNG.pick(["cock", "dick", "member"])+".",
		])
		
		if(RNG.chance(30)):
			text += RNG.pick([
				" Wet slurping noises can be heard from {sub.you}.",
				" {sub.You} {sub.youAre} making wet noises with {sub.yourHis} mouth.",
				" {sub.You} {sub.youVerb('try', 'tries')} to work that tongue.",
			])
		
		if(domInfo.isReadyToCum()):
			text += RNG.pick([
				" {dom.YouHe} {dom.youAre} about to cum!",
				" {dom.YouHe} {dom.youAre} edging {dom.yourself}.",
				" {dom.YourHis} "+RNG.pick(["cock", "dick", "member"])+" is twitching a lot.",
				" {dom.YouHe} {dom.youAre} barely keeping {dom.yourself} from cumming.",
				" {dom.YouHe} reached {dom.yourHis} peak!",
			])
		elif(domInfo.isCloseToCumming()):
			text += RNG.pick([
				" {dom.YouHe} {dom.youAre} leaking "+RNG.pick(["pre", "precum"])+" directly into that mouth.",
				" {dom.YouHe} {dom.youAre} gonna cum soon!",
				" {dom.YourHis} "+RNG.pick(["cock", "dick", "member"])+" is twitching slightly.",
			])
		return {text = text}
	
func getDomActions():
	var actions = []

	if(state in [""]):
		if(getDom().hasReachablePenis()):
			actions.append({
				"id": "cocktease",
				"score": 1.0,
				"name": "Cock teasing",
				"desc": "Make them tease your cock so you can get hard",
			})
			
			if(domInfo.isReadyToPenetrate() && getDom().getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
				actions.append({
					"id": "asktosuck",
					"score": 1.0 - domInfo.getAngerScore(),
					"name": "Order to open mouth",
					"desc": "Ask the sub to open their mouth so you can shove your cock in",
				})
				actions.append({
					"id": "forcetosuck",
					"score": 0.1 + domInfo.getAngerScore(),
					"name": "Force to suck cock",
					"desc": "Make that bitch suck your cock",
				})
		if(getDom().hasReachableVagina() && getDom().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) == null):
			actions.append({
				"id": "asktolick",
				"score": 0.0,
				"name": "Order to lick",
				"desc": "Ask the sub to lick your pussy",
			})
			actions.append({
				"id": "grindface",
				"score": 0.0,
				"name": "Grind face",
				"desc": "Grind their face with your pussy",
			})
	if(state in ["blowjob"]):
		if(domInfo.isReadyToCum()):
			actions.append({
				"id": "bjcuminside",
				"score": 1.0,
				"name": "Cum inside",
				"desc": "Stuff that mouth",
			})
			actions.append({
				"id": "bjpullout",
				"score": 1.0,
				"name": "Pull out",
				"desc": "Cum all over their face instead",
			})
		
	actions.append({
		"id": "stop",
		"score": getStopScore(),
		"name": "Stop oral",
		"desc": "Stop the oral sex activity",
	})

	return actions

func doDomAction(_id, _actionInfo):
	if(_id == "cocktease"):
		var clothingItem = getDom().getFirstItemThatCoversBodypart(BodypartSlot.Penis)
		var throughTheClothing = ""
		if(clothingItem != null):
			throughTheClothing = " through the "+clothingItem.getCasualName()
		
		var text = RNG.pick([
			"{dom.You} "+RNG.pick(["{dom.youVerb('pull')}", "{dom.youVerb('bring')}", "{dom.youVerb('move')}"])+" {sub.yourHis} head to {dom.yourHis} cock and {dom.youVerb('make')} {sub.youHim} "+RNG.pick(["rub", "grind"])+" {sub.youHis} face against it"+throughTheClothing+"."
		])
		
		domInfo.addLust(10.0 + domInfo.fetishScore({Fetish.OralSexReceiving: 5.0}))
		domInfo.addArousalForeplay(0.05)
		affectSub(subInfo.fetishScore({Fetish.OralSexGiving: 1.0}), 0.1, -0.3, -0.01)
		
		if(domInfo.isReadyToPenetrate() && clothingItem == null):
			text += RNG.pick([
				" {dom.Your} hard cock is leaking "+RNG.pick(["pre", "precum", "arousal"])+".",
				" {dom.Your} cock is "+RNG.pick(["ready", "hard enough"])+" to be shoved into {sub.yourHis} mouth.",
			])
		
		return {text = text}
	if(_id == "asktosuck"):
		state = "askingtosuck"
		waitTimer = 0
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('order')} {sub.youHim} to "+RNG.pick(["open {sub.yourHis} mouth", "part {sub.yourHis} lips"])+".",
		])
		
		affectSub(subInfo.fetishScore({Fetish.OralSexGiving: 1.0}), 0.05, -0.4, 0.0)
		
		return {text=text}
	if(_id == "forcetosuck"):
		var successChance = 30
		if(getSub().isBitingBlocked()):
			successChance = 100
		
		if(RNG.chance(successChance)):
			state = "blowjob"
			var text = RNG.pick([
				"{dom.You} {dom.youVerb('force')} {dom.yourHis} cock "+RNG.pick(["past {sub.yourHis} lips", "inside {sub.yourHis} mouth", "past {sub.yourHis} teeth"])+" and {dom.youVerb('make')} {sub.you} "+RNG.pick(["suck", "blow"])+" {dom.youHim}!",
			])
			affectSub(subInfo.fetishScore({Fetish.OralSexGiving: 1.0}), 0.05, -0.2, -0.05)
			domInfo.addAnger(-0.1)
			return {text = text}
		else:
			var text = RNG.pick([
				"{dom.You} {dom.youVerb('try', 'tries')} to "+RNG.pick(["force", "push", "shove", "forcefully shove"])+" {dom.yourHis} cock "+RNG.pick(["into {sub.yourHis} mouth", "past {sub.yourHis} lips", "past {sub.yourHis} teeth"])+"."
			])
			affectSub(subInfo.fetishScore({Fetish.OralSexGiving: 1.0}), 0.05, -0.2, -0.01)
			domInfo.addAnger(0.05)
			return {text = text}
	
	if(_id == "bjcuminside"):
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('grunt')} while {dom.yourHis} "+RNG.pick(["cock", "dick", "member"])+" throbs and [b]shoots cum directly into {sub.your} mouth[/b].",
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
		domInfo.cum()
		satisfyGoals()
		state = ""

		return {text=text}
	
	
	if(_id == "stop"):
		endActivity()
		return {text = "{dom.You} {dom.youVerb('pull')} {dom.yourHis} cock away from {sub.yourHis} lips."}

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

	if(state in ["", "blowjob", "askingtosuck"]):
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
	if(state in [""]):
		if(getDom().hasReachablePenis()):
			actions.append({
				"id": "teasecock",
				"score": subInfo.getComplyScore() * 0.5 + subInfo.fetishScore({Fetish.OralSexGiving: 0.5}),
				"name": "Tease cock",
				"desc": "Show their cock some love",
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
	
	return max(theChance, 5.0)

func getSubBiteChance(baseChance, domAngerRemoval):
	if(state in ["blowjob"]):
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
			if(state == "blowjob"):
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
	return

func getAnimation():
	return [StageScene.Duo, "kneel", {pc=subID, npc=domID, npcAction="stand"}]

