extends SexActivityBase
var waitTimer:int = 0

var usedBodypart:String = BodypartSlot.Vagina
var usedTag:int = SexActivityTag.VaginaUsed
var usedTagInside:int = SexActivityTag.VaginaPenetrated
var fetishGiving:String = Fetish.VaginalSexGiving
var fetishReceiving:String = Fetish.VaginalSexReceiving
var aboutToRideReaction:int = SexReaction.AboutToRidePussy
var usedBodypartNames:Array = ["pussy", "pussy", "slit", "cunt", "kitty"]
var switchHoleActivity:String = "DomRidingSubAnal"
var otherHoleNames:Array = ["anus"]
var otherHoleBodypart:String = BodypartSlot.Anus
var otherHoleTag:int = SexActivityTag.AnusUsed
var otherHoleFetishGiving:String = Fetish.AnalSexGiving
var otherHoleFetishReceiving:String = Fetish.AnalSexReceiving
var otherGoal:String = SexGoal.ReceiveAnal
var currentPose:String = ""
var isVag:bool = true
var isMakingOut:bool = false

func _init():
	id = "DomRidingSubVaginal"
	
	activityName = "Cowgirl Vaginal"
	activityDesc = "Begin to ride them with your pussy!"
	activityCategory = ["Fuck"]

func getGoals():
	if(currentPose == POSE_COWGIRLCHOKE):
		return {
			SexGoal.ChokeReceiveVaginal: 1.0,
			SexGoal.ReceiveVaginal: 1.0,
			SexGoal.ReceiveStraponVaginal: 1.0,
		}
	
	return {
		SexGoal.ReceiveVaginal: 1.0,
		SexGoal.ReceiveStraponVaginal: 1.0,
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		SexType.SlutwallSex: true,
	}

const POSE_DEFAULT = "POSE_DEFAULT"
const POSE_COWGIRL = "POSE_COWGIRL"
const POSE_REVERSECOWGIRL = "POSE_REVERSECOWGIRL"
const POSE_COWGIRLALT = "POSE_COWGIRLALT"
const POSE_LOTUS = "POSE_LOTUS"
const POSE_COWGIRLAMAZON = "POSE_COWGIRLAMAZON"
const POSE_STANDRIDE = "POSE_STANDRIDE"
const POSE_COWGIRLCHOKE = "POSE_COWGIRLCHOKE"

const PoseToName = {
	POSE_DEFAULT: "Default",
	POSE_COWGIRL: "Cowgirl",
	POSE_REVERSECOWGIRL: "Reverse Cowgirl",
	POSE_COWGIRLALT: "Cowgirl Alternative",
	POSE_COWGIRLCHOKE: "Cowgirl Choking",
	POSE_LOTUS: "Lotus",
	POSE_STANDRIDE: "Standing",
	POSE_COWGIRLAMAZON: "Cowgirl amazon",
}
const PoseToAnimName = {
	POSE_DEFAULT: StageScene.SexCowgirl,
	POSE_COWGIRL: StageScene.SexCowgirl,
	POSE_REVERSECOWGIRL: StageScene.SexReverseCowgirl,
	POSE_COWGIRLALT: StageScene.SexCowgirlAlt,
	POSE_COWGIRLCHOKE: StageScene.SexCowgirlChoke,
	POSE_LOTUS: StageScene.SexLotus,
	POSE_STANDRIDE: StageScene.SexStandRide,
	POSE_COWGIRLAMAZON: StageScene.SexCowgirlAmazon,
}
func getAvaiablePoses() -> Array:
	if(currentPose == POSE_COWGIRLCHOKE):
		return [POSE_COWGIRLCHOKE]
	
	if(getSexType() == SexType.DefaultSex):
		var possible:= [POSE_COWGIRL, POSE_REVERSECOWGIRL, POSE_COWGIRLALT, POSE_LOTUS, POSE_COWGIRLAMAZON]
		if(getSexEngine() != null && getSexEngine().hasWallsNearby()):
			possible.append(POSE_STANDRIDE)
		
		return possible
	
	return [POSE_DEFAULT]

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(!_subInfo.getChar().hasReachablePenis() && !_subInfo.getChar().isWearingStrapon()):
		return false
	if(usedBodypart == BodypartSlot.Vagina && !_domInfo.getChar().hasReachableVagina()):
		return false
	if(usedBodypart == BodypartSlot.Anus && !_domInfo.getChar().hasReachableAnus()):
		return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func isActivityImpossibleShouldStop() -> bool:
	if(!getSub().hasReachablePenis() && !getSub().isWearingStrapon()):
		return true
	if(usedBodypart == BodypartSlot.Vagina && !getDom().hasReachableVagina()):
		return true
	if(usedBodypart == BodypartSlot.Anus && !getDom().hasReachableAnus()):
		return true
		
	return false

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		var thetags:Array = [usedTag, SexActivityTag.HavingSex]
		if(getState() in ["fucking", "aftercumminginside", "knotting", "inside"]):
			thetags.append(usedTagInside)
		return thetags
	if(_indx == SUB_0):
		if(getState() in ["fucking", "aftercumminginside", "knotting", "inside"]):
			return [SexActivityTag.PenisUsed, SexActivityTag.PenisInside, SexActivityTag.HavingSex, SexActivityTag.PreventsSubViolence, SexActivityTag.PreventsSubTeasing]
		return [SexActivityTag.PenisUsed, SexActivityTag.HavingSex, SexActivityTag.PreventsSubViolence, SexActivityTag.PreventsSubTeasing]
	return []

func getCheckTagsDom() -> Array:
	return [SexActivityTag.OrderedToDoSomething, usedTag, SexActivityTag.HavingSex]

func getCheckTagsSub() -> Array:
	return [SexActivityTag.OrderedToDoSomething, SexActivityTag.PenisUsed, SexActivityTag.HavingSex]

func isStraponSex() -> bool:
	return getSub().isWearingStrapon()

#func subSensetivity() -> float:
#	var strapon = getSub().getWornStrapon()
#	if(strapon == null):
#		return 1.0
#
#	return strapon.getStraponPleasureForDom()

