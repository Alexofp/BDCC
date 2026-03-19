extends SexActivityBase

var currentPose:String = ""
var isStuffing:bool = false

const POSE_CUDDLEFUCK = "cuddlefuck"
const POSE_BONDAGEFUCK = "bondagefuck"
const POSE_CHOKEFUCK = "chokefuck"

var fuckHole:String = S_VAGINA
var fuckFetish:String = Fetish.VaginalSexGiving
var fuckHoleNames:Array = [
	"pussy",
	"pussy",
	"slit",
]

const POSES = {
	POSE_CUDDLEFUCK: {
		name = "Cuddle-fuck",
		anim = StageScene.TentaclesCuddle,
		anims = ["tease", "inside", "sex", "fast"],
		startText = "{dom.You} {dom.youVerb('grab')} {sub.you} and {dom.youVerb('lift')} {sub.youHim} above the floor slightly. Most tentacles are forming a seat under {sub.youHim} while one of them slides towards {sub.yourHis} <HOLE>.",
	},
	POSE_BONDAGEFUCK: {
		name = "Bound-fuck",
		anim = StageScene.TentaclesBondage,
		anims = ["tease", "inside", "sex", "fast"],
		startText = "{dom.You} {dom.youVerb('grab')} {sub.you} and {dom.youVerb('bind')} {sub.yourHis} arms and legs, two tentacles are covering up {sub.yourHis} mouth and eyes while another one slides down to {sub.yourHis} <HOLE>.",
	},
	POSE_CHOKEFUCK: {
		name = "Choke-fuck",
		anim = StageScene.TentaclesChoke,
		anims = ["sextease", "sexinside", "sex", "sexfast"],
		startText = "",
	},
}

func getAvaiablePoses() -> Array:
	if(currentPose == POSE_CHOKEFUCK):
		return [POSE_CHOKEFUCK]
	
	return [POSE_CUDDLEFUCK, POSE_BONDAGEFUCK]

func _init():
	id = "TentaclesSexVag"
	
	activityName = "Vaginal"
	activityDesc = "Fuck the sub's pussy."
	activityCategory = ["Fuck"]


