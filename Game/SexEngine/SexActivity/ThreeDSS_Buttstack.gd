extends SexActivityBase

var sub0Hole:String = S_VAGINA
var sub1Hole:String = S_VAGINA
var domFocus:int = SUB_0

func _init():
	id = "ThreeDSS_Buttstack"
	
	activityName = "Buttstack"
	activityDesc = "Fuck the two subs at once, switching between them at any point!"
	activityCategory = ["Fuck", "Threesome"]

# DOM_0 = fucks vagina
# SUB_0 = gets fucked (bottom one)
# SUB_1 = gets fucked (top one)

func getGoals():
	return {
		SexGoal.FuckVaginal: 1.0,
		SexGoal.StraponVaginal: 1.0,
		SexGoal.FuckAnal: 1.0,
		SexGoal.StraponAnal: 1.0,
	}

func getGoalsFor(_indx:int, _args:Array) -> Dictionary:
	if(_indx == DOM_0):
		return {
			SexGoal.FuckVaginal: 1.0,
			SexGoal.StraponVaginal: 1.0,
			SexGoal.FuckAnal: 1.0,
			SexGoal.StraponAnal: 1.0,
		}
	return {}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		#SexType.StocksSex: true,
		#SexType.SlutwallSex: true,
	}

func isActivityImpossibleShouldStop() -> bool:
	if(!getDom(0).hasReachablePenis() && !getDom(0).isWearingStrapon()):
		return true
	if(sub0Hole == S_VAGINA && !getSub(0).hasReachableVagina()):
		return true
	if(sub0Hole == S_ANUS && !getSub(0).hasReachableAnus()):
		return true
	if(sub1Hole == S_VAGINA && !getSub(1).hasReachableVagina()):
		return true
	if(sub1Hole == S_ANUS && !getSub(1).hasReachableAnus()):
		return true
	return false

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var sub:BaseCharacter = _subInfo.getChar()
	if(!sub.hasReachableAnus()):
		return false
	
	var dom:BaseCharacter = _domInfo.getChar()
	if(!dom.hasReachablePenis() && !dom.isWearingStrapon()):
		return false
	
	if(!hasSubIDsThatSatisfyConditions(_sexEngine, [COND_HasReachableAnus], 1, [_subInfo.getCharID()])):
		return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		if(state != ""):
			return [SexActivityTag.HavingSex, SexActivityTag.PenisUsed, SexActivityTag.PenisInside]
		return [SexActivityTag.HavingSex, SexActivityTag.PenisUsed]
	if(_indx == SUB_0):
		if(state != ""):
			return [SexActivityTag.HavingSex, SexActivityTag.AnusUsed if sub0Hole == S_ANUS else SexActivityTag.VaginaUsed, SexActivityTag.AnusPenetrated if sub0Hole == S_ANUS else SexActivityTag.VaginaPenetrated]
		return [SexActivityTag.HavingSex, SexActivityTag.AnusUsed if sub0Hole == S_ANUS else SexActivityTag.VaginaUsed]
	if(_indx == SUB_1):
		if(state != ""):
			return [SexActivityTag.HavingSex, SexActivityTag.AnusUsed if sub1Hole == S_ANUS else SexActivityTag.VaginaUsed, SexActivityTag.AnusPenetrated if sub1Hole == S_ANUS else SexActivityTag.VaginaPenetrated]
		return [SexActivityTag.HavingSex, SexActivityTag.AnusUsed if sub1Hole == S_ANUS else SexActivityTag.VaginaUsed]
	return []

func canPenetrateHole() -> bool:
	return canPenetrateHoleOf(domFocus)

