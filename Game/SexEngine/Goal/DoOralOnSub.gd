extends SexGoalBase

func _init():
	id = SexGoal.DoOralOnSub

func getVisibleName():
	return "Do oral on sub"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if((!_subInfo.getChar().hasReachablePenis() && !_subInfo.getChar().hasReachableVagina()) || _domInfo.getChar().isOralBlocked()):
		return false
	if(!_subInfo.getChar().canZoneOrgasm(BodypartSlot.Penis) && !_subInfo.getChar().canZoneOrgasm(BodypartSlot.Vagina)):
		return false

	return true

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 1.0,
	}

func doFastSex(_sexEngine, _domInfo, _subInfo, _data):
	var sub = _subInfo.getChar()
	var dom = _domInfo.getChar()
	
	if(sub.hasReachablePenis() && RNG.chance(50)):
		dom.gotThroatFuckedBy(sub.getID())
		if(RNG.chance(50)):
			dom.cummedInMouthBy(sub.getID())
		else:
			dom.cummedOnBy(sub.getID(), FluidSource.Penis)
	elif(sub.hasReachableVagina()):
		if(RNG.chance(50)):
			dom.cummedInMouthBy(sub.getID(), FluidSource.Vagina, RNG.randf_range(0.4, 0.8))
		else:
			dom.cummedOnBy(sub.getID(), FluidSource.Vagina, RNG.randf_range(0.4, 0.8))

func canBegFor() -> bool:
	return true

func getBegName() -> String:
	return "Ask for oral"

func getBegCategory() -> Array:
	return BegCategorySex

func getBegDesc() -> String:
	return "Beg the dom to pleasure your cock or pussy with their mouth!"

func getBegMessage(_sexEngine, _domInfo, _subInfo) -> String:
	#var _isBusy:bool = _sexEngine.hasTag(_subInfo.charID, SexActivityTag.HavingSex)
	var hasVag:bool = _subInfo.getChar().hasReachableVagina()
	var hasPP:bool = _subInfo.getChar().hasReachablePenis()

	if(hasVag && hasPP):
		return "{sub.You} {sub.youVerb('beg')} {dom.you} to pleasure {sub.yourHis} pussy or cock."
	if(hasVag):
		return "{sub.You} {sub.youVerb('beg')} {dom.you} to pleasure {sub.yourHis} {sub.pussyStretch} pussy."
	return "{sub.You} {sub.youVerb('beg')} {dom.you} to pleasure {sub.yourHis} cock."

func getBegDialogue(_sexEngine, _domInfo, _subInfo) -> String:
	var hasVag:bool = _subInfo.getChar().hasReachableVagina()
	var hasPP:bool = _subInfo.getChar().hasReachablePenis()
	
	if(hasVag && hasPP):
		return RNG.pick([
			"Please, I need to feel your lips on my pussy.. or my cock.",
			"Your lips would feel so good on my cock, please? My pussy works too..",
			"I'm aching for your tongue on my pussy.. or around cock..",
			"Could you suck me? Or lick me.. I'll be so good for you.",
			"I need your mouth between my legs, please, I'm begging you.",
		])
	if(hasVag):
		return RNG.pick([
			"Your tongue lapping up my pussy juices is all I can think about, please..",
			"Please, I need your mouth on my pussy so badly.",
			"Your tongue is all I can think about.. please, taste me.",
			"I'm begging you, eat me out. I need to feel your lips on my pussy.",
			"Just a taste, please? Let me feel your tongue on my pussy.",
			"I need your face between my legs. Please don't make me wait.",
			"Your lips would feel so good on my pussy right now, please?",
		])
	return RNG.pick([
		"Please, I need to feel your mouth on my cock.",
		"Wrap those lips around my cock, I'm begging you.",
		"I'll do anything if you just suck my dick.",
		"Please, I need the wet heat of your tongue around my cock.",
		"Please, let me cum in that perfect mouth.",
	])

func getBegDomFetishes() -> Dictionary:
	return {
		Fetish.OralSexGiving: 1.0,
	}
