extends SexActivityBase

var currentPose:String = ""
var isStuffing:bool = false

const POSE_ALLHOLES = "allholes"

const POSES = {
	POSE_ALLHOLES: {
		name = "All holes",
		anim = StageScene.TentaclesSex,
		anims = ["tease", "inside", "sex", "fast"],
	},
}

func getAvaiablePoses() -> Array:
	return [POSE_ALLHOLES]

func _init():
	id = "TentaclesSexAllHoles"
	
	activityName = "All holes"
	activityDesc = "Fuck the sub's pussy, ass and mouth."
	activityCategory = ["Fuck"]


func getGoals():
	return {
		SexGoal.FuckVaginal: 1.0,
		SexGoal.FuckAnal: 1.0,
		SexGoal.FuckOral: 1.0,
	}

func getSupportedSexTypes():
	return {
		SexType.TentaclesSex: true,
	}

func isActivityImpossibleShouldStop() -> bool:
	#if(!getSub().hasReachableVagina() || !getSub().hasReachableAnus() || getSub().isOralBlocked()):
	#	return true
	return false

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var sub:BaseCharacter = _subInfo.getChar()
	#if(!sub.hasReachableVagina()):
	#	return false
	if(!sub.hasReachableAnus()):
		return false
	if(sub.isOralBlocked()):
		return false
	
	#var dom:BaseCharacter = _domInfo.getChar()
	#if(!dom.hasReachablePenis() && !dom.isWearingStrapon()):
	#	return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		if(state != ""):
			return [SexActivityTag.HavingSex, SexActivityTag.PenisUsed, SexActivityTag.PenisInside]
		return [SexActivityTag.HavingSex, SexActivityTag.PenisUsed]
	if(_indx == SUB_0):
		if(state != ""):
			return [SexActivityTag.HavingSex, SexActivityTag.AnusUsed, SexActivityTag.AnusPenetrated, SexActivityTag.VaginaUsed, SexActivityTag.VaginaPenetrated, SexActivityTag.MouthUsed]
		return [SexActivityTag.HavingSex, SexActivityTag.AnusUsed, SexActivityTag.VaginaUsed]
	return []

func startActivity(_args):
	currentPose = RNG.pick(getAvaiablePoses())
	
	addText("{dom.You} {dom.youVerb('grab')} {sub.you} and {dom.youVerb('raise')} {sub.youHim} above the floor, {dom.yourHis} tentacles are pressed against all {sub.yourHis} holes at once!")

func onSwitchFrom(_otherActivity, _args):
	currentPose = RNG.pick(getAvaiablePoses())

func processTurn():
	if(state == ""):
		isStuffing = false
	return

func inside_processTurn():
	addTextPick([
		"{sub.You} {sub.youAre} being a total tentacle-slut, all {sub.yourHis} holes stuffed full of them.",
		"{sub.Your} holes are all stuffed full of tentacles.",
		"{sub.Your} holes are keeping the tentacles warm.",
	])
	if(getSub().hasReachableVagina()):
		stimulateSex(DOM_0, SUB_0, S_VAGINA, I_TEASE, SPEED_VERYSLOW)
		stimulateSex(DOM_0, SUB_0, S_ANUS, I_TEASE, SPEED_VERYSLOW)
	else:
		stimulateSex(DOM_0, SUB_0, S_ANUS, I_TEASE, SPEED_SLOW)

