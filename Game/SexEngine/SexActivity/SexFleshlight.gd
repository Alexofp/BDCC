extends SexActivityBase

var targetID:String = ""
var targetHole:String = S_ANUS
var npcsWithPortalPanties:Array = []
var shouldCalculateNpcsWithPortalPanties:bool = true

func _init():
	id = "SexFleshlight"
	
	activityName = "Portal Fleshlight"
	activityDesc = "Use a fleshlight to pleasure the sub!"
	activityCategory = ["Fuck"]

func getGoals():
	return {
		#SexGoal.SubUndressSub: 1.0,
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		#SexType.StocksSex: true,
		#SexType.SlutwallSex: true,
	}

func isActivityImpossibleShouldStop() -> bool:
	if(!getSub().hasReachablePenis()):
		return true
	if(targetID != ""):
		var theChar:BaseCharacter = GlobalRegistry.getCharacter(targetID)
		if(!theChar):
			return true
		if(!theChar.hasBodypart(targetHole)):
			return true
	if(getSubInfo().isUnconscious()):
		return true
	return false

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(!_domInfo.getChar().isPlayer()):
		return false
	
	if(!_domInfo.getChar().getInventory().hasItemID("PortalPantiesFleshlight")):
		return false
	if(!_subInfo.getChar().hasReachablePenis()):
		return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		if(state != ""):
			return [SexActivityTag.HavingSex, SexActivityTag.HandsUsed]
		return [SexActivityTag.HavingSex]
	if(_indx == SUB_0):
		if(state != ""):
			return [SexActivityTag.HavingSex, SexActivityTag.PenisUsed, SexActivityTag.PenisInside, SexActivityTag.PreventsSubTeasing]
		return [SexActivityTag.HavingSex]
	return []

func getCheckTagsDom() -> Array:
	return [SexActivityTag.HavingSex]

func getCheckTagsSub() -> Array:
	return [SexActivityTag.HavingSex]

func startActivity(_args):
	addText("Change me.")

func processTurn():
	return

func addTextTarget(_text:String):
	addText(_text.replace("<TARGET>", targetID))

func init_processTurn():
	if(targetID != ""):
		var theChar:BaseCharacter = GlobalRegistry.getCharacter(targetID)
		if(!theChar):
			return
		if(!theChar.hasBodypart(targetHole)):
			return
		addTextTarget("Fleshlight target: {<TARGET>.Your} "+getNameHoleGeneric(targetHole)+".")
		getSubInfo().addArousalForeplay(0.1)
		
func sex_processTurn():
	addTextPick([
		"{dom.You} {dom.youAre} stroking {sub.your} {sub.penisShort} with a fleshlight.",
		"{dom.You} {dom.youVerb('slide')} a fleshlight along {sub.your} {sub.penisShort}.",
		"{dom.You} {dom.youVerb('pleasure')} {sub.your} {sub.penisShort} with a fleshlight.",
	])
	stimulate(SUB_0, S_PENIS, getTargetIndx(), targetHole, I_NORMAL, Fetish.VaginalSexGiving if targetHole == S_VAGINA else S_ANUS)
	doProcessFuck(SUB_0, getTargetIndx(), targetHole, " through the portal panties")
	doProcessFuckExtra(SUB_0, getTargetIndx(), targetHole)
	if(isReadyToCumHandled(getTargetIndx()) && getTargetIndx() != SUB_0):
		cumGeneric(getTargetIndx(), getTargetIndx(), UniqueOrgasm.PortalSex)
	
	if(RNG.chance(20) && getSexEngine().isInvolved(targetID)):
		var theTargetInfo:= getSexEngine().getCharInfo(targetID)
		if(!theTargetInfo.isUnconscious()):
			addTextTarget(RNG.pick([
				"{<TARGET>.You} {<TARGET>.youVerb('moan')} while being fucked remotely!",
				"{<TARGET>.You} {<TARGET>.youVerb('squirm')} while being fucked remotely!",
			]))
			moan(getTargetIndx())
	
	clearTargetIndx()

