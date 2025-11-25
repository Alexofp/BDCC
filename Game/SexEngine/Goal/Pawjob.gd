extends SexGoalBase

func _init():
	id = SexGoal.Pawjob

func getVisibleName():
	return "Pawjob"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_domInfo.getChar().hasBoundLegs()):
		return false
	if(!_subInfo.getChar().hasReachablePenis()):
		return false
	if(!_subInfo.getChar().canZoneOrgasm(BodypartSlot.Penis)):
		return false
	
	return true

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 1.0,
		SexGoal.SubUndressDom: 0.1,
		SexGoal.SubOptionalCondomOnSub: 0.2,
	}

func getGoalDefaultWeight():
	return 0.3

func doFastSex(_sexEngine, _domInfo, _subInfo, _data):
	var sub = _subInfo.getChar()
	var dom = _domInfo.getChar()
	
	if(sub.hasReachablePenis()):
		if(RNG.chance(30)):
			sub.cummedOnBy(sub.getID())
		elif(RNG.chance(30)):
			dom.cummedOnBy(sub.getID())
	
	sendSexEvent(_sexEngine, SexEvent.UniqueOrgasm, _domInfo, _subInfo, {orgasmType=UniqueOrgasm.Feet})

func canBegFor() -> bool:
	return true

func getBegName() -> String:
	return "Pawjob"

func getBegCategory() -> Array:
	return BegCategoryExotic

func getBegDesc() -> String:
	return "Beg the dom to give you a pawjob!"

func getBegMessage(_sexEngine, _domInfo, _subInfo) -> String:
	return "{sub.You} {sub.youVerb('beg')} {dom.you} to give {sub.youHim} a pawjob."

func getBegDialogue(_sexEngine, _domInfo, _subInfo) -> String:
	return RNG.pick([
		"Let me feel your soft {dom.feet} stroking my cock, please?",
		"I'd do anything to have your {dom.feet} stroking my cock.",
		"Your {dom.feet} look so perfect, please let me get pleasure from them.",
		"Could you.. use your {dom.feet} to get me off? Please?",
	])

func getBegDomFetishes() -> Dictionary:
	return {
		Fetish.FeetplayGiving: 1.0,
	}
