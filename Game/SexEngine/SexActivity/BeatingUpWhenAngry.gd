extends SexActivityBase

func _init():
	id = "BeatingUpWhenAngry"

func getGoals():
	return {
	}

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(_subInfo.isUnconscious()):
		return -1.0
	return _domInfo.getIsAngryScore() * 1.0 * max(0.0, 0.1 + _domInfo.personalityScore({PersonalityStat.Mean: 1.0})) - _subInfo.getAboutToPassOutScore() * _domInfo.fetishScore({Fetish.UnconsciousSex: -1.0})

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
		domSay = domReaction(SexReaction.AboutToBeatUp, 50),
		subSay = subReaction(SexReaction.AboutToBeatUp, 20),
	}

func processTurn():
	if(state == ""):
		affectSub(subInfo.fetishScore({Fetish.Masochist: 1.0}, -0.5), 0.1, -0.2, -0.05)
		affectDom(domInfo.fetishScore({Fetish.Sadist: 1.0}), 0.01, 0.0)
		subInfo.addPain(5)
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
	return actions

func doDomAction(_id, _actionInfo):
	if(_id == "stop"):
		endActivity()
		
		return {
			text = "{dom.You} {dom.youVerb('have', 'has')} stopped beating {sub.you} up.",
		}
	
	return null

func getSubActions():
	var actions = []

	return actions

func doSubAction(_id, _actionInfo):
	return null