func getDickName(dickName = null) -> String:
	if(isStraponSex()):
		return "strapon"
	if(dickName == null):
		return RNG.pick(["cock", "dick", "member"])
	return dickName

func getUsedBodypartName() -> String:
	var theName = RNG.pick(usedBodypartNames)
	if(usedBodypart == BodypartSlot.Vagina):
		theName = "{dom.pussyStretch} "+theName
	if(usedBodypart == BodypartSlot.Anus):
		theName = "{dom.anusStretch} "+theName
	
	if(getDom().getLustLevel() > 0.6):
		if(usedBodypart == BodypartSlot.Vagina):
			theName = RNG.pick(["needy", "awaiting", "inviting"])+" "+theName
		if(usedBodypart == BodypartSlot.Anus):
			theName = RNG.pick(["needy", "awaiting", "drippy", "inviting", "wet", "slick", "aroused"])+" "+theName
	elif(getDom().getLustLevel() < 0.1 && RNG.chance(50)):
		if(usedBodypart == BodypartSlot.Vagina):
			theName = RNG.pick(["dry"])+" "+theName
		if(usedBodypart == BodypartSlot.Anus):
			theName = RNG.pick(["dry"])+" "+theName
	return theName

func getStartTextForPose(thePose:String) -> String:
	var throughClothing = "."
	if(!hasBodypartUncovered(DOM_0, usedBodypart)):
		throughClothing = " through {dom.yourHis} clothing"
	
	var text:String = ""
	if(thePose == POSE_COWGIRL):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('stradle')} {sub.you} and {dom.youVerb('rub')} {dom.yourHis} "+getUsedBodypartName()+" against {sub.yourHis} "+getDickName(RNG.pick(["dick", "penis", "cock", "member"]))+throughClothing+".",
		])
	elif(thePose == POSE_REVERSECOWGIRL):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('stradle')} {sub.you} in a reverse cowgirl position and {dom.youVerb('rub')} {dom.yourHis} "+getUsedBodypartName()+" against {sub.yourHis} "+getDickName(RNG.pick(["dick", "penis", "cock", "member"]))+throughClothing+".",
		])
	elif(thePose == POSE_COWGIRLAMAZON):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('stradle')} {sub.you} in a half-amazon cowgirl position and {dom.youVerb('rub')} {dom.yourHis} "+getUsedBodypartName()+" against {sub.yourHis} "+getDickName(RNG.pick(["dick", "penis", "cock", "member"]))+throughClothing+".",
		])
	elif(thePose == POSE_COWGIRLALT):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('stradle')} {sub.you} and {dom.youVerb('tilt')} {dom.yourHis} body back while rubbing {dom.yourHis} "+getUsedBodypartName()+" against {sub.yourHis} "+getDickName(RNG.pick(["dick", "penis", "cock", "member"]))+throughClothing+".",
		])
	elif(thePose == POSE_LOTUS):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('sink')} into {sub.your} lap, wrapping {dom.yourHis} legs around {sub.yourHis} waist, holding {sub.yourHis} shoulders for support. {dom.YourHis} "+getUsedBodypartName()+" {dom.youVerb('press', 'presses')} tightly against {sub.yourHis} "+getDickName(RNG.pick(["dick", "penis", "cock", "member"]))+throughClothing+" in the close, intimate embrace.",
		])
	elif(thePose == POSE_STANDRIDE):
		text = RNG.pick([
				"{dom.You} {dom.youVerb('raise')} one leg high and {dom.youVerb('pin')} {sub.you} against the nearby wall, {dom.yourHis} {dom.foot} brushing {sub.yourHis} shoulder. {dom.YourHis} "+getUsedBodypartName()+" {dom.youVerb('press', 'presses')} against {sub.yourHis} "+getDickName(RNG.pick(["dick", "penis", "cock"]))+throughClothing+".",
			])
	else:
		text = RNG.pick([
			"{dom.You} {dom.youVerb('stradle')} {sub.you} and {dom.youVerb('rub')} {dom.yourHis} "+getUsedBodypartName()+" against {sub.yourHis} "+getDickName(RNG.pick(["dick", "penis", "cock", "member"]))+throughClothing+".",
		])
	return text
	
func getSwitchPoseTextForPose(thePose:String) -> String:
	var text:String = ""
	if(thePose == POSE_COWGIRL):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('stradle')} {sub.you} in cowgirl position, {sub.your} "+getDickName(RNG.pick(["dick", "penis", "cock", "member"]))+" is still inside {dom.yourHis} "+getUsedBodypartName()+"!",
		])
	elif(thePose == POSE_REVERSECOWGIRL):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('stradle')} {sub.you} in a reverse cowgirl position, {sub.your} "+getDickName(RNG.pick(["dick", "penis", "cock", "member"]))+" is still inside {dom.yourHis} "+getUsedBodypartName()+"!",
		])
	elif(thePose == POSE_COWGIRLAMAZON):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('stradle')} {sub.you} in a half-amazon cowgirl position, {sub.your} "+getDickName(RNG.pick(["dick", "penis", "cock", "member"]))+" is still inside {dom.yourHis} "+getUsedBodypartName()+"!",
		])
	elif(thePose == POSE_COWGIRLALT):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('stradle')} {sub.you} and {dom.youVerb('tilt')} {dom.yourHis} body back, {sub.your} "+getDickName(RNG.pick(["dick", "penis", "cock", "member"]))+" is still inside {dom.yourHis} "+getUsedBodypartName()+"!",
		])
	elif(thePose == POSE_LOTUS):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('stradle')} {sub.you} in a lotus position, {sub.your} "+getDickName(RNG.pick(["dick", "penis", "cock", "member"]))+" is still inside {dom.yourHis} "+getUsedBodypartName()+"!",
		])
	elif(thePose == POSE_STANDRIDE):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('pin')} {sub.you} against a nearby wall with a vertical split, {sub.your} "+getDickName(RNG.pick(["dick", "penis", "cock", "member"]))+" is still inside {dom.yourHis} "+getUsedBodypartName()+"!",
		])
	else:
		text = RNG.pick([
			"{dom.You} {dom.youVerb('stradle')} {sub.you}, {sub.your} "+getDickName(RNG.pick(["dick", "penis", "cock", "member"]))+" is still inside {dom.yourHis} "+getUsedBodypartName()+"!",
		])
	return text

