extends SexActivityBase
var times = 0
var gonnaCumOutside = false

var usedBodypart = BodypartSlot.Vagina
var usedTag = SexActivityTag.VaginaUsed
var usedTagInside = SexActivityTag.VaginaPenetrated
var fetishGiving = Fetish.VaginalSexGiving
var fetishReceiving = Fetish.VaginalSexReceiving
var usedBodypartNames = ["pussy", "pussy", "slit", "cunt", "kitty"]
var switchHoleActivity = "SexAnalOnAllFours"
var otherHoleNames = ["anus"]
var otherHoleBodypart = BodypartSlot.Anus
var otherHoleTag = SexActivityTag.AnusUsed
var otherHoleFetishGiving = Fetish.AnalSexGiving
var otherHoleFetishReceiving = Fetish.AnalSexReceiving
var otherGoal = SexGoal.FuckAnal
var aboutToPenetrateReaction = SexReaction.AboutToPenetratePussy
var sexReactionPullOut = SexReaction.BeggingToPullOutVaginal
var currentPose = ""
var switchedPoseOnce = false

func _init():
	id = "SexVaginalOnAllFours"

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

func isStocksSex():
	return getSexType() == SexType.StocksSex

func getPoseDescriptor():
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
	return " [color=red]FIX DESCRIPTOR[/color]"

const POSE_DEFAULT = "POSE_DEFAULT"
const POSE_ALLFOURS = "POSE_ALLFOURS"
const POSE_STANDING = "POSE_STANDING"
const POSE_MISSONARY = "POSE_MISSONARY"
const POSE_FULLNELSON = "POSE_FULLNELSON"
const POSE_CHOKEFUCK = "POSE_CHOKEFUCK"
const PoseToName = {
	POSE_DEFAULT: "Default",
	POSE_ALLFOURS: "All Fours",
	POSE_STANDING: "Standing",
	POSE_MISSONARY: "Missonary",
	POSE_FULLNELSON: "Full Nelson",
	POSE_CHOKEFUCK: "Choke fuck",
}
const PoseToAnimName = {
	POSE_DEFAULT: StageScene.SexAllFours,
	POSE_ALLFOURS: StageScene.SexAllFours,
	POSE_STANDING: StageScene.SexFreeStanding,
	POSE_MISSONARY: StageScene.SexMissionary,
	POSE_FULLNELSON: StageScene.SexFullNelson,
	POSE_CHOKEFUCK: StageScene.Choking,
}
func getAvaiablePoses():
	if(currentPose == POSE_CHOKEFUCK):
		return [POSE_CHOKEFUCK]
	
	if(getSexType() == SexType.DefaultSex):
		if(subInfo.isUnconscious()):
			return [POSE_ALLFOURS, POSE_MISSONARY, POSE_FULLNELSON]
		else:
			return [POSE_ALLFOURS, POSE_STANDING, POSE_MISSONARY, POSE_FULLNELSON]
	
	return [POSE_DEFAULT]

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(!_domInfo.getChar().hasReachablePenis() && !_domInfo.getChar().isWearingStrapon()):
		return false
	if(usedBodypart == BodypartSlot.Vagina && !_subInfo.getChar().hasReachableVagina()):
		return false
	if(usedBodypart == BodypartSlot.Anus && !_subInfo.getChar().hasReachableAnus()):
		return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getVisibleName():
	return "Vaginal"

func getCategory():
	return ["Fuck"]

func getDomTags():
	if(state in ["fucking", "aftercumminginside", "knotting"]):
		return [SexActivityTag.PenisUsed, SexActivityTag.PenisInside, SexActivityTag.HavingSex]
	return [SexActivityTag.PenisUsed, SexActivityTag.HavingSex]

func getSubTags():
	var thetags = [usedTag, SexActivityTag.PreventsSubViolence, SexActivityTag.PreventsSubTeasing, SexActivityTag.HavingSex]
	if(state in ["fucking", "aftercumminginside", "knotting"]):
		thetags.append(usedTagInside)
	return thetags

func getDomTagsCheck():
	return [SexActivityTag.OrderedToDoSomething, SexActivityTag.PenisUsed, SexActivityTag.HavingSex]

func getSubTagsCheck():
	return [SexActivityTag.OrderedToDoSomething, usedTag, SexActivityTag.HavingSex]

func isStraponSex():
	return getDom().isWearingStrapon()

func domSensetivity():
	var strapon = getDom().getWornStrapon()
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