func canSwitchHole() -> bool:
	if(getDomOrSub(domFocus).hasReachableVagina() && getDomOrSub(domFocus).hasReachableAnus()):
		if(state != ""):
			if(domFocus == SUB_0):
				if(sub0Hole == S_ANUS && !hasBodypartUncovered(domFocus, S_VAGINA)):
					return false
				if(sub0Hole == S_VAGINA && !hasBodypartUncovered(domFocus, S_ANUS)):
					return false
			if(domFocus == SUB_1):
				if(sub1Hole == S_ANUS && !hasBodypartUncovered(domFocus, S_VAGINA)):
					return false
				if(sub1Hole == S_VAGINA && !hasBodypartUncovered(domFocus, S_ANUS)):
					return false
		return true
	return false

func canPenetrateHoleOf(_indx:int) -> bool:
	if(_indx == SUB_0):
		if(sub0Hole == S_VAGINA && (!hasBodypartUncovered(_indx, S_VAGINA) || !getDomOrSub(_indx).hasReachableVagina())):
			return false
		if(sub0Hole == S_ANUS && (!hasBodypartUncovered(_indx, S_ANUS) || !getDomOrSub(_indx).hasReachableAnus())):
			return false
	if(_indx == SUB_1):
		if(sub1Hole == S_VAGINA && (!hasBodypartUncovered(_indx, S_VAGINA) || !getDomOrSub(_indx).hasReachableVagina())):
			return false
		if(sub1Hole == S_ANUS && (!hasBodypartUncovered(_indx, S_ANUS) || !getDomOrSub(_indx).hasReachableAnus())):
			return false
	
	return true

func canSwitchTarget() -> bool:
	if(state == ""):
		return true
	return canPenetrateHoleOf(getOtherFocus())

func checkHolesPossible(_shouldAddText:bool=false):
	if(sub0Hole == S_VAGINA):
		if(!getSub(0).hasReachableVagina()):
			sub0Hole = S_ANUS
			if(getSub(0).hasReachableAnus() && _shouldAddText):
				addText("{sub.Your} pussy becomes unavailable so {dom.you} {dom.youVerb('switch', 'switches')} to {sub.yourHis} ass!")
	elif(sub0Hole == S_ANUS):
		if(!getSub(0).hasReachableAnus() && getSub(0).hasReachableVagina()):
			sub0Hole = S_VAGINA
			if(_shouldAddText):
				addText("{sub.Your} anus becomes unavailable so {dom.you} {dom.youVerb('switch', 'switches')} to {sub.yourHis} pussy!")
	if(sub1Hole == S_VAGINA):
		if(!getSub(1).hasReachableVagina()):
			sub1Hole = S_ANUS
			if(getSub(1).hasReachableAnus() && _shouldAddText):
				addText("{sub1.Your} pussy becomes unavailable so {dom.you} {dom.youVerb('switch', 'switches')} to {sub1.yourHis} ass!")
	elif(sub1Hole == S_ANUS):
		if(!getSub(1).hasReachableAnus() && getSub(1).hasReachableVagina()):
			sub1Hole = S_VAGINA
			if(_shouldAddText):
				addText("{sub1.Your} anus becomes unavailable so {dom.you} {dom.youVerb('switch', 'switches')} to {sub1.yourHis} pussy!")

func startActivity(_args):
	var otherSubID:String = getSubIDsThatSatisfyConditions(getSexEngine(), [COND_HasReachableAnus], 1, [getSubInfo().getCharID()])[0]
	pullInSub(otherSubID)
	
	checkHolesPossible()
	
	#addText("{dom.You} and {dom1.you} grab {sub.you} and prepare to double-penetrate {sub.youHim}, "+getYour()+" "+getCocksName()+" are pressed against {sub.yourHis} "+getNameHole(SUB_0, S_VAGINA)+" and "+getNameHole(SUB_0, S_ANUS)+"!")
	addText("{dom.You} {dom.youVerb('grab')} two subs and {dom.youVerb('place')} them on top of each other, forming a buttstack!")
	addText("{dom.Your} {dom.penisShort} is pressed against {<SUB>.your}".replace("<SUB>", indxToTextID(domFocus))+" "+getNameHole(domFocus, getCurrentHole())+getThroughClothingText(DOM_0, S_PENIS)+".")

