extends SexActivityBase
var times:int = 0
var gonnaCumOutside:bool = false

var usedBodypart:String = BodypartSlot.Vagina
var usedTag:int = SexActivityTag.VaginaUsed
var usedTagInside:int = SexActivityTag.VaginaPenetrated
var fetishGiving:String = Fetish.VaginalSexGiving
var fetishReceiving:String = Fetish.VaginalSexReceiving
var usedBodypartNames:Array = ["pussy", "pussy", "slit", "cunt", "kitty"]
var switchHoleActivity:String = "SexAnalOnAllFours"
var otherHoleNames:Array = ["anus"]
var otherHoleBodypart:String = BodypartSlot.Anus
var otherHoleTag:int = SexActivityTag.AnusUsed
var otherHoleFetishGiving:String = Fetish.AnalSexGiving
var otherHoleFetishReceiving:String = Fetish.AnalSexReceiving
var otherGoal:String = SexGoal.FuckAnal
var aboutToPenetrateReaction:int = SexReaction.AboutToPenetratePussy
var sexReactionPullOut:int = SexReaction.BeggingToPullOutVaginal
var currentPose:String = ""
var switchedPoseOnce:bool = false
var isVag:bool = true
var straponTimer:int = 0

func _init():
	id = "SexVaginalOnAllFours"
	
	activityName = "Vaginal"
	activityDesc = "Fuck their pussy!"
	activityCategory = ["Fuck"]

func getGoals():
	if(currentPose == POSE_CHOKEFUCK):
		return {
			SexGoal.ChokeSexVaginal: 1.0,
			SexGoal.FuckVaginal: 1.0,
			SexGoal.StraponVaginal: 1.0,
		}
	
	return {
		SexGoal.FuckVaginal: 1.0,
		SexGoal.StraponVaginal: 1.0,
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		SexType.StocksSex: true,
		SexType.SlutwallSex: true,
	}

func isStocksSex() -> bool:
	return getSexType() == SexType.StocksSex

func getPoseDescriptor() -> String:
	if(getSexType() == SexType.StocksSex):
		return " in stocks"
	if(getSexType() == SexType.SlutwallSex):
		return " in the slutwall"
	if(currentPose == POSE_ALLFOURS):
		return " on all fours"
	if(currentPose == POSE_FULLNELSON):
		return " in a full nelson pose"
	if(currentPose == POSE_MISSONARY):
		return " in a missionary pose"
	if(currentPose == POSE_STANDING):
		return " standing"
	if(currentPose == POSE_CHOKEFUCK):
		return " while also choking"
	if(currentPose == POSE_BEHIND):
		return " in a behind pose"
	if(currentPose == POSE_MATINGPRESS):
		return " in a mating press"
	if(currentPose == POSE_LOWDOGGY):
		return " on all fours"
	if(currentPose == POSE_LEGRAISED):
		return " with one leg raised"
	if(currentPose == POSE_AGAINSTWALL):
		return " against a wall"
	if(currentPose == POSE_PINNEDWALL):
		return " pinned against a wall"
	if(currentPose == POSE_WALLPRESS):
		return " pinned against a wall"
	return " [color=red]FIX DESCRIPTOR[/color]"

const POSE_DEFAULT = "POSE_DEFAULT"
const POSE_ALLFOURS = "POSE_ALLFOURS"
const POSE_STANDING = "POSE_STANDING"
const POSE_MISSONARY = "POSE_MISSONARY"
const POSE_FULLNELSON = "POSE_FULLNELSON"
const POSE_CHOKEFUCK = "POSE_CHOKEFUCK"
const POSE_BEHIND = "POSE_BEHIND"
const POSE_MATINGPRESS = "POSE_MATINGPRESS"
const POSE_LOWDOGGY = "POSE_LOWDOGGY"
const POSE_LEGRAISED = "POSE_LEGRAISED"
const POSE_AGAINSTWALL = "POSE_AGAINSTWALL"
const POSE_PINNEDWALL = "POSE_PINNEDWALL"
const POSE_WALLPRESS = "POSE_WALLPRESS"


const PoseToName = {
	POSE_DEFAULT: "Default",
	POSE_ALLFOURS: "All Fours",
	POSE_STANDING: "Standing",
	POSE_MISSONARY: "Missonary",
	POSE_FULLNELSON: "Full Nelson",
	POSE_CHOKEFUCK: "Choke fuck",
	POSE_BEHIND: "Behind",
	POSE_MATINGPRESS: "Mating Press",
	POSE_LOWDOGGY: "Low Doggy",
	POSE_LEGRAISED: "Raised leg",
	POSE_AGAINSTWALL: "Against a wall",
	POSE_PINNEDWALL: "Pinned into wall",
	POSE_WALLPRESS: "Wall Press",
}
const PoseToAnimName = {
	POSE_DEFAULT: StageScene.SexAllFours,
	POSE_ALLFOURS: StageScene.SexAllFours,
	POSE_STANDING: StageScene.SexFreeStanding,
	POSE_MISSONARY: StageScene.SexMissionary,
	POSE_FULLNELSON: StageScene.SexFullNelson,
	POSE_CHOKEFUCK: StageScene.Choking,
	POSE_BEHIND: StageScene.SexBehind,
	POSE_MATINGPRESS: StageScene.SexMatingPress,
	POSE_LOWDOGGY: StageScene.SexLowDoggy,
	POSE_LEGRAISED: StageScene.SexPawLick,
	POSE_AGAINSTWALL: StageScene.SexStanding,
	POSE_PINNEDWALL: StageScene.SexPinnedBehind,
	POSE_WALLPRESS: StageScene.SexAgainstWall,
}
func getAvaiablePoses() -> Array:
	if(currentPose == POSE_CHOKEFUCK):
		return [POSE_CHOKEFUCK]
	
	if(getSexType() == SexType.DefaultSex):
		if(getSubInfo().isUnconscious()):
			var possible:= [POSE_ALLFOURS, POSE_MISSONARY, POSE_FULLNELSON, POSE_BEHIND, POSE_MATINGPRESS, POSE_LOWDOGGY]
		
			if(getSexEngine() != null && getSexEngine().hasWallsNearby()):
				possible.append(POSE_WALLPRESS)
		
			return possible
		else:
			var possible:= [POSE_ALLFOURS, POSE_STANDING, POSE_MISSONARY, POSE_FULLNELSON, POSE_BEHIND, POSE_MATINGPRESS, POSE_LEGRAISED, POSE_LOWDOGGY]
			
			if(getSexEngine() != null && getSexEngine().hasWallsNearby()):
				possible.append(POSE_AGAINSTWALL)
				possible.append(POSE_PINNEDWALL)
				possible.append(POSE_WALLPRESS)
			
			return possible
	
	return [POSE_DEFAULT]

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(!_domInfo.getChar().hasReachablePenis() && !_domInfo.getChar().isWearingStrapon()):
		return false
	if(usedBodypart == BodypartSlot.Vagina && !_subInfo.getChar().hasReachableVagina()):
		return false
	if(usedBodypart == BodypartSlot.Anus && !_subInfo.getChar().hasReachableAnus()):
		return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func isActivityImpossibleShouldStop() -> bool:
	if(!getDom().hasReachablePenis() && !getDom().isWearingStrapon()):
		return true
	if(usedBodypart == BodypartSlot.Vagina && !getSub().hasReachableVagina()):
		return true
	if(usedBodypart == BodypartSlot.Anus && !getSub().hasReachableAnus()):
		return true
		
	return false

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		if(state in ["fucking", "aftercumminginside", "knotting"]):
			return [SexActivityTag.PenisUsed, SexActivityTag.PenisInside, SexActivityTag.HavingSex]
		return [SexActivityTag.PenisUsed, SexActivityTag.HavingSex]
	if(_indx == SUB_0):
		var thetags:Array = [usedTag, SexActivityTag.PreventsSubViolence, SexActivityTag.PreventsSubTeasing, SexActivityTag.HavingSex]
		if(state in ["fucking", "aftercumminginside", "knotting"]):
			thetags.append(usedTagInside)
		return thetags
	return []

