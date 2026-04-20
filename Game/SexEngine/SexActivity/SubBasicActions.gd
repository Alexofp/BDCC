extends SexActivityBase

func _init():
	id = "SubBasicActions"
	startedByDom = false
	startedBySub = true
	
	activityName = "Basic actions"
	activityDesc = "Basic things that a sub can do"
	activityCategory = []

func getGoals():
	return {
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		SexType.StocksSex: true,
		SexType.SlutwallSex: true,
		SexType.BitchsuitSex: true,
		SexType.TentaclesSex: true,
	}

func isStocksSex() -> bool:
	return getSexEngine().getSexTypeID() == SexType.StocksSex

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return 0.0

func getStartActions(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var sub:BaseCharacter = _subInfo.getChar()
	#var dom:BaseCharacter = _domInfo.getChar()
	
	if(!_sexEngine.hasTag(_subInfo.charID, SexActivityTag.PreventsSubTeasing) && !_sexEngine.hasTag(_subInfo.charID, SexActivityTag.HavingSex) && !_sexEngine.hasTag(_subInfo.charID, SexActivityTag.VaginaPenetrated)&& !_sexEngine.hasTag(_subInfo.charID, SexActivityTag.AnusPenetrated) && !_sexEngine.hasTag(_subInfo.charID, SexActivityTag.MouthUsed)):
		var teaseScore:float = _subInfo.getComplyScore() * 0.1 + _subInfo.getResistScore() * 0.05 + max(0.0, _subInfo.personalityScore({PersonalityStat.Impatient: 0.1}))
		addStartAction(["tease"], "Tease", "Tease them", teaseScore, {A_CATEGORY: []})
		
	var resistScore:float = _subInfo.getResistScore() * (0.15 + _subInfo.personalityScore({PersonalityStat.Subby: -0.1, PersonalityStat.Mean: 0.1, PersonalityStat.Coward: -0.05}))
	if(!_sexEngine.hasTag(_subInfo.charID, SexActivityTag.PreventsSubViolence)):
		if(_sexEngine.getSexTypeID() != SexType.SlutwallSex):
			if(!_subInfo.getChar().hasBoundArms() && _sexEngine.getSexTypeID() != SexType.StocksSex):
				addStartAction(["punch"], "Punch", "Hit them!", resistScore, {A_CATEGORY:[]})
			elif(!_subInfo.getChar().hasBoundLegs()):
				addStartAction(["kick"], "Kick", "Hit them!", resistScore/1.5, {A_CATEGORY: []})
	
	if(sub.getInventory().hasRemovableRestraintsNoLockedSmartlocks() && sub.getStamina() > 0):
		var struggleScore:float = _subInfo.getResistScore() - _subInfo.getComplyScore()*_subInfo.fetishScore({Fetish.Bondage: 1.0})
		addStartAction(["struggle"], "Restraints", "Struggle against your restraints", struggleScore, {A_CATEGORY: []})
	
	if(_domInfo.isAngry() && !_sexEngine.hasTag(_subInfo.charID, SexActivityTag.MouthUsed)):
		var apologizeScore:float = _subInfo.getAboutToPassOutScore() + _subInfo.personalityScore({PersonalityStat.Coward: 0.2, PersonalityStat.Brat: -0.1, PersonalityStat.Subby: 0.2})
		addStartAction(["apologize"], "Apologize", "Try to calm them down", apologizeScore, {A_CATEGORY: [], A_CHANCE: getApologySuccessChance(_sexEngine, _domInfo, _subInfo)})

func getApologySuccessChance(_sexEngine, _domInfo, _subInfo) -> float:
	var theChance = 90.0 - _domInfo.personalityScore({PersonalityStat.Mean: 1.0}) * 20.0
	if(_subInfo.getChar().isGagged()):
		theChance *= 0.5
	if(_sexEngine.getSexTypeID() == SexType.SlutwallSex):
		theChance *= 0.6
	return clamp(theChance, 5, 100)

func startActivity(_args):
	var actionID:String = _args[0]
	
	if(actionID in ["struggle"]):
		endActivity()
		var sub = getSub()
		var struggleData:Dictionary = sub.doStruggleOutOfRestraints(getSubInfo().isScared(), false)
		if(struggleData.empty()):
			return
		
		var text:String = struggleData["text"] if struggleData.has("text") else "[color=red]ERROR? No struggle text provided[/color]"
		
		if(struggleData.has("lust") && struggleData["lust"] > 0):
			getSubInfo().addLust(struggleData["lust"])
		if(struggleData.has("pain") && struggleData["pain"] > 0):
			getSubInfo().addPain(struggleData["pain"])
			getSubInfo().addFear(struggleData["pain"]/40.0)
		if(struggleData.has("stamina") && struggleData["stamina"] != 0):
			sub.addStamina(-struggleData["stamina"])
		
		addText(text)
		reactSub(SexReaction.ResistingRestraints, [30])
		fetishUp(SUB_0, Fetish.Bondage, -1.0)
		return
	
	if(actionID in ["apologize"]):
		endActivity()
		var text:String = RNG.pick([
			"{sub.You} {sub.youVerb('try', 'tries')} to apologize.",
			"{sub.You} {sub.youVerb('attempt')} to apologize for {sub.yourHis} actions.",
		])
		if(!RNG.chance(getApologySuccessChance(getSexEngine(), getDomInfo(), getSubInfo()))):
			if(RNG.chance(30)):
				getDomInfo().addAnger(0.1)
				text += RNG.pick([
					" That only made {dom.youHim} more angry.",
					" That only made {dom.youHim} more eager for violence.",
				])
		else:
			getDomInfo().addAnger(-0.3)
		
		addText(text)
		reactSub(SexReaction.Apologizing)
		return
	
	if(actionID in ["tease"]):
		endActivity()
		var possible:Array = [
			"{sub.You} {sub.youVerb('tease')} {dom.youHim} with {sub.yourHis} body.",
		]
		if(isStocksSex()):
			possible = [
				"{sub.You} {sub.youVerb('tease')} {dom.youHim} with {sub.yourHis} body while still trapped in stocks.",
				"{sub.You} {sub.youVerb('wiggle')} {sub.yourHis} lower part of the body seductively.",
			]
		if(getSub().isGagged()):
			possible.append_array([
				"{sub.You} {sub.youVerb('mumble')} something incoherent {dom.youHim}.",
			])
		else:
			possible.append_array([
				"{sub.You} {sub.youVerb('smile')} "+RNG.pick(["seductively", "playfully", "teasingly"])+" at {dom.youHim}.",
				"{sub.You} {sub.youVerb('bite')} {sub.yourHis} lip "+RNG.pick(["seductively", "playfully", "teasingly"])+".",
			])
		if(getSub().bodypartHasTrait(BodypartSlot.Tail, PartTrait.TailFlexible)):
			possible.append_array([
				"{sub.You} {sub.youVerb('sway')} {sub.yourHis} tail seductively at {dom.youHim}.",
			])
		if(getSub().hasBigBreasts()):
			possible.append_array([
				"{sub.You} {sub.youVerb('bounce')} slightly, making {sub.yourHis} "+RNG.pick(["tits", "breasts"])+" jiggle.",
			])
		if(getSexType() == SexType.SlutwallSex):
			possible = [
				"{sub.You} {sub.youVerb('tease')} {dom.youHim} with {sub.yourHis} body while still trapped in the slutwall.",
				"{sub.You} {sub.youVerb('wiggle')} {sub.yourHis} lower part of the body seductively.",
			]
			if(getSub().bodypartHasTrait(BodypartSlot.Tail, PartTrait.TailFlexible)):
				possible.append_array([
					"{sub.You} {sub.youVerb('sway')} {sub.yourHis} tail seductively at {dom.youHim}.",
				])
			
		var text:String = RNG.pick(possible)
		
		affectDom(1.0, 0.2, 0.0)
		addText(text)
		reactSub(SexReaction.Teasing)
		return
		
	if(actionID in ["punch", "kick"]):
		endActivity()
		var text:String = ""
		if(actionID == "punch"):
			text = RNG.pick([
				"{sub.You} {sub.youVerb('punch', 'punches')} {dom.youHim}!",
			])
		else:
			text = RNG.pick([
				"{sub.You} {sub.youVerb('kick')} {dom.youHim}!",
			])
		getDomInfo().addAnger(0.2 + 0.1 * getDomInfo().fetishScore({Fetish.Masochism: -1.0}))
		var howMuchPainAdded = RNG.randi_range(4, 6)
		getDomInfo().addPain(howMuchPainAdded)
		sendSexEvent(SexEvent.PainInflicted, SUB_0, DOM_0, {pain=howMuchPainAdded,isDefense=true,intentional=true})
		
		addText(text)
		reactSub(SexReaction.ActivelyResisting, [50])
		return
