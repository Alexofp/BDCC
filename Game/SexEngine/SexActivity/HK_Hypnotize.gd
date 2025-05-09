extends SexActivityBase

func _init():
	id = "Hypnotize"

func getGoals():
	return {
		SexGoal.Hypnotize: 1.0,
	}

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(_subInfo.getChar().isBlindfolded()):
		return false
	if(_subInfo.isUnconscious()):
		return false
	if(_domInfo.getChar().isBlindfolded()):
		return false
	if(_domInfo.getChar().isGagged()):
		return false
	if(_domInfo.getChar().isPlayer() && !_domInfo.getChar().hasPerk(Perk.HypnosisAmateurHypnotist)):
		return false
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getVisibleName():
	return "Hypnotize"

func getCategory():
	return ["Hypnosis"]

func getDomTags():
	return [SexActivityTag.MouthUsed, SexActivityTag.HandsUsed]
	
func getSubTags():
	return []

func startActivity(_args):
	state = ""
	var text = ""
	return {
		text = text,
	}

func onSwitchFrom(_otherActivity, _args):
	return .onSwitchFrom(_otherActivity, _args)

func processTurn():
	if(state == ""):
		var text = ""
		if(doesCurrentAnimationHasEyeContact()):
			text += RNG.pick([
				"{dom.You} [rainbow freq=0.05 sat=0.5 val=1.0]{dom.youVerb('stare')}[/rainbow] deeply into {sub.yourHis} eyes.",
				"{dom.You} [rainbow freq=0.05 sat=0.5 val=1.0]{dom.youVerb('lock')} eyes with {sub.yourHis}[/rainbow], capturing {sub.yourHis} full attention.",
				"Lost in {dom.your} gaze, {sub.your} thoughts become a [rainbow freq=0.05 sat=0.5 val=1.0]distant echo[/rainbow], surrendering to the captivating pull of those [rainbow freq=0.05 sat=0.5 val=1.0]hypnotic eyes[/rainbow].",
				])
		else:
			text += RNG.pick([
				"{dom.You} [rainbow freq=0.05 sat=0.5 val=1.0]{dom.youVerb('hum')} quietly[/rainbow] into {sub.yourHis} ear.",
				"[rainbow freq=0.05 sat=0.5 val=1.0]A soft, melodic hum[/rainbow] escapes {dom.your} lips, creating a soothing atmosphere as {dom.youHe} gently {dom.youVerb('guide')} {sub.yourHis} consciousness into a realm of deep relaxation.",
				"With a gentle whisper, {dom.you} {dom.youVerb('plunge')} {sub.yourHis} mind into a [rainbow freq=0.05 sat=0.5 val=1.0]hypnotic pool[/rainbow].",
				"A soft murmur escapes {dom.your} lips, pulling {sub.you} into a [rainbow freq=0.05 sat=0.5 val=1.0]gentle embrace of hypnosis[/rainbow].",
				"{dom.You} {dom.youVerb('hum')} a [rainbow freq=0.05 sat=0.5 val=1.0]soothing melody[/rainbow], and the vibrations resonate through {sub.yourHis} being.",
				])
		affectDom(domInfo.fetishScore({Fetish.HypnosisHypnotist: 1.0})+0.0, 0.1, 0.0)
		affectSub(subInfo.fetishScore({Fetish.HypnosisSubject: 1.0})+0.0, 0.1, -0.02, 0.0)
		HypnokinkUtil.changeSuggestibilityBy(subInfo.getChar(), RNG.randi_range(4,6))
		return {
			text = text,
		}

func getDomActions():
	var actions = []
	if(state in [""]):
		actions.append({
			"id": "stop",
			"score": getStopScore(),
			"name": "Stop hypnosis",
			"desc": "Stop messing with their head.",
			"priority" : 0,
		})
	if(state in [""]):
		if((getDom() == GM.pc) && (isSubInTrance()) && (!(getSub().hasEffect(StatusEffect.ImplantedPosthypnoticTrigger)))):
			actions.append({
				"id": "implant_posthypno",
				"score": 1.0,
				"name": "Give Trigger",
				"desc": "Implant a devious posthypnotic trigger.",
				"priority" : 0,
			})
	return actions

func doDomAction(_id, _actionInfo):
	if(_id == "stop"):
		var text = ""
		endActivity()
		text += RNG.pick([
			"{dom.You} {dom.youVerb('stop')} messing with {sub.your} head.",
			"{dom.You} {dom.youVerb('lean')} back, breaking the spell."
		])
		return {
			text = text,
		}
	if(_id == "implant_posthypno"):
		var text = ""
		var domSay = ""
		getSub().addEffect(StatusEffect.ImplantedPosthypnoticTrigger)
		domSay = "Whenever I snap my fingers, you will..."
		text += "{dom.You} {dom.youVerb('whisper')} into {sub.your} ear."
		return {
			text = text,
			domSay = domSay
		}