func getCheckTagsDom() -> Array:
	return [SexActivityTag.OrderedToDoSomething, SexActivityTag.PenisUsed, SexActivityTag.HavingSex]

func getCheckTagsSub() -> Array:
	return [SexActivityTag.OrderedToDoSomething, usedTag, SexActivityTag.HavingSex]

func isStraponSex() -> bool:
	return getDom().isWearingStrapon()

func getDickName(dickName = null) -> String:
	if(isStraponSex()):
		return "strapon"
	if(dickName == null):
		return RNG.pick(["cock", "dick", "member"])
	return dickName

func getUsedBodypartName() -> String:
	var theName = RNG.pick(usedBodypartNames)
	if(usedBodypart == BodypartSlot.Vagina):
		theName = "{sub.pussyStretch} "+theName
	if(usedBodypart == BodypartSlot.Anus):
		theName = "{sub.anusStretch} "+theName
	
	if(getSub().getLustLevel() > 0.6):
		if(usedBodypart == BodypartSlot.Vagina):
			theName = RNG.pick(["needy", "awaiting", "inviting"])+" "+theName
		if(usedBodypart == BodypartSlot.Anus):
			theName = RNG.pick(["needy", "awaiting", "drippy", "inviting", "wet", "slick", "aroused"])+" "+theName
	elif(getSub().getLustLevel() < 0.1 && RNG.chance(50)):
		if(usedBodypart == BodypartSlot.Vagina):
			theName = RNG.pick(["dry"])+" "+theName
		if(usedBodypart == BodypartSlot.Anus):
			theName = RNG.pick(["dry"])+" "+theName
	return theName

func getStartTextForPose(thePose) -> String:
	var throughClothing = "."
	if(!hasBodypartUncovered(SUB_0, usedBodypart)):
		throughClothing = " through {sub.yourHis} clothing."
	
	var text:String = ""
	if(thePose == POSE_ALLFOURS):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('put')} {sub.you} on all fours and {dom.youVerb('position')} {dom.yourself} behind {sub.your} butt with {dom.yourHis} "+getDickName()+" out and {dom.youVerb('press', 'presses')} it against {sub.yourHis} "+getUsedBodypartName()+throughClothing,
		])
	elif(thePose == POSE_LOWDOGGY):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('put')} {sub.you} on all fours and {dom.youVerb('position')} {dom.yourself} behind {sub.your} butt with {dom.yourHis} "+getDickName()+" out and {dom.youVerb('press', 'presses')} it against {sub.yourHis} "+getUsedBodypartName()+throughClothing,
		])
	elif(thePose == POSE_STANDING):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('stand')} behind {sub.your} butt and {dom.youVerb('press', 'presses')} {dom.yourHis} "+getDickName()+" against {sub.yourHis} "+getUsedBodypartName()+throughClothing,
		])
	elif(thePose == POSE_MISSONARY):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('pin')} {sub.your} body against the floor, positioning {dom.yourself} between {sub.yourHis} legs. {dom.You} {dom.youVerb('align')} {dom.yourHis} "+getDickName()+" against {sub.yourHis} "+getUsedBodypartName()+".",
		])
	elif(thePose == POSE_FULLNELSON):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('wrap')} {dom.yourHis} arms under {sub.your} legs and {dom.youVerb('raise', 'raises')} {sub.youHim} above the floor, {dom.yourHis} hands locking {sub.yourHis} arms in a full nelson hold. {dom.YourHis} "+getDickName()+" is pressed against {sub.yourHis} "+getUsedBodypartName()+throughClothing,
		])
	elif(thePose == POSE_BEHIND):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('pin')} {sub.your} body against the floor, positioning {dom.yourself} behind. {dom.You} {dom.youVerb('align')} {dom.yourHis} "+getDickName()+" against {sub.yourHis} "+getUsedBodypartName()+".",
		])
	elif(thePose == POSE_MATINGPRESS):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('pin')} {sub.you} firmly against the floor in a mating press position, folding {sub.yourHis} legs up toward {sub.yourHis} shoulders. {dom.You} {dom.youVerb('press', 'presses')} {dom.yourself} close, aligning {dom.yourHis} "+getDickName()+" against {sub.yourHis} "+getUsedBodypartName()+throughClothing,
		])
	elif(thePose == POSE_LEGRAISED):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('lift')} one of {sub.yourHis} legs, letting it dangle near {dom.yourHis} face, while {dom.youVerb('press', 'presses')} {dom.yourself} close. {dom.YourHis} "+getDickName()+" rubs against {sub.yourHis} "+getUsedBodypartName()+throughClothing,
		])
	elif(thePose == POSE_AGAINSTWALL):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('press', 'presses')} {sub.you} firmly against the wall, {sub.yourHis} hands braced against it for support. {dom.You} {dom.youVerb('position')} {dom.yourself} behind, letting {dom.yourHis} "+getDickName()+" press against {sub.yourHis} "+getUsedBodypartName()+throughClothing,
		])
	elif(thePose == POSE_PINNEDWALL):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('pin')} {sub.you} against the wall, {sub.yourHis} hands instinctively reaching up to grab it for stability. {dom.You} {dom.youVerb('get')} a hold of one of {sub.yourHis} legs and {dom.youVerb('press', 'presses')} {dom.yourHis} "+getDickName()+" against {sub.yourHis} "+getUsedBodypartName()+throughClothing,
		])
	elif(thePose == POSE_WALLPRESS):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('pin')} {sub.you} firmly against the wall, legs raised high, {sub.yourHis} hands reaching out to grab {dom.yourHis} shoulders. {dom.You} {dom.youVerb('press', 'presses')} {dom.yourHis} "+getDickName()+" against {sub.yourHis} "+getUsedBodypartName()+throughClothing,
		])
	else:
		text = RNG.pick([
			"{dom.You} {dom.youVerb('position')} {dom.yourself} behind {sub.your} butt with {dom.yourHis} "+getDickName()+" out and {dom.youVerb('press', 'presses')} it against {sub.yourHis} "+getUsedBodypartName()+throughClothing,
		])
	return text
	
