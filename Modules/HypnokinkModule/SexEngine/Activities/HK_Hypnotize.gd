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
	if(_domInfo.getChar() != GM.pc || !_domInfo.getChar().hasPerk(Perk.HypnosisAmateurHypnotist)):
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
		text += "{dom.You} {dom.youVerb('stare')} deeply into {sub.yourHis} eyes."
		affectDom(domInfo.fetishScore({Fetish.HypnosisHypnotist: 1.0})+0.0, 0.1, 0.0)
		affectSub(subInfo.fetishScore({Fetish.HypnosisSubject: 1.0})+0.0, 0.1, -0.02, 0.0)
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
			"name": "Resist",
			"desc": "Don't let them control you!",
			"priority" : 0,
		})
	return actions

func doSubAction(_id, _actionInfo):
	if(_id == "surrender"):
		var text = ""
		var domSay = null
		var subSay = null
		# dummy react, to ensure domSay and subSay are generated
		domSay = domReaction(SexReaction.Teasing, 0)
		subInfo.getChar().addEffect(StatusEffect.Suggestible, [RNG.randi_range(4,16)])
		
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
					"N-no..."	
				])
		return {
			text = text,
			domSay = domSay,
			subSay = subSay,
		}
	if(_id == "resist"):
		var text = ""
		var domSay = null
		var subSay = null
		domInfo.addAnger(0.04)
		subSay = subReaction(SexReaction.Resisting, 100)
		return {
			text = text,
			domSay = domSay,
			subSay = subSay,
		}

func isSubHypnotized():
	return HypnokinkUtil.isHypnotized(getSub())

func isSubInTrance():
	return HypnokinkUtil.isInTrance(getSub())
	
func getAnimationPriority():
	return 0

func getAnimation():
	if(state == ""):
		return [StageScene.SexMissionary, "tease", {pc=domID, npc=subID}]