func getSubActions():
	var actions = []
	if(state in [""]):
		actions.append({
			"id": "surrender",
			"score": subInfo.getComplyScore(),
			"name": "Surrender",
			"desc": "Give in to the words.",
			"priority" : 0,
		})
	if(state in [""]):
		actions.append({
			"id": "resist",
			"score": subInfo.getResistScore(),
			"name": "Resist hypnosis",
			"desc": "Don't let them control you!",
			"priority" : 0,
			"chance": getSubResistChance(20, 15),
		})
	return actions

func doSubAction(_id, _actionInfo):
	if(_id == "surrender"):
		var text = ""
		var domSay = null
		var subSay = null
		# dummy react, to ensure domSay and subSay are generated
		domSay = domReaction(SexReaction.Teasing, 0)
		HypnokinkUtil.changeSuggestibilityBy(subInfo.getChar(), RNG.randi_range(4,16))
		
		if(isSubInTrance()):
			if(RNG.chance(75)):
				subSay = RNG.pick([
					"Obey...", "Submit...", "Yes...",
				])
		elif(isSubHypnotized()):
			if(RNG.chance(75)):
				subSay = RNG.pick([
					"I'll behave...",
					"I'll obey...",
					"I submit...",
					"Y-yes..."	
				])
		else:
			if(RNG.chance(75)):
				subSay = RNG.pick([
					"Wh-what are you...",
					"What is this?",
					"What's happening?",
					"I don't..."	
				])
		return {
			text = text,
			domSay = domSay,
			subSay = subSay,
		}
	if(_id == "resist"):
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('try', 'tries')} to resist {dom.your} hypnotic influence."
		])
		var domSay = null
		var subSay = null
		domInfo.addAnger(0.04)
		
		if(isSubInTrance()):
			HypnokinkUtil.changeSuggestibilityBy(subInfo.getChar(), RNG.randi_range(4,16))
			if(RNG.chance(75)):
				subSay = RNG.pick([
					"Nnh...", 
					"Please...", 
					"Can't...",
				])
		elif(isSubHypnotized()):
			HypnokinkUtil.changeSuggestibilityBy(subInfo.getChar(), RNG.randi_range(-4,2))
			if(RNG.chance(75)):
				subSay = RNG.pick([
					"I don't...",
					"I'd better...",
					"I won't...",
					"No...",
					"I can't..."
				])
		else:
			HypnokinkUtil.changeSuggestibilityBy(subInfo.getChar(), -RNG.randi_range(1, 16))
			if(RNG.chance(75)):
				subSay = RNG.pick([
					"What are you doing?",
					"What is this?",
					"What's happening?",
					"No!",
					"Stop it!"
				])
		
		if(HypnokinkUtil.getSuggestibleStacks(getSub()) < 5.0 && RNG.chance(getSubResistChance(20, 15))):
			text += RNG.pick([
				" {sub.You} {sub.youVerb('manage')} to break free from {dom.yourHis} hypnotic gaze!",
			])
			failGoals()
			endActivity()
		
		return {
			text = text,
			domSay = domSay,
			subSay = subSay,
		}

func getSubResistChance(baseChance, domAngerRemoval):
	var theChance = baseChance - domInfo.getAngerScore()*domAngerRemoval
	if(getSub().hasBlockedHands()): # Can't cover eyes or something
		theChance *= 0.5
	if(getSub().hasBoundArms()):
		theChance *= 0.8
	if(getSub().hasBoundLegs()):
		theChance *= 0.8
	
	return max(theChance, 5.0)

func isSubHypnotized():
	return HypnokinkUtil.isHypnotized(getSub())

func isSubInTrance():
	return HypnokinkUtil.isInTrance(getSub())
	
func getAnimationPriority():
	return 0

func getAnimation():
	if(state == ""):
		return [StageScene.SexMissionary, "tease", {pc=domID, npc=subID}]

func doesCurrentAnimationHasEyeContact():
	var currentAnimData = getSexEngine().getBestAnimation()
	if(currentAnimData == null || currentAnimData.size() <= 0):
		return true
	
	if(currentAnimData[0] in [
		StageScene.BreastFeeding,
		StageScene.Choking,
		StageScene.Duo,
		StageScene.Duo,
		StageScene.HangingDuo,
		StageScene.HangingSex,
		StageScene.Hug,
		StageScene.PuppyDuo,
		StageScene.PuppyFeetCrotch,
		StageScene.PuppySexOral,
		StageScene.Rekt,
		StageScene.SexCowgirl,
		StageScene.SexCowgirlAlt,
		StageScene.SexCowgirlChoke,
		StageScene.SexFeetPlay,
		StageScene.SexHandjob,
		StageScene.SexMissionary,
		StageScene.SexStart,
		StageScene.SexTribadism,
		StageScene.UrinalPeeing,
		StageScene.UrinalSex,
		StageScene.DuoHypnoTied,
	]):
		return true
	return false