func getSwitchPoseTextForPose(thePose:String) -> String:
	var text:String = ""
	if(thePose == POSE_ALLFOURS):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('put')} {sub.you} on all fours and {dom.youVerb('position')} {dom.yourself} behind {sub.your} butt, {dom.yourHis} "+getDickName()+" still inside {sub.yourHis} "+getUsedBodypartName()+"!",
		])
	elif(thePose == POSE_LOWDOGGY):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('put')} {sub.you} on all fours and {dom.youVerb('position')} {dom.yourself} behind {sub.your} butt, {dom.yourHis} "+getDickName()+" still inside {sub.yourHis} "+getUsedBodypartName()+"!",
		])
	elif(thePose == POSE_STANDING):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('pick')} {sub.you} up, making {sub.youHim} stand on {sub.yourHis} feet. {dom.YourHis} "+getDickName()+" is still inside {sub.yourHis} "+getUsedBodypartName()+"!",
		])
	elif(thePose == POSE_MISSONARY):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('pin')} {sub.your} body against the floor, {dom.yourHis} "+getDickName()+" is still inside {sub.yourHis} "+getUsedBodypartName()+"!",
		])
	elif(thePose == POSE_FULLNELSON):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('wrap')} {dom.yourHis} arms under {sub.your} legs and {dom.youVerb('raise', 'raises')} {sub.youHim} above the floor, {dom.yourHis} hands locking {sub.yourHis} arms in a full nelson hold. {dom.YourHis} "+getDickName()+" is still inside {sub.yourHis} "+getUsedBodypartName()+"!",
		])
	elif(thePose == POSE_BEHIND):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('pin')} {sub.your} body against the floor, {dom.yourHis} "+getDickName()+" is still inside {sub.yourHis} "+getUsedBodypartName()+"!",
		])
	elif(thePose == POSE_MATINGPRESS):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('pin')} {sub.you} firmly against the floor in a mating press position, folding {sub.yourHis} legs up toward {sub.yourHis} shoulders. {dom.YourHis} "+getDickName()+" is still inside {sub.yourHis} "+getUsedBodypartName()+"!",
		])
	elif(thePose == POSE_LEGRAISED):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('lift')} one of {sub.yourHis} legs, letting it dangle near {dom.yourHis} face, while {dom.youVerb('press', 'presses')} {dom.yourself} close. {dom.YourHis} "+getDickName()+" is still inside {sub.yourHis} "+getUsedBodypartName()+"!",
		])
	elif(thePose == POSE_AGAINSTWALL):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('press', 'presses')} {sub.you} firmly against the wall, {sub.yourHis} hands braced against it for support. {dom.You} {dom.youVerb('position')} {dom.yourself} behind, {dom.yourHis} "+getDickName()+" is still inside {sub.yourHis} "+getUsedBodypartName()+"!",
		])
	elif(thePose == POSE_PINNEDWALL):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('pin')} {sub.you} against the wall, {sub.yourHis} hands instinctively reaching up to grab it for stability. {dom.YourHis} "+getDickName()+" is still inside {sub.yourHis} "+getUsedBodypartName()+"!",
		])
	elif(thePose == POSE_WALLPRESS):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('pin')} {sub.you} firmly against the wall, legs raised high, {sub.yourHis} hands reaching out to grab {dom.yourHis} shoulders. {dom.YourHis} "+getDickName()+" is still inside {sub.yourHis} "+getUsedBodypartName()+"!",
		])
	else:
		text = RNG.pick([
			"{dom.You} {dom.youVerb('position')} {dom.yourself} behind {sub.your} butt, {dom.yourHis} "+getDickName()+" is still inside {sub.yourHis} "+getUsedBodypartName()+"!",
		])
	return text
	
func startActivity(_args):
	currentPose = RNG.pick(getAvaiablePoses())
	
	addText(getStartTextForPose(currentPose))
	react(aboutToPenetrateReaction, [50, 50])

func onSwitchFrom(_otherActivity, _args):
	if(_args != null && _args == ["choke"]):
		currentPose = POSE_CHOKEFUCK
		return
	currentPose = RNG.pick(getAvaiablePoses())

func processTurn():
	if(currentPose == POSE_CHOKEFUCK):
		choke(DOM_0, SUB_0, CHOKE_GENTLE)
	
func knotting_processTurn():
	cockWarmer(SUB_0, DOM_0, usedBodypart, true)

func fucking_processTurn():
	times += 1
	stimulateSex(DOM_0, SUB_0, usedBodypart, I_NORMAL)

	doProcessFuck(DOM_0, SUB_0, usedBodypart, getPoseDescriptor())
	
	if(currentPose == POSE_STANDING && getSubInfo().isUnconscious()):
		currentPose = POSE_ALLFOURS
		addText("Unable to continue standing, {sub.you} {sub.youVerb('fall')} to all fours!")
	
	doProcessFuckExtra(DOM_0, SUB_0, usedBodypart)
	
	if(isStraponSex() && !getSub().canZoneOrgasm(usedBodypart)): # If sub can't cum, just have some fun
		straponTimer += 1
		if(straponTimer > 5 && RNG.chance(5.0*straponTimer)):
			satisfyGoals()

