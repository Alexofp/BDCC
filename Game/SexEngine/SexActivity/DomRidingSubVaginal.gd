extends SexActivityBase
var waitTimer = 0

var usedBodypart = BodypartSlot.Vagina
var usedTag = SexActivityTag.VaginaUsed
var usedTagInside = SexActivityTag.VaginaPenetrated
var fetishGiving = Fetish.VaginalSexGiving
var fetishReceiving = Fetish.VaginalSexReceiving
var aboutToRideReaction = SexReaction.AboutToRidePussy
var usedBodypartNames = ["pussy", "pussy", "slit", "cunt", "kitty"]
var switchHoleActivity = "DomRidingSubAnal"
var otherHoleNames = ["anus"]
var otherHoleBodypart = BodypartSlot.Anus
var otherHoleTag = SexActivityTag.AnusUsed
var otherHoleFetishGiving = Fetish.AnalSexGiving
var otherHoleFetishReceiving = Fetish.AnalSexReceiving
var otherGoal = SexGoal.ReceiveAnal
var currentPose = ""
var isVag = true
var isMakingOut:bool = false

func _init():
	id = "DomRidingSubVaginal"

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
}
const PoseToAnimName = {
	POSE_DEFAULT: StageScene.SexCowgirl,
	POSE_COWGIRL: StageScene.SexCowgirl,
	POSE_REVERSECOWGIRL: StageScene.SexReverseCowgirl,
	POSE_COWGIRLALT: StageScene.SexCowgirlAlt,
	POSE_COWGIRLCHOKE: StageScene.SexCowgirlChoke,
	POSE_LOTUS: StageScene.SexLotus,
	POSE_STANDRIDE: StageScene.SexStandRide,
}
func getAvaiablePoses():
	if(currentPose == POSE_COWGIRLCHOKE):
		return [POSE_COWGIRLCHOKE]
	
	if(getSexType() == SexType.DefaultSex):
		var possible:= [POSE_COWGIRL, POSE_REVERSECOWGIRL, POSE_COWGIRLALT, POSE_LOTUS]
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

func getVisibleName():
	return "Cowgirl Vaginal"

func getCategory():
	return ["Fuck"]

func getDomTags():
	var thetags = [usedTag, SexActivityTag.HavingSex]
	if(state in ["fucking", "aftercumminginside", "knotting", "inside"]):
		thetags.append(usedTagInside)
	return thetags

func getSubTags():
	if(state in ["fucking", "aftercumminginside", "knotting", "inside"]):
		return [SexActivityTag.PenisUsed, SexActivityTag.PenisInside, SexActivityTag.HavingSex, SexActivityTag.PreventsSubViolence, SexActivityTag.PreventsSubTeasing]
	return [SexActivityTag.PenisUsed, SexActivityTag.HavingSex, SexActivityTag.PreventsSubViolence, SexActivityTag.PreventsSubTeasing]

func getDomTagsCheck():
	return [SexActivityTag.OrderedToDoSomething, usedTag, SexActivityTag.HavingSex]

func getSubTagsCheck():
	return [SexActivityTag.OrderedToDoSomething, SexActivityTag.PenisUsed, SexActivityTag.HavingSex]

func isStraponSex():
	return getSub().isWearingStrapon()

func subSensetivity():
	var strapon = getSub().getWornStrapon()
	if(strapon == null):
		return 1.0
	
	return strapon.getStraponPleasureForDom()

func getDickName(dickName = null):
	if(isStraponSex()):
		return "strapon"
	if(dickName == null):
		return RNG.pick(["cock", "dick", "member"])
	return dickName

func getUsedBodypartName():
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