func getStartTextForPose(thePose):
	var throughClothing = "."
	if(subInfo.getChar().getFirstItemThatCoversBodypart(usedBodypart) != null):
		throughClothing = " through {sub.yourHis} clothing."
	
	var text = ""
	if(thePose == POSE_ALLFOURS):
		text = RNG.pick([
			"{dom.You} {dom.youVerb('put')} {sub.you} on all fours and {dom.youVerb('position')} {dom.yourself} behind {sub.your} butt with {dom.yourHis} "+getDickName()+" out and presses it against {sub.yourHis} "+getUsedBodypartName()+throughClothing,
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
	else:
		text = RNG.pick([
			"{dom.You} {dom.youVerb('position')} {dom.yourself} behind {sub.your} butt with {dom.yourHis} "+getDickName()+" out and presses it against {sub.yourHis} "+getUsedBodypartName()+throughClothing,
		])
	return text
	
func getSwitchPoseTextForPose(thePose):
	var text = ""
	if(thePose == POSE_ALLFOURS):
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
	else:
		text = RNG.pick([
			"{dom.You} {dom.youVerb('position')} {dom.yourself} behind {sub.your} butt, {dom.yourHis} "+getDickName()+" is still inside {sub.yourHis} "+getUsedBodypartName()+"!",
		])
	return text
	
func startActivity(_args):
	currentPose = RNG.pick(getAvaiablePoses())
	state = ""
	
	var text = getStartTextForPose(currentPose)
	
	return {
		text = text,
		domSay = domReaction(aboutToPenetrateReaction, 50),
		subSay = subReaction(aboutToPenetrateReaction, 50),
	}

func onSwitchFrom(_otherActivity, _args):
	if(_args != null && _args == ["choke"]):
		currentPose = POSE_CHOKEFUCK
		return
	currentPose = RNG.pick(getAvaiablePoses())

func processTurn():
	if(currentPose == POSE_CHOKEFUCK):
		subInfo.addConsciousness(-0.01)
	
	if(state == "knotting"):
		var freeRoom = getSub().getPenetrationFreeRoomBy(usedBodypart, domID)
		if(freeRoom > 0.0):
			var text = RNG.pick([
				"{sub.You} {sub.youAre} being a "+RNG.pick(["great", "good"])+" cock warmer for {dom.you}. There is enough room inside {sub.yourHis} "+RNG.pick(usedBodypartNames)+" for {sub.youHim} not to feel any pain.",
			])
			
			return {text = text}
		else:
			var text = RNG.pick([
				"{sub.You} {sub.youAre} trying to be a cock warmer for {dom.you} but {sub.yourHis} "+RNG.pick(usedBodypartNames)+" is too tight, it's very painful! But it sure feels good for {dom.you}.",
			])
			subInfo.addPain(RNG.randi_range(2, 5))
			domInfo.addLust(10)
			domInfo.addArousalForeplay(0.1)
			getSub().gotOrificeStretchedBy(usedBodypart, domID, 0.1)
			return {text = text}
	
	if(state == "fucking"):
		times += 1
		affectSub(subInfo.fetishScore({fetishReceiving: 1.0})+0.5, 0.1, -0.1, -0.01)
		affectDom(domInfo.fetishScore({fetishGiving: 1.0})+0.3, 0.1*domSensetivity(), 0.0)
		subInfo.addArousalSex(0.2)
		domInfo.addArousalSex(0.2*domSensetivity())
		
		var text = RNG.pick([
			"{dom.You} {dom.youAre} fucking {sub.youHim}"+getPoseDescriptor()+".",
			"{dom.You} {dom.youVerb('pound')} {sub.your} "+RNG.pick(usedBodypartNames)+".",
			"{dom.You} {dom.youVerb('fuck')} {sub.your} "+RNG.pick(usedBodypartNames)+".",
		])
		
		if(currentPose == POSE_STANDING && subInfo.isUnconscious()):
			currentPose = POSE_ALLFOURS
			text += " Unable to continue standing, {sub.you} {sub.youVerb('fall')} to all fours!"
		
		if(RNG.chance(20)):
			var freeRoom = getSub().getPenetrationFreeRoomBy(usedBodypart, domID)
			
			getSub().gotOrificeStretchedBy(usedBodypart, domID, 0.1)
			
			if(usedBodypart == BodypartSlot.Vagina):
				if(freeRoom <= 5.0):
					text += RNG.pick([
						" The tip of {dom.yourHis} "+getDickName(RNG.pick(["cock", "dick", "member"]))+" easily "+RNG.pick(["hits", "smashes", "reaches", "finds"])+" {sub.yourHis} "+RNG.pick(["cervix", "natural barricade"])+".",
					])
				elif(freeRoom >= 10):
					text += RNG.pick([
						" The tip of {dom.yourHis} "+getDickName(RNG.pick(["cock", "dick", "member"]))+" can barely reach anywhere deep.",
						" The tip of {dom.yourHis} "+getDickName(RNG.pick(["cock", "dick", "member"]))+" is struggling to reach {sub.yourHis} "+RNG.pick(["cervix", "natural barricade"])+".",
					])
			if(usedBodypart == BodypartSlot.Anus):
				if(freeRoom <= 5.0):
					text += RNG.pick([
						" The tip of {dom.yourHis} "+getDickName(RNG.pick(["cock", "dick", "member"]))+" easily "+RNG.pick(["hits", "smashes", "reaches", "finds"])+" {sub.yourHis} "+RNG.pick(["pleasure spot"])+".",
					])
				elif(freeRoom >= 10):
					text += RNG.pick([
						" The tip of {dom.yourHis} "+getDickName(RNG.pick(["cock", "dick", "member"]))+" can barely reach anywhere deep.",
						" The tip of {dom.yourHis} "+getDickName(RNG.pick(["cock", "dick", "member"]))+" is struggling to reach {sub.yourHis} "+RNG.pick(["pleasure spot"])+".",
					])
		
		if(RNG.chance(20) && getDom().bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisBarbs)):
			text += RNG.pick([
				" Barbs on {dom.yourHis} "+getDickName(RNG.pick(["cock", "dick", "shaft"]))+" provide extra stimulation.",
				" Barbs on {dom.yourHis} "+getDickName(RNG.pick(["cock", "dick", "shaft"]))+" "+RNG.pick(["rake against", "scratch"])+" the "+RNG.pick(["soft insides", "soft inner walls"])+".",
			])
		if(RNG.chance(20) && getDom().bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisRidges)):
			text += RNG.pick([
				" Ridges on {dom.yourHis} "+getDickName(RNG.pick(["cock", "dick", "shaft"]))+" provide extra stimulation.",
			])
		
		if(isStraponSex()):
			if(domInfo.isReadyToCum()):
				text += RNG.pick([
					" {dom.You} {dom.youAre} edging {dom.yourself}.",
					" {dom.You} {dom.youAre} about to cum!",
					" {dom.You} {dom.youAre} keeping {dom.yourself} on edge.",
				])
			elif(domInfo.isCloseToCumming()):
				text += RNG.pick([
					" {dom.You} pants eagerly.",
					" {dom.You} closes in on {dom.yourHis} orgasm.",
					" {dom.You} {dom.youAre} gonna cum soon.",
				])
		else:
			if(domInfo.isReadyToCum()):
				text += RNG.pick([
					" {dom.You} {dom.youAre} edging {dom.yourself}.",
					" {dom.You} {dom.youAre} about to cum!",
					" {dom.You} {dom.youAre} keeping {dom.yourself} on edge.",
					" {dom.Your} "+RNG.pick(["cock", "dick", "member"])+" is moments from cumming.",
					" {dom.Your} "+RNG.pick(["cock", "dick", "member"])+" reached its peak."
				])
			elif(domInfo.isCloseToCumming()):
				text += RNG.pick([
					" {dom.You} pants eagerly.",
					" {dom.You} closes in on {dom.yourHis} orgasm.",
					" {dom.You} {dom.youAre} gonna cum soon.",
					" {dom.Your} "+RNG.pick(["cock", "dick", "member"])+" is throbbing.",
					" {dom.Your} "+RNG.pick(["cock", "dick", "member"])+" is twitching and leaking a lot."
				])
		
		return {text=text}

	