func startActivity(_args):
	currentPose = RNG.pick(getAvaiablePoses())
	
	var text:String = getStartTextForPose(currentPose)
	if(getSexType() == SexType.SlutwallSex):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('stand')} on the chains and {dom.youVerb('stradle')} {sub.you}, {dom.yourHis} "+RNG.pick(usedBodypartNames)+" is rubbing against {sub.yourHis} "+getDickName(RNG.pick(["dick", "penis", "cock", "member"]))+".",
		])
	addText(text)
	react(aboutToRideReaction)

func onSwitchFrom(_otherActivity, _args):
	if(_args != null && _args == ["choke"]):
		currentPose = POSE_COWGIRLCHOKE
		return
	currentPose = RNG.pick(getAvaiablePoses())

func processExtra():
	if(!isMakingOut):
		return
	
	var hasPC:bool = (getSubID() == "pc" || getDomID() == "pc")
	var text:String = ("You " if hasPC else "They ")+RNG.pick([
		"are making out.",
		"are still in a deep kiss.",
		"are still kissing.",
	])
	
	if(RNG.chance(30)):
		text += RNG.pick([
			" A faint moan escapes {sub.yourHis} throat.",
			" {dom.YourHis} teeth graze {sub.yourHis} lower lip, drawing a soft gasp.",
			" Tongues are exchanging saliva.",
			" Tongues are dancing and swirling against each other.",
			" Soft gasps and moans escape from both.",
		])
	
	if(OPTIONS.isContentEnabled(ContentType.CumStealing)):
		if(RNG.chance(20) && getDom().bodypartShareFluidsWith(BodypartSlot.Head, getSubID(), BodypartSlot.Head, 0.2)):
			text += RNG.pick([
				" {dom.You} and {sub.you} [b]share some cum[/b] while "+RNG.pick(["making out", "kissing", "kissing deeply"])+"!",
				" [b]Some cum gets shared[/b] between the two "+RNG.pick(["mouths", "tongues", "lovers"])+"!",
				" [b]Snowballing is happening, some cum gets shared around[/b].",
			])
	sendSexEvent(SexEvent.Kissing, DOM_0, SUB_0, {})
	
	addText(text)

func processTurn():
	if(currentPose == POSE_COWGIRLCHOKE):
		choke(DOM_0, SUB_0, CHOKE_GENTLE)
	
	if(isMakingOut && currentPose != POSE_LOTUS):
		isMakingOut = false
	
	if(getState() == "knotting" || getState() == "inside"):
		cockWarmer(DOM_0, SUB_0, usedBodypart, getState() == "knotting")
		processExtra()
		return
	
func fucking_processTurn():
	stimulate(SUB_0, S_PENIS, DOM_0, usedBodypart, I_NORMAL, fetishGiving)
#	affectSub(getSubInfo().fetishScore({fetishGiving: 1.0})+0.5, 0.1 * subSensetivity(), -0.1, -0.01)
#	affectDom(getDomInfo().fetishScore({fetishReceiving: 1.0})+0.3, 0.1, 0.0)
#	getSubInfo().stimulateArousalZone(0.2, BodypartSlot.Penis, 1.0)
#	getDomInfo().stimulateArousalZone(0.2, usedBodypart, 1.0)
	
	doProcessRide(DOM_0, SUB_0, usedBodypart)
	
	doProcessRideExtra(DOM_0, SUB_0, usedBodypart)

	processExtra()