func getStartTextForPose(thePose):
	var throughClothing = "."
	if(domInfo.getChar().getFirstItemThatCoversBodypart(usedBodypart) != null):
		throughClothing = " through {dom.yourHis} clothing."
	
	var text = ""
	if(thePose == POSE_COWGIRL):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('stradle')} {sub.you} and {dom.youVerb('rub')} {dom.yourHis} "+getUsedBodypartName()+" against {sub.yourHis} "+getDickName(RNG.pick(["dick", "penis", "cock", "member"]))+throughClothing,
		])
	elif(thePose == POSE_REVERSECOWGIRL):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('stradle')} {sub.you} in a reverse cowgirl position and {dom.youVerb('rub')} {dom.yourHis} "+getUsedBodypartName()+" against {sub.yourHis} "+getDickName(RNG.pick(["dick", "penis", "cock", "member"]))+throughClothing,
		])
	elif(thePose == POSE_COWGIRLALT):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('stradle')} {sub.you} and {dom.youVerb('tilt')} {dom.yourHis} body back while rubbing {dom.yourHis} "+getUsedBodypartName()+" against {sub.yourHis} "+getDickName(RNG.pick(["dick", "penis", "cock", "member"]))+throughClothing,
		])
	elif(thePose == POSE_LOTUS):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('sink')} into {sub.your} lap, wrapping {dom.yourHis} legs around {sub.yourHis} waist, holding {sub.yourHis} shoulders for support. {dom.YourHis} "+getUsedBodypartName()+" {dom.youVerb('press', 'presses')} tightly against {sub.yourHis} "+getDickName(RNG.pick(["dick", "penis", "cock", "member"]))+throughClothing+" in the close, intimate embrace.",
		])
	elif(thePose == POSE_STANDRIDE):
		text = RNG.pick([
				"{dom.You} {dom.youVerb('raise')} one leg high and {dom.youVerb('pin')} {sub.you} against the nearby wall, {dom.yourHis} {dom.foot} brushing {sub.yourHis} shoulder. {dom.YourHis} "+getUsedBodypartName()+" {dom.youVerb('press')} against {sub.yourHis} "+getDickName(RNG.pick(["dick", "penis", "cock"]))+throughClothing+".",
			])
	else:
		text = RNG.pick([
			"{dom.You} {dom.youVerb('stradle')} {sub.you} and {dom.youVerb('rub')} {dom.yourHis} "+getUsedBodypartName()+" against {sub.yourHis} "+getDickName(RNG.pick(["dick", "penis", "cock", "member"]))+throughClothing,
		])
	return text
	
func getSwitchPoseTextForPose(thePose):
	var text = ""
	if(thePose == POSE_COWGIRL):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('stradle')} {sub.you} in cowgirl position, {sub.your} "+getDickName(RNG.pick(["dick", "penis", "cock", "member"]))+" is still inside {dom.yourHis} "+getUsedBodypartName()+"!",
		])
	elif(thePose == POSE_REVERSECOWGIRL):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('stradle')} {sub.you} in a reverse cowgirl position, {sub.your} "+getDickName(RNG.pick(["dick", "penis", "cock", "member"]))+" is still inside {dom.yourHis} "+getUsedBodypartName()+"!",
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
	state = ""
	currentPose = RNG.pick(getAvaiablePoses())
	
	var text = getStartTextForPose(currentPose)
	if(getSexType() == SexType.SlutwallSex):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('stand')} on the chains and {dom.youVerb('stradle')} {sub.you}, {dom.yourHis} "+RNG.pick(usedBodypartNames)+" is rubbing against {sub.yourHis} "+getDickName(RNG.pick(["dick", "penis", "cock", "member"]))+".",
		])
	
	return {
		text = text,
		domSay = domReaction(aboutToRideReaction),
	}

func onSwitchFrom(_otherActivity, _args):
	if(_args != null && _args == ["choke"]):
		currentPose = POSE_COWGIRLCHOKE
		return
	currentPose = RNG.pick(getAvaiablePoses())

func processChoke():
	if(currentPose == POSE_COWGIRLCHOKE):
		subInfo.addConsciousness(-0.01)
		sendSexEvent(SexEvent.Choking, domID, subID, {strongChoke=false})

func processExtra():
	if(!isMakingOut):
		return null
	
	var hasPC:bool = (subID == "pc" || domID == "pc")
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
		if(RNG.chance(20) && getDom().bodypartShareFluidsWith(BodypartSlot.Head, subID, BodypartSlot.Head, 0.2)):
			text += RNG.pick([
				" {dom.You} and {sub.you} [b]share some cum[/b] while "+RNG.pick(["making out", "kissing", "kissing deeply"])+"!",
				" [b]Some cum gets shared[/b] between the two "+RNG.pick(["mouths", "tongues", "lovers"])+"!",
				" [b]Snowballing is happening, some cum gets shared around[/b].",
			])
	sendSexEvent(SexEvent.Kissing, domID, subID, {})
	
	return {text=text}