func getDomActions():
	var actions = []
	if(state in [""]):
		actions.append({
			"id": "rub",
			"score": 1.0,
			"name": "Rub",
			"desc": "Rub your "+getDickName()+" against their "+RNG.pick(usedBodypartNames),
		})
		if(domInfo.isReadyToPenetrate() && subInfo.getChar().getFirstItemThatCoversBodypart(usedBodypart) == null && domInfo.getChar().getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
			actions.append({
				"id": "insert",
				"score": 1.0,
				"name": "Penetrate",
				"desc": "Try to insert your "+getDickName()+" into their "+RNG.pick(usedBodypartNames),
			})
		if(subInfo.getChar().hasBodypart(otherHoleBodypart) && !getSexEngine().hasTag(subID, otherHoleTag)):
			actions.append({
				"id": "switchhole",
				"score": 5.0 * (-domInfo.goalsScore(getGoals(), subID) + domInfo.goalsScore({otherGoal: 1.0}, subID)),
				"name": "Switch hole",
				"desc": "Switch to the sub's "+RNG.pick(otherHoleNames),
			})
		actions.append({
			"id": "stop",
			"score": getStopScore(),
			"name": "Stop fuck",
			"desc": "Stop fucking",
		})
	if(state in ["fucking"]):
		
		if(domInfo.isReadyToCum() && isHandlingDomOrgasms() && isStraponSex()):
			actions.append({
				"id": "domstraponcum",
				"score": 1.0,
				"name": "Cum!",
				"desc": "You're about to cum!",
				"priority" : 1001,
			})
		if(domInfo.isReadyToCum() && isHandlingDomOrgasms() && !isStraponSex()):
			var condomScore = 0.0
			if(getDomCondom() != null):
				condomScore = 1.0
			
			var scoreToCumInside = max(condomScore, domInfo.fetishScore({Fetish.Breeding: 1.0}) + 0.5 - 20.0*float(gonnaCumOutside))
			if(getSub().hasPerk(Perk.FertilitySubmissiveAndBreedable)):
				scoreToCumInside = 1.0
			
			var hasKnot = getDom().bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisKnot)
			if(hasKnot):
				actions.append({
					"id": "knotinside",
					"score": scoreToCumInside,
					"name": "Knot them",
					"desc": "Try to knot their "+RNG.pick(usedBodypartNames),
					"priority": 1001,
				})
				
			actions.append({
				"id": "cuminside",
				"score": scoreToCumInside,
				"name": "Cum inside",
				"desc": "Cum inside their "+RNG.pick(usedBodypartNames),
				"priority": 1001,
			})
			actions.append({
				"id": "cumpullout",
				"score": 1.0 - min(1.0, scoreToCumInside),
				"name": "Pull out",
				"desc": "Cum on their butt",
				"priority": 1001,
			})
	if(state in ["aftercumminginside"]):
		actions.append({
			"id": "continuefucking",
			"score": 1.0,
			"name": "Continue fucking",
			"desc": "Continue fucking their "+RNG.pick(usedBodypartNames),
		})
	if(state in ["aftercumminginside", "fucking"]):
		if(!domInfo.isReadyToCum()):
			actions.append({
				"id": "pullout",
				"score": getStopScore(),
				"name": "Pull out",
				"desc": "Pull your cock out and stop fucking them",
			})
	if(state in ["knotting"]):
		actions.append({
			"id": "pullknotout",
			"score": 1.0,
			"name": "Pull out",
			"desc": "Try to yank your knot out",
		})
	for pose in getAvaiablePoses():
		if(pose == currentPose):
			continue
		var poseName = "error"
		if(PoseToName.has(pose)):
			poseName = PoseToName[pose]
		actions.append({
			"id": "switchpose",
			"score": 0.0 if switchedPoseOnce else 0.01,
			"name": poseName,
			"desc": "Change pose",
			"category": ["Switch pose"],
			"args": [pose],
		})
	
	return actions