func getActions(_indx:int):
	if(_indx == DOM_0):
		if(state in [""]):
			addAction("rub", 1.0, "Rub", "Rub your "+getDickName()+" against their "+RNG.pick(usedBodypartNames))
			if(getDomInfo().isReadyToPenetrate() && getSubInfo().getChar().getFirstItemThatCoversBodypart(usedBodypart) == null && getDomInfo().getChar().getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
				addAction("insert", 1.0, "Penetrate", "Try to insert your "+getDickName()+" into their "+RNG.pick(usedBodypartNames))
			if(getSubInfo().getChar().hasBodypart(otherHoleBodypart) && !getSexEngine().hasTag(getSubID(), otherHoleTag)):
				var switchholeScore:float = 5.0 * (-getDomInfo().goalsScore(getGoals(), getSubID()) + getDomInfo().goalsScore({otherGoal: 1.0}, getSubID()))
				addAction("switchhole", switchholeScore, "Switch hole", "Switch to the sub's "+RNG.pick(otherHoleNames))
			addAction("stop", getStopScore(), "Stop fuck", "Stop fucking")
		if(state in ["fucking"]):
			addAction("slowdown", getPauseSexScore(DOM_0, SUB_0, usedBodypart), "Slow down", "Stop fucking for a second..")
			
			if(isStraponSex() && getDom().bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisKnot)):
				var subArousal:float = getSubInfo().getArousal()
				var straponForceKnotScore:float = 0.05
				if(subArousal > 0.8 || getSubInfo().isUnconscious()):
					straponForceKnotScore = 0.5
				addAction("straponForceKnot", straponForceKnotScore, "Force knot in", "Try to force the knot in!")
			if(isReadyToCumHandled(DOM_0) && isStraponSex()):
				addAction("domstraponcum", 1.0, "Cum!", "You're about to cum!", {A_PRIORITY: 1001})
			if(isReadyToCumHandled(DOM_0) && !isStraponSex()):
				var condomScore:float = 0.0
				if(getDomCondom() != null):
					condomScore = 1.0
				
				var scoreToCumInside:float = max(condomScore, getDomInfo().fetishScore({Fetish.Breeding: 1.0}) + 0.5 - 20.0*float(gonnaCumOutside))
				if(getSub().hasPerk(Perk.FertilitySubmissiveAndBreedable)):
					scoreToCumInside = 1.0
				
				var hasKnot:bool = getDom().bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisKnot)
				if(hasKnot):
					var knotinsideScore:float = scoreToCumInside * (3.0 if getSub().hasPerk(Perk.CumUniqueBiology) else 1.0)
					addAction("knotinside", knotinsideScore, "Knot them", "Try to knot their "+RNG.pick(usedBodypartNames), {A_PRIORITY: 1001})
					
				addAction("cuminside", scoreToCumInside, "Cum inside", "Cum inside their "+RNG.pick(usedBodypartNames), {A_PRIORITY: 1001})
				addAction("cumpullout", 1.0 - min(1.0, scoreToCumInside), "Pull out", "Cum on their butt", {A_PRIORITY: 1001})
			elif(isReadyToCumHandled(SUB_0) && !getSubInfo().canDoActions()):
				addAction("subcumDom", 1.0, "Sub's orgasm", "They are about to cum!", {A_PRIORITY: 1001})

		if(state in ["aftercumminginside"]):
			addAction("continuefucking", getContinueSexScore(DOM_0, SUB_0, usedBodypart) - getStopScore(), "Continue fucking", "Continue fucking their "+RNG.pick(usedBodypartNames))
		if(state in ["aftercumminginside", "fucking"]):
			if(!getDomInfo().isReadyToCum()):
				addAction("pullout", getStopScore(), "Pull out", "Pull your cock out and stop fucking them")
		if(state in ["knotting"]):
			addAction("pullknotout", 1.0, "Pull out", "Try to yank your knot out")
		for pose in getAvaiablePoses():
			if(pose == currentPose):
				continue
			var poseName = "error"
			if(PoseToName.has(pose)):
				poseName = PoseToName[pose]
			addAction("switchpose", 0.0 if switchedPoseOnce else 0.01, poseName, "Change pose", {A_CATEGORY: ["Switch pose"], A_ARGS: [pose]})
		
	if(_indx == SUB_0):
		if(state == ""):
			var rubSubScore:float = getSubInfo().getComplyScore() * fetish(SUB_0, fetishReceiving)
			addAction("rubSub", rubSubScore, "Rub", "Rub your "+RNG.pick(usedBodypartNames)+" against their cock")
			addAction("resist", getSubInfo().getResistScore() / 2.0, RNG.pick(["Pull away"]), "Resist the attempts", {A_CHANCE: getSubResistChance(30.0, 25.0)})
			if(getSubInfo().getChar().getFirstItemThatCoversBodypart(usedBodypart) == null && getDom().getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null && getDomInfo().isReadyToPenetrate()):
				addAction("envelop", fetish(SUB_0, fetishReceiving), RNG.pick(["Envelop cock"]), "Try to get this cock inside you")
			if(getSubInfo().getChar().hasBodypart(otherHoleBodypart) && !getSexEngine().hasTag(getSubID(), otherHoleTag)):
				var offerotherholeScore:float = min(0.2, getSubInfo().fetishScore({fetishReceiving: -1.0}) + getSubInfo().fetishScore({otherHoleFetishReceiving: 1.0}))
				addAction("offerotherhole", offerotherholeScore, "Offer "+RNG.pick(otherHoleNames)+" instead", "Offer your other hole", {A_CHANCE: getDomSwitchHoleChance()})
		if(state in ["fucking"]):
			var moanScore:float = max(0.1, fetish(SUB_0, fetishReceiving)*0.5 + personality(SUB_0, PersonalityStat.Subby)*0.5)
			addAction("moan", moanScore, "Moan", "Show how much you like it")
			addAction("resistduringfuck", getSubInfo().getResistScore() / 2.0, "Resist", "Try to stop them!", {A_CHANCE: getSubResistChance(20.0, 15.0)})
			if(getDomInfo().isCloseToCumming() && !isStraponSex()):
				var begtopulloutScore:float = (getResistScore(SUB_0) / 2.0 - getSubInfo().fetishScore({Fetish.BeingBred: 1.0})) / 3.0
				addAction("begtopullout", begtopulloutScore, "Beg to pull out", "Ask them not to cum inside you", {A_CHANCE: 10 - 10 * getDomInfo().fetishScore({Fetish.Breeding: 1.0})})
		if(state in ["fucking", "knotting"]):
			if(isReadyToCumHandled(SUB_0)):
				addAction("subcum", 1.0, "Cum!", "You're about to cum!", {A_PRIORITY: 1001})
		
func doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "straponForceKnot"):
		# Need a tryKnot func?
		#if(tryPenetrate())
		stimulateSex(DOM_0, SUB_0, usedBodypart, I_NORMAL, SPEED_SLOW)
		#var subArousal:float = getSubInfo().getArousal()
		if(RNG.chance(getSub().getKnottingChanceBy(usedBodypart, getDomID()) * 0.25)):
			getSub().gotOrificeStretchedBy(usedBodypart, getDomID(), true, 0.2)
			addTextTopBottom(RNG.pick([
				#"{dom.You} {dom.youVerb('manage')} to knot {sub.you}!",
				"{<TOP>.You} "+RNG.pick(["{<TOP>.youVerb('ram')}", "{<TOP>.youVerb('shove')}", "{<TOP>.youVerb('slide')}"])+" {<TOP>.yourHis} {<TOP>.penisShort} deep inside {<BOTTOM>.your} "+getNameHole(SUB_0, usedBodypart)+" and force the knot in, stretching {<BOTTOM>.yourHis} "+getNameHole(SUB_0, usedBodypart)+" wide!",
				"{<TOP>.You} {<TOP>.youVerb('manage')} to force {<TOP>.yourHis} knot in, stretching {<BOTTOM>.you} out!",
				"{<TOP>.You} "+RNG.pick(["{<TOP>.youVerb('ram')}", "{<TOP>.youVerb('shove')}", "{<TOP>.youVerb('slide')}"])+" {<TOP>.yourHis} {<TOP>.penisShort} balls-deep. The knot stretches {<BOTTOM>.your} "+getNameHole(SUB_0, usedBodypart)+" until finally slipping in.",
			]), DOM_0, SUB_0)
			state = "knotting"
			cumInside(DOM_0, SUB_0, usedBodypart)
			satisfyGoals()
		else:
			getSub().gotOrificeStretchedBy(usedBodypart, getDomID(), true, 0.1)
			addTextPick([
				"{dom.You} {dom.youVerb('try', 'tries')} to shove the knot inside!",
				"{dom.You} {dom.youVerb('try', 'tries')} to stretch {sub.yourHis} "+getNameHole(SUB_0, usedBodypart)+" enough to slip the knot inside!",
				"{dom.You} {dom.youVerb('try', 'tries')} to knot {sub.you}!",
			])
		return
	if(_id == "slowdown"):
		state = "aftercumminginside"
		addText("{dom.You} {dom.youVerb('slow')} {dom.yourHis} pace down and just {dom.youVerb('let')} {dom.yourHis} "+getDickName()+" stay inside.")
		return
	if(_id == "switchpose"):
		switchedPoseOnce = true
		var newPose = _action["args"][0]
		var isInside:bool = true
		if(state in [""]):
			isInside = false
		
		if(isInside):
			addText(getSwitchPoseTextForPose(newPose))
		else:
			addText(getStartTextForPose(newPose))
		currentPose = newPose
		return
	if(_id == "subcumDom"):
		var straponText:String = ""
		if(isStraponSex()):
			satisfyGoals()
			
			var strapon = getDom().getWornStrapon()
			if(strapon.getFluids() != null && !strapon.getFluids().isEmpty()):
				getSub().cummedInBodypartByAdvanced(usedBodypart, getDomID())
				straponText="{dom.Your} strapon gets squeezed by {sub.your} "+RNG.pick(usedBodypartNames)+" enough for it to suddenly [b]release its contents inside {sub.youHim}[/b]!"
			
		getSub().cumOnFloor(getDomID())
		getSubInfo().cum()
		addGenericOrgasmText(SUB_0)
		if(straponText != ""):
			addText(straponText)
		return
	if(_id == "domstraponcum"):
		getDom().cumOnFloor()
		getDomInfo().cum()
		addGenericOrgasmText(DOM_0)
		return
	if(_id == "rub"):
		stimulateSex(DOM_0, SUB_0, usedBodypart, I_TEASE)
		#affectSub(getSubInfo().fetishScore({fetishReceiving: 1.0}), 0.05, -0.1, 0.0)
		#affectDom(max(0.1, getDomInfo().fetishScore({fetishGiving: 1.0})+1.0), 0.05*domSensitivity(), 0.0)
		addText("{dom.You} {dom.youVerb('rub')} {dom.yourHis} "+getDickName()+" against {sub.your} "+RNG.pick(usedBodypartNames)+".")
		return
	if(_id == "insert"):
		if(RNG.chance(20)):
			stimulateSex(DOM_0, SUB_0, usedBodypart, I_TEASE)
			#affectSub(getSubInfo().fetishScore({fetishReceiving: 1.0}), 0.01, -0.1, 0.0)
			#affectDom(getDomInfo().fetishScore({fetishGiving: 1.0}), 0.01*domSensitivity(), 0.01)
			
			addTextPick([
				"{dom.You} {dom.youVerb('attempt')} to sink {dom.yourHis} "+getDickName()+" into {sub.your} "+RNG.pick(usedBodypartNames)+".",
				"{dom.You} {dom.youVerb('try','tries')} to penetrate {sub.your} "+RNG.pick(usedBodypartNames)+" with {dom.yourHis} "+getDickName()+".",
				"{dom.You} {dom.youVerb('rub')} {dom.yourHis} "+getDickName()+" against {sub.your} "+RNG.pick(usedBodypartNames)+", trying to sink it in.",
			])
			return
		else:
			# Cock len vs Vagina depth check here
			if(!RNG.chance(getSub().getPenetrateChanceBy(usedBodypart, getDomID()))):
				getSub().gotOrificeStretchedBy(usedBodypart, getDomID(), true, 0.1)
				addText("{dom.Your} "+getDickName()+" stretches {sub.your} "+RNG.pick(usedBodypartNames)+" out while trying to fit inside.")
				#affectSub(getSubInfo().fetishScore({fetishReceiving: 1.0}), 0.05, -0.2, -0.01)
				#affectDom(getDomInfo().fetishScore({fetishGiving: 1.0}), 0.05*domSensitivity(), -0.01)
				#getSubInfo().addArousalForeplay(0.05)
				#getDomInfo().addArousalForeplay(0.05*domSensitivity())
				stimulateSex(DOM_0, SUB_0, usedBodypart, I_TEASE)
				
				return
			else:
				sendSexEvent(SexEvent.HolePenetrated, DOM_0, SUB_0, {hole=usedBodypart,engulfed=false,strapon=isStraponSex()})
				gonnaCumOutside = false
				#getSub().gotFuckedBy(usedBodypart, getDomID())
				getSub().gotOrificeStretchedBy(usedBodypart, getDomID(), true, 0.2)
				state = "fucking"
				#affectSub(getSubInfo().fetishScore({fetishReceiving: 1.0}), 0.1, -0.3, 0.0)
				#affectDom(getDomInfo().fetishScore({fetishGiving: 1.0}), 0.1*domSensitivity(), -0.05)
				#getSubInfo().addArousalForeplay(0.1)
				#getDomInfo().addArousalForeplay(0.1*domSensitivity())
				stimulateSex(DOM_0, SUB_0, usedBodypart, I_LOW)
				var text:String = RNG.pick([
					"{dom.You} {dom.youVerb('manage','manages')} to penetrate {sub.your} "+RNG.pick(usedBodypartNames)+"!",
					"{dom.You} {dom.youVerb('shove','shoves')} {dom.yourHis} "+getDickName()+" inside {sub.your} "+RNG.pick(usedBodypartNames)+"!",
				])
				if(usedBodypart == BodypartSlot.Anus && getSub().getInventory().hasSlotEquipped(InventorySlot.Anal)):
					var item = getSub().getInventory().getEquippedItem(InventorySlot.Anal)
					text = "{dom.You} temporarily {dom.youVerb('retrieve')} "+str(item.getAStackName())+" out of {sub.your} ass. "+text
				elif(usedBodypart == BodypartSlot.Vagina && getSub().getInventory().hasSlotEquipped(InventorySlot.Vagina)):
					var item = getSub().getInventory().getEquippedItem(InventorySlot.Vagina)
					text = "{dom.You} temporarily {dom.youVerb('retrieve')} "+str(item.getAStackName())+" out of {sub.your} pussy. "+text
				
				addText(text)
				
				var freeRoom:float = getSub().getPenetrationFreeRoomBy(usedBodypart, getDomID())
				var chanceToPain = -freeRoom * 2.0
				if(RNG.chance(chanceToPain) || (getDomInfo().isAngry() && RNG.chance(20))):
					doStretch(DOM_0, SUB_0, usedBodypart)

				return
	if(_id == "switchhole"):
		switchCurrentActivityTo(switchHoleActivity)
		addText("{dom.You} {dom.youVerb('switch', 'switches')} holes. {dom.YouHe} {dom.youAre} "+RNG.pick(["prodding", "teasing", "rubbing"])+" {sub.your} "+RNG.pick(otherHoleNames)+" now.")
		return
	if(_id in ["knotinside", "cuminside"]):
		var cumData:Dictionary = doProcessCumInside(DOM_0, SUB_0, usedBodypart, (_id == "knotinside"))
		satisfyGoals()
		if(cumData.has("knotSuccess") && cumData["knotSuccess"]):
			state = "knotting"
		else:
			state = "aftercumminginside"
		applyTallymarkIfNeeded(usedBodypart)
		return
	if(_id == "cumpullout"):
		cumOnto(DOM_0, SUB_0, {sex=true})
		satisfyGoals()
		state = ""
		applyTallymarkIfNeeded(usedBodypart)
		return
	if(_id == "continuefucking"):
		gonnaCumOutside = false
		state = "fucking"
		var text:String = ""
		if(!getDom().isPlayer()):
			var randomNewPose = RNG.pick(getAvaiablePoses())
			if(currentPose != randomNewPose):
				currentPose = randomNewPose
				text = getSwitchPoseTextForPose(randomNewPose)+" "
		
		text += RNG.pick([
			"{dom.You} began moving {dom.yourHis} hips again, fucking {sub.your} "+RNG.pick(usedBodypartNames)+"!",
			"{dom.You} went for a second round, fucking {sub.your} "+RNG.pick(usedBodypartNames)+" again!",
		])
		addText(text)
		return
	if(_id == "pullknotout"):
		if(RNG.chance(30)):
			state = ""
			var text:String = RNG.pick([
				"{dom.You} "+RNG.pick(["{dom.youVerb('pull')}", "{dom.youVerb('yank')}"])+" {dom.yourHis} knot out.",
			])
			
			if((getSub().hasEffect(StatusEffect.HasCumInsideVagina) && usedBodypart == BodypartSlot.Vagina) || (getSub().hasEffect(StatusEffect.HasCumInsideAnus) && usedBodypart == BodypartSlot.Anus)):
				if((getSub().getBuffsHolder().hasBuff(Buff.BlocksVaginaLeakingBuff) && usedBodypart == BodypartSlot.Vagina) || (getSub().getBuffsHolder().hasBuff(Buff.BlocksAnusLeakingBuff) && usedBodypart == BodypartSlot.Anus)):
					text += RNG.pick([
						" Some "+RNG.pick(["cum", "seed", "semen"])+" tries to leak out but {dom.you} quickly {dom.youVerb('plug')} {sub.yourHis} "+RNG.pick(usedBodypartNames)+".",
					])
				else:	
					text += RNG.pick([
						" Some "+RNG.pick(["cum", "seed", "semen"])+" leaks out of {sub.yourHis} used "+RNG.pick(usedBodypartNames)+".",
					])
			stimulateSex(DOM_0, SUB_0, usedBodypart, I_NORMAL, SPEED_VERYSLOW)
			addText(text)
			return
		else:
			var text:String = RNG.pick([
				"{dom.You} {dom.youVerb('try', 'tries')} to "+RNG.pick(["pull", "yank"])+" {dom.yourHis} "+RNG.pick(["cock", "dick"])+" out but {dom.youVerb('fail')}. The knot slowly deflates.",
			])
			getSub().gotOrificeStretchedBy(usedBodypart, getDomID(), true, 0.1)
			#affectSub(getSubInfo().fetishScore({fetishReceiving: 1.0}), 0.1, -0.3, 0.0)
			#affectDom(getDomInfo().fetishScore({fetishGiving: 1.0}), 0.1, -0.05)
			#getSubInfo().addArousalForeplay(0.1)
			#getDomInfo().addArousalForeplay(0.1)
			stimulateSex(DOM_0, SUB_0, usedBodypart, I_TEASE)
			addText(text)
			return
	if(_id == "pullout"):
		endActivity()
		var text:String = RNG.pick([
			"{dom.You} {dom.youVerb('pull')} {dom.yourHis} "+getDickName()+" away.",
		])
		
		addText(text)
		return
	if(_id == "stop"):
		endActivity()
		addText("{dom.You} {dom.youVerb('stop')} the fuck.")
		return
	
	if(_id == "subcum"):
		var straponText:String = ""
		if(isStraponSex()):
			satisfyGoals()
			var strapon = getDom().getWornStrapon()
			if(strapon.getFluids() != null && !strapon.getFluids().isEmpty()):
				getSub().cummedInBodypartByAdvanced(usedBodypart, getDomID())
				straponText="{dom.Your} strapon gets squeezed by {sub.your} "+RNG.pick(usedBodypartNames)+" enough for it to suddenly [b]release its contents inside {sub.youHim}[/b]!"
		getSub().cumOnFloor(getDomID())
		getSubInfo().cum()
		addGenericOrgasmText(SUB_0)
		if(straponText != ""):
			addText(straponText)
		return
	if(_id == "rubSub"):
		#switchCurrentActivityTo("SexFuckTest2")
		getDomInfo().addAnger(-0.05)
		stimulateSexRide(SUB_0, DOM_0, usedBodypart, I_TEASE)
		#affectSub(getSubInfo().fetishScore({fetishReceiving: 1.0}), 0.1, 0.0, 0.0)
		#affectDom(getDomInfo().fetishScore({fetishGiving: 1.0}), 0.1*domSensitivity(), -0.01)
		#getSubInfo().addArousalForeplay(0.05)
		#getDomInfo().addArousalForeplay(0.05*domSensitivity())
		addText("{sub.You} {sub.youVerb('rub')} against {dom.youHim}.")
		return
	if(_id == "envelop"):
		if(!RNG.chance(getSub().getPenetrateChanceBy(usedBodypart, getDomID()))):
			getSub().gotOrificeStretchedBy(usedBodypart, getDomID(), true, 0.1)
			#affectSub(getSubInfo().fetishScore({fetishReceiving: 1.0}), 0.1, 0.0, 0.0)
			#affectDom(getDomInfo().fetishScore({fetishGiving: 1.0}), 0.2, -0.01)
			stimulateSexRide(SUB_0, DOM_0, usedBodypart, I_TEASE)
			addText("{sub.You} {sub.youVerb('try', 'tries')} to envelop {dom.yourHis} "+getDickName()+" but it's too big!")
			return
		
		sendSexEvent(SexEvent.HolePenetrated, DOM_0, SUB_0, {hole=usedBodypart,engulfed=true,strapon=isStraponSex()})
		#affectSub(getSubInfo().fetishScore({fetishReceiving: 1.0}), 0.1, 0.0, 0.0)
		#affectDom(getDomInfo().fetishScore({fetishGiving: 1.0}), 0.1*domSensitivity(), -0.01)
		#getSubInfo().stimulateArousalZone(0.1, usedBodypart, 0.5)
		#getDomInfo().stimulateArousalZone(0.1, BodypartSlot.Penis, 0.5)
		stimulateSexRide(SUB_0, DOM_0, usedBodypart, I_LOW)
		
		#getSub().gotFuckedBy(usedBodypart, getDomID())
		getSub().gotOrificeStretchedBy(usedBodypart, getDomID(), true, 0.2)
		gonnaCumOutside = false
		state = "fucking"
		addText("{sub.You} {sub.youVerb('engulf')} {dom.youHis} "+getDickName()+", letting it penetrate {sub.yourHis} "+RNG.pick(usedBodypartNames)+".")
		return
	if(_id == "offerotherhole"):
		var text:String = RNG.pick([
			"{sub.You} {sub.youVerb('offer')} {sub.yourHis} other hole to {dom.you}.",
		])
		if(getDom().isPlayer()):
			addText(text)
			return
		
		if(RNG.chance(getDomSwitchHoleChance())):
			text += RNG.pick([
				" {dom.You} {dom.youVerb('nod')}."
			])
			getDomInfo().remember("switchedHoles")
			
			if(usedBodypart == BodypartSlot.Vagina):
				replaceGoalsTo(SexGoal.FuckAnal)
			else:
				replaceGoalsTo(SexGoal.FuckVaginal)
			
			addText(text)
			return
		else:
			getDomInfo().addAnger(0.05)
			text += RNG.pick([
				" {dom.You} {dom.youVerb('ignore')} {sub.yourHis} offer."
			])
			
			addText(text)
			return
	if(_id == "resist"):
		var howMuchPainAdded:int = RNG.randi_range(2, 6)
		getDomInfo().addPain(howMuchPainAdded)
		sendSexEvent(SexEvent.PainInflicted, SUB_0, DOM_0, {pain=howMuchPainAdded,isDefense=true,intentional=true})
		if(RNG.chance(getSubResistChance(30.0, 25.0))):
			getDomInfo().addAnger(0.4)
			endActivity()
			addText("{sub.You} {sub.youVerb('manage')} to kick {dom.you} off of {sub.youHim}.")
			return
		else:
			getDomInfo().addAnger(0.2)
			addText("{sub.You} {sub.youVerb('resist')} attempts to penetrate {sub.youHis} "+RNG.pick(usedBodypartNames)+".")
			reactSub(SexReaction.ActivelyResisting, [50])
			return
	if(_id == "moan"):
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
			"{sub.You} "+moanText+" while being fucked"+getPoseDescriptor()+"!",
			"{sub.You} "+moanText+" while having {sub.yourHis} "+RNG.pick(usedBodypartNames)+" used!",
			"{sub.You} "+moanText+" eagerly!",
		])
		moan(SUB_0)
		return
	if(_id == "resistduringfuck"):
		if(RNG.chance(getSubResistChance(20.0, 15.0))):
			getDomInfo().addAnger(0.2)
			
			state = ""
			addText("{sub.You} {sub.youVerb('struggle')} enough for {dom.youHim} to pull out!")
			return
		else:
			getDomInfo().addAnger(0.1)
			addTextPick([
				"{sub.You} {sub.youVerb('try', 'tries')} to resist while being fucked"+getPoseDescriptor()+"!",
				"{sub.You} {sub.youVerb('try', 'tries')} to resist while having {sub.yourHis} "+RNG.pick(usedBodypartNames)+" used!",
				"{sub.You} {sub.youVerb('try', 'tries')} to make {dom.youHim} pull out!",
			])
			reactSub(SexReaction.ActivelyResisting, [50])
			return
	if(_id == "begtopullout"):
		getDomInfo().addAnger(-0.02)
		var text:String = RNG.pick([
			"{sub.You} {sub.youVerb('beg')} {dom.youHim} not to cum inside.",
			"{sub.You} {sub.youVerb('beg')} {dom.youHim} to pull out.",
		])
		
		if(RNG.chance(10 - 10 * getDomInfo().fetishScore({Fetish.Breeding: 1.0})) && !getDom().isPlayer()):
			gonnaCumOutside = true
			text += " {dom.you} listened!"
		
		addText(text)
		reactSub(sexReactionPullOut)
		return
	
