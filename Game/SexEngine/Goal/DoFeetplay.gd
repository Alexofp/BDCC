extends SexGoalBase

func _init():
	id = SexGoal.DoFeetplay

func getVisibleName():
	return "Feetplay"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_domInfo.getChar().hasBoundLegs()):
		return false
	if(!_subInfo.getChar().hasReachablePenis() && !_subInfo.getChar().isWearingChastityCage() && !_subInfo.getChar().hasReachableVagina()):
		return false
	
	return true

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 1.0,
	}

func getGoalDefaultWeight():
	return 0.3

func doFastSex(_sexEngine, _domInfo, _subInfo, _data):
	var sub = _subInfo.getChar()
	#var dom = _domInfo.getChar()
	
	if(sub.hasReachablePenis() || sub.isWearingChastityCage()):
		sub.cummedOnBy(sub.getID())
	elif(sub.hasReachableVagina()):
		sub.cummedOnBy(sub.getID(), FluidSource.Vagina)
	
	sendSexEvent(_sexEngine, SexEvent.UniqueOrgasm, _domInfo, _subInfo, {orgasmType=UniqueOrgasm.Feet})

	if(RNG.chance(50)):
		sendSexEvent(_sexEngine, SexEvent.PainInflicted, _domInfo, _subInfo, {pain=RNG.randi_range(1, 20),isDefense=false,intentional=false})

func canBegFor() -> bool:
	return true

func getBegName() -> String:
	return "Feetplay"

func getBegCategory() -> Array:
	return BegCategoryExotic

func getBegDesc() -> String:
	return "Beg the dom to let you feel their feet all over you!"

func getBegMessage(_sexEngine, _domInfo, _subInfo) -> String:
	return "{sub.You} {sub.youVerb('beg')} {dom.you} to put {dom.yourHis} {dom.feet} all over {sub.youHim}."

func getBegDialogue(_sexEngine, _domInfo, _subInfo) -> String:
	return RNG.pick([
		"Please, I need to feel your {dom.feet} on me.",
		"I'm begging to be your doorcarpet, to feel your weight and your skin.",
		"Please, just run your {dom.feet} over me. I need it so badly.",
		"I'll be so good for you, just let me have the touch of your {dom.feet}.",
		"Grant me the honor of feeling your {dom.feet} explore every part of me.",
	])

func getBegDomFetishes() -> Dictionary:
	return {
		Fetish.FeetplayGiving: 1.0,
	}