func doDomAction(_id, _actionInfo):
	if(_id == "switchpose"):
		switchedPoseOnce = true
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
	
	if(_id == "domstraponcum"):
		getDom().cumOnFloor()
		domInfo.cum()
		return getGenericDomOrgasmData()
	
	if(_id == "rub"):
		affectSub(subInfo.fetishScore({fetishReceiving: 1.0}), 0.05, -0.1, 0.0)
		affectDom(max(0.1, domInfo.fetishScore({fetishGiving: 1.0})+1.0), 0.05*domSensetivity(), 0.0)
		
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('rub')} {dom.yourHis} "+getDickName()+" against {sub.your} "+RNG.pick(usedBodypartNames)+".",
		])
		return {text=text}
	if(_id == "insert"):
		if(RNG.chance(20)):
			affectSub(subInfo.fetishScore({fetishReceiving: 1.0}), 0.01, -0.1, 0.0)
			affectDom(domInfo.fetishScore({fetishGiving: 1.0}), 0.01*domSensetivity(), 0.01)
			
			var text = RNG.pick([
				"{dom.You} {dom.youVerb('attempt')} to sink {dom.yourHis} "+getDickName()+" into {sub.your} "+RNG.pick(usedBodypartNames)+".",
				"{dom.You} {dom.youVerb('try','tries')} to penetrate {sub.your} "+RNG.pick(usedBodypartNames)+" with {dom.yourHis} "+getDickName()+".",
				"{dom.You} {dom.youVerb('rub')} {dom.yourHis} "+getDickName()+" against {sub.your} "+RNG.pick(usedBodypartNames)+", trying to sink it in.",
			])
			return {text = text}
		else:
			# Cock len vs Vagina depth check here
			if(!RNG.chance(getSub().getPenetrateChanceBy(usedBodypart, domID))):
				getSub().gotOrificeStretchedBy(usedBodypart, domID, 0.1)
				var text = RNG.pick([
					"{dom.Your} "+getDickName()+" stretches {sub.your} "+RNG.pick(usedBodypartNames)+" out while trying to fit inside.",
				])
				affectSub(subInfo.fetishScore({fetishReceiving: 1.0}), 0.05, -0.2, -0.01)
				affectDom(domInfo.fetishScore({fetishGiving: 1.0}), 0.05*domSensetivity(), -0.01)
				subInfo.addArousalForeplay(0.05)
				domInfo.addArousalForeplay(0.05*domSensetivity())
				
				return {text = text}
			else:
				gonnaCumOutside = false
				#getSub().gotFuckedBy(usedBodypart, domID)
				getSub().gotOrificeStretchedBy(usedBodypart, domID, 0.2)
				state = "fucking"
				affectSub(subInfo.fetishScore({fetishReceiving: 1.0}), 0.1, -0.3, 0.0)
				affectDom(domInfo.fetishScore({fetishGiving: 1.0}), 0.1*domSensetivity(), -0.05)
				subInfo.addArousalForeplay(0.1)
				domInfo.addArousalForeplay(0.1*domSensetivity())
				var text = RNG.pick([
					"{dom.You} {dom.youVerb('manage','manages')} to penetrate {sub.your} "+RNG.pick(usedBodypartNames)+"!",
					"{dom.You} {dom.youVerb('shove','shoves')} {dom.yourHis} "+getDickName()+" inside {sub.your} "+RNG.pick(usedBodypartNames)+"!",
				])
				if(usedBodypart == BodypartSlot.Anus && getSub().getInventory().hasSlotEquipped(InventorySlot.Anal)):
					var item = getSub().getInventory().getEquippedItem(InventorySlot.Anal)
					text = "{dom.You} temporary {dom.youVerb('take')} out "+str(item.getAStackName())+" out of {sub.your} ass. "+text
				elif(usedBodypart == BodypartSlot.Vagina && getSub().getInventory().hasSlotEquipped(InventorySlot.Vagina)):
					var item = getSub().getInventory().getEquippedItem(InventorySlot.Vagina)
					text = "{dom.You} temporary {dom.youVerb('take')} out "+str(item.getAStackName())+" out of {sub.your} pussy. "+text
				
				var freeRoom = getSub().getPenetrationFreeRoomBy(usedBodypart, domID)
				var chanceToPain = -freeRoom * 2.0
				if(RNG.chance(chanceToPain) || (domInfo.isAngry() && RNG.chance(20))):
					getSub().doPainfullyStretchHole(usedBodypart, domID)
				
				return {text = text}
	if(_id == "switchhole"):
		switchCurrentActivityTo(switchHoleActivity)
		
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('switch', 'switches')} holes. {dom.YouHe} {dom.youAre} "+RNG.pick(["prodding", "teasing", "rubbing"])+" {sub.your} "+RNG.pick(otherHoleNames)+" now.",
		])
		
		return {text = text}
		
	if(_id in ["knotinside", "cuminside"]):
		var wombText = RNG.pick([
			"womb", "womb",
			"babymaker",
		])
		if(usedBodypart == BodypartSlot.Anus):
			wombText = RNG.pick([
				"guts",
				"insides",
			])
		var text = ""
		
		var knotSuccess = false
		#var isTryingToKnot = false
		if(_id == "knotinside"):
			var freeRoom = getSub().getPenetrationFreeRoomBy(usedBodypart, domID)
			var chanceToPain = -freeRoom * 5.0
			if(RNG.chance(chanceToPain) || (domInfo.isAngry() && RNG.chance(10))):
				getSub().doPainfullyStretchHole(usedBodypart, domID)
			
			#isTryingToKnot = true
			getSub().gotOrificeStretchedBy(usedBodypart, domID, 0.5)
			if(RNG.chance(getSub().getPenetrateChanceBy(usedBodypart, domID))):
				knotSuccess = true
			else:
				text += RNG.pick([
					"{dom.You} {dom.youVerb('try', 'tries')} to "+RNG.pick(["force {dom.yourHis} knot in", "knot {sub.you}"])+" but the hole is just too tight. "
				])
		
		if(knotSuccess):
			text += RNG.pick([
				"{dom.You} "+RNG.pick(["{dom.youVerb('ram')}", "{dom.youVerb('shove')}", "{dom.youVerb('slide')}"])+" {dom.yourHis} cock deep inside {sub.yourHis} "+RNG.pick(usedBodypartNames)+" and force the knot in, stretching {sub.yourHis} "+RNG.pick(usedBodypartNames)+" wide before [b]"+RNG.pick(["stuffing", "filling"])+" it full of {dom.yourHis} seed[/b]!",
				"{dom.You} {dom.youVerb('manage')} to force {dom.yourHis} knot in, stretching {sub.youHim} out! {dom.YouHe} {dom.youVerb('grunt')} as {dom.yourHis} cock starts shooting thick ropes of "+RNG.pick(["cum", "seed", "jizz", "semen"])+" deep [b]inside {sub.yourHis} "+wombText+"[/b]!",
				"{dom.Your} balls tense up as {dom.youHe} "+RNG.pick(["{dom.youVerb('ram')}", "{dom.youVerb('shove')}", "{dom.youVerb('slide')}"])+" {dom.yourHis} cock deep. The knot slips in, stretching {sub.yourHis} "+RNG.pick(usedBodypartNames)+" while [b]{dom.youHe} {dom.youAre} cumming inside[/b]!",
				"{dom.You} "+RNG.pick(["{dom.youVerb('ram')}", "{dom.youVerb('shove')}", "{dom.youVerb('slide')}"])+" {dom.yourHis} cock balls-deep. The knot stretches {sub.yourHis} "+RNG.pick(usedBodypartNames)+" until finally slipping in. {dom.You} {dom.youVerb('grunt')} while [b]stuffing {sub.yourHis} "+wombText+"[/b]!",
			])
		else:
			text += RNG.pick([
				"{dom.You} "+RNG.pick(["{dom.youVerb('ram')}", "{dom.youVerb('shove')}", "{dom.youVerb('slide')}"])+" {dom.yourHis} cock deep inside {sub.yourHis} "+RNG.pick(usedBodypartNames)+" and [b]"+RNG.pick(["{dom.youVerb('stuff')}", "{dom.youVerb('fill')}"])+" it full of {dom.yourHis} seed[/b]!",
				"{dom.You} {dom.youVerb('grunt')} as {dom.yourHis} cock starts shooting thick ropes of "+RNG.pick(["cum", "seed", "jizz", "semen"])+" deep [b]inside {sub.yourHis} "+wombText+"[/b]!",
				"{dom.Your} balls tense up as {dom.youHe} "+RNG.pick(["{dom.youVerb('ram')}", "{dom.youVerb('shove')}", "{dom.youVerb('slide')}"])+" {dom.yourHis} cock deep and [b]{dom.youVerb('cum')} inside {sub.you}[/b]!",
				"{dom.You} "+RNG.pick(["{dom.youVerb('ram')}", "{dom.youVerb('shove')}", "{dom.youVerb('slide')}"])+" {dom.yourHis} cock balls-deep and {dom.youVerb('grunt')} while [b]stuffing {sub.yourHis} "+RNG.pick(usedBodypartNames)+"[/b]!",
			])
		
		var condom:ItemBase = getDomCondom()
		if(condom != null):
			var breakChance = condom.getCondomBreakChance()
			var condomBroke = getDom().shouldCondomBreakWhenFucking(getSub(), breakChance)
			if(condomBroke):
				text = "[b]The condom broke![/b] "+text
				condom.destroyMe()
			else:
				text = RNG.pick([
					"{dom.You} filled the condom inside {sub.your} "+RNG.pick(usedBodypartNames)+"!",
					"{dom.You} stuffed the condom in {sub.your} "+RNG.pick(usedBodypartNames)+" full of {dom.yourHis} "+RNG.pick(["cum", "seed", "jizz", "semen"])+"!",
				])
				if(knotSuccess):
					text = RNG.pick([
						"{dom.You} {dom.youVerb('manage')} to knot {sub.youHim}! ",
						"{dom.You} {dom.youVerb('manage')} to shove {dom.yourHis} knot into {sub.youHim}! ",
					]) + text
				
				getDom().cumInItem(condom)
				domInfo.cum()
				subInfo.addArousalSex(0.2)
				satisfyGoals()
				if(knotSuccess):
					state = "knotting"
				else:
					state = "aftercumminginside"
				
				return getSexEngine().combineData({text=text}, applyTallymarkIfNeededData(usedBodypart))
		
		var beingBredScore = subInfo.fetishScore({Fetish.BeingBred: 1.0})
		if(beingBredScore < 0.0):
			subInfo.addResistance(1.0)
			subInfo.addFear(0.1)
		getSub().cummedInBodypartBy(usedBodypart, domID)
		domInfo.cum()
		subInfo.addArousalSex(0.2)
		satisfyGoals()
		if(knotSuccess):
			state = "knotting"
		else:
			state = "aftercumminginside"

		return getSexEngine().combineData({text=text}, applyTallymarkIfNeededData(usedBodypart))
	if(_id == "cumpullout"):
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('pull')} {dom.yourHis} "+getDickName()+" out and [b]cums all over {sub.your} butt[/b]!",
			"{dom.You} {dom.youVerb('pull')} out, [b]cumming all over {sub.your} ass[/b]!",
		])
		
		var condom:ItemBase = getDomCondom()
		if(condom != null):
			var breakChance = condom.getCondomBreakChance()
			
			if(RNG.chance(breakChance)):
				text = "[b]The condom broke![/b] "+text
				condom.destroyMe()
			else:
				text = RNG.pick([
					"{dom.You} {dom.youVerb('pull')} {dom.yourHis} "+getDickName()+" out and {dom.youVerb('fill')} {dom.yourHis} condom! {dom.You} {dom.youVerb('dispose')} of it.",
					"{dom.You} {dom.youVerb('pull')} out, stuffing {dom.yourHis} condom! {dom.You} {dom.youVerb('dispose')} of it.",
				])
				condom.destroyMe()
				getSexEngine().saveCondomToLootIfPerk(condom)
				getDom().cumInItem(condom)
				domInfo.cum()
				satisfyGoals()
				state = ""
				
				return getSexEngine().combineData({text=text}, applyTallymarkIfNeededData(usedBodypart))
		
		getSub().cummedOnBy(domID, FluidSource.Penis)
		domInfo.cum()
		satisfyGoals()
		state = ""

		return getSexEngine().combineData({text=text}, applyTallymarkIfNeededData(usedBodypart))
	if(_id == "continuefucking"):
		gonnaCumOutside = false
		state = "fucking"
		var text = ""
		if(!getDom().isPlayer()):
			var randomNewPose = RNG.pick(getAvaiablePoses())
			if(currentPose != randomNewPose):
				currentPose = randomNewPose
				text = getSwitchPoseTextForPose(randomNewPose)+" "
		
		text += RNG.pick([
			"{dom.You} began moving {dom.yourHis} hips again, fucking {sub.your} "+RNG.pick(usedBodypartNames)+"!",
			"{dom.You} went for a second round, fucking {sub.your} "+RNG.pick(usedBodypartNames)+" again!",
		])
		return {text = text}
	if(_id == "pullknotout"):
		if(RNG.chance(30)):
			state = ""
			var text = RNG.pick([
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
			return {text = text}
		else:
			var text = RNG.pick([
				"{dom.You} {dom.youVerb('try', 'tries')} to "+RNG.pick(["pull", "yank"])+" {dom.yourHis} "+RNG.pick(["cock", "dick"])+" out but {dom.youVerb('fail')}. The knot slowly deflates.",
			])
			getSub().gotOrificeStretchedBy(usedBodypart, domID, 0.1)
			affectSub(subInfo.fetishScore({fetishReceiving: 1.0}), 0.1, -0.3, 0.0)
			affectDom(domInfo.fetishScore({fetishGiving: 1.0}), 0.1, -0.05)
			subInfo.addArousalForeplay(0.1)
			domInfo.addArousalForeplay(0.1)
			return {text = text}
		
	if(_id == "pullout"):
		endActivity()
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('pull')} {dom.yourHis} "+getDickName()+" away.",
		])
		var condom:ItemBase = getDomCondom()
		if(condom != null):
			text += " {dom.You} {dom.youVerb('dispose')} of {dom.yourHis} condom."
			condom.destroyMe()
			getSexEngine().saveCondomToLootIfPerk(condom)
		
		return {text = text}
	
	if(_id == "stop"):
		endActivity()
		return {text = "{dom.You} {dom.youVerb('stop')} the fuck."}
	