func getSubResistChance(baseChance:float, domAngerRemoval:float) -> float:
	var theChance = baseChance - getDomInfo().getAngerScore()*domAngerRemoval
	if(getSub().hasBlockedHands()):
		theChance *= 0.5
	if(getSub().hasBoundArms()):
		theChance *= 0.5
	if(getSub().isBlindfolded()):
		theChance *= 0.8
	if(isStocksSex() || getSexType() == SexType.SlutwallSex):
		theChance *= 0.5
	if(currentPose == POSE_FULLNELSON):
		theChance *= 0.5
	
	return max(theChance, 5.0)

func getAnimation():
	if(getSexType() == SexType.SlutwallSex):
		if(state in [""]):
			return [StageScene.SlutwallSex, "tease", {npc=DOM_0, pc=SUB_0}]
		if(state in ["aftercumminginside", "knotting"]):
			return [StageScene.SlutwallSex, "inside", {npc=DOM_0, pc=SUB_0}]
		if(getDomInfo().isCloseToCumming() || (isStraponSex() && getSubInfo().isCloseToCumming())):
			return [StageScene.SlutwallSex, "fast", {npc=DOM_0, pc=SUB_0}]
			
		return [StageScene.SlutwallSex, "sex", {npc=DOM_0, pc=SUB_0}]
	
	if(isStocksSex()):
		if(state in [""]):
			return [StageScene.StocksSex, "tease", {npc=DOM_0, pc=SUB_0}]
		if(state in ["aftercumminginside", "knotting"]):
			return [StageScene.StocksSex, "inside", {npc=DOM_0, pc=SUB_0}]
		if(getDomInfo().isCloseToCumming() || (isStraponSex() && getSubInfo().isCloseToCumming())):
			return [StageScene.StocksSex, "fast", {npc=DOM_0, pc=SUB_0}]
			
		return [StageScene.StocksSex, "sex", {npc=DOM_0, pc=SUB_0}]
	
	var animToPlay = StageScene.SexAllFours
	var supportsFlop = false
	if(PoseToAnimName.has(currentPose)):
		animToPlay = PoseToAnimName[currentPose]
	if(animToPlay == StageScene.SexAllFours):
		supportsFlop = true
	var shouldFlop = (getSub().hasBoundArms() || getSubInfo().isUnconscious()) && supportsFlop
	var shouldUncon = getSubInfo().isUnconscious()
	
	if(shouldFlop):
		if(state in [""]):
			return [animToPlay, "teaseflop", {pc=DOM_0, npc=SUB_0}]
		if(state in ["aftercumminginside", "knotting"]):
			return [animToPlay, "insideflop", {pc=DOM_0, npc=SUB_0}]
		if(getDomInfo().isCloseToCumming() || (isStraponSex() && getSubInfo().isCloseToCumming())):
			return [animToPlay, "fastflop", {pc=DOM_0, npc=SUB_0}]
			
		return [animToPlay, "sexflop", {pc=DOM_0, npc=SUB_0}]
	else:
		if(state in [""]):
			return [animToPlay, "tease", {pc=DOM_0, npc=SUB_0, uncon=shouldUncon}]
		if(state in ["aftercumminginside", "knotting"]):
			return [animToPlay, "inside", {pc=DOM_0, npc=SUB_0, uncon=shouldUncon}]
		if(getDomInfo().isCloseToCumming() || (isStraponSex() && getSubInfo().isCloseToCumming())):
			return [animToPlay, "fast", {pc=DOM_0, npc=SUB_0, uncon=shouldUncon}]
			
		return [animToPlay, "sex", {pc=DOM_0, npc=SUB_0, uncon=shouldUncon}]