func inside_processTurn():
	cockWarmer(getTargetIndx(), SUB_0, targetHole)
	clearTargetIndx()

const HOLES_CAN_PORTAL_FUCK = [S_VAGINA, S_ANUS]

func getActions(_indx:int):
	if(_indx == DOM_0):
		addAction("stop", getStopScore(), "Stop fleshlight", "Put the fleshlight away")
		
		if(state == ""):
			var theNpcs:Array = getNpcsWithPortalPanties()
			for portalNPC in theNpcs:
				var charName:String = portalNPC.getName()
				for slot in HOLES_CAN_PORTAL_FUCK:
					var theHoleName:String = getNameHoleGeneric(slot)
					addAction("setTarget", 0.0, theHoleName, "Target "+charName+"'s "+theHoleName, {
						A_CATEGORY: ["Fleshlight Target", charName], A_ARGS: [portalNPC.getID(), slot], A_PRIORITY: 5,
					})
		
			if(isReadyToFuck(SUB_0)):
				addAction("penetrate", 1.0, "Penetrate", "Try to penetrate that hole with the sub's cock.")
		if(state == "inside"):
			addAction("pullout", getStopScore(), "Pull out", "Pull the sub's member out of that fleshlight")
			addAction("fuckmore", 0.5, "Stroke more", "Start moving your hand again!")
		if(state == "sex"):
			addAction("pause", 0.0, "Pause stroking", "Give the sub some rest.")
		
	if(_indx == SUB_0):
		addAction("pullaway", getSubInfo().getResistScore(), "Pull away", "Try to pull away", {A_CHANCE: getSubResistChance(30.0, 25.0)})
		if(isReadyToCumHandled(SUB_0)):
			addAction("subcum", 1.0, "Orgasm!", "You are about to cum!", {A_PRIORITY: 1001})

func doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "stop"):
		endActivity()
		addText("{dom.You} pulled away.")
		return 
	if(_id == "pullout"):
		state = ""
		addText("{dom.You} {dom.youVerb('pull')} the fleshlight off of {sub.your} {sub.penisShort}.")
		return
	if(_id == "fuckmore"):
		state = "sex"
		addText("{dom.You} {dom.youVerb('begin')} to move {dom.yourHis} hand again, sliding the fleshlight along {sub.your} {sub.penisShort}.")
		return
	if(_id == "pause"):
		state = "inside"
		addText("{dom.You} {dom.youVerb('pause')} the stroking, giving {sub.you} some rest.")
		return
	if(_id == "setTarget"):
		targetID = _action["args"][0]
		targetHole = _action["args"][1]
		
		addTextTarget("{dom.You} {dom.youVerb('pick')} the target! A portal opens up on the fleshlight, revealing {<TARGET>.your} "+getNameHoleGeneric(targetHole)+".")
		if(targetID == getDomOrSubID(DOM_0)):
			talkText(DOM_0, RNG.pick([
				"Hope you like this one.",
				"See that? That's my "+getNameHole(DOM_0, targetHole)+".",
				"Wanna fuck me? You can now.",
				"Do you like this one? It's mine.",
				"This "+getNameHole(DOM_0, targetHole)+" is mine, by the way.",
			]))
		elif(targetID == getDomOrSubID(SUB_0)):
			talkText(DOM_0, RNG.pick([
				"Looks familliar? It should.",
				"Think you can handle yourself?",
				"I can see your "+getNameHole(SUB_0, targetHole)+" clench.",
				"Do you like this one? It's yours actually.",
				"This "+getNameHole(SUB_0, targetHole)+" is yours, by the way.",
			]))
		else:
			talkText(DOM_0, RNG.pick([
				"Wonder if you know them.",
				"Can you recognize who it is just by their holes?",
				"Ready to feel them around your cock?",
				"Ready to fuck someone else?",
			]))
		return
	if(_id == "penetrate"):
		if(tryPenetrate(SUB_0, getTargetIndx(), targetHole)):
			state = "sex"
		clearTargetIndx()
		return
	
	if(_id == "subcum"):
		cumInside(SUB_0, getTargetIndx(), targetHole)
		clearTargetIndx()
		state = "inside"
		return
		
	if(_id == "pullaway"):
		#if(pullAway(SUB_0, DOM_0, chance)):
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
	if(state == "inside"):
		return [StageScene.SexFleshlight, "inside", {pc=SUB_0, npc=DOM_0, bodyState={hard=true}}]
	if(state == "sex"):
		if(isCloseToCumming(SUB_0) || isCloseToCumming(DOM_0)):
			return [StageScene.SexFleshlight, "fast", {pc=SUB_0, npc=DOM_0, bodyState={hard=true}}]
		return [StageScene.SexFleshlight, "sex", {pc=SUB_0, npc=DOM_0, bodyState={hard=true}}]
	return [StageScene.SexFleshlight, "tease", {pc=SUB_0, npc=DOM_0}]