func processTurn():
	processChoke()
	
	if(isMakingOut && currentPose != POSE_LOTUS):
		isMakingOut = false
	
	if(state == "knotting" || state == "inside"):
		var freeRoom = getDom().getPenetrationFreeRoomBy(usedBodypart, subID)
		if(freeRoom > 0.0):
			var text = RNG.pick([
				"{dom.You} {dom.youAre} being a "+RNG.pick(["great", "good"])+" cock warmer for {sub.you}. There is enough room inside {dom.yourHis} "+RNG.pick(usedBodypartNames)+" for {dom.youHim} not to feel any pain.",
			])
			
			return combineData({text = text}, processExtra())
		else:
			var text = RNG.pick([
				"{dom.You} {dom.youAre} trying to be a cock warmer for {sub.you} but {dom.yourHis} "+RNG.pick(usedBodypartNames)+" is too tight, it's very painful! But it sure feels good for {sub.you}.",
			])
			var howMuchPainAdd = RNG.randi_range(1, 2)
			domInfo.addPain(howMuchPainAdd)
			sendSexEvent(SexEvent.PainInflicted, subID, domID, {pain=howMuchPainAdd,isDefense=false,intentional=false})
			subInfo.addLust(10)
			subInfo.addArousalForeplay(0.1)
			getDom().gotOrificeStretchedBy(usedBodypart, subID, 0.1)
			return combineData({text = text}, processExtra())
	
	if(state == "fucking"):
		affectSub(subInfo.fetishScore({fetishGiving: 1.0})+0.5, 0.1 * subSensetivity(), -0.1, -0.01)
		affectDom(domInfo.fetishScore({fetishReceiving: 1.0})+0.3, 0.1, 0.0)
		subInfo.stimulateArousalZone(0.2, BodypartSlot.Penis, 1.0)
		domInfo.stimulateArousalZone(0.2, usedBodypart, 1.0)
		
		var text = RNG.pick([
			"{dom.You} {dom.youAre} riding {sub.yourHis} "+getDickName(RNG.pick(["dick", "cock", "member"]))+".",
			"{dom.You} {dom.youAre} bouncing on {sub.yourHis} "+getDickName(RNG.pick(["dick", "cock", "member"]))+" with {dom.yourHis} "+RNG.pick(usedBodypartNames)+".",
			"{dom.You} {dom.youAre} going up and down on {sub.yourHis} "+getDickName(RNG.pick(["dick", "cock", "member"]))+" with {dom.yourHis} "+RNG.pick(usedBodypartNames)+".",
			"{dom.You} {dom.youAre} fucking {sub.yourHis} "+getDickName(RNG.pick(["dick", "cock", "member"]))+" with {dom.yourHis} "+RNG.pick(usedBodypartNames)+".",
		])
		
		if(RNG.chance(20)):
			var freeRoom = getDom().getPenetrationFreeRoomBy(usedBodypart, subID)
			
			getDom().gotOrificeStretchedBy(usedBodypart, subID, 0.1)
			
			if(usedBodypart == BodypartSlot.Vagina):
				if(freeRoom <= 5.0):
					text += RNG.pick([
						" The tip of {sub.yourHis} "+getDickName(RNG.pick(["cock", "dick", "member"]))+" easily "+RNG.pick(["hits", "smashes", "reaches", "finds"])+" {dom.yourHis} "+RNG.pick(["cervix", "natural barricade"])+".",
					])
				elif(freeRoom >= 10):
					text += RNG.pick([
						" The tip of {sub.yourHis} "+getDickName(RNG.pick(["cock", "dick", "member"]))+" can barely reach anywhere deep.",
						" The tip of {sub.yourHis} "+getDickName(RNG.pick(["cock", "dick", "member"]))+" is struggling to reach {dom.yourHis} "+RNG.pick(["cervix", "natural barricade"])+".",
					])
			if(usedBodypart == BodypartSlot.Anus):
				if(freeRoom <= 5.0):
					text += RNG.pick([
						" The tip of {sub.yourHis} "+getDickName(RNG.pick(["cock", "dick", "member"]))+" easily "+RNG.pick(["hits", "smashes", "reaches", "finds"])+" {dom.yourHis} "+RNG.pick(["pleasure spot"])+".",
					])
				elif(freeRoom >= 10):
					text += RNG.pick([
						" The tip of {sub.yourHis} "+getDickName(RNG.pick(["cock", "dick", "member"]))+" can barely reach anywhere deep.",
						" The tip of {sub.yourHis} "+getDickName(RNG.pick(["cock", "dick", "member"]))+" is struggling to reach {dom.yourHis} "+RNG.pick(["pleasure spot"])+".",
					])
		
		if(RNG.chance(20) && getSub().bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisBarbs)):
			text += RNG.pick([
				" Barbs on {sub.yourHis} "+getDickName(RNG.pick(["cock", "dick", "shaft"]))+" provide extra stimulation.",
				" Barbs on {sub.yourHis} "+getDickName(RNG.pick(["cock", "dick", "shaft"]))+" "+RNG.pick(["rake against", "scratch"])+" the "+RNG.pick(["soft insides", "soft inner walls"])+".",
			])
		
		if(isStraponSex()):
			if(subInfo.isReadyToCum()):
				text += RNG.pick([
					" {sub.You} {sub.youAre} being edged by {dom.you}.",
					" {sub.You} {sub.youAre} about to cum!",
					" {sub.You} {sub.youAre} keeping {dom.yourself} on edge.",
				])
			elif(subInfo.isCloseToCumming()):
				text += RNG.pick([
					" {sub.You} {sub.youVerb('pant')} eagerly.",
					" {sub.You} closes in on {sub.yourHis} orgasm.",
					" {sub.You} {sub.youAre} gonna cum soon.",
				])
		else:
			if(subInfo.isReadyToCum()):
				text += RNG.pick([
					" {sub.You} {sub.youAre} being edged by {dom.you}.",
					" {sub.You} {sub.youAre} about to cum!",
					" {sub.You} {sub.youAre} keeping {dom.yourself} on edge.",
					" {sub.Your} "+RNG.pick(["cock", "dick", "member"])+" is moments from cumming.",
					" {sub.Your} "+RNG.pick(["cock", "dick", "member"])+" reached its peak."
				])
			elif(subInfo.isCloseToCumming()):
				text += RNG.pick([
					" {sub.You} {sub.youVerb('pant')} eagerly.",
					" {sub.You} closes in on {sub.yourHis} orgasm.",
					" {sub.You} {sub.youAre} gonna cum soon.",
					" {sub.Your} "+RNG.pick(["cock", "dick", "member"])+" is throbbing.",
					" {sub.Your} "+RNG.pick(["cock", "dick", "member"])+" is twitching and leaking a lot."
				])
		
		return combineData({text = text}, processExtra())