func getActions(_indx:int):
	if(_indx == DOM_0):
		if(currentPose == POSE_LOTUS):
			if(!isMakingOut && !getDom().isMuzzled() && !getSub().isMuzzled()):
				var makeoutScore:float = getDomInfo().personalityScore({PersonalityStat.Mean:-0.1})
				addAction("makeout", makeoutScore, "Start kissing", "Start making out at the same time since this sex pose allows it")
			if(isMakingOut):
				addAction("stopmakeout", 0.01, "Stop kissing", "Enough sharing fluids!")
		
		if(state == "" || state == "inside"):
			addAction("rub", 1.0 - getStopScore(), "Rub", "Rub your "+RNG.pick(usedBodypartNames)+" against their "+getDickName())
		if(state == ""):
			if(getDom().getFirstItemThatCoversBodypart(usedBodypart) == null && getSub().getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null && getSubInfo().isReadyToPenetrate()):
				addAction("envelop", 1.0, "Envelop "+getDickName("cock"), "Try to get this "+getDickName("cock")+" inside you")
					
			if(getDomInfo().getChar().hasBodypart(otherHoleBodypart) && !getSexEngine().hasTag(getDomID(), otherHoleTag)):
				var switchholeScore:float = 5.0 * (-getDomInfo().goalsScore(getGoals(), getSubID()) + getDomInfo().goalsScore({otherGoal: 1.0}, getSubID()))
				addAction("switchhole", switchholeScore, "Switch hole", "Switch to riding with your "+RNG.pick(otherHoleNames))

		if(state in ["fucking", "knotting"]):
			if(isReadyToCumHandled(DOM_0)):
				addAction("domcum", 1.0, "Cum!", "You're about to cum!", {A_PRIORITY: 1001})

		if(state in ["fucking"]):
			var moanScore:float = max(0.1, getDomInfo().fetishScore({fetishReceiving: 1.0}) + getDomInfo().personalityScore({PersonalityStat.Subby: 1.0}))
			addAction("moan", moanScore, "Moan", "Show how much you like it")

			addAction("slowdown", getPauseSexScore(DOM_0, SUB_0, S_PENIS, usedBodypart), "Slow down", "Stop fucking for a second..")
			
			if(isStraponSex() && getSub().bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisKnot)):
				var domArousal:float = getDomInfo().getArousal()
				var straponForceKnotScore:float = 0.01
				if(domArousal > 0.8):
					straponForceKnotScore = 0.5
				addAction("straponForceKnot", straponForceKnotScore, "Force knot in", "Try to force their knot inside you!")
				
		if(getState() in ["subabouttocum"] || (getState() == "fucking" && getSubInfo().isReadyToCum() && !getSubInfo().canDoActions())):
			var scoreToCumInside:float = 1.0
			var hasKnot:bool = getSub().bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisKnot)
			if(hasKnot):
				scoreToCumInside *= 0.5
				
				addAction("letsubknotinside", scoreToCumInside, "Knot!", "Try to force the knot into your "+RNG.pick(usedBodypartNames), {A_PRIORITY: 1001})
				
			addAction("letsubcuminside", scoreToCumInside, "Cum inside", "Let the sub cum inside you", {A_PRIORITY: 1001})
			addAction("makesubcumoutside", 1.0, "Pull out", "Stop riding the sub", {A_PRIORITY: 1001})
		
		if(!(state in ["knotting"])):
			addAction("stop", getStopScore(), "Stop riding", "Stop the sex activity")
		if(state in ["knotting"]):
			addAction("pullknotout", 1.0, "Pull out", "Try to yank their knot out")
		for pose in getAvaiablePoses():
			if(pose == currentPose):
				continue
			var poseName = "error"
			if(PoseToName.has(pose)):
				poseName = PoseToName[pose]
			addAction("switchpose", 0.0, poseName, "Change pose", {A_CATEGORY: ["Switch pose"], A_ARGS: [pose]})
		
		if(state == "inside"):
			if(getDom().getFirstItemThatCoversBodypart(usedBodypart) == null && getSub().getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
				addAction("ridemore", getContinueSexScore(DOM_0, SUB_0, S_PENIS, usedBodypart)-getStopScore(), "Ride more", "Continue riding this "+getDickName("cock")+".")
			
			
	if(_indx == SUB_0):
		if(state in [""]):
			addAction("rubSub", getSubInfo().getComplyScore()/2.0, "Tease", "Rub your dick against their "+RNG.pick(usedBodypartNames))

		if(state in ["fucking"]):
			if(isReadyToCumHandled(SUB_0) && isStraponSex()):
				addAction("subcumstrapon", 1.0, "Cum!", "You're about to cum", {A_PRIORITY: 1001})
			
			if(isReadyToCumHandled(SUB_0) && !isStraponSex()):
				addAction("warndom", 1.0, "Warn them", "Let them know that you're about to cum", {A_PRIORITY: 1001})
				var cuminsideScore:float = getResistScore(SUB_0) + fetish(SUB_0, Fetish.Breeding)*0.5
				addAction("cuminside", cuminsideScore, "Cum inside", "Cum inside their "+RNG.pick(usedBodypartNames), {A_PRIORITY: 1001})
			var moanSubScore:float = max(0.1, getSubInfo().fetishScore({fetishGiving: 0.5}) + getSubInfo().personalityScore({PersonalityStat.Subby: 0.5}))
			addAction("moanSub", moanSubScore, "Moan", "Show how much you like it")
			
		if(state in ["fucking", "", "inside"]):
			addAction("throwoff", getResistScore(SUB_0), "Throw them off", "Resist their attempts to ride you", {A_CHANCE: getSubResistChance(30.0, 25.0)})

func doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "straponForceKnot"):
		# Need a tryKnot func?
		#if(tryPenetrate())
		stimulate(SUB_0, S_PENIS, DOM_0, usedBodypart, I_NORMAL, fetishGiving, SPEED_SLOW)
		#var subArousal:float = getSubInfo().getArousal()
		if(RNG.chance(getDom().getKnottingChanceBy(usedBodypart, getSubID()) * 0.25)):
			getDom().gotOrificeStretchedBy(usedBodypart, getSubID(), true, 0.2)
			addTextTopBottom(RNG.pick([
				#"{dom.You} {dom.youVerb('manage')} to knot {sub.you}!",
				"{<BOTTOM>.You} {<BOTTOM>.youVerb('ride')} {<TOP>.your} {<TOP>.penisShort} hard until {<TOP>.yourHis} knot suddenly slips inside, stretching {<BOTTOM>.yourHis} "+getNameHole(DOM_0, usedBodypart)+" wide!",
			]), SUB_0, DOM_0)
			state = "knotting"
			cumInside(SUB_0, DOM_0, usedBodypart)
			#satisfyGoals()
		else:
			getDom().gotOrificeStretchedBy(usedBodypart, getSubID(), true, 0.1)
			addTextPick([
				"{dom.You} {dom.youVerb('try', 'tries')} to shove {sub.your} knot inside!",
				"{dom.You} {dom.youVerb('try', 'tries')} to stretch {dom.yourHis} "+getNameHole(DOM_0, usedBodypart)+" on {sub.your} knot enough to make it slip inside!",
				"{dom.You} {dom.youVerb('try', 'tries')} to knot {dom.yourself} on {sub.your} {sub.penisShort}!",
			])
		return
	if(_id == "makeout"):
		isMakingOut = true
		if(!getSubInfo().isResistingSlightly()):
			addText("{dom.You} {dom.youVerb('lean')} in closer, {dom.yourHis} lips locking with {sub.yourHis} in a deep, heated kiss. Kiss that keeps going. {sub.YouHe} {sub.youVerb('respond')}, opening {sub.yourHis} mouth to meet {dom.yourHis} tongue.")
		else:
			addText("{dom.You} {dom.youVerb('lean')} in closer and {dom.youVerb('force')} a deep kiss despite {sub.your} muffled protests. {dom.YourHis} tongue pushes into that mouth, claiming it as {sub.youHe} {sub.youVerb('squirm')} beneath.")
		return
	if(_id == "stopmakeout"):
		isMakingOut = false
		addText("{dom.You} {dom.youVerb('decide')} to stop making out.")
		return
	if(_id == "switchpose"):
		#switchedPoseOnce = true
		var newPose:String = _action["args"][0]
		var isInside:bool = true
		if(state in [""]):
			isInside = false
		
		if(isInside):
			addText(getSwitchPoseTextForPose(newPose))
		else:
			addText(getStartTextForPose(newPose))
		currentPose = newPose
		return
	if(_id == "switchhole"):
		switchCurrentActivityTo(switchHoleActivity)
		addText("{dom.You} {dom.youVerb('switch', 'switches')} holes, now rubbing {dom.yourHis} "+RNG.pick(otherHoleNames)+" against {sub.yourHis} "+getDickName()+".")
		return
	if(_id == "stop"):
		endActivity()
		addText("{dom.You} {dom.youVerb('pull')} {dom.yourself} away from {sub.your} "+getDickName()+" and {dom.youVerb('get')} up.")
		return
	if(_id == "domcum"):
		getDom().cumOnFloor()
		getDomInfo().cum()
		var straponText:String = ""
		if(isStraponSex()):
			satisfyGoals()
			var strapon = getSub().getWornStrapon()
			if(strapon.getFluids() != null && !strapon.getFluids().isEmpty()):
				getDom().cummedInBodypartByAdvanced(usedBodypart, getSubID())
				straponText = "{sub.Your} strapon gets squeezed by {dom.your} "+RNG.pick(usedBodypartNames)+" enough for it to suddenly [b]release its contents inside {dom.youHim}[/b]!"
		getSubInfo().stimulateArousalZone(0.2, BodypartSlot.Penis, 1.0)
		addGenericOrgasmText(DOM_0)
		if(straponText != ""):
			addText(straponText)
		return
	if(_id in ["letsubcuminside", "letsubknotinside"]):
		var wombText:String = RNG.pick([
			"womb", "womb",
			"babymaker",
		])
		if(usedBodypart == BodypartSlot.Anus):
			wombText = RNG.pick([
				"ass",
				"butt",
			])
		var text:String = ""
		
		var condomBroke:bool = false
		var knotSuccess:bool = false
		#var isTryingToKnot = false
		if(_id == "letsubknotinside"):
			#isTryingToKnot = true
			getDom().gotOrificeStretchedBy(usedBodypart, getSubID(), true, 0.5)
			if(RNG.chance(getDom().getKnottingChanceBy(usedBodypart, getSubID()))):
				knotSuccess = true
			else:
				text += RNG.pick([
					"{dom.You} {dom.youVerb('try', 'tries')} to "+RNG.pick(["force {sub.yourHis} knot inside {dom.youHim}", "get knotted by {dom.you}"])+" but {dom.yourHis} hole is just too tight. "
				])
		
		if(knotSuccess):
			text = RNG.pick([
				"{dom.You} "+RNG.pick(["{dom.youVerb('nod')} and", "just"])+" {dom.youVerb('keep')} riding {sub.your} "+RNG.pick(["cock", "dick", "member"])+" hard until {sub.yourHis} knot suddenly slips inside! [b]{sub.You} {sub.youVerb('moan')} as {sub.youHe} {sub.youVerb('cum')} inside {dom.yourHis} "+RNG.pick(usedBodypartNames)+"[/b]!",
			])
		else:
			text = RNG.pick([
				"{dom.You} "+RNG.pick(["{dom.youVerb('nod')} and", "just"])+" {dom.youVerb('keep')} riding {sub.your} "+RNG.pick(["cock", "dick", "member"])+" until [b]{sub.youHe} {sub.youVerb('cum')} inside {dom.yourHis} "+RNG.pick(usedBodypartNames)+"[/b]!",
			])
		text += RNG.pick([
			" Waves after waves of sticky "+RNG.pick(["cum", "seed", "jizz", "semen"])+" flow into {dom.yourHis} "+wombText+".",
		])
		
		var condom:ItemBase = getSub().getWornCondom()
		if(condom != null):
			var breakChance = condom.getCondomBreakChance()
			condomBroke = getSub().shouldCondomBreakWhenFucking(getDom(), breakChance)
			if(condomBroke):
				text = "[b]The condom broke![/b] "+text
				condom.destroyMe()
			else:
				if(knotSuccess):
					text = RNG.pick([
						"{dom.You} "+RNG.pick(["{dom.youVerb('nod')} and", "just"])+" {dom.youVerb('keep')} riding {sub.your} "+RNG.pick(["cock", "dick", "member"])+" hard until {sub.yourHis} knot suddenly slips inside!",
					])
				else:
					text = RNG.pick([
						"{dom.You} "+RNG.pick(["{dom.youVerb('nod')} and", "just"])+" {dom.youVerb('keep')} riding {sub.your} "+RNG.pick(["cock", "dick", "member"])+".",
					])
				text += RNG.pick([
					" {sub.You} {sub.youVerb('moan')} as {sub.youHe} {sub.youVerb('fill')} the condom inside {dom.your} "+RNG.pick(usedBodypartNames)+"!",
					" {sub.You} {sub.youVerb('moan')} as {sub.youHe} {sub.youVerb('stuff')} the condom in {dom.your} "+RNG.pick(usedBodypartNames)+" full of {sub.yourHis} "+RNG.pick(["cum", "seed", "jizz", "semen"])+"!",
				])
				var loadSize = getSub().cumInItem(condom)
				getSubInfo().cum()
				getDomInfo().addArousalSex(0.02)
				sendSexEvent(SexEvent.FilledCondomInside, SUB_0, DOM_0, {hole=usedBodypart,loadSize=loadSize,knotted=knotSuccess,engulfed=true})
				satisfyGoals()
				if(knotSuccess):
					state = "knotting"
				else:
					state = "inside"
				
				addText(text)
				return
		
		getDom().cummedInBodypartByAdvanced(usedBodypart, getSubID(), {knotted=knotSuccess,condomBroke=condomBroke,engulfed=true})
		getSubInfo().cum()
		
		satisfyGoals()
		if(knotSuccess):
			state = "knotting"
			getDomInfo().addArousalSex(0.05)
		else:
			state = "inside"
			getDomInfo().addArousalSex(0.02)
		
		addText(text)
		return
	if(_id == "makesubcumoutside"):
		var text:String = RNG.pick([
			"{dom.You} {dom.youVerb('ride')} {sub.yourHis} "+RNG.pick(["dick", "cock", "member"])+" until {sub.youHe} {sub.youAre} ready to cum. But {dom.you} {dom.youVerb('stop')} riding {sub.youHim} just in time!",
		])
		state = ""
		
		var condom:ItemBase = getSub().getWornCondom()
		if(condom != null):
			var breakChance = condom.getCondomBreakChance()
			
			if(RNG.chance(breakChance)):
				text = "[b]The condom broke![/b] "+text
				condom.destroyMe()
			else:
				text += RNG.pick([
					" {sub.You} "+RNG.pick(["{sub.youVerb('fill')}", "{sub.youVerb('stuff')}"])+" {sub.yourHis} condom!",
				])
				getSub().cumInItem(condom)
				getSubInfo().cum()
				satisfyGoals()
				
				addText(text)
				return
		
		text += RNG.pick([
			" {sub.You} [b]{sub.youVerb('cum')} all over {sub.yourself}[/b]! Strings of {sub.yourHis} own "+RNG.pick(["cum", "seed", "semen"])+" land on {sub.yourHis} chest, leaving a mess.",
		])
		
		getSub().cummedOnBy(getSubID(), FluidSource.Penis)
		getSubInfo().cum()
		satisfyGoals()

		addText(text)
		return
	if(_id == "pullknotout"):
		if(RNG.chance(30)):
			state = ""
			var text = RNG.pick([
				"{dom.You} {dom.youVerb('manage')} to raise {dom.yourself}. The knot "+RNG.pick(["falls out", "gets pulled out"])+" with a satisfying plop noise.",
			])
			
			if((getDom().hasEffect(StatusEffect.HasCumInsideVagina) && usedBodypart == BodypartSlot.Vagina) || (getDom().hasEffect(StatusEffect.HasCumInsideAnus) && usedBodypart == BodypartSlot.Anus)):
				if((getDom().getBuffsHolder().hasBuff(Buff.BlocksVaginaLeakingBuff) && usedBodypart == BodypartSlot.Vagina) || (getDom().getBuffsHolder().hasBuff(Buff.BlocksAnusLeakingBuff) && usedBodypart == BodypartSlot.Anus)):
					text += RNG.pick([
						" Some "+RNG.pick(["cum", "seed", "semen"])+" tries to leak out but {dom.you} quickly {dom.youVerb('plug')} {dom.yourHis} "+RNG.pick(usedBodypartNames)+" back.",
					])
				else:	
					text += RNG.pick([
						" Some "+RNG.pick(["cum", "seed", "semen"])+" leaks out of {dom.yourHis} used "+RNG.pick(usedBodypartNames)+".",
					])
			stimulate(SUB_0, S_PENIS, DOM_0, usedBodypart, I_NORMAL, fetishGiving, SPEED_VERYSLOW)
			addText(text)
			return
		else:
			var text = RNG.pick([
				"{dom.You} {dom.youVerb('try', 'tries')} to "+RNG.pick(["pull", "yank"])+" {sub.yourHis} "+RNG.pick(["cock", "dick"])+" out but {dom.youVerb('fail')}. The knot inside {dom.youHim} slowly deflates.",
			])
			getDom().gotOrificeStretchedBy(usedBodypart, getSubID(), true, 0.1)
			affectSub(getSubInfo().fetishScore({fetishGiving: 1.0}), 0.1, -0.3, 0.0)
			affectDom(getDomInfo().fetishScore({fetishReceiving: 1.0}), 0.1, -0.05)
			getSubInfo().addArousalForeplay(0.1)
			getDomInfo().addArousalForeplay(0.1)
			addText(text)
			return
	if(_id == "rub"):
		stimulate(DOM_0, usedBodypart, SUB_0, S_PENIS, I_TEASE, fetishReceiving)
		#affectSub(getSubInfo().fetishScore({fetishGiving: 1.0}), 0.1 * subSensetivity(), 0.0, 0.0)
		#affectDom(getDomInfo().fetishScore({fetishReceiving: 1.0}), 0.1, -0.01)
		#getSubInfo().addArousalForeplay(0.05 * subSensetivity())
		#getDomInfo().addArousalForeplay(0.05)
		
		addText("{dom.You} {dom.youVerb('rub')} {dom.yourHis} "+RNG.pick(usedBodypartNames)+" against {sub.yourHis} "+getDickName()+".")
		return
	if(_id == "envelop"):
		if(!RNG.chance(getDom().getPenetrateChanceBy(usedBodypart, getSubID()))):
			getDom().gotOrificeStretchedBy(usedBodypart, getSubID(), true, 0.1)
			#affectSub(getSubInfo().fetishScore({fetishGiving: 1.0}), 0.1 * subSensetivity(), 0.0, 0.0)
			#affectDom(getDomInfo().fetishScore({fetishReceiving: 1.0}), 0.2, -0.01)
			stimulate(DOM_0, usedBodypart, SUB_0, S_PENIS, I_TEASE, fetishReceiving)
			addText("{dom.You} {dom.youVerb('try', 'tries')} to envelop {sub.yourHis} "+getDickName()+" but it's too big!")
			return
		
		sendSexEvent(SexEvent.HolePenetrated, SUB_0, DOM_0, {hole=usedBodypart,engulfed=true,strapon=isStraponSex()})
		#affectSub(getSubInfo().fetishScore({fetishGiving: 1.0}), 0.1 * subSensetivity(), 0.0, 0.0)
		#affectDom(getDomInfo().fetishScore({fetishReceiving: 1.0}), 0.1, -0.01)
		#getSubInfo().stimulateArousalZone(0.1, BodypartSlot.Penis, 0.5)
		#getDomInfo().stimulateArousalZone(0.1, usedBodypart, 0.5)
		stimulate(DOM_0, usedBodypart, SUB_0, S_PENIS, I_LOW, fetishReceiving)
		
		#getSub().gotFuckedBy(usedBodypart, getDomID())
		getDom().gotOrificeStretchedBy(usedBodypart, getSubID(), true, 0.2)
		#gonnaCumOutside = false
		state = "fucking"
		addText("{dom.You} {dom.youVerb('envelop')} {sub.youHis} "+getDickName()+", letting it penetrate {dom.yourHis} "+RNG.pick(usedBodypartNames)+".")
		return
	if(_id == "slowdown"):
		state = "inside"
		addText("{dom.You} {dom.youVerb('stop')} riding that "+getDickName()+" and just {dom.youVerb('let')} it stay inside.")
		return
	if(_id == "moan"):
		var moanText:String = RNG.pick([
			"{dom.youVerb('moan')}"
		])
		if(getDom().isGagged()):
			moanText = RNG.pick([
				"{dom.youVerb('let')} out muffled moans",
			])
		addTextPick([
			"{dom.You} "+moanText+" while being fucked!",
			"{dom.You} "+moanText+" while riding {sub.youHim} with {dom.yourHis} "+RNG.pick(usedBodypartNames)+"!",
			"{dom.You} "+moanText+" eagerly!",
		])
		moan(DOM_0)
		#affectSub(getSubInfo().fetishScore({fetishGiving: 1.0}), 0.03 * subSensetivity(), -0.01, -0.0)
		#affectDom(getDomInfo().fetishScore({fetishReceiving: 1.0}), 0.05, -0.03)
		return
	if(_id == "ridemore"):
		getDom().gotOrificeStretchedBy(usedBodypart, getSubID(), true, 0.2)
		#gonnaCumOutside = false
		state = "fucking"
		addText("{dom.You} {dom.youVerb('continue')} to ride {sub.youHis} "+getDickName()+" with {dom.yourHis} "+RNG.pick(usedBodypartNames)+".")
		return

	if(_id == "subcumstrapon"):
		getSub().cumOnFloor(getDomID())
		getSubInfo().cum()
		addGenericOrgasmText(SUB_0)
		return
	if(_id == "moanSub"):
		var moanText:String = RNG.pick([
			"{sub.youVerb('moan')}"
		])
		if(getSub().isGagged()):
			moanText = RNG.pick([
				"{sub.youVerb('let')} out muffled moans",
				"{sub.youVerb('let')} out a muffled moan",
				"{sub.youVerb('let')} out a muffled noise of pleasure",
			])
		
		addTextPick([
			"{sub.You} "+moanText+" while {dom.you} {dom.youVerb('ride')} {sub.youHim}!",
			"{sub.You} "+moanText+" while {sub.yourHis} "+getDickName()+" is used by {dom.you}!",
			"{sub.You} "+moanText+" eagerly!",
		])
		moan(SUB_0)
		return
	if(_id == "throwoff"):
		if(RNG.chance(getSubResistChance(30.0, 25.0))):
			if(state != ""):
				state = ""
				isMakingOut = false
			else:
				endActivity()
			
			addText("{sub.You} {sub.youVerb('manage')} to throw {dom.youHim} away from {sub.yourHis} "+getDickName()+".")
			reactSub(SexReaction.ActivelyResisting, [50])
			getDomInfo().addAnger(0.3)
			return
		else:
			addText("{sub.You} {sub.youVerb('try', 'tries')} to resist and "+RNG.pick(["shove", "push", "throw"])+" {dom.you} off but {sub.youVerb('fail')}.")
			getDomInfo().addAnger(0.1)
			reactSub(SexReaction.ActivelyResisting, [50])
			return
	if(_id == "rubSub"):
		stimulate(SUB_0, S_PENIS, DOM_0, usedBodypart, I_TEASE, fetishGiving)
		#affectSub(getSubInfo().fetishScore({fetishGiving: 1.0}), 0.05 * subSensetivity(), -0.1, 0.0)
		#affectDom(max(0.1, getDomInfo().fetishScore({fetishReceiving: 1.0})+1.0), 0.05, 0.0)
		
		addText("{sub.You} {sub.youVerb('rub')} {sub.yourHis} "+getDickName()+" against {dom.your} "+RNG.pick(usedBodypartNames)+".")
		return
	if(_id == "warndom"):
		state = "subabouttocum"
		getDomInfo().addAnger(-0.05)
		addText("{sub.You} {sub.youVerb('warn')} {dom.youHim} that {sub.youHe} {sub.youAre} "+RNG.pick(["about to cum", "close", "very close"])+".")
		reactSub(SexReaction.WarnAboutToCum)
		return
	if(_id == "cuminside"):
		var text:String = RNG.pick([
			"{sub.You} {sub.youVerb('grunt')} as {sub.yourHis} "+RNG.pick(["cock", "dick", "member"])+" throbs and [b]"+RNG.pick(["cums inside {dom.yourHis} "+RNG.pick(usedBodypartNames), "stuffs {dom.yourHis} "+RNG.pick(usedBodypartNames)])+" without asking permission[/b]!",
		])
		if(usedBodypart == BodypartSlot.Vagina):
			text += RNG.pick([
				" Waves after waves of sticky "+RNG.pick(["cum", "seed", "jizz", "semen"])+" flow into {dom.yourHis} "+RNG.pick(["womb", "babymaker", "womb"])+".",
			])
		else:
			text += RNG.pick([
				" Waves after waves of sticky "+RNG.pick(["cum", "seed", "jizz", "semen"])+" get shoved into {dom.yourHis} "+RNG.pick(["ass", "butt"])+".",
			])
		
		var condomBroke = false
		var condom:ItemBase = getSub().getWornCondom()
		if(condom != null):
			var breakChance = condom.getCondomBreakChance()
			condomBroke = getSub().shouldCondomBreakWhenFucking(getDom(), breakChance)
			if(condomBroke):
				text = "[b]The condom broke![/b] "+text
				condom.destroyMe()
			else:
				text = RNG.pick([
					"{sub.You} {sub.youVerb('fill')} the condom inside {dom.your} "+RNG.pick(usedBodypartNames)+" [b]without asking for permission[/b]!",
					"{sub.You} {sub.youVerb('stuff')} the condom in {dom.your} "+RNG.pick(usedBodypartNames)+" full of {sub.yourHis} "+RNG.pick(["cum", "seed", "jizz", "semen"])+" [b]without asking for permission[/b]!",
				])
				var loadSize = getSub().cumInItem(condom)
				getSubInfo().cum()
				getDomInfo().addArousalSex(0.02)
				sendSexEvent(SexEvent.FilledCondomInside, SUB_0, DOM_0, {hole=usedBodypart,loadSize=loadSize,knotted=false})
				satisfyGoals()
				state = "inside"
				
				addText(text)
				return
		
		var beingBredScore = getDomInfo().fetishScore({Fetish.BeingBred: 1.0})
		if(beingBredScore < 0.0):
			getDomInfo().addAnger(1.0)
			text += RNG.pick([
				" {dom.You} {dom.youAre} furious!",
			])
			getDomInfo().addFrustration(1.0)
		else:
			getDomInfo().addAnger(0.3)
		getDom().cummedInBodypartByAdvanced(usedBodypart, getSubID(), {condomBroke=condomBroke})
		getSubInfo().cum()
		getDomInfo().addArousalSex(0.02)
		satisfyGoals()
		state = "inside"

		addText(text)
		return