func getDomCondom():
	return getDom().getWornCondom()

func getDomSwitchHoleChance() -> float:
	if(getDomInfo().hasMemory("switchedHoles")):
		return 0.0
	
	var domLikesOtherHoleScore:float = getDomInfo().fetishScore({otherHoleFetishGiving:1.0, fetishGiving: -0.5})
	
	return max(5.0, domLikesOtherHoleScore * 100.0 * (1.0 - getDomInfo().getAngerScore()))

func getOrgasmHandlePriority(_indx:int) -> int:
	if(_indx == DOM_0):
		if(isStraponSex()):
			return 5
		return 10
	if(_indx == SUB_0):
		if(isStraponSex()):
			return 10
		return 5
	return -1

func getJoinActions(_sexInfo:SexInfoBase):
	if(!(_sexInfo is SexDomInfo)):
		return
	#var theChar:BaseCharacter = _sexInfo.getChar()
	
	if(usedBodypart == S_ANUS && canSwitchTo("ThreeDDS_SpitroastAnal", [DOM_0, _sexInfo], [SUB_0])):
		addJoinAction(["spitroast"], "+Spitroast", "Join and fuck their mouth!", getJoinActivityScore("ThreeDDS_SpitroastAnal", DOM_1, _sexInfo, getSubInfo()), {A_CATEGORY: ["Fuck"]})
	elif(usedBodypart == S_VAGINA && canSwitchTo("ThreeDDS_SpitroastVag", [DOM_0, _sexInfo], [SUB_0])):
		addJoinAction(["spitroast"], "+Spitroast", "Join and fuck their mouth!", getJoinActivityScore("ThreeDDS_SpitroastVag", DOM_1, _sexInfo, getSubInfo()), {A_CATEGORY: ["Fuck"]})

	if(canSwitchTo("ThreeDDS_DP", [DOM_0, _sexInfo], [SUB_0])):
		var theDPHole:String = S_ANUS if usedBodypart == S_VAGINA else S_VAGINA
		if(!getSub().hasReachableVagina()):
			theDPHole = S_ANUS
		elif(getSub().hasReachableVagina() && !getSub().hasReachableAnus()):
			theDPHole = S_VAGINA
		
		if(theDPHole == S_ANUS):
			addJoinAction(["dp"], "+DP (anal)", "Join and fuck their ass at the same time!", getJoinActivityScore("ThreeDDS_DP", DOM_1, _sexInfo, getSubInfo()), {A_CATEGORY: ["Fuck"]})
		else:
			addJoinAction(["dp"], "+DP (vaginal)", "Join and fuck their pussy at the same time!", getJoinActivityScore("ThreeDDS_DP", DOM_0, _sexInfo, getSubInfo()), {A_CATEGORY: ["Fuck"]})
	
	if(canSwitchTo("ThreeDDS_Train", [DOM_0, _sexInfo], [SUB_0], [usedBodypart, S_VAGINA])):
		addJoinAction(["trainVag"], "+Train (vag, receive)", "Join and let the sub fuck your pussy at the same time!", getJoinActivityScore("ThreeDDS_Train", DOM_1, _sexInfo, getSubInfo(), [S_VAGINA]), {A_CATEGORY: ["Fuck"]})
	if(canSwitchTo("ThreeDDS_Train", [DOM_0, _sexInfo], [SUB_0], [usedBodypart, S_ANUS])):
		addJoinAction(["trainAnal"], "+Train (anal, receive)", "Join and let the sub fuck your ass at the same time!", getJoinActivityScore("ThreeDDS_Train", DOM_1, _sexInfo, getSubInfo(), [S_ANUS]), {A_CATEGORY: ["Fuck"]})
	
		
