extends SexActivityBase

func _init():
	id = "Hypnotize"
	
	activityName = "Hypnotize"
	activityDesc = "Make them obey!"
	activityCategory = ["Hypnosis"]

func getGoals():
	return {
		SexGoal.Hypnotize: 1.0,
	}

func canStopSexWithThisActivity() -> bool:
	return true

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

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return [SexActivityTag.MouthUsed, SexActivityTag.HandsUsed]
	return []

func startActivity(_args):
	pass

func init_processTurn():
	if(doesCurrentAnimationHasEyeContact()):
		addTextPick([
			"{dom.You} [rainbow freq=0.05 sat=0.5 val=1.0]{dom.youVerb('stare')}[/rainbow] deeply into {sub.yourHis} eyes.",
			"{dom.You} [rainbow freq=0.05 sat=0.5 val=1.0]{dom.youVerb('lock')} eyes with {sub.yourHis}[/rainbow], capturing {sub.yourHis} full attention.",
			"Lost in {dom.your} gaze, {sub.your} thoughts become a [rainbow freq=0.05 sat=0.5 val=1.0]distant echo[/rainbow], surrendering to the captivating pull of those [rainbow freq=0.05 sat=0.5 val=1.0]hypnotic eyes[/rainbow].",
			])
	else:
		addTextPick([
			"{dom.You} [rainbow freq=0.05 sat=0.5 val=1.0]{dom.youVerb('hum')} quietly[/rainbow] into {sub.yourHis} ear.",
			"[rainbow freq=0.05 sat=0.5 val=1.0]A soft, melodic hum[/rainbow] escapes {dom.your} lips, creating a soothing atmosphere as {dom.youHe} gently {dom.youVerb('guide')} {sub.yourHis} consciousness into a realm of deep relaxation.",
			"With a gentle whisper, {dom.you} {dom.youVerb('plunge')} {sub.yourHis} mind into a [rainbow freq=0.05 sat=0.5 val=1.0]hypnotic pool[/rainbow].",
			"A soft murmur escapes {dom.your} lips, pulling {sub.you} into a [rainbow freq=0.05 sat=0.5 val=1.0]gentle embrace of hypnosis[/rainbow].",
			"{dom.You} {dom.youVerb('hum')} a [rainbow freq=0.05 sat=0.5 val=1.0]soothing melody[/rainbow], and the vibrations resonate through {sub.yourHis} being.",
			])
	affectDom(getDomInfo().fetishScore({Fetish.HypnosisHypnotist: 1.0})+0.0, 0.1, 0.0)
	affectSub(getSubInfo().fetishScore({Fetish.HypnosisSubject: 1.0})+0.0, 0.1, -0.02, 0.0)
	HypnokinkUtil.changeSuggestibilityBy(getSubInfo().getChar(), RNG.randi_range(4,6))
	fetishAffect(SUB_0, Fetish.HypnosisSubject)
	fetishAffect(DOM_0, Fetish.HypnosisHypnotist)


func getActions(_indx:int):
	if(_indx == DOM_0):
		if(state in [""]):
			addAction("stop", getStopScore(), "Stop hypnosis", "Stop messing with their head.")
		if(state in [""]):
			if((getDom() == GM.pc) && (isSubInTrance()) && (!(getSub().hasEffect(StatusEffect.ImplantedPosthypnoticTrigger)))):
				addAction("implant_posthypno", 1.0, "Give Trigger", "Implant a devious posthypnotic trigger.")
	
	if(_indx == SUB_0):
		if(state in [""]):
			addAction("surrender", getComplyScore(SUB_0), "Surrender", "Give in to the words.")
		if(state in [""]):
			addAction("resist", getResistScore(SUB_0), "Resist hypnosis", "Don't let them control you!", {A_CHANCE: getSubResistChance(20, 15)})

func doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "stop"):
		endActivity()
		addTextPick([
			"{dom.You} {dom.youVerb('stop')} messing with {sub.your} head.",
			"{dom.You} {dom.youVerb('lean')} back, breaking the spell."
		])
		return
	if(_id == "implant_posthypno"):
		getSub().addEffect(StatusEffect.ImplantedPosthypnoticTrigger)
		addText("{dom.You} {dom.youVerb('whisper')} into {sub.your} ear.")
		talkText(DOM_0, "Whenever I snap my fingers, you will...")
		return

	if(_id == "surrender"):
		var subSay:String = ""
		HypnokinkUtil.changeSuggestibilityBy(getSubInfo().getChar(), RNG.randi_range(4,16))
		
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
		if(subSay != ""):
			talkText(SUB_0, subSay)
		return
	if(_id == "resist"):
		addText("{sub.You} {sub.youVerb('try', 'tries')} to resist {dom.your} hypnotic influence.")
		var subSay:String = ""
		getDomInfo().addAnger(0.04)
		
		if(isSubInTrance()):
			HypnokinkUtil.changeSuggestibilityBy(getSubInfo().getChar(), RNG.randi_range(4,16))
			if(RNG.chance(75)):
				subSay = RNG.pick([
					"Nnh...", 
					"Please...", 
					"Can't...",
				])
		elif(isSubHypnotized()):
			HypnokinkUtil.changeSuggestibilityBy(getSubInfo().getChar(), RNG.randi_range(-4,2))
			if(RNG.chance(75)):
				subSay = RNG.pick([
					"I don't...",
					"I'd better...",
					"I won't...",
					"No...",
					"I can't..."
				])
		else:
			HypnokinkUtil.changeSuggestibilityBy(getSubInfo().getChar(), -RNG.randi_range(1, 16))
			if(RNG.chance(75)):
				subSay = RNG.pick([
					"What are you doing?",
					"What is this?",
					"What's happening?",
					"No!",
					"Stop it!"
				])
		
		if(HypnokinkUtil.getSuggestibleStacks(getSub()) < 5.0 && RNG.chance(getSubResistChance(20, 15))):
			addText("{sub.You} {sub.youVerb('manage')} to break free from {dom.yourHis} hypnotic gaze!")
			failGoals()
			endActivity()
		
		if(subSay != ""):
			talkText(SUB_0, subSay)
		return

func getSubResistChance(baseChance:float, domAngerRemoval:float) -> float:
	var theChance = baseChance - getDomInfo().getAngerScore()*domAngerRemoval
	if(getSub().hasBlockedHands()): # Can't cover eyes or something
		theChance *= 0.5
	if(getSub().hasBoundArms()):
		theChance *= 0.8
	if(getSub().hasBoundLegs()):
		theChance *= 0.8
	
	return max(theChance, 5.0)

func isSubHypnotized() -> bool:
	return HypnokinkUtil.isHypnotized(getSub())

func isSubInTrance() -> bool:
	return HypnokinkUtil.isInTrance(getSub())
	
func getAnimationPriority():
	return 0

func getAnimation():
	if(state == ""):
		return [StageScene.SexMissionary, "tease", {pc=DOM_0, npc=SUB_0}]

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