func getSubResistChance(baseChance:float, domAngerRemoval:float) -> float:
	var theChance = baseChance - getDomInfo().getAngerScore()*domAngerRemoval
	if(getSub().hasBlockedHands()):
		theChance *= 0.6
	if(getSub().hasBoundArms()):
		theChance *= 0.6
	if(getSub().hasBoundLegs()):
		theChance *= 0.5
	if(getSub().isBlindfolded()):
		theChance *= 0.8
	if(getSexType() == SexType.SlutwallSex):
		theChance *= 0.5
	
	return max(theChance, 5.0)

func getAnimation():
	var shouldUncon = getSubInfo().isUnconscious()
	
	if(getSexType() == SexType.SlutwallSex):
		if(state in [""]):
			return [StageScene.SlutwallRide, "tease", {pc=SUB_0, npc=DOM_0}]
		if(state in ["knotting", "inside"]):
			return [StageScene.SlutwallRide, "inside", {pc=SUB_0, npc=DOM_0}]
		if(getSubInfo().isCloseToCumming() || (isStraponSex() && getDomInfo().isCloseToCumming())):
			return [StageScene.SlutwallRide, "fast", {pc=SUB_0, npc=DOM_0}]
		return [StageScene.SlutwallRide, "sex", {pc=SUB_0, npc=DOM_0}]
	
	var animToPlay = StageScene.SexCowgirl
	if(PoseToAnimName.has(currentPose)):
		animToPlay = PoseToAnimName[currentPose]
	var pcPoseID:int=SUB_0
	var npcPoseID:int=DOM_0
	if(currentPose == POSE_LOTUS):
		pcPoseID = DOM_0
		npcPoseID = SUB_0
	
	if(state in [""]):
		return [animToPlay, "tease", {pc=pcPoseID, npc=npcPoseID, uncon=shouldUncon}]
	if(state in ["knotting", "inside"]):
		return [animToPlay, "inside", {pc=pcPoseID, npc=npcPoseID, uncon=shouldUncon}]
	if(getSubInfo().isCloseToCumming() || (isStraponSex() && getDomInfo().isCloseToCumming())):
		if(currentPose == POSE_REVERSECOWGIRL):
			shouldUncon = false
		return [animToPlay, "fast", {pc=pcPoseID, npc=npcPoseID, uncon=shouldUncon}]
	return [animToPlay, "sex", {pc=pcPoseID, npc=npcPoseID, uncon=shouldUncon}]

