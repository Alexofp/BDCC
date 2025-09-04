extends SexActivityBase

var leashTimer:int = 0

func _init():
	id = "DomLeashesSub"
	
	activityName = "Grab leash"
	activityDesc = "Grab their leash!"
	activityCategory = ["Humiliate"]

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
	if(!getSub().getInventory().hasEquippedItemWithTag(ItemTag.AllowsEnslaving)):
		return true
	return false

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(!_subInfo.getChar().getInventory().hasEquippedItemWithTag(ItemTag.AllowsEnslaving)):
		return false
	if(_domInfo.getChar().hasBoundArms() || _domInfo.getChar().hasBlockedHands()):
		return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return _domInfo.personalityScore({PersonalityStat.Subby: -0.05}) + _subInfo.getResistScoreSmooth()*0.05

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return []
	if(_indx == SUB_0):
		return [SexActivityTag.Leashed]
	return []

func getCheckTagsDom() -> Array:
	return []

func getCheckTagsSub() -> Array:
	return [SexActivityTag.Leashed]

func startActivity(_args):
	addText("{dom.You} {dom.youVerb('pull')} out a [b]leash[/b] and {dom.youVerb('start')} trying to clip it to {sub.your} collar!")
	react(SexReaction.LeashStart)

func init_processTurn():
	leashTimer += 1
	if(leashTimer >= 2):
		setState("leashed")
		addText("{dom.You} {dom.youVerb('clip')} a [b]leash[/b] to {sub.your} collar!")
		react(SexReaction.Leashed)
		fetishAffect(SUB_0, Fetish.Bondage, 2.0)
		fetishAffect(DOM_0, Fetish.Rigging, 3.0)

func getActions(_indx:int):
	if(_indx == DOM_0):
		if(state == "leashed"):
			addAction("stop", getStopSexScore(DOM_0), "Remove leash", "Stop leashing them", {A_CATEGORY: ["Humiliate"]})
			if(!getSubInfo().isUnconscious()):
				var yankScore:float = getDomInfo().getIsAngryScore() * 1.0 * max(0.1, 0.1 + getDomInfo().personalityScore({PersonalityStat.Mean: 1.0})) - getSubInfo().getAboutToPassOutScore() * getDomInfo().fetishScore({Fetish.UnconsciousSex: -1.0})
				addAction("yank", yankScore, "Yank leash", "Yank on that leash hard!", {A_CATEGORY: ["Violence"]})
	if(_indx == SUB_0):
		if(state == ""):
			addAction("pullaway", getSubInfo().getResistScore(), "Resist leash!", "Try to pull away from the leash", {A_CHANCE: getSubResistChance(90.0, 40.0)})

func doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "stop"):
		endActivity()
		addText("{dom.You} {dom.youVerb('unclip')} the leash from {sub.your} collar.")
		return 
	if(_id == "yank"):
		addText("{dom.You} [b]{dom.youVerb('yank')}[/b] on {sub.your} leash [b]hard[/b], choking {sub.youHim}.")
		choke(DOM_0, SUB_0, CHOKE_VERYHARD)
		react(SexReaction.LeashYank, [50.0, 30.0])
		return 

	if(_id == "pullaway"):
		var successChance:float = getSubResistChance(90.0, 40.0)
		if(RNG.chance(successChance)):
			addText("{sub.You} {sub.youVerb('resist')} and {sub.youVerb('manage')} to avoid getting leashed by {dom.you}!")
			getDomInfo().addAnger(0.3)
			endActivity()
			fetishUp(SUB_0, Fetish.Bondage, -5.0)
			fetishUp(DOM_0, Fetish.Rigging, -4.0)
			return
		else:
			addText("{sub.You} {sub.youVerb('try', 'tries')} to resist getting leashed but {sub.youVerb('fail')}.")
			getDomInfo().addAnger(0.1)
			fetishUp(SUB_0, Fetish.Bondage, -3.0)
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
	
func getLeashes() -> Dictionary:
	if(state == ""):
		return {}
	return {
		DOM_0: SUB_0,
	}

func saveData():
	var data = .saveData()
	
	data["leashTimer"] = leashTimer

	return data
	
func loadData(data):
	.loadData(data)
	
	leashTimer = SAVE.loadVar(data, "leashTimer", 0)
