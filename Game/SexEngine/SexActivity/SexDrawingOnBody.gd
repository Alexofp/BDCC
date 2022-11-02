extends SexActivityBase

func _init():
	id = "SexDrawingOnBody"

func getGoals():
	return {
	}

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return _domInfo.fetishScore({Fetish.Bodywritings: 0.2}) * (1.0 + _domInfo.personalityScore({PersonalityStat.Mean: 1.0}))

func getVisibleName():
	return "Draw on body"

func getCategory():
	return ["BDSM"]

func getDomTags():
	return [SexActivityTag.HandsUsed]

func getSubTags():
	return []

func startActivity(_args):
	state = ""
	
	subInfo.addResistance(0.5 * subInfo.fetishScore({Fetish.Bodywritings: -1.0}))
	
	return {
		text = "{dom.You} {dom.youVerb('pull')} out a [b]black marker[/b].",
		domSay = domReaction(SexReaction.AboutToDrawOnBody, 30),
		subSay = subReaction(SexReaction.AboutToDrawOnBody, 20, {Fetish.Bodywritings: 1.0}),
	}

func processTurn():
	if(state == ""):
		state = "drawsoon"
		return null
	if(state == "drawsoon"):
		state = "abouttodraw"
		subInfo.addResistance(0.2 * subInfo.fetishScore({Fetish.Bodywritings: -1.0}))
		return {text="{dom.You} {dom.youVerb('move')} the marker close to {sub.yourHis} body."}
	if(state == "abouttodraw"):
		endActivity()
		
		subInfo.addResistance(0.5 * subInfo.fetishScore({Fetish.Bodywritings: -1.0}))
		
		var zone = BodyWritingsZone.getRandomZone()
		var writingID = BodyWritings.getRandomWritingIDForZone(zone)
		getSub().addBodywriting(zone, writingID)
		return {
			text="{dom.You} drew [b]'"+str(BodyWritings.getWritingText(writingID))+"'[/b] on {sub.yourHis} "+BodyWritingsZone.getZoneVisibleName(zone)+".",
			domSay = domReaction(SexReaction.AfterDrawingOnBody, 30),
			subSay = subReaction(SexReaction.AfterDrawingOnBody, 50, {Fetish.Bodywritings: 1.0}),
			}
	
func getDomActions():
	var actions = []

	return actions

func doDomAction(_id, _actionInfo):
	return null

func getSubActions():
	var actions = []
	if(!getSub().hasBoundArms()):
		actions.append({
				"id": "resist",
				"score": subInfo.getResistScore() * 2.0,
				"name": "Whack marker away",
				"desc": "Resist against the marker",
			})
	return actions

func doSubAction(_id, _actionInfo):
	if(_id == "resist"):
		if(RNG.chance(30)):
			endActivity()
			domInfo.addAnger(0.2)
			return {text = "{sub.You} managed to whack the marker out of {dom.yourHis} hands!"}
		
		return {text = "{sub.You} {sub.youVerb('try', 'tries')} to whack the marker out of {dom.yourHis} hands but {sub.youVerb('fail')}.",}
