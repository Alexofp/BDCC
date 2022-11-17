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
	var sub:BaseCharacter = _subInfo.getChar()
	#var dom:BaseCharacter = _domInfo.getChar()
	var actions = []
	
	if(!_sexEngine.hasTag(_subInfo.charID, SexActivityTag.PreventsSubTeasing) && !_sexEngine.hasTag(_subInfo.charID, SexActivityTag.MouthUsed)):
		actions.append({
			name = "Tease",
			desc = "Tease them",
			args = ["tease"],
			score = _subInfo.getComplyScore() * _subInfo.personalityScore({PersonalityStat.Subby: 0.2, PersonalityStat.Brat: 0.1, PersonalityStat.Impatient: 0.1}),
			category = getCategory(),
			#chance = getApologySuccessChance(_domInfo, _subInfo),
		})
		
	var resistScore = _subInfo.getResistScore() * (0.15 + _subInfo.personalityScore({PersonalityStat.Subby: -0.1, PersonalityStat.Mean: 0.1, PersonalityStat.Coward: -0.05}))
		
	if(!_sexEngine.hasTag(_subInfo.charID, SexActivityTag.PreventsSubViolence)):
		if(!_subInfo.getChar().hasBoundArms()):
			actions.append({
				name = "Punch",
				desc = "Hit them!",
				args = ["punch"],
				score = resistScore,
				category = getCategory(),
				#chance = getApologySuccessChance(_domInfo, _subInfo),
			})
		elif(!_subInfo.getChar().hasBoundLegs()):
			actions.append({
				name = "Kick",
				desc = "Hit them!",
				args = ["kick"],
				score = resistScore/1.5,
				category = getCategory(),
				#chance = getApologySuccessChance(_domInfo, _subInfo),
			})
	
	if(sub.getInventory().hasRemovableRestraints() && sub.getStamina() > 0):
		actions.append({
			name = "Restraints",
			desc = "Struggle against your restraints",
			args = ["struggle"],
			score = _subInfo.getResistScore() - _subInfo.getComplyScore()*_subInfo.fetishScore({Fetish.Bondage: 1.0}),
			category = getCategory(),
		})
	
	if(_domInfo.isAngry() && !_sexEngine.hasTag(_subInfo.charID, SexActivityTag.MouthUsed)):
		actions.append({
			name = "Apologize",
			desc = "Try to calm them down",
			args = ["apologize"],
			score = _subInfo.personalityScore({PersonalityStat.Coward: 0.2, PersonalityStat.Brat: -0.1, PersonalityStat.Subby: 0.2}),
			category = getCategory(),
			chance = getApologySuccessChance(_domInfo, _subInfo),
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

func getApologySuccessChance(_domInfo, _subInfo):
	var theChance = 90.0 - _domInfo.personalityScore({PersonalityStat.Mean: 1.0}) * 20.0
	if(_subInfo.getChar().isGagged()):
		theChance *= 0.5
	return clamp(theChance, 5, 100)

func startActivity(_args):
	state = ""
	var actionID = _args[0]
	
	if(actionID in ["struggle"]):
		endActivity()
		var sub = getSub()
		var possible = []
		var trivial = []
		
		for item in getSub().getInventory().getEquppedRestraints():
			var restraintData: RestraintData = item.getRestraintData()
			
			if(restraintData == null || !restraintData.canStruggle()):
				continue
			
			if(!restraintData.shouldDoStruggleMinigame(sub)):
				trivial.append(item)
			else:
				possible.append(item)
		
		var pickedItem
		var minigameStatus
		if(trivial.size() > 0):
			pickedItem = RNG.pick(trivial)
			minigameStatus = 1.0
		elif(possible.size() > 0):
			pickedItem = RNG.pick(possible)
			minigameStatus = RNG.randf_range(0.6, 0.8)
		else:
			return
		
		var text = ""
		var restraintData: RestraintData = pickedItem.getRestraintData()
		var struggleData = restraintData.doStruggle(sub, minigameStatus)
		
		var struggleText = GM.ui.processString(struggleData["text"], {"user":subID})
		text += struggleText
		
		if(struggleData.has("damage")):
			var damage = struggleData["damage"] * minigameStatus
			restraintData.takeDamage(damage)
			text += ("\n{sub.You} made "+str(Util.roundF(damage*100.0, 1))+"% of progress, "+str(Util.roundF(max(0.0, restraintData.getTightness()*100.0), 1))+"% left.")
		if(struggleData.has("lust") && struggleData["lust"] > 0):
			subInfo.addLust(struggleData["lust"])
		if(struggleData.has("pain") && struggleData["pain"] > 0):
			subInfo.addPain(struggleData["pain"])
		if(struggleData.has("stamina") && struggleData["stamina"] != 0):
			sub.addStamina(-struggleData["stamina"])
		
		if(restraintData.shouldBeRemoved()):
			text += "\n[b]"+restraintData.getRemoveMessage()+"[/b]"
			restraintData.onStruggleRemoval()
			sub.getInventory().removeEquippedItem(pickedItem)
		
		return {text=text}
	
	if(actionID in ["apologize"]):
		endActivity()
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('try', 'tries')} to apologize.",
			"{sub.You} {sub.youVerb('attempt')} to apologize for {sub.yourHis} actions.",
		])
		if(!RNG.chance(getApologySuccessChance(domInfo, subInfo))):
			if(RNG.chance(30)):
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
		domInfo.addAnger(0.2 + 0.1 * domInfo.fetishScore({Fetish.Masochism: -1.0}))
		domInfo.addPain(RNG.randi_range(4, 6))
		
		return {text=text}