func getSubActions():
	var actions = []
	if(state == ""):
		actions.append({
				"id": "rub",
				"score": subInfo.getComplyScore() * subFetishScore({fetishReceiving: 1.0}),
				"name": "Rub",
				"desc": "Rub your "+RNG.pick(usedBodypartNames)+" against their cock",
			})
		actions.append({
				"id": "resist",
				"score": subInfo.getResistScore() / 2.0,
				"name": RNG.pick(["Pull away"]),
				"desc": "Resist the attempts",
				"chance": getSubResistChance(30.0, 25.0),
			})
		if(subInfo.getChar().getFirstItemThatCoversBodypart(usedBodypart) == null && getDom().getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null && domInfo.isReadyToPenetrate()):
			actions.append({
					"id": "envelop",
					"score": subFetishScore({fetishReceiving: 1.0}),
					"name": RNG.pick(["Envelop cock"]),
					"desc": "Try to get this cock inside you",
				})
		if(subInfo.getChar().hasBodypart(otherHoleBodypart) && !getSexEngine().hasTag(subID, otherHoleTag)):
			actions.append({
					"id": "offerotherhole",
					"score": min(0.2, subInfo.fetishScore({fetishReceiving: -1.0}) + subInfo.fetishScore({otherHoleFetishReceiving: 1.0})),
					"name": "Offer "+RNG.pick(otherHoleNames)+" instead",
					"desc": "Offer your other hole",
					"chance": getDomSwitchHoleChance(),
				})
	if(state in ["fucking"]):
		actions.append({
				"id": "moan",
				"score": max(0.1, subFetishScore({fetishReceiving: 0.5}) + subPersonalityScore({PersonalityStat.Subby: 0.5})),
				"name": "Moan",
				"desc": "Show how much you like it",
			})
		actions.append({
				"id": "resistduringfuck",
				"score": subInfo.getResistScore() / 2.0,
				"name": "Resist",
				"desc": "Try to stop them!",
				"chance": getSubResistChance(20.0, 15.0),
			})
		if(domInfo.isCloseToCumming() && !isStraponSex()):
			actions.append({
					"id": "begtopullout",
					"score": (subInfo.getResistScore() / 2.0 - subInfo.fetishScore({Fetish.BeingBred: 1.0})) / 3.0,
					"name": "Beg to pull out",
					"desc": "Ask them not to cum inside you",
					"chance": 10 - 10 * domInfo.fetishScore({Fetish.Breeding: 1.0}),
				})
		if(subInfo.isReadyToCum() && isHandlingSubOrgasms()):
			actions.append({
				"id": "subcum",
				"score": 1.0,
				"name": "Cum!",
				"desc": "You're about to cum!",
				"priority" : 1001,
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
	if(isStocksSex() || getSexType() == SexType.SlutwallSex):
		theChance *= 0.5
	if(currentPose == POSE_FULLNELSON):
		theChance *= 0.5
	
	return max(theChance, 5.0)

func doSubAction(_id, _actionInfo):
	if(_id == "subcum"):
		var straponData = null
		
		if(isStraponSex()):
			satisfyGoals()
			
			var strapon = getDom().getWornStrapon()
			if(strapon.getFluids() != null && !strapon.getFluids().isEmpty()):
				getSub().cummedInBodypartBy(usedBodypart, domID, FluidSource.Strapon)
				straponData = {
					text = "{dom.Your} strapon gets squeezed by {sub.your} "+RNG.pick(usedBodypartNames)+" enough for it to suddenly [b]release its contents inside {sub.youHim}[/b]!"
				}
			
		getSub().cumOnFloor()
		subInfo.cum()
		return getSexEngine().combineData(getGenericSubOrgasmData(), straponData)
	
	if(_id == "rub"):
		#switchCurrentActivityTo("SexFuckTest2")
		domInfo.addAnger(-0.05)
		affectSub(subInfo.fetishScore({fetishReceiving: 1.0}), 0.1, 0.0, 0.0)
		affectDom(domInfo.fetishScore({fetishGiving: 1.0}), 0.1*domSensetivity(), -0.01)
		subInfo.addArousalForeplay(0.05)
		domInfo.addArousalForeplay(0.05*domSensetivity())
		
		return {text = "{sub.You} {sub.youVerb('rub')} against {dom.youHim}.",}
	if(_id == "envelop"):
		if(!RNG.chance(getSub().getPenetrateChanceBy(usedBodypart, domID))):
			getSub().gotOrificeStretchedBy(usedBodypart, domID, 0.1)
			affectSub(subInfo.fetishScore({fetishReceiving: 1.0}), 0.1, 0.0, 0.0)
			affectDom(domInfo.fetishScore({fetishGiving: 1.0}), 0.2, -0.01)
			return {text="{sub.You} {sub.youVerb('try', 'tries')} to envelop {dom.yourHis} "+getDickName()+" but it's too big!"}
		
		affectSub(subInfo.fetishScore({fetishReceiving: 1.0}), 0.1, 0.0, 0.0)
		affectDom(domInfo.fetishScore({fetishGiving: 1.0}), 0.1*domSensetivity(), -0.01)
		subInfo.addArousalSex(0.1)
		domInfo.addArousalSex(0.1*domSensetivity())
		
		#getSub().gotFuckedBy(usedBodypart, domID)
		getSub().gotOrificeStretchedBy(usedBodypart, domID, 0.2)
		gonnaCumOutside = false
		state = "fucking"
		return {text = "{sub.You} {sub.youVerb('engulf')} {dom.youHis} "+getDickName()+", letting it penetrate {sub.yourHis} "+RNG.pick(usedBodypartNames)+"."}
	if(_id == "offerotherhole"):
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('offer')} {sub.yourHis} other hole to {dom.you}.",
		])
		if(getDom().isPlayer()):
			return {text = text}
		
		if(RNG.chance(getDomSwitchHoleChance())):
			text += RNG.pick([
				" {dom.You} {dom.youVerb('nod')}."
			])
			domInfo.remember("switchedHoles")
			
			if(usedBodypart == BodypartSlot.Vagina):
				replaceGoalsTo(SexGoal.FuckAnal)
			else:
				replaceGoalsTo(SexGoal.FuckVaginal)
			
			return {text = text}
		else:
			domInfo.addAnger(0.05)
			text += RNG.pick([
				" {dom.You} {dom.youVerb('ignore')} {sub.yourHis} offer."
			])
			
			return {text = text}
	
	if(_id == "resist"):
		domInfo.addPain(RNG.randi_range(2, 6))
		if(RNG.chance(getSubResistChance(30.0, 25.0))):
			domInfo.addAnger(0.4)
			endActivity()
			return {text = "{sub.You} {sub.youVerb('manage')} to kick {dom.you} off of {sub.youHim}."}
		else:
			domInfo.addAnger(0.2)
			return {text = "{sub.You} {sub.youVerb('resist')} attempts to penetrate {sub.youHis} "+RNG.pick(usedBodypartNames)+".",
			subSay=subReaction(SexReaction.ActivelyResisting, 50)}
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
			"{sub.You} "+moanText+" while being fucked"+getPoseDescriptor()+"!",
			"{sub.You} "+moanText+" while having {sub.yourHis} "+RNG.pick(usedBodypartNames)+" used!",
			"{sub.You} "+moanText+" eagerly!",
		])
		domInfo.addAnger(-0.02)
		domInfo.addLust(5)
		return {text = text}
	if(_id == "resistduringfuck"):
		
		if(RNG.chance(getSubResistChance(20.0, 15.0))):
			domInfo.addAnger(0.2)
			
			state = ""
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('strugle')} enough for {dom.youHim} to pull out!",
			])
			return {text = text}
		else:
			domInfo.addAnger(0.1)
			
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('try', 'tries')} to resist while being fucked"+getPoseDescriptor()+"!",
				"{sub.You} {sub.youVerb('try', 'tries')} to resist while having {sub.yourHis} "+RNG.pick(usedBodypartNames)+" used!",
				"{sub.You} {sub.youVerb('try', 'tries')} to make {dom.youHim} pull out!",
			])
			
			return {text = text, subSay=subReaction(SexReaction.ActivelyResisting, 50)}
		
	if(_id == "begtopullout"):
		domInfo.addAnger(-0.02)
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('beg')} {dom.youHim} not to cum inside.",
			"{sub.You} {sub.youVerb('beg')} {dom.youHim} to pull out.",
		])
		
		if(RNG.chance(10 - 10 * domInfo.fetishScore({Fetish.Breeding: 1.0})) && !getDom().isPlayer()):
			gonnaCumOutside = true
			text += " {dom.you} listened!"
		
		return {text = text, subSay=subReaction(sexReactionPullOut)}

