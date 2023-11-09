extends SexActivityBase

func _init():
	id = "BeatingUpWhenAngry"

func getGoals():
	return {
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		SexType.StocksSex: true,
		SexType.SlutwallSex: true,
	}

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(_subInfo.isUnconscious()):
		return -1.0
	return _domInfo.getIsAngryScore() * 1.0 * max(0.1, 0.1 + _domInfo.personalityScore({PersonalityStat.Mean: 1.0})) - _subInfo.getAboutToPassOutScore() * _domInfo.fetishScore({Fetish.UnconsciousSex: -1.0})

func getVisibleName():
	return "Beat up"

func getCategory():
	return ["Violence"]

func getDomTags():
	return [SexActivityTag.HandsUsed]

func getSubTags():
	return []

func startActivity(_args):
	state = ""
	
	return {
		text = "{dom.You} {dom.youVerb('start')} beating {sub.you} up!",
		domSay = domReaction(SexReaction.AboutToBeatUp, 100),
		subSay = subReaction(SexReaction.AboutToBeatUp, 20),
	}

func processTurn():
	if(state == ""):
		subInfo.addFear(0.05)
		affectSub(subInfo.fetishScore({Fetish.Masochism: 1.0}, -0.5), 0.1, -0.2, 0.0)
		affectDom(domInfo.fetishScore({Fetish.Sadism: 0.5}, 0.5), 0.1, 0.0)
		var howMuchAddPain = RNG.randi_range(4, 8)
		subInfo.addPain(howMuchAddPain)
		sendSexEvent(SexEvent.PainInflicted, domID, subID, {pain=howMuchAddPain,isDefense=false,intentional=true})
		domInfo.addAnger(-0.1)
		
		var texts = [
			"{dom.You} {dom.youVerb('punch', 'punches')} {sub.youHim}.",
			"{dom.You} {dom.youVerb('punch', 'punches')} {sub.youHim} violently.",
			"{dom.You} {dom.youVerb('punch', 'punches')} {sub.yourHis} jaw.",
			"{dom.You} {dom.youVerb('scratch', 'scratches')} {sub.youHim}.",
			"{dom.You} {dom.youVerb('scratch', 'scratches')} {sub.youHim} helpless.",
			"{dom.You} {dom.youVerb('scratch', 'scratches')} {sub.yourHis} neck.",
			"{dom.You} {dom.youVerb('scratch', 'scratches')} {sub.yourHis} back.",
			"{dom.You} {dom.youVerb('pull')} on {sub.yourHis} hair.",
		]
		if(getSexType() == SexType.SlutwallSex):
			texts = [
				"{dom.You} {dom.youVerb('punch', 'punches')} {sub.youHim}.",
				"{dom.You} {dom.youVerb('punch', 'punches')} {sub.youHim} violently.",
				"{dom.You} {dom.youVerb('squeeze', 'squeezes')} {sub.yourHis} ass painfully.",
				"{dom.You} {dom.youVerb('scratch', 'scratches')} {sub.youHim}.",
				"{dom.You} {dom.youVerb('scratch', 'scratches')} {sub.youHim} helpless.",
				"{dom.You} {dom.youVerb('scratch', 'scratches')} {sub.yourHis} thighs.",
			]
		
		var text = []
		var amount = RNG.randi_range(1, Util.mini(3, texts.size()))
		for _i in range(amount):
			text.append(RNG.grab(texts))
		
		return {
			text=Util.join(text, " "),
			domSay = domReaction(SexReaction.BeatingUp, 30),
			subSay = subReaction(SexReaction.BeatingUp, 30),
			}
	
func getDomActions():
	var actions = []
	actions.append({
			"id": "stop",
			"score": 1.0 - domInfo.getIsAngryScore() + subInfo.getAboutToPassOutScore() * domInfo.fetishScore({Fetish.UnconsciousSex: 1.0}, 0.5),
			"name": "Stop beating up",
			"desc": "Enough violence",
		})
	actions.append({
			"id": "hithard",
			"score": domInfo.getIsAngryScore()*domInfo.fetishScore({Fetish.Masochism: 0.4}) - subInfo.getAboutToPassOutScore() * domInfo.fetishScore({Fetish.UnconsciousSex: 1.0}, 0.5),
			"name": "Hit really hard",
			"desc": "Make that bitch regret it",
		})
	return actions

func doDomAction(_id, _actionInfo):
	if(_id == "stop"):
		endActivity()
		
		return {
			text = "{dom.You} {dom.youVerb('have', 'has')} stopped beating {sub.you} up.",
		}
	
	if(_id == "hithard"):
		affectSub(subInfo.fetishScore({Fetish.Masochism: 1.0}, -0.5), 0.1, -0.05, 0.0)
		affectDom(domInfo.fetishScore({Fetish.Sadism: 0.5}, 0.5), 0.2, 0.0)
		var howMuchAddPain = RNG.randi_range(15, 25)
		subInfo.addPain(howMuchAddPain)
		sendSexEvent(SexEvent.PainInflicted, domID, subID, {pain=howMuchAddPain,isDefense=false,intentional=true})
		domInfo.addAnger(-0.2)
		subInfo.addFear(0.3)
		
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('hit')} {sub.youHim} [b]really hard[/b].",
			"{dom.You} {dom.youVerb('slam')} {sub.youHim} against the wall [b]really hard[/b].",
			"{dom.You} {dom.youVerb('punch', 'punches')} {sub.youHim} [b]really hard[/b].",
		])
		
		if(RNG.chance(50)):
			getSub().doWound(domID)
		
		return {
			text = text,
			domSay = domReaction(SexReaction.BeatingUpHard, 100),
			subSay = subReaction(SexReaction.BeatingUpHard, 20),
		}

func getSubActions():
	var actions = []

	return actions

func doSubAction(_id, _actionInfo):
	return null