func onSwitchFrom(_otherActivity, _args):
	pass
	
func getYour(pcIsInvolvedText:String = "your", noPcText:String = "their") -> String:
	if(isSub("pc")):
		return pcIsInvolvedText
	return noPcText

func getCurrentHole() -> String:
	if(domFocus == SUB_0):
		return sub0Hole
	return sub1Hole
func getCurrentGiveFetish() -> String:
	if(getCurrentHole() == S_VAGINA):
		return Fetish.VaginalSexGiving
	return Fetish.AnalSexGiving

func getOtherFocus() -> int:
	if(domFocus == SUB_0):
		return SUB_1
	return SUB_0

func getOtherChar() -> BaseCharacter:
	return getDomOrSub(getOtherFocus())

func processTurn():
	checkHolesPossible(true)

func init_processTurn():
	# Cock pressed against pussy/ass
	pass

func inside_processTurn():
	cockWarmer(domFocus, DOM_0, getCurrentHole())

func sex_processTurn():
	stimulateSex(DOM_0, domFocus, getCurrentHole(), I_NORMAL)
	
	doProcessFuck(DOM_0, domFocus, getCurrentHole(), " in a buttstack position")
	doProcessFuckExtra(DOM_0, domFocus, getCurrentHole())

func getActions(_indx:int):
	if(_indx == DOM_0):
		addAction("stop", getStopScore(), "Stop Buttstack", "Stop the threesome")
		
		if(state == "inside"):
			addAction("fuckMore", getContinueSexScore(_indx, domFocus, getCurrentHole())-getStopScore(), "Continue fucking", "Start fucking them again")
			addAction("pullOut", getStopScore(), "Pull out", "Pull your member out")
		
		if(state == ""):
			addAction("rub", 1.0 if !isReadyToPenetrate(_indx) else 0.4, "Rub", "Rub your cock against them")
			if(isReadyToFuck(DOM_0) && canPenetrateHole()):
				addAction("penetrate", 1.0, "Penetrate", "Try to start fucking them!")
		if(state != "inside"):
			if(canSwitchTarget()):
				addAction("switch", 0.1, "Switch to "+getOtherChar().getName(), "Switch to the other sub!")
			if(canSwitchHole()):
				addAction("switchHole", 0.0, "Switch to "+("pussy" if getCurrentHole() == S_ANUS else "anal"), "Switch which hole you are targeting")
		if(state == "sex"):
			addAction("pause", getPauseSexScore(_indx, domFocus, getCurrentHole()), "Slow down", "Pause the fucking")
		if(state == "sex"):
			if(isReadyToCumHandled(_indx) && !isStrapon(_indx)):
				addAction("cum", 0.0 if canSwitchTarget() else 1.0, "Cum inside", "Cum inside them!", {A_PRIORITY: 1001})
				if(canSwitchTarget()):
					addAction("cumShare", 1.0, "Share load", "Cum inside both of them!", {A_PRIORITY: 1001})
		elif(state == "sex" && isReadyToCumHandled(domFocus) && !canDoActions(domFocus)):
			addAction("subcum", 1.0, "Sub orgasm!", "They are about to cum!", {A_PRIORITY: 1001})
		elif(state == "sex" && isStrapon(_indx) && isReadyToCumHandled(_indx)):
			addAction("domcumstrapon", 1.0, "Cum!", "You're about to cum", {A_PRIORITY: 1001})
		
	if(_indx == SUB_0 || _indx == SUB_1):
		addAction("pullaway", getResistScore(_indx), "Pull away", "Try to pull away", {A_CHANCE: getSubResistChance(30.0, 25.0)})
		if(state == "sex"):
			if(isReadyToCumHandled(_indx)):
				addAction("subcum", 1.0, "Cum!", "You're about to cum!", {A_PRIORITY: 1001})

func doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "switch"):
		
		if(domFocus == SUB_0):
			domFocus = SUB_1
		else:
			domFocus = SUB_0
		checkHolesPossible()
		if(state == ""):
			if(domFocus == SUB_0):
				addText("{dom.You} {dom.youVerb('switch', 'switches')} {dom.yourHis} attention to {sub.you}!")
			else:
				addText("{dom.You} {dom.youVerb('switch', 'switches')} {dom.yourHis} attention to {sub1.you}!")
			addText("{dom.Your} {dom.penisShort} is now pressed against {<SUB>.your}".replace("<SUB>", indxToTextID(domFocus))+" "+getNameHole(domFocus, getCurrentHole())+getThroughClothingText(DOM_0, S_PENIS)+".")

		else:
			tryPenetrate(DOM_0, domFocus, getCurrentHole(), false, true)
			addText("{dom.You} {dom.youVerb('pull')} {dom.yourHis} {dom.penisShort} out and {dom.youVerb('shove')} it down "+("{sub.your}" if domFocus == SUB_0 else "{sub1.your}")+" "+getNameHole(domFocus, getCurrentHole())+" instead!")
		return
	if(_id == "switchHole"):
		addText("{dom.You} {dom.youVerb('switch', 'switches')} holes!")
		if(domFocus == SUB_0):
			if(sub0Hole == S_ANUS):
				sub0Hole = S_VAGINA
			else:
				sub0Hole = S_ANUS
		else:
			if(sub1Hole == S_ANUS):
				sub1Hole = S_VAGINA
			else:
				sub1Hole = S_ANUS
		checkHolesPossible()
		if(state == ""):
			addText("{dom.You} {dom.youVerb('switch', 'switches')} {dom.yourHis} attention to "+("{sub.your}" if domFocus == SUB_0 else "{sub1.your}")+" other hole!")
			addText("{dom.Your} {dom.penisShort} is now pressed against {<SUB>.your}".replace("<SUB>", indxToTextID(domFocus))+" "+getNameHole(domFocus, getCurrentHole())+getThroughClothingText(DOM_0, S_PENIS)+".")

		else:
			addText("{dom.You} {dom.youVerb('pull')} {dom.yourHis} {dom.penisShort} out and {dom.youVerb('guide')} it down the other hole.")
			tryPenetrate(DOM_0, domFocus, getCurrentHole(), false, true)
		return
	if(_id == "cum"):
		stimulate(DOM_0, S_PENIS, domFocus, getCurrentHole(), I_NORMAL, getCurrentGiveFetish())
		var orgAmount:int = 1
		if(isReadyToCumHandled(domFocus)):
			orgAmount += 1
			
		if(orgAmount == 2):
			addText("[b]Double orgasm![/b]")
		if(isReadyToCumHandled(domFocus)):
			cumGeneric(domFocus, DOM_0)
		if(isReadyToCumHandled(DOM_0) && !isStrapon(DOM_0)):
			cumInside(DOM_0, domFocus, getCurrentHole())
		satisfyGoals()
		state = "inside"
		return
	if(_id == "cumShare"):
		stimulate(DOM_0, S_PENIS, SUB_0, sub0Hole, I_NORMAL, Fetish.VaginalSexGiving if sub0Hole == S_VAGINA else Fetish.AnalSexGiving)
		stimulate(DOM_0, S_PENIS, SUB_1, sub1Hole, I_NORMAL, Fetish.VaginalSexGiving if sub1Hole == S_VAGINA else Fetish.AnalSexGiving)
		var otherFocus:int = SUB_0 if domFocus == SUB_1 else SUB_1
		var otherHole:String = sub0Hole if domFocus == SUB_1 else sub1Hole
		var orgAmount:int = 1
		if(isReadyToCumHandled(SUB_0)):
			orgAmount += 1
		if(isReadyToCumHandled(SUB_1)):
			orgAmount += 2
			
		if(orgAmount == 2):
			addText("[b]Double orgasm![/b]")
		if(orgAmount == 3):
			addText("[b]Triple orgasm![/b]")
		if(isReadyToCumHandled(domFocus)):
			cumGeneric(domFocus, DOM_0)
		if(isReadyToCumHandled(otherFocus)):
			cumGeneric(otherFocus, DOM_0)
		if(isReadyToCumHandled(DOM_0) && !isStrapon(DOM_0)):
			cumInsideShare(DOM_0, domFocus, getCurrentHole(), otherFocus, otherHole)
		domFocus = otherFocus
		satisfyGoals()
		state = "inside"
		return
	if(_id == "fuckMore"):
		addText("{dom.You} {dom.youVerb('resume')} the fucking!")
		state = "sex"
		return
	if(_id == "pause"):
		addText("{dom.You} {dom.youVerb('pause')} the fucking.")
		state = "inside"
		return
	if(_id == "pullOut"):
		addText("{dom.You} {dom.youVerb('pull')} out.")
		state = ""
		return
	if(_id == "rub"):
		rubPenisAgainst(DOM_0, domFocus, getCurrentHole())
		return
	if(_id == "penetrate"):
		if(tryPenetrate(DOM_0, domFocus, getCurrentHole())):
			state = "sex"
		return
	if(_id == "stop"):
		endActivity()
		addText("{dom.You} {dom.youVerb('let')} the subs get off of each other.")
		return 
	if(_id == "domcumstrapon"):
		cumGeneric(_indx, _indx)
		return

	if(_id == "pullaway"):
		var successChance:float = getSubResistChance(30.0, 25.0)
		if(RNG.chance(successChance)):
			addText("The subs pull away from {dom.you}.")
			getDomInfo().addAnger(0.3)
			if(getState() != ""):
				setState("")
			else:
				endActivity()
			return
		else:
			addText("The subs try to pull away from {dom.you} but fail.")
			getDomInfo().addAnger(0.1)
			return
	if(_id == "subcum"):
		cumGeneric(_indx, DOM_0)
		
		var shouldGoals:bool = false
		if(isStrapon(DOM_0)):
			cumInside(DOM_0, _indx, getCurrentHole())
			shouldGoals = true
		if(shouldGoals):
			satisfyGoals()
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
	var theSuffix:String = "up" if domFocus == SUB_1 else "down"
	
	if(state == "inside"):
		return [StageScene.ButtStackSex, "inside"+theSuffix, {pc=SUB_0, npc=SUB_1, npc2=DOM_0, npcBodyState={hard=true}, npc2BodyState={hard=true}}]
	if(state == "sex"):
		if(isCloseToCumming(DOM_0) || (isStrapon(DOM_0) && (isCloseToCumming(SUB_0) || isCloseToCumming(SUB_1)))):
			return [StageScene.ButtStackSex, "fast"+theSuffix, {pc=SUB_0, npc=SUB_1, npc2=DOM_0, npcBodyState={hard=true}, npc2BodyState={hard=true}}]
		return [StageScene.ButtStackSex, "sex"+theSuffix, {pc=SUB_0, npc=SUB_1, npc2=DOM_0, npcBodyState={hard=true}, npc2BodyState={hard=true}}]
	return [StageScene.ButtStackSex, "tease", {pc=SUB_0, npc=SUB_1, npc2=DOM_0}]
	#return [StageScene.Duo, "stand", {pc=SUB_0, npc=DOM_0, npcAction="stand"}]

func getAnimationPriority():
	return 10

func getOrgasmHandlePriority(_indx:int) -> int:
	return 10

func saveData():
	var data = .saveData()
	
	data["sub0Hole"] = sub0Hole
	data["sub1Hole"] = sub1Hole
	data["domFocus"] = domFocus

	return data
	
func loadData(data):
	.loadData(data)
	
	sub0Hole = SAVE.loadVar(data, "sub0Hole", S_ANUS)
	sub1Hole = SAVE.loadVar(data, "sub1Hole", S_ANUS)
	domFocus = SAVE.loadVar(data, "domFocus", SUB_0)