func getDomActions():
	var actions = []
	if(currentPose == POSE_LOTUS):
		if(!isMakingOut && !getDom().isMuzzled() && !getSub().isMuzzled()):
			actions.append({
					"id": "makeout",
					"score": domInfo.personalityScore({PersonalityStat.Mean:-0.1}),
					"name": "Start kissing",
					"desc": "Start making out at the same time since this sex pose allows it",
				})
		if(isMakingOut):
			actions.append({
					"id": "stopmakeout",
					"score": 0.01,
					"name": "Stop kissing",
					"desc": "Enough sharing fluids!",
				})
	
	if(state == "" || state == "inside"):
		actions.append({
				"id": "rub",
				"score": 1.0 - getStopScore(),
				"name": "Rub",
				"desc": "Rub your "+RNG.pick(usedBodypartNames)+" against their "+getDickName(),
			})
	if(state == ""):
		if(getDom().getFirstItemThatCoversBodypart(usedBodypart) == null && getSub().getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null && subInfo.isReadyToPenetrate()):
			actions.append({
					"id": "envelop",
					"score": 1.0,
					"name": "Envelop "+getDickName("cock"),
					"desc": "Try to get this "+getDickName("cock")+" inside you",
				})
				
		if(domInfo.getChar().hasBodypart(otherHoleBodypart) && !getSexEngine().hasTag(domID, otherHoleTag)):
			actions.append({
				"id": "switchhole",
				"score": 5.0 * (-domInfo.goalsScore(getGoals(), subID) + domInfo.goalsScore({otherGoal: 1.0}, subID)),
				"name": "Switch hole",
				"desc": "Switch to riding with your "+RNG.pick(otherHoleNames),
			})

	if(state in ["fucking"]):
		actions.append({
				"id": "moan",
				"score": max(0.1, domInfo.fetishScore({fetishReceiving: 1.0}) + domInfo.personalityScore({PersonalityStat.Subby: 1.0})),
				"name": "Moan",
				"desc": "Show how much you like it",
			})

		actions.append({
				"id": "slowdown",
				"score": (1.0 if getSub().isZoneOverstimulated(BodypartSlot.Penis) else 0.0),
				"name": "Slow down",
				"desc": "Stop fucking for a second..",
			})

		if(domInfo.isReadyToCum() && isHandlingDomOrgasms()):
			actions.append({
				"id": "domcum",
				"score": 1.0,
				"name": "Cum!",
				"desc": "You're about to cum!",
				"priority" : 1001,
			})
			
	if(state in ["subabouttocum"] || (state == "fucking" && subInfo.isReadyToCum() && !subInfo.canDoActions())):
		var scoreToCumInside = 1.0
		var hasKnot = getSub().bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisKnot)
		if(hasKnot):
			scoreToCumInside *= 0.5
			
			actions.append({
				"id": "letsubknotinside",
				"score": scoreToCumInside,
				"name": "Knot!",
				"desc": "Try to force the knot into your "+RNG.pick(usedBodypartNames),
				"priority": 1001,
			})
			
		actions.append({
			"id": "letsubcuminside",
			"score": scoreToCumInside,
			"name": "Cum inside",
			"desc": "Let the sub cum inside you",
			"priority" : 1001,
		})
		actions.append({
			"id": "makesubcumoutside",
			"score": 1.0,
			"name": "Pull out",
			"desc": "Stop riding the sub",
			"priority" : 1001,
		})
	
	if(!(state in ["knotting"])):
		actions.append({
			"id": "stop",
			"score": getStopScore(),
			"name": "Stop riding",
			"desc": "Stop the sex activity",
		})
	if(state in ["knotting"]):
		actions.append({
			"id": "pullknotout",
			"score": 1.0,
			"name": "Pull out",
			"desc": "Try to yank their knot out",
		})
	for pose in getAvaiablePoses():
		if(pose == currentPose):
			continue
		var poseName = "error"
		if(PoseToName.has(pose)):
			poseName = PoseToName[pose]
		actions.append({
			"id": "switchpose",
			"score": 0.0,
			"name": poseName,
			"desc": "Change pose",
			"category": ["Switch pose"],
			"args": [pose],
		})
			
	return actions