func sex_processTurn():
	if(getSub().hasReachableVagina()):
		stimulateSex(DOM_0, SUB_0, S_VAGINA, I_NORMAL, SPEED_VERYSLOW)
		stimulateSex(DOM_0, SUB_0, S_ANUS, I_NORMAL, SPEED_VERYSLOW)
	else:
		stimulateSex(DOM_0, SUB_0, S_ANUS, I_NORMAL, SPEED_SLOW)
	stimulateSex(DOM_0, SUB_0, S_MOUTH, I_NORMAL, SPEED_VERYSLOW)
	
	var possible:Array = [
		"Slick tentacles hold {sub.you} helpless above the floor and fuck {sub.yourHis} every hole.",
		"Dripping tentacles pump into {sub.your} needy holes without pause.",
		"Held in the air, {sub.you} {sub.youAre} being fucked in every hole by the same relentless, wet tendrils.",
		"Three wet tendrils pump into all {sub.your} holes at once.",
	]
	
	if(getSub().hasReachableVagina()):
		possible.append_array([
			"Three slick tendrils fuck {sub.your} mouth, pussy, and ass in a steady rhythm.",
			"Many tentacles stuff {sub.your} mouth, pussy, and ass at the same time.",
			"Slick tendrils hold {sub.you} high, fucking {sub.yourHis} mouth, pussy, and ass all at once.",
		])
	else:
		possible.append_array([
			"Three slick tendrils fuck {sub.your} mouth and double-stuff {sub.yourHis} ass.",
			"Many tentacles stuff {sub.your} mouth and ass at the same time.",
			"Slick tendrils hold {sub.you} high, fucking {sub.yourHis} mouth and ass at the same time.",
			
		])
	addTextPick(possible)
	
	if(isStuffing):
		stuffTentacleEggRandomHole(SUB_0)
	
	var possibleExtra:Array = []
	if(getSubInfo().isCloseToCumming()):
		possibleExtra.append_array([
			"{sub.YourHis} wet inner walls squeeze hard around the relentless tentacles.",
			"{sub.YourHis} body shudders as a wave of pleasure is building deep inside.",
			"{sub.You} {sub.youVerb('try', 'tries')} to moan, but the tentacle in {sub.yourHis} mouth muffles the sound into a gurgle.",
			"{sub.YourHis} ass spasms, involuntarily gripping the slick tendril pumping into it.",
			"{sub.YourHis} eyes roll back as {sub.youHe} {sub.youVerb('feel')} {sub.yourself} getting dangerously close.",
		])
		if(getSub().hasReachableVagina()):
			possibleExtra.append_array([
				"A gush of {sub.yourHis} own wetness coats the tentacle pistoning in and out of {sub.yourHis} pussy.",
				"Pre-orgasmic clenches squeeze {sub.yourHis} pussy around the invading tendril.",
			])
	else:
		possibleExtra.append_array([
			"{sub.YourHis} inner walls squeeze around the relentless tentacles.",
			"Tears stream down {sub.yourHis} cheeks from the intense, deep pounding of {sub.yourHis} throat.",
			"Helpless whimpers escape around the thick tentacle fucking {sub.yourHis} throat.",
		])
		
	if(RNG.chance(possibleExtra.size()*10)):
		addTextPick(possibleExtra)