func getAnimation():
	if(getSexType() == SexType.SlutwallSex):
		if(state in [""]):
			return [StageScene.SlutwallSex, "tease", {npc=domID, pc=subID}]
		if(state in ["aftercumminginside", "knotting"]):
			return [StageScene.SlutwallSex, "inside", {npc=domID, pc=subID}]
		if(domInfo.isCloseToCumming() || (isStraponSex() && subInfo.isCloseToCumming())):
			return [StageScene.SlutwallSex, "fast", {npc=domID, pc=subID}]
			
		return [StageScene.SlutwallSex, "sex", {npc=domID, pc=subID}]
	
	if(isStocksSex()):
		if(state in [""]):
			return [StageScene.StocksSex, "tease", {npc=domID, pc=subID}]
		if(state in ["aftercumminginside", "knotting"]):
			return [StageScene.StocksSex, "inside", {npc=domID, pc=subID}]
		if(domInfo.isCloseToCumming() || (isStraponSex() && subInfo.isCloseToCumming())):
			return [StageScene.StocksSex, "fast", {npc=domID, pc=subID}]
			
		return [StageScene.StocksSex, "sex", {npc=domID, pc=subID}]
	
	var animToPlay = StageScene.SexAllFours
	var supportsFlop = false
	if(PoseToAnimName.has(currentPose)):
		animToPlay = PoseToAnimName[currentPose]
	if(animToPlay == StageScene.SexAllFours):
		supportsFlop = true
	var shouldFlop = (getSub().hasBoundArms() || subInfo.isUnconscious()) && supportsFlop
	var shouldUncon = subInfo.isUnconscious()
	
	if(shouldFlop):
		if(state in [""]):
			return [animToPlay, "teaseflop", {pc=domID, npc=subID}]
		if(state in ["aftercumminginside", "knotting"]):
			return [animToPlay, "insideflop", {pc=domID, npc=subID}]
		if(domInfo.isCloseToCumming() || (isStraponSex() && subInfo.isCloseToCumming())):
			return [animToPlay, "fastflop", {pc=domID, npc=subID}]
			
		return [animToPlay, "sexflop", {pc=domID, npc=subID}]
	else:
		if(state in [""]):
			return [animToPlay, "tease", {pc=domID, npc=subID, uncon=shouldUncon}]
		if(state in ["aftercumminginside", "knotting"]):
			return [animToPlay, "inside", {pc=domID, npc=subID, uncon=shouldUncon}]
		if(domInfo.isCloseToCumming() || (isStraponSex() && subInfo.isCloseToCumming())):
			return [animToPlay, "fast", {pc=domID, npc=subID, uncon=shouldUncon}]
			
		return [animToPlay, "sex", {pc=domID, npc=subID, uncon=shouldUncon}]