func doJoinAction(_sexInfo:SexInfoBase, _args):
	if(_args[0] == "spitroast"):
		if(usedBodypart == S_ANUS):
			switchCurrentActivityTo("ThreeDDS_SpitroastAnal", [_sexInfo.getCharID()])
		if(usedBodypart == S_VAGINA):
			switchCurrentActivityTo("ThreeDDS_SpitroastVag", [_sexInfo.getCharID()])
	if(_args[0] == "dp"):
		if(usedBodypart == S_ANUS):
			switchCurrentActivityTo("ThreeDDS_DP", ["vag", _sexInfo.getCharID()])
		if(usedBodypart == S_VAGINA):
			switchCurrentActivityTo("ThreeDDS_DP", ["anal", _sexInfo.getCharID()])
	if(_args[0] == "trainVag"):
		switchCurrentActivityTo("ThreeDDS_Train", [usedBodypart, S_VAGINA, _sexInfo.getCharID()])
	if(_args[0] == "trainAnal"):
		switchCurrentActivityTo("ThreeDDS_Train", [usedBodypart, S_ANUS, _sexInfo.getCharID()])
	
func saveData():
	var data = .saveData()
	
	data["times"] = times
	data["gonnaCumOutside"] = gonnaCumOutside
	data["switchedPoseOnce"] = switchedPoseOnce
	data["currentPose"] = currentPose
	data["straponTimer"] = straponTimer

	return data
	
func loadData(data):
	.loadData(data)
	
	times = SAVE.loadVar(data, "times", 0)
	gonnaCumOutside = SAVE.loadVar(data, "gonnaCumOutside", false)
	switchedPoseOnce = SAVE.loadVar(data, "switchedPoseOnce", false)
	currentPose = SAVE.loadVar(data, "currentPose", "")
	straponTimer = SAVE.loadVar(data, "straponTimer", 0)
	if(currentPose == ""):
		currentPose = RNG.pick(getAvaiablePoses())
