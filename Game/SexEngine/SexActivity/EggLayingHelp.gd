extends SexActivityBase

var shouldDoFlopAnim:bool = false
var shouldDoEggAnim:bool = false

var eggsCanStealAmount:int = 0

func _init():
	id = "EggLayingHelp"
	
	activityName = "Egg laying"
	activityDesc = "Help them to lay eggs since they clearly need it!"
	activityCategory = []

func getGoals():
	return {
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
	}

func isActivityImpossibleShouldStop() -> bool:
	#if(getSubInfo().isUnconscious()):
	#	return true
	return false

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(!_domInfo.getChar().isPlayer()):
		return false
	
	if(false && !_subInfo.getChar().isReadyToLayEggs()):
		return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return [SexActivityTag.HandsUsed, SexActivityTag.HavingSex]
	if(_indx == SUB_0):
		return [SexActivityTag.PreventsSubTeasing, SexActivityTag.VaginaUsed, SexActivityTag.AnusUsed, SexActivityTag.HavingSex]
	return []

func startActivity(_args):
	addText("{dom.You} {dom.youVerb('prepare')} to help {sub.you} lay eggs!")
	#react(SexReaction.AboutToBeatUp)

func processTurn():
	addText("MEOW")
	
	if(!getSub().isReadyToLayEggs()):
		if(getSub().isEggStuffed()):
			addText("There are no eggs left that {sub.you} can lay currently..")
		else:
			addText("There are no eggs left that {sub.you} can lay..")

func getActions(_indx:int):
	if(_indx == DOM_0):
		addAction("stop", 1.0 if !getSub().isReadyToLayEggs() else 0.0, "Stop helping", "Enough egg laying..")
		
		if(true || getSub().isReadyToLayEggs()):
			addAction("egg", 1.0, "Help lay", "Help them to lay an egg!", {A_PRIORITY: 5})
		
	if(_indx == SUB_0):
		var escapeScore:float = 0.0 + getSubInfo().getResistScoreSmooth() * 0.2 - getSubInfo().fetishScore({Fetish.BeingBred: 0.5})
		addAction("escape", escapeScore, "Resist", "Try to resist this", {A_CHANCE: getResistChance(SUB_0, DOM_0, RESIST_LEGS_FOCUS, 20.0, 0.0)})

func doAction(_indx:int, _actionID:String, _action:Dictionary):
	if(_actionID == "egg"):
		shouldDoEggAnim = true
		
		if(!getSub().isReadyToLayEggs()):
			shouldDoFlopAnim = true
		
	if(_actionID == "stop"):
		endActivity()
		addText("{dom.You} {dom.youVerb('have', 'has')} stopped helping {sub.you}.")
	
	if(_actionID == "escape"):
		if(RNG.chance(getResistChance(SUB_0, DOM_0, RESIST_LEGS_FOCUS, 20.0, 0.0))):
			addText("{sub.You} {sub.youVerb('pull')} away from {dom.you}.")
			getDomInfo().addAnger(0.3)
			if(state != ""):
				state = ""
			else:
				endActivity()
		else:
			addTextPick([
				"{sub.You} desperately {sub.youVerb('try', 'tries')} to pull away from {dom.you}.",
			])
			getDomInfo().addAnger(0.03)
		reactSub(SexReaction.Resisting, [50])
		return

func getAnimationPriority():
	return 10

func getAnimation():
	if(shouldDoEggAnim):
		shouldDoEggAnim = false
		return [StageScene.EggLaying, "1", {pc=SUB_0, npc=DOM_0, shouldAutoFlop=shouldDoFlopAnim}]
	return [StageScene.EggLaying, "idle" if !shouldDoFlopAnim else "after", {pc=SUB_0, npc=DOM_0, shouldAutoFlop=shouldDoFlopAnim}]

func hasAnimsToPlay() -> bool:
	return true