func getActions(_indx:int):
	if(_indx == DOM_0):
		addAction("stop", getStopScore(), "Stop sex", "Stop the sex")
		
		if(state == "inside" && !checkActiveDomPC(_indx)):
			var continueScoreFinal:float = 0.0
			if(getSub().hasReachableVagina()):
				continueScoreFinal = min(getContinueSexScore(_indx, SUB_0, S_ANUS), getContinueSexScore(_indx, SUB_0, S_VAGINA))
			else:
				continueScoreFinal = getContinueSexScore(_indx, SUB_0, S_ANUS)
			
			addAction("fuckMore", continueScoreFinal-getStopScore(), "Continue fucking", "Start fucking them again")
			addAction("pullOut", getStopScore(), "Pull out", "Pull your member out")
		
		if(state == ""):
			addAction("rub", 1.0 if !isReadyToPenetrate(_indx) else 0.4, "Rub", "Rub your cock against them", {A_PRIORITY: 4})
			if(hasBodypartUncovered(SUB_0, S_VAGINA) && hasBodypartUncovered(SUB_0, S_ANUS) && !getSub().isOralBlocked() && !checkActiveDomPC(_indx)):
				addAction("penetrate", 1.0, "Penetrate", "Try to start fucking them!", {A_PRIORITY: 5})
		if(state == "sex" && !checkActiveDomPC(_indx)):
			var pauseScoreFinal:float = 0.0
			if(getSub().hasReachableVagina()):
				pauseScoreFinal = max(getPauseSexScore(_indx, SUB_0, S_ANUS), getPauseSexScore(_indx, SUB_0, S_VAGINA))
			else:
				pauseScoreFinal = getPauseSexScore(_indx, SUB_0, S_ANUS)
			addAction("pause", pauseScoreFinal, "Slow down", "Pause the fucking", {A_PRIORITY: 1})
			
			if(isStuffing):
				addAction("stopStuff", 0.0, "Stop egg-stuffing", "Enough stuffing eggs into the sub")
			else:
				var theStartScore:float = getDomInfo().getArousal()*fetish(DOM_0, Fetish.Breeding)
				if(theStartScore < 0.4):
					theStartScore = 0.0
				addAction("startStuff", theStartScore, "Start egg-stuffing", "Start stuffing eggs into the sub's holes!")
			
		if(state == "sex" && isReadyToCumHandled(DOM_0)):
			addAction("cum", 1.0, "Cum inside", "Cum inside them!", {A_PRIORITY: 1001})
			if(isStuffing):
				addAction("donothing", 1.0, "Keep stuffing", "Keep stuffing the sub with eggs!", {A_PRIORITY: 1001})
		elif(state == "sex" && isReadyToCumHandled(SUB_0) && !canDoActions(SUB_0) && !checkActiveDomPC(_indx)):
			addAction("subcum", 1.0, "Sub orgasm!", "They are about to cum!", {A_PRIORITY: 1001})
		
		for pose in getAvaiablePoses():
			if(pose == currentPose):
				continue
			if(!POSES.has(pose)):
				continue
			var poseName:String = POSES[pose]["name"]
			addAction("switchpose", 0.0, poseName, "Change pose", {A_CATEGORY: ["Switch pose"], A_ARGS: [pose]})
		
		
	if(_indx == SUB_0):
		addAction("pullaway", getSubInfo().getResistScore(), "Pull away", "Try to pull away", {A_CHANCE: getSubResistChance(30.0, 25.0), A_PRIORITY: 2})
		if(state == "sex"):
			if(isReadyToCumHandled(SUB_0)):
				addAction("subcum", 1.0, "Cum!", "You're about to cum!", {A_PRIORITY: 1001})

func doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "startStuff"):
		isStuffing = true
		addText("The tentacles have began stuffing eggs into {sub.your} holes!")
	if(_id == "stopStuff"):
		isStuffing = false
		addText("The tentacles have stopped stuffing eggs into {sub.your} holes.")
	
	
	if(_id == "cum"):
		isStuffing = false
		if(getSub().hasReachableVagina()):
			stimulate(DOM_0, S_PENIS, SUB_0, S_VAGINA, I_NORMAL, Fetish.VaginalSexGiving)
		stimulate(DOM_0, S_PENIS, SUB_0, S_ANUS, I_NORMAL, Fetish.AnalSexGiving)
		var orgAmount:int = 0
		if(isReadyToCumHandled(DOM_0)):
			orgAmount += 1
		if(isReadyToCumHandled(SUB_0)):
			orgAmount += 1
			
		if(orgAmount == 2):
			addText("[b]Double orgasm![/b]")
		elif(orgAmount == 3):
			addText("[b]Triple orgasm![/b]")
		elif(orgAmount == 4):
			addText("[b]Quadruple orgasm![/b]")
		if(isReadyToCumHandled(SUB_0)):
			cumGeneric(SUB_0, DOM_0)
		if(isReadyToCumHandled(DOM_0)):
			addText("[b]The tentacles cum![/b]")
			var possible:Array = [
			]
			var theSub:BaseCharacter = getSub()
			var hasEggs:bool = theSub.hasEggsIn(BodypartSlot.Vagina, true) || theSub.hasEggsIn(BodypartSlot.Anus, true) || theSub.hasEggsIn(BodypartSlot.Head, true)
			if(getSub().hasReachableVagina()):
				getDom().fillBalls(RNG.randf_range(0.9, 1.0))
				cumInsideNoText(DOM_0, SUB_0, S_VAGINA)
				possible.append_array([
					"Slick tips swell inside {sub.your} mouth, pussy, and ass, then begin to pulse, pumping thick {dom.cum} deep into {sub.yourHis} holes all at once"+(", [b]fertilizing the eggs[/b]" if hasEggs else "")+".",
					"The tendrils twitch and pulse, then unload. A gush of sticky {dom.cum} hits the back of {sub.your} throat. Another floods {sub.yourHis} pussy, warm and thick. A third stuffs {sub.yourHis} ass, filling it up."+(" [b]The nectar helps to fertilize the eggs[/b]." if hasEggs else "")+"",
					"All at once, the tentacles erupt. Hot {dom.cum} pours down {sub.your} throat, pumps into {sub.yourHis} womb, and floods {sub.yourHis} {sub.analStretch} ass."+(" [b]The nectar helps to fertilize the eggs[/b]." if hasEggs else "")+"",
				])
			else:
				possible.append_array([
					"Slick tips swell inside {sub.your} mouth and ass, then begin to pulse, pumping thick {dom.cum} deep into {sub.yourHis} holes all at once"+(", [b]fertilizing the eggs[/b]" if hasEggs else "")+".",
					"The tendrils twitch and pulse, then unload. A gush of sticky {dom.cum} hits the back of {sub.your} throat while anothre floods {sub.yourHis} ass, filling it up."+(" [b]The nectar helps to fertilize the eggs[/b]." if hasEggs else "")+"",
					"All at once, the tentacles erupt. Hot {dom.cum} pours down {sub.your} throat and gets pumped into {sub.yourHis} {sub.analStretch} ass, stuffing it full."+(" [b]The nectar helps to fertilize the eggs[/b]." if hasEggs else "")+"",
				])
			getDom().fillBalls(RNG.randf_range(0.9, 1.0))
			cumInsideNoText(DOM_0, SUB_0, S_ANUS)
			getDom().fillBalls(RNG.randf_range(0.9, 1.0))
			cumInsideNoText(DOM_0, SUB_0, S_MOUTH)
			getDom().fillBalls(RNG.randf_range(0.9, 1.0))
			getSub().cummedOnBy(getDomID(), FluidSource.Penis)
			
			addTextPick(possible)
		satisfyGoals()
		state = "inside"
		return
	if(_id == "fuckMore"):
		addText("The tentacles start fucking {sub.you} again!")
		state = "sex"
		return
	if(_id == "pause"):
		addTextTopBottom("{<TOP>.You} {<TOP>.youVerb('pause')} the action.", _indx, SUB_0)
		state = "inside"
		return
	if(_id == "pullOut"):
		addText("{dom.You} {dom.youVerb('pull')} {dom.yourHis} tentacles out.")
		state = ""
		return
	if(_id == "rub"):
		addText("{dom.You} {dom.youVerb('rub')} {dom.yourHis} tentacles against {sub.your} holes.")
		if(getSub().hasReachableVagina()):
			stimulateSex(DOM_0, SUB_0, S_VAGINA, I_TEASE, SPEED_VERYSLOW)
		stimulateSex(DOM_0, SUB_0, S_ANUS, I_TEASE, SPEED_VERYSLOW)
		stimulateSex(DOM_0, SUB_0, S_MOUTH, I_TEASE, SPEED_VERYSLOW)
		return
	if(_id == "penetrate"):
		var didPenetrate:bool = RNG.chance(40)
		
		if(getSub().hasReachableVagina()):
			penetration(didPenetrate, DOM_0, SUB_0, S_VAGINA)
		penetration(didPenetrate, DOM_0, SUB_0, S_ANUS)
		
		if(didPenetrate):
			var possible:Array = [
			]
			if(getSub().hasReachableVagina()):
				possible.append_array([
					"A thick tentacle rams deep into {sub.your} mouth. Another fills {sub.yourHis} pussy. Another spears {sub.yourHis} ass. They all begin moving.",
					"Three slick tips press at {sub.your} holes. They push in together, stuffing {sub.youHim} full.",
				])
			else:
				possible.append_array([
					"A thick tentacle rams deep into {sub.your} mouth. Another two fill {sub.yourHis} ass. They all begin moving.",
					"Three slick tips press at {sub.your} holes. They push in together, stuffing {sub.youHim} full.",
				])
			addTextPick(possible)
			state = "sex"
		else:
			var possible:Array = [
				"The tentacles try to stretch {sub.yourHis} holes wider.",
				"Slick tentacle tips prod {sub.yourHis} tight holes, trying to slip inside slowly.",
				"Tentacle tips circle {sub.your} holes before prodding them, trying to fit in.",
			]
			addTextPick(possible)
		return
	if(_id == "stop"):
		endActivity()
		addText("{dom.You} {dom.youVerb('pull')} away from {sub.you}.")
		return 
	if(_id == "switchpose"):
		#switchedPoseOnce = true
		var newPose:String = _action["args"][0]
		#var isInside:bool = true
		#if(state in [""]):
		#	isInside = false
		
		#if(isInside):
		#	addText(getSwitchPoseTextForPose(newPose))
		#else:
		#	addText(getStartTextForPose(newPose))
		addText("{dom.You} {dom.youVerb('switch', 'switches')} pose!")
		currentPose = newPose
		return

	if(_id == "pullaway"):
		var successChance:float = getSubResistChance(30.0, 25.0)
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
			return
	if(_id == "subcum"):
		cumGeneric(SUB_0, DOM_0)
		return
			