func doDomAction(_id, _actionInfo):
	if(_id == "makeout"):
		isMakingOut = true
		
		var text:String = ""
		if(!subInfo.isResistingSlightly()):
			text += RNG.pick([
				"{dom.You} {dom.youVerb('lean')} in closer, {dom.yourHis} lips locking with {sub.your} in a deep, heated kiss. Kiss that keeps going. {sub.YouHe} {sub.youVerb('respond')}, opening {sub.yourHis} mouth to meet {dom.yourHis} tongue.",
			])
		else:
			text += RNG.pick([
				"{dom.You} {dom.youVerb('lean')} in closer and {dom.youVerb('force')} a deep kiss despite {sub.your} muffled protests. {dom.YourHis} tongue pushes into that mouth, claiming it as {sub.youHe} {sub.youVerb('squirm')} beneath.",
			])
		
		return {text = text}

	if(_id == "stopmakeout"):
		isMakingOut = false
		
		var text:String = RNG.pick([
			"{dom.You} {dom.youVerb('decide')} to stop making out.",
		])
		
		return {text = text}

	if(_id == "switchpose"):
		#switchedPoseOnce = true
		var newPose = _actionInfo["args"][0]
		var isInside = true
		if(state in [""]):
			isInside = false
		
		var text = ""
		if(isInside):
			text = getSwitchPoseTextForPose(newPose)
		else:
			text = getStartTextForPose(newPose)
		currentPose = newPose
		return {text = text}
	
	if(_id == "switchhole"):
		switchCurrentActivityTo(switchHoleActivity)
		
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('switch', 'switches')} holes, now rubbing {dom.yourHis} "+RNG.pick(otherHoleNames)+" against {sub.yourHis} "+getDickName()+".",
		])
		
		return {text = text}
		
	
	if(_id == "stop"):
		endActivity()
		
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('pull')} {dom.yourself} away from {sub.your} "+getDickName()+" and {dom.youVerb('get')} up.",
		])
		
		var condom:ItemBase = getSub().getWornCondom()
		if(condom != null):
			text += " {dom.You} {dom.youVerb('dispose')} of {sub.yourHis} condom."
			condom.destroyMe()
			getSexEngine().saveCondomToLootIfPerk(condom)
		
		return {text = text}

	if(_id == "domcum"):
		getDom().cumOnFloor()
		domInfo.cum()
		var straponData = null
		if(isStraponSex()):
			satisfyGoals()
			
			var strapon = getSub().getWornStrapon()
			if(strapon.getFluids() != null && !strapon.getFluids().isEmpty()):
				getDom().cummedInBodypartByAdvanced(usedBodypart, subID)
				straponData = {
					text = "{sub.Your} strapon gets squeezed by {dom.your} "+RNG.pick(usedBodypartNames)+" enough for it to suddenly [b]release its contents inside {dom.youHim}[/b]!"
				}
		
		subInfo.stimulateArousalZone(0.2, BodypartSlot.Penis, 1.0)
		
		return getSexEngine().combineData(getGenericDomOrgasmData(), straponData)
	
	if(_id in ["letsubcuminside", "letsubknotinside"]):
		var wombText = RNG.pick([
			"womb", "womb",
			"babymaker",
		])
		if(usedBodypart == BodypartSlot.Anus):
			wombText = RNG.pick([
				"ass",
				"butt",
			])
		var text = ""
		
		var condomBroke = false
		var knotSuccess = false
		#var isTryingToKnot = false
		if(_id == "letsubknotinside"):
			#isTryingToKnot = true
			getDom().gotOrificeStretchedBy(usedBodypart, subID, 0.5)
			if(RNG.chance(getDom().getKnottingChanceBy(usedBodypart, subID))):
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
				subInfo.cum()
				domInfo.addArousalSex(0.02)
				sendSexEvent(SexEvent.FilledCondomInside, subID, domID, {hole=usedBodypart,loadSize=loadSize,knotted=knotSuccess,engulfed=true})
				satisfyGoals()
				if(knotSuccess):
					state = "knotting"
				else:
					state = "inside"
				
				if(!knotSuccess):
					condom.destroyMe()
					getSexEngine().saveCondomToLootIfPerk(condom)
					text += RNG.pick([
						" {dom.You} {dom.youVerb('dispose')} of the used condom.",
					])
				
				return {text=text}
		
		getDom().cummedInBodypartByAdvanced(usedBodypart, subID, {knotted=knotSuccess,condomBroke=condomBroke,engulfed=true})
		subInfo.cum()
		
		satisfyGoals()
		if(knotSuccess):
			state = "knotting"
			domInfo.addArousalSex(0.05)
		else:
			state = "inside"
			domInfo.addArousalSex(0.02)

		return {text=text}
	if(_id == "makesubcumoutside"):
		var text = RNG.pick([
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
					" {sub.You} "+RNG.pick(["{sub.youVerb('fill')}", "{sub.youVerb('stuff')}"])+" {sub.yourHis} condom! {dom.You} {dom.youVerb('dispose')} of it.",
				])
				condom.destroyMe()
				getSexEngine().saveCondomToLootIfPerk(condom)
				getSub().cumInItem(condom)
				subInfo.cum()
				satisfyGoals()
				
				return {text=text}
		
		text += RNG.pick([
			" {sub.You} [b]{sub.youVerb('cum')} all over {sub.yourself}[/b]! Strings of {sub.yourHis} own "+RNG.pick(["cum", "seed", "semen"])+" land on {sub.yourHis} chest, leaving a mess.",
		])
		
		getSub().cummedOnBy(subID, FluidSource.Penis)
		subInfo.cum()
		satisfyGoals()

		return {text=text}
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
			return {text = text}
		else:
			var text = RNG.pick([
				"{dom.You} {dom.youVerb('try', 'tries')} to "+RNG.pick(["pull", "yank"])+" {sub.yourHis} "+RNG.pick(["cock", "dick"])+" out but {dom.youVerb('fail')}. The knot inside {dom.youHim} slowly deflates.",
			])
			getDom().gotOrificeStretchedBy(usedBodypart, subID, 0.1)
			affectSub(subInfo.fetishScore({fetishGiving: 1.0}), 0.1, -0.3, 0.0)
			affectDom(domInfo.fetishScore({fetishReceiving: 1.0}), 0.1, -0.05)
			subInfo.addArousalForeplay(0.1)
			domInfo.addArousalForeplay(0.1)
			return {text = text}
	if(_id == "rub"):
		affectSub(subInfo.fetishScore({fetishGiving: 1.0}), 0.1 * subSensetivity(), 0.0, 0.0)
		affectDom(domInfo.fetishScore({fetishReceiving: 1.0}), 0.1, -0.01)
		subInfo.addArousalForeplay(0.05 * subSensetivity())
		domInfo.addArousalForeplay(0.05)
		
		return {text = "{dom.You} {dom.youVerb('rub')} {dom.yourHis} "+RNG.pick(usedBodypartNames)+" against {sub.yourHis} "+getDickName()+".",}
	if(_id == "envelop"):
		if(!RNG.chance(getDom().getPenetrateChanceBy(usedBodypart, subID))):
			getDom().gotOrificeStretchedBy(usedBodypart, subID, 0.1)
			affectSub(subInfo.fetishScore({fetishGiving: 1.0}), 0.1 * subSensetivity(), 0.0, 0.0)
			affectDom(domInfo.fetishScore({fetishReceiving: 1.0}), 0.2, -0.01)
			return {text="{dom.You} {dom.youVerb('try', 'tries')} to envelop {sub.yourHis} "+getDickName()+" but it's too big!"}
		
		sendSexEvent(SexEvent.HolePenetrated, subID, domID, {hole=usedBodypart,engulfed=true,strapon=isStraponSex()})
		affectSub(subInfo.fetishScore({fetishGiving: 1.0}), 0.1 * subSensetivity(), 0.0, 0.0)
		affectDom(domInfo.fetishScore({fetishReceiving: 1.0}), 0.1, -0.01)
		subInfo.stimulateArousalZone(0.1, BodypartSlot.Penis, 0.5)
		domInfo.stimulateArousalZone(0.1, usedBodypart, 0.5)
		
		#getSub().gotFuckedBy(usedBodypart, domID)
		getDom().gotOrificeStretchedBy(usedBodypart, subID, 0.2)
		#gonnaCumOutside = false
		state = "fucking"
		return {text = "{dom.You} {dom.youVerb('envelop')} {sub.youHis} "+getDickName()+", letting it penetrate {dom.yourHis} "+RNG.pick(usedBodypartNames)+"."}

	if(_id == "slowdown"):
		state = "inside"
		
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('stop')} riding that "+getDickName()+" and just {dom.youVerb('let')} it stay inside.",
		])
		return {text = text}

	if(_id == "moan"):
		var moanText = RNG.pick([
			"{dom.youVerb('moan')}"
		])
		if(getDom().isGagged()):
			moanText = RNG.pick([
				"{dom.youVerb('let')} out muffled moans",
			])
		
		var text = RNG.pick([
			"{dom.You} "+moanText+" while being fucked!",
			"{dom.You} "+moanText+" while riding {sub.youHim} with {dom.yourHis} "+RNG.pick(usedBodypartNames)+"!",
			"{dom.You} "+moanText+" eagerly!",
		])
		affectSub(subInfo.fetishScore({fetishGiving: 1.0}), 0.03 * subSensetivity(), -0.01, -0.0)
		affectDom(domInfo.fetishScore({fetishReceiving: 1.0}), 0.05, -0.03)
		return {text = text}



