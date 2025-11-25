extends SexGoalBase

func _init():
	id = SexGoal.FuckOral

func getVisibleName():
	return "Fuck orally"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if((!_domInfo.getChar().hasReachablePenis() && !_domInfo.getChar().hasReachableVagina()) || _subInfo.getChar().isOralBlocked()):
		return false
	if(!_domInfo.getChar().canZoneOrgasm(BodypartSlot.Penis) && !_domInfo.getChar().canZoneOrgasm(BodypartSlot.Vagina)):
		return false
	
	return true

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressDom: 1.0,
	}

func domWantsToCum():
	return true

func doFastSex(_sexEngine, _domInfo, _subInfo, _data):
	var sub = _subInfo.getChar()
	var dom = _domInfo.getChar()
	
	if(dom.hasReachablePenis() && RNG.chance(50)):
		sub.gotThroatFuckedBy(dom.getID())
		if(RNG.chance(50)):
			sub.cummedInMouthBy(dom.getID())
		else:
			sub.cummedOnBy(dom.getID(), FluidSource.Penis)
	elif(dom.hasReachableVagina()):
		if(RNG.chance(50)):
			sub.cummedInMouthBy(dom.getID(), FluidSource.Vagina, RNG.randf_range(0.4, 0.8))
		else:
			sub.cummedOnBy(dom.getID(), FluidSource.Vagina, RNG.randf_range(0.4, 0.8))

	if(RNG.chance(50)):
		sendSexEvent(_sexEngine, SexEvent.PainInflicted, _domInfo, _subInfo, {pain=RNG.randi_range(1, 20),isDefense=false,intentional=false})

	if(RNG.chance(20)):
		var zone = BodyWritingsZone.getRandomZone()
		var writingID = BodyWritings.getRandomWritingIDForZone(zone)
		sub.addBodywriting(zone, writingID)
		sendSexEvent(_sexEngine, SexEvent.BodyWritingAdded, _domInfo, _subInfo, {zone=zone,writingID=writingID})
	
	if(RNG.chance(20) || sub.hasTallymarks() || (_sexEngine.getSexTypeID() in [SexType.StocksSex, SexType.SlutwallSex])):
		sub.addTallymarkFace()

func canBegFor() -> bool:
	return true

func getBegName() -> String:
	return "Offer mouth"

func getBegCategory() -> Array:
	return BegCategorySex

func getBegDesc() -> String:
	return "Beg the dom to fuck your face!"

func getBegMessage(_sexEngine, _domInfo, _subInfo) -> String:
	var _isBusy:bool = _sexEngine.hasTag(_subInfo.charID, SexActivityTag.HavingSex)

	if(!_isBusy):
		return "{sub.You} {sub.youVerb('open')} {sub.yourHis} mouth wide for {dom.you}."
	
	return "{sub.You} {sub.youVerb('beg')} {dom.you} to use {sub.yourHis} mouth."

func getBegDialogue(_sexEngine, _domInfo, _subInfo) -> String:
	var hasVag:bool = _domInfo.getChar().hasReachableVagina()
	var hasPP:bool = _domInfo.getChar().hasReachablePenis()
	
	if(hasVag && hasPP):
		return RNG.pick([
			"I'm begging you, fuck my mouth with your cock.. or grind on my tongue, just use me.",
			"Use my face however you want, just let me serve you.",
			"I need your cunt on my mouth, please, grind against my tongue.. Or just shove your cock down my throat.",
			"Let me worship your pussy or cock with my mouth, please.",
			"Please, I need your cock in my mouth.. or your pussy on my tongue, just use my face.",
			"I'm begging you, let me taste you. Fuck my mouth or ride my tongue, I need to feel you.",
			"Please, use my face. I want you to come all over it or fuck my throat until I can't breathe.",
			"I need you to ruin me. Please, fuck my mouth with your cock or smother me with your cunt.",
		])
	if(hasVag):
		return RNG.pick([
			"Please, let me taste you.",
			"I need to feel you on my tongue, please.",
			"Use my face, I'm begging you.",
			"Let me worship you with my mouth, please.",
			"Grind yourself against me, I need it.",
			"Please, just sit on my face and use me.",
			"I'm desperate to lick your pussy.",
			"Please, let me make you cum with my tongue.",
			"I'll be good, just let me eat you out.",
			"Smother me with your pussy, please.",
			"Ride my face, I need to feel you.",
		])
	return RNG.pick([
		"Please, use my mouth, I need to feel you.",
		"I'm begging you, fuck my face.",
		"Don't make me wait, just fuck my throat already.",
		"Please, shove your cock down my throat and use me.",
		"Please stretch my throat, just face-fuck me.",
		"Just grab my head and take what you need, please.",
		"I'll be good, I promise, just please fuck my face."
	])

func getBegDomFetishes() -> Dictionary:
	return {
		Fetish.OralSexGiving: 1.0,
	}