func getAnimationPriority():
	return 10

func getOrgasmHandlePriority(_indx:int) -> int:
	if(_indx == SUB_0):
		return 10
	if(_indx == SUB_1):
		return 10
	if(_indx == DOM_0 && targetID == getDomID()):
		return 10
	return -1

func calculateNpcsWithPortalPanties() -> Array:
	var result:Array = []
	
	if(GM.pc.isWearingPortalPanties()):
		result.append(GM.pc)
	
	var staticChars = GM.main.getCharacters()
	for charID in staticChars:
		var character:Character = staticChars[charID]
		if(character.isWearingPortalPanties() || character.isWearingInvisiblePortalPanties()):
			character.updateNonBattleEffects()
			result.append(character)
	
	var dynamicChars = GM.main.getDynamicCharacters()
	for charID in dynamicChars:
		var character:Character = dynamicChars[charID]
		if(character.isWearingPortalPanties() || character.isWearingInvisiblePortalPanties()):
			character.updateNonBattleEffects()
			result.append(character)
	
	return result

func getNpcsWithPortalPanties() -> Array:
	if(!shouldCalculateNpcsWithPortalPanties):
		return npcsWithPortalPanties
	shouldCalculateNpcsWithPortalPanties = false
	npcsWithPortalPanties = calculateNpcsWithPortalPanties()
	return npcsWithPortalPanties

func charCanUseVagina(character) -> bool:
	if(character.isWearingPortalPanties()):
		return (character.hasVagina())
	if(character.isWearingInvisiblePortalPanties()):
		return character.hasVagina() && character.getPortalSexHoleAvailable(BodypartSlot.Vagina)
	return false

func charCanUseAnus(character) -> bool:
	if(character.isWearingPortalPanties()):
		return (character.hasAnus())
	if(character.isWearingInvisiblePortalPanties()):
		return character.hasAnus() && character.getPortalSexHoleAvailable(BodypartSlot.Anus)
	return false

func charCanUse(character, slot:String) -> bool:
	if(slot == S_VAGINA):
		return charCanUseVagina(character)
	if(slot == S_ANUS):
		return charCanUseAnus(character)
	return false

func getExtraInvolvedCharIDs() -> Array:
	if(targetID != ""):
		return [targetID]
	return []

# Temporarily adds the target as SUB_1 if they aren't participating. Huge hack.
func getTargetIndx() -> int:
	if(targetID == ""):
		assert(false, "Target ID is Empty!")
		return SUB_0
	if(subs.size() > 1):
		return SUB_1
	if(isDom(targetID)):
		return DOM_0
	if(isSub(targetID)):
		return SUB_0
	var tempInfo:SexSubInfo = SexSubInfo.new()
	tempInfo.initInfo(targetID, getSexEngine())
	subs.append(tempInfo)
	return SUB_1

func clearTargetIndx():
	if(subs.size() > 1):
		subs.remove(1)

func saveData():
	var data = .saveData()
	
	data["targetID"] = targetID
	data["targetHole"] = targetHole

	return data
	
func loadData(data):
	.loadData(data)
	
	targetID = SAVE.loadVar(data, "targetID", "")
	targetHole = SAVE.loadVar(data, "targetHole", S_ANUS)
	
	shouldCalculateNpcsWithPortalPanties = true
