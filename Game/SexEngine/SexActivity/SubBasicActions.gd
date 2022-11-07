extends SexActivityBase

func _init():
	id = "SubBasicActions"
	startedByDom = false
	startedBySub = true

func getGoals():
	return {
	}

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return 0.0

func getStartActions(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	#var sub:BaseCharacter = _subInfo.getChar()
	#var dom:BaseCharacter = _domInfo.getChar()
	var actions = []
	
	if(!_sexEngine.hasAnyAcitivites(_subInfo.charID)):
		actions.append({
			name = "Tease",
			desc = "Tease them",
			args = ["tease"],
			score = _subInfo.getComplyScore() * _subInfo.personalityScore({PersonalityStat.Subby: 0.2, PersonalityStat.Brat: 0.1, PersonalityStat.Impatient: 0.1}),
			category = getCategory(),
			#chance = getApologySuccessChance(_domInfo),
		})
		
	if(!_sexEngine.hasTag(_subInfo.charID, SexActivityTag.PreventsSubViolence)):
		var resistScore = _subInfo.getResistScore() * (0.15 + _subInfo.personalityScore({PersonalityStat.Subby: -0.1, PersonalityStat.Mean: 0.1, PersonalityStat.Coward: -0.05}))
		if(!_subInfo.getChar().hasBoundArms()):
			actions.append({
				name = "Punch",
				desc = "Hit them!",
				args = ["punch"],
				score = resistScore,
				category = getCategory(),
				#chance = getApologySuccessChance(_domInfo),
			})
		elif(!_subInfo.getChar().hasBoundLegs()):
			actions.append({
				name = "Kick",
				desc = "Hit them!",
				args = ["kick"],
				score = resistScore/1.5,
				category = getCategory(),
				#chance = getApologySuccessChance(_domInfo),
			})
	
	if(_domInfo.isAngry()):
		actions.append({
			name = "Apologize",
			desc = "Try to calm them down",
			args = ["apologize"],
			score = _subInfo.personalityScore({PersonalityStat.Coward: 0.2, PersonalityStat.Brat: -0.1, PersonalityStat.Subby: 0.2}),
			category = getCategory(),
			chance = getApologySuccessChance(_domInfo),
		})
	

	
	return actions

func getVisibleName():
	return "Basic actions"

func getCategory():
	return []

func getDomTags():
	return []

func getSubTags():
	return []

func getApologySuccessChance(_domInfo):
	return clamp(90.0 - _domInfo.personalityScore({PersonalityStat.Mean: 1.0}) * 30.0, 5, 100)

func startActivity(_args):
	state = ""
	var actionID = _args[0]
	
	if(actionID in ["apologize"]):
		endActivity()
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('try', 'tries')} to apologize.",
			"{sub.You} {sub.youVerb('attempt')} to apologize for {sub.yourHis} actions.",
		])
		if(!RNG.chance(getApologySuccessChance(domInfo))):
			domInfo.addAnger(0.1)
			text += RNG.pick([
				" That only made {dom.youHim} more angry.",
				" That only made {dom.youHim} more eager for violence.",
			])
		else:
			domInfo.addAnger(-0.3)
		
		return {text = text}
	
	if(actionID in ["tease"]):
		endActivity()
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('tease')} {dom.youHim}.",
		])
		affectDom(1.0, 0.2, 0.0)
		return {text=text}
		
	if(actionID in ["punch", "kick"]):
		endActivity()
		var text
		if(actionID == "punch"):
			text = RNG.pick([
				"{sub.You} {sub.youVerb('punch', 'punches')} {dom.youHim}!",
			])
		else:
			text = RNG.pick([
				"{sub.You} {sub.youVerb('kick')} {dom.youHim}!",
			])
		domInfo.addAnger(0.2 + 0.1 * domInfo.fetishScore({Fetish.Masochist: -1.0}))
		domInfo.addPain(RNG.randi_range(1, 2))
		
		return {text=text}