func getSubResistChance(baseChance:float, domAngerRemoval:float) -> float:
	var theChance = baseChance - getDomInfo().getAngerScore()*domAngerRemoval
	if(getSub().hasBlockedHands()):
		theChance *= 0.5
	if(getSub().hasBoundArms()):
		theChance *= 0.5
	if(getSub().isBlindfolded()):
		theChance *= 0.8
	
	return max(theChance, 5.0)

func getAnimation():
	var theSexAnim:String = StageScene.TentaclesSex
	var theSexAnims:Array = ["tease", "inside", "sex", "fast"]
	if(POSES.has(currentPose)):
		var thePose:Dictionary = POSES[currentPose]
		theSexAnim = thePose.get("anim", theSexAnim)
		theSexAnims = thePose.get("anims", theSexAnims)
	
	if(state == "inside"):
		return [theSexAnim, theSexAnims[1], {pc=SUB_0}]
	if(state == "sex"):
		if(isCloseToCumming(DOM_0)):
			return [theSexAnim, theSexAnims[3], {pc=SUB_0}]
		return [theSexAnim, theSexAnims[2], {pc=SUB_0}]
	return [theSexAnim, theSexAnims[0], {pc=SUB_0}]
	#return [StageScene.Duo, "stand", {pc=SUB_0, npc=DOM_0, npcAction="stand"}]

func getAnimationPriority():
	return 10

func getOrgasmHandlePriority(_indx:int) -> int:
	return 10

func saveData():
	var data = .saveData()
	
	data["currentPose"] = currentPose
	data["isStuffing"] = isStuffing

	return data
	
func loadData(data):
	.loadData(data)
	
	currentPose = SAVE.loadVar(data, "currentPose", "")
	if(currentPose == ""):
		currentPose = RNG.pick(getAvaiablePoses())
	isStuffing = SAVE.loadVar(data, "isStuffing", false)