func getSubActions():
	var actions = []
	if(state in [""]):
		actions.append({
			"id": "rub",
			"score": subInfo.getComplyScore()/2.0,
			"name": "Tease",
			"desc": "Rub your dick against their "+RNG.pick(usedBodypartNames),
		})

	if(state in ["fucking"]):
		if(subInfo.isReadyToCum() && isHandlingSubOrgasms() && isStraponSex()):
			actions.append({
				"id": "subcumstrapon",
				"score": 1.0,
				"name": "Cum!",
				"desc": "You're about to cum",
				"priority": 1001,
			})
		
		if(subInfo.isReadyToCum() && isHandlingSubOrgasms() && !isStraponSex()):
			actions.append({
				"id": "warndom",
				"score": 1.0,
				"name": "Warn them",
				"desc": "Let them know that you're about to cum",
				"priority": 1001,
			})
			actions.append({
				"id": "cuminside",
				"score": subInfo.getResistScore() + subInfo.fetishScore({Fetish.Breeding: 0.5}),
				"name": "Cum inside",
				"desc": "Cum inside their "+RNG.pick(usedBodypartNames),
				"priority": 1001,
			})
		actions.append({
				"id": "moan",
				"score": max(0.1, subInfo.fetishScore({fetishGiving: 0.5}) + subInfo.personalityScore({PersonalityStat.Subby: 0.5})),
				"name": "Moan",
				"desc": "Show how much you like it",
			})
		
	if(state in ["fucking", "", "inside"]):
		actions.append({
			"id": "throwoff",
			"score": subInfo.getResistScore(),
			"name": "Throw them off",
			"desc": "Resist their attempts to ride you",
			"chance": getSubResistChance(30.0, 25.0),
		})

	
	return actions