func getDomCondom():
	return getDom().getWornCondom()

func getDomSwitchHoleChance():
	if(domInfo.hasMemory("switchedHoles")):
		return 0.0
	
	var domLikesOtherHoleScore = domInfo.fetishScore({otherHoleFetishGiving:1.0, fetishGiving: -0.5})
	
	return max(5.0, domLikesOtherHoleScore * 100.0 * (1.0 - domInfo.getAngerScore()))

func getDomOrgasmHandlePriority():
	if(isStraponSex()):
		return 5
	return 10

func getSubOrgasmHandlePriority():
	if(isStraponSex()):
		return 10
	return 5

func saveData():
	var data = .saveData()
	
	data["times"] = times
	data["gonnaCumOutside"] = gonnaCumOutside
	data["switchedPoseOnce"] = switchedPoseOnce
	data["currentPose"] = currentPose

	return data
	
func loadData(data):
	.loadData(data)
	
	times = SAVE.loadVar(data, "times", 0)
	gonnaCumOutside = SAVE.loadVar(data, "gonnaCumOutside", false)
	switchedPoseOnce = SAVE.loadVar(data, "switchedPoseOnce", false)
	currentPose = SAVE.loadVar(data, "currentPose", "")
	if(currentPose == ""):
		currentPose = RNG.pick(getAvaiablePoses())