func getDomSwitchHoleChance() -> float:
	if(getDomInfo().hasMemory("switchedHoles")):
		return 0.0
	
	var domLikesOtherHoleScore = getDomInfo().fetishScore({otherHoleFetishGiving:1.0, fetishGiving: -0.5})
	
	return max(5.0, domLikesOtherHoleScore * 100.0 * (1.0 - getDomInfo().getAngerScore()))

func getOrgasmHandlePriority(_indx:int) -> int:
	if(_indx == DOM_0):
		if(isStraponSex()):
			return 10
		return 5
	if(_indx == SUB_0):
		if(isStraponSex()):
			return 5
		return 10
	return -1

func getJoinActions(_sexInfo:SexInfoBase):
	if(!(_sexInfo is SexDomInfo)):
		return
	#var theChar:BaseCharacter = _sexInfo.getChar()
	
	if(canSwitchTo("ThreeDDS_Train", [_sexInfo, DOM_0], [SUB_0], [S_VAGINA, usedBodypart])):
		addJoinAction(["trainVag"], "+Train (vag)", "Join and fuck the sub's pussy at the same time!", getJoinActivityScore("ThreeDDS_Train", DOM_0, _sexInfo, getSubInfo(), [S_VAGINA]), {A_CATEGORY: ["Fuck"]})
	if(canSwitchTo("ThreeDDS_Train", [_sexInfo, DOM_0], [SUB_0], [S_ANUS, usedBodypart])):
		addJoinAction(["trainAnal"], "+Train (anal)", "Join and fuck the sub's ass at the same time!", getJoinActivityScore("ThreeDDS_Train", DOM_0, _sexInfo, getSubInfo(), [S_ANUS]), {A_CATEGORY: ["Fuck"]})
		
	if(canSwitchTo("ThreeDDS_RideGrind", [DOM_0, _sexInfo], [SUB_0], [usedBodypart])):
		addJoinAction(["rideAndGrind"], "+Grind face", "Join and grind the sub's face at the same time!", getJoinActivityScore("ThreeDDS_RideGrind", DOM_1, _sexInfo, getSubInfo()), {A_CATEGORY: ["Fuck"]})
		
		
func doJoinAction(_sexInfo:SexInfoBase, _args):
	if(_args[0] == "trainVag"):
		switchCurrentActivityTo("ThreeDDS_Train", [S_VAGINA, usedBodypart, _sexInfo.getCharID(), true])
	if(_args[0] == "trainAnal"):
		switchCurrentActivityTo("ThreeDDS_Train", [S_ANUS, usedBodypart, _sexInfo.getCharID(), true])
	
	if(_args[0] == "rideAndGrind"):
		switchCurrentActivityTo("ThreeDDS_RideGrind", [usedBodypart, _sexInfo.getCharID()])
	

func saveData():
	var data = .saveData()
	
	data["waitTimer"] = waitTimer
	data["currentPose"] = currentPose
	data["isMakingOut"] = isMakingOut

	return data
	
func loadData(data):
	.loadData(data)
	
	waitTimer = SAVE.loadVar(data, "waitTimer", 0)
	currentPose = SAVE.loadVar(data, "currentPose", "")
	isMakingOut = SAVE.loadVar(data, "isMakingOut", false)
	if(currentPose == ""):
		currentPose = RNG.pick(getAvaiablePoses())