func getGoals():
	if(currentPose == POSE_CHOKEFUCK):
		return {
			SexGoal.ChokeSexVaginal: 1.0,
			SexGoal.FuckVaginal: 1.0,
		}
	return {
		SexGoal.FuckVaginal: 1.0,
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
	if(fuckHole == S_ANUS && !sub.hasReachableAnus()):
		return false
	if(fuckHole == S_VAGINA && !sub.hasReachableVagina()):
		return false
	
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
	
	var theEntry:Dictionary = POSES[currentPose]
	addText(theEntry["startText"].replace("<HOLE>", RNG.pick(fuckHoleNames)))

func onSwitchFrom(_otherActivity, _args):
	if(_args != null && _args == ["choke"]):
		currentPose = POSE_CHOKEFUCK
		return
	currentPose = RNG.pick(getAvaiablePoses())

func processTurn():
	if(state == ""):
		isStuffing = false
	if(currentPose == POSE_CHOKEFUCK):
		choke(DOM_0, SUB_0, CHOKE_GENTLE)
	return

func inside_processTurn():
	addTextPick([
		"{sub.You} {sub.youAre} being a total tentacle-slut, {sub.yourHis} "+RNG.pick(fuckHoleNames)+" is serving as a tentacle-warmer.",
		"{sub.Your} "+RNG.pick(fuckHoleNames)+" is warming up one of the tentacles.",
		"{sub.Your} "+RNG.pick(fuckHoleNames)+" is keeping one of the tentacles warm.",
	])
	stimulateSex(DOM_0, SUB_0, fuckHole, I_TEASE, SPEED_VERYSLOW)

func sex_processTurn():
	stimulateSex(DOM_0, SUB_0, fuckHole, I_NORMAL, SPEED_SLOW)
	
	var possible:Array = [
		"Slick tentacles hold {sub.you} helpless and fuck {sub.yourHis} "+RNG.pick(fuckHoleNames)+".",
		"Dripping tentacles pump into {sub.your} "+RNG.pick(fuckHoleNames)+" without pause.",
		"While bound, {sub.you} {sub.youAre} being fucked by the same relentless, wet tendril.",
		"A slick, wet tendril pumps into {sub.your} "+RNG.pick(fuckHoleNames)+", again and again.",
		"A slick tendril fucks {sub.your} "+RNG.pick(fuckHoleNames)+", deep and steady.",
		"A slick tendril slides in and out of {sub.your} "+RNG.pick(fuckHoleNames)+", fucking {sub.youHim}.",
		"Bound tight, {sub.you} {sub.youAre} fucked deep by a wet, pulsing tentacle.",
	]
	
	addTextPick(possible)
	
	if(isStuffing):
		stuffTentacleEgg(SUB_0, fuckHole)
	
	var possibleExtra:Array = []
	if(getSubInfo().isCloseToCumming()):
		possibleExtra.append_array([
			"{sub.YourHis} wet inner walls squeeze hard around the relentless tentacles.",
			"{sub.YourHis} body shudders as a wave of pleasure is building deep inside.",
			"{sub.YourHis} "+RNG.pick(fuckHoleNames)+" clenches, involuntarily gripping the slick tendril pumping into it.",
			"{sub.YourHis} eyes roll back as {sub.youHe} {sub.youVerb('feel')} {sub.yourself} getting dangerously close.",
		])
		if(fuckHole == S_VAGINA):
			possibleExtra.append_array([
				"A gush of {sub.yourHis} own wetness coats the tentacle pistoning in and out of {sub.yourHis} "+RNG.pick(fuckHoleNames)+".",
				"Pre-orgasmic clenches squeeze {sub.yourHis} "+RNG.pick(fuckHoleNames)+" around the invading tendril.",
			])
	else:
		possibleExtra.append_array([
			"{sub.YourHis} inner walls squeeze around the relentless tentacles.",
			"A slimy tip prods the same entrance, teasing and wet.",
			"More tendrils wrap tight around {sub.yourHis} thighs, spreading them wider.",
			"Every deep penetration makes {sub.yourHis} body squirm and tremble.",
			"Wet sounds fill the air with each swift withdrawal.",
			"Gooey ropes of precum-like secret ooze from the tendril fucking {sub.your} "+RNG.pick(fuckHoleNames)+".",
		])
		
	if(RNG.chance(possibleExtra.size()*10)):
		addTextPick(possibleExtra)

func getActions(_indx:int):
	if(_indx == DOM_0):
		addAction("stop", getStopScore(), "Stop sex", "Stop the sex")
		
		if(state == "inside" && !checkActiveDomPC(_indx)):
			addAction("fuckMore", getContinueSexScore(_indx, SUB_0, fuckHole)-getStopScore(), "Continue fucking", "Start fucking them again")
			addAction("pullOut", getStopScore(), "Pull out", "Pull your member out")
		
		if(state == ""):
			addAction("rub", 1.0 if !isReadyToPenetrate(_indx) else 0.4, "Rub", "Rub your cock against them", {A_PRIORITY: 4})
			if(hasBodypartUncovered(SUB_0, fuckHole) && !checkActiveDomPC(_indx)):
				addAction("penetrate", 1.0, "Penetrate", "Try to start fucking them!", {A_PRIORITY: 5})
		if(state == "sex" && !checkActiveDomPC(_indx)):
			addAction("pause", getPauseSexScore(_indx, SUB_0, fuckHole), "Slow down", "Pause the fucking", {A_PRIORITY: 1})
			
			if(isStuffing):
				addAction("stopStuff", 0.0, "Stop egg-stuffing", "Enough stuffing eggs into the sub")
			else:
				var theStartScore:float = getDomInfo().getArousal()*fetish(DOM_0, Fetish.Breeding)
				if(theStartScore < 0.4):
					theStartScore = 0.0
				addAction("startStuff", theStartScore, "Start egg-stuffing", "Start stuffing eggs into the sub's fuckhole!")
			
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
		addText("The tentacles have began stuffing eggs into {sub.your} "+RNG.pick(fuckHoleNames)+"!")
	if(_id == "stopStuff"):
		isStuffing = false
		addText("The tentacles have stopped stuffing eggs into {sub.your} "+RNG.pick(fuckHoleNames)+".")
	
	
	if(_id == "cum"):
		isStuffing = false
		stimulate(DOM_0, S_PENIS, SUB_0, fuckHole, I_NORMAL, fuckFetish)
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
			var hasEggs:bool = theSub.hasEggsIn(fuckHole, true)
			getDom().fillBalls(RNG.randf_range(0.9, 1.0))
			cumInsideNoText(DOM_0, SUB_0, fuckHole)
			getDom().fillBalls(RNG.randf_range(0.9, 1.0))
			getSub().cummedOnBy(getDomID(), FluidSource.Penis)
			possible.append_array([
				"Slick tip of a tentacle swell inside {sub.your} "+RNG.pick(fuckHoleNames)+", then begin to pulse, pumping thick {dom.cum} deep into {sub.yourHis} fuckhole"+(", [b]fertilizing the eggs[/b]" if hasEggs else "")+"!",
				"The slick tip lodged inside {sub.your} "+RNG.pick(fuckHoleNames)+" swells to a fat knot, then pulses hard. A thick, hot load of {dom.cum} begins to get pumped deep into {sub.youHim}"+(", [b]fertilizing the eggs inside[/b]" if hasEggs else "")+".",
				"The tentacle rams in deep and swells. Thick, gooey {dom.cum} erupts from the tip in a hot wave. Another thick load follows fast, pumping deep into {sub.your} "+RNG.pick(fuckHoleNames)+". The tentacles keep stuffing {sub.youHim} until {sub.youHe} {sub.youAre} full"+(", [b]fertilizing the eggs inside[/b]" if hasEggs else "")+".",
			])
			
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
		addText("{dom.You} {dom.youVerb('pull')} {dom.yourHis} tentacle out.")
		state = ""
		return
	if(_id == "rub"):
		addText("{dom.You} {dom.youVerb('rub')} {dom.yourHis} tentacles against {sub.your} "+RNG.pick(fuckHoleNames)+".")
		stimulateSex(DOM_0, SUB_0, fuckHole, I_TEASE, SPEED_SLOW)
		return
	if(_id == "penetrate"):
		var didPenetrate:bool = RNG.chance(50)
		
		penetration(didPenetrate, DOM_0, SUB_0, fuckHole)
		
		if(didPenetrate):
			var possible:Array = [
			]
			possible.append_array([
				"A thick tentacle rams deep into {sub.your} "+RNG.pick(fuckHoleNames)+" and then begins to move!",
				"A slick tip presses at {sub.your} "+RNG.pick(fuckHoleNames)+". It slides in, stuffing {sub.youHim} full.",
			])
			addTextPick(possible)
			state = "sex"
		else:
			var possible:Array = [
				"The tentacles try to stretch {sub.yourHis} "+RNG.pick(fuckHoleNames)+" wider.",
				"Slick tentacle tips prod {sub.yourHis} "+RNG.pick(fuckHoleNames)+", trying to slip inside slowly.",
				"Tentacle tips circle {sub.your} "+RNG.pick(fuckHoleNames)+" before prodding it, trying to fit in.",
			]
			addTextPick(possible)
		return
	if(_id == "stop"):
		endActivity()
		addText("{dom.You} {dom.youVerb('pull')} away from {sub.you}.")
		return 
	if(_id == "switchpose"):
		var newPose:String = _action["args"][0]
		addText("{dom.You} {dom.youVerb('switch', 'switches')} pose!")
		currentPose = newPose
		var theEntry:Dictionary = POSES[currentPose]
		addText(theEntry["startText"].replace("<HOLE>", RNG.pick(fuckHoleNames)))
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