func getSubResistChance(baseChance, domAngerRemoval):
	var theChance = baseChance - domInfo.getAngerScore()*domAngerRemoval
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

func doSubAction(_id, _actionInfo):
	if(_id == "subcumstrapon"):
		getSub().cumOnFloor(domID)
		subInfo.cum()
		return getGenericSubOrgasmData()
	
	if(_id == "moan"):
		var moanText = RNG.pick([
			"{sub.youVerb('moan')}"
		])
		if(getSub().isGagged()):
			moanText = RNG.pick([
				"{sub.youVerb('let')} out muffled moans",
				"{sub.youVerb('let')} out a muffled moan",
				"{sub.youVerb('let')} out a muffled noise of pleasure",
			])
		
		var text = RNG.pick([
			"{sub.You} "+moanText+" while {dom.you} {dom.youVerb('ride')} {sub.youHim}!",
			"{sub.You} "+moanText+" while {sub.yourHis} "+getDickName()+" is used by {dom.you}!",
			"{sub.You} "+moanText+" eagerly!",
		])
		domInfo.addAnger(-0.02)
		domInfo.addLust(5)
		return {text = text}
	if(_id == "throwoff"):
		if(getSubResistChance(30.0, 25.0)):
			if(state != ""):
				state = ""
				isMakingOut = false
			else:
				endActivity()
			
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('manage')} to throw {dom.youHim} away from {sub.yourHis} "+getDickName()+".",
			])
			domInfo.addAnger(0.3)
			return {text = text, subSay=subReaction(SexReaction.ActivelyResisting, 50)}
		else:
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('try', 'tries')} to resist and "+RNG.pick(["shove", "push", "throw"])+" {dom.you} off but {sub.youVerb('fail')}.",
			])
			domInfo.addAnger(0.1)
			return {text = text, subSay=subReaction(SexReaction.ActivelyResisting, 50)}
	
	if(_id == "rub"):
		affectSub(subInfo.fetishScore({fetishGiving: 1.0}), 0.05 * subSensetivity(), -0.1, 0.0)
		affectDom(max(0.1, domInfo.fetishScore({fetishReceiving: 1.0})+1.0), 0.05, 0.0)
		
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('rub')} {sub.yourHis} "+getDickName()+" against {dom.your} "+RNG.pick(usedBodypartNames)+".",
		])
		return {text=text}

	if(_id == "warndom"):
		state = "subabouttocum"
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('warn')} {dom.youHim} that {sub.youHe} {sub.youAre} "+RNG.pick(["about to cum", "close", "very close"])+".",
		])
		domInfo.addAnger(-0.05)
		return {
			text = text,
			domSay = domReaction(SexReaction.WarnAboutToCum, 100),
			subSay = subReaction(SexReaction.WarnAboutToCum, 100),
			}
		
	if(_id == "cuminside"):
		var text = RNG.pick([
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
				subInfo.cum()
				domInfo.addArousalSex(0.02)
				sendSexEvent(SexEvent.FilledCondomInside, subID, domID, {hole=usedBodypart,loadSize=loadSize,knotted=false})
				satisfyGoals()
				state = "inside"
				
				return {text=text}
		
		var beingBredScore = domInfo.fetishScore({Fetish.BeingBred: 1.0})
		if(beingBredScore < 0.0):
			domInfo.addAnger(1.0)
			text += RNG.pick([
				" {dom.You} {dom.youAre} furious!",
			])
			domInfo.addFrustration(1.0)
		else:
			domInfo.addAnger(0.3)
		getDom().cummedInBodypartByAdvanced(usedBodypart, subID, {condomBroke=condomBroke})
		subInfo.cum()
		domInfo.addArousalSex(0.02)
		satisfyGoals()
		state = "inside"

		return {text=text}

func inside_domActions():
	var actions = []
	
	if(getDom().getFirstItemThatCoversBodypart(usedBodypart) == null && getSub().getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null && subInfo.isReadyToPenetrate()):
		actions.append({
				"id": "ridemore",
				"score": (0.0 if getSub().isZoneOverstimulated(BodypartSlot.Penis) else 0.25) - getStopScore(),
				"name": "Ride more",
				"desc": "Continue riding this "+getDickName("cock")+".",
			})
	
	return actions

func inside_doDomAction(_id, _actionInfo):
	if(_id == "ridemore"):
		getDom().gotOrificeStretchedBy(usedBodypart, subID, 0.2)
		#gonnaCumOutside = false
		state = "fucking"
		return {text = "{dom.You} {dom.youVerb('continue')} to ride {sub.youHis} "+getDickName()+" with {dom.yourHis} "+RNG.pick(usedBodypartNames)+"."}


func getAnimation():
	var shouldUncon = subInfo.isUnconscious()
	
	if(getSexType() == SexType.SlutwallSex):
		if(state in [""]):
			return [StageScene.SlutwallRide, "tease", {pc=subID, npc=domID}]
		if(state in ["knotting", "inside"]):
			return [StageScene.SlutwallRide, "inside", {pc=subID, npc=domID}]
		if(subInfo.isCloseToCumming() || (isStraponSex() && domInfo.isCloseToCumming())):
			return [StageScene.SlutwallRide, "fast", {pc=subID, npc=domID}]
		return [StageScene.SlutwallRide, "sex", {pc=subID, npc=domID}]
	
	var animToPlay = StageScene.SexCowgirl
	if(PoseToAnimName.has(currentPose)):
		animToPlay = PoseToAnimName[currentPose]
	var pcPoseID:String=subID
	var npcPoseID:String=domID
	if(currentPose == POSE_LOTUS):
		pcPoseID = domID
		npcPoseID = subID
	
	if(state in [""]):
		return [animToPlay, "tease", {pc=pcPoseID, npc=npcPoseID, uncon=shouldUncon}]
	if(state in ["knotting", "inside"]):
		return [animToPlay, "inside", {pc=pcPoseID, npc=npcPoseID, uncon=shouldUncon}]
	if(subInfo.isCloseToCumming() || (isStraponSex() && domInfo.isCloseToCumming())):
		if(currentPose == POSE_REVERSECOWGIRL):
			shouldUncon = false
		return [animToPlay, "fast", {pc=pcPoseID, npc=npcPoseID, uncon=shouldUncon}]
	return [animToPlay, "sex", {pc=pcPoseID, npc=npcPoseID, uncon=shouldUncon}]

func getDomSwitchHoleChance():
	if(domInfo.hasMemory("switchedHoles")):
		return 0.0
	
	var domLikesOtherHoleScore = domInfo.fetishScore({otherHoleFetishGiving:1.0, fetishGiving: -0.5})
	
	return max(5.0, domLikesOtherHoleScore * 100.0 * (1.0 - domInfo.getAngerScore()))

func getDomOrgasmHandlePriority():
	if(isStraponSex()):
		return 10
	return 5

func getSubOrgasmHandlePriority():
	if(isStraponSex()):
		return 5
	return 10

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
