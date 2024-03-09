extends SexActivityBase

func _init():
	id = "SexDrawingOnBody"

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
	return _domInfo.fetishScore({Fetish.Bodywritings: 0.05}) * (1.0 + _domInfo.personalityScore({PersonalityStat.Mean: 0.3}))

func getVisibleName():
	return "Draw on body"

func getCategory():
	return ["Humiliate"]

func getDomTags():
	return [SexActivityTag.HandsUsed]

func getSubTags():
	return []

func startActivity(_args):
	state = ""
	
	affectSub(subInfo.fetishScore({Fetish.Bodywritings: 1.0}, -0.25), 0.01, -0.2, -0.02)
	
	return {
		text = "{dom.You} {dom.youVerb('pull')} out a [b]black marker[/b].",
		domSay = domReaction(SexReaction.AboutToDrawOnBody, 100),
		subSay = subReaction(SexReaction.AboutToDrawOnBody, 20),
	}

func processTurn():
	if(state == ""):
		state = "drawsoon"
		return null
	if(state == "drawsoon"):
		state = "abouttodraw"
		affectSub(subInfo.fetishScore({Fetish.Bodywritings: 1.0}, -0.25), 0.01, -0.2, -0.02)
		return {text="{dom.You} {dom.youVerb('move')} the marker close to {sub.yourHis} body."}
	if(state == "abouttodraw"):
		endActivity()
		
		affectSub(subInfo.fetishScore({Fetish.Bodywritings: 1.0}, -0.25), 0.01, -0.2, -0.02)
		
		var zone = BodyWritingsZone.getRandomZone()
		if(getSexType() == SexType.SlutwallSex):
			zone = BodyWritingsZone.getRandomZoneLowerPart()
		
		var writingID = BodyWritings.getRandomWritingIDForZone(zone)
		getSub().addBodywriting(zone, writingID)
		sendSexEvent(SexEvent.BodyWritingAdded, domID, subID, {zone=zone,writingID=writingID})
		return {
			text="{dom.You} drew [b]'"+str(BodyWritings.getWritingText(writingID))+"'[/b] on {sub.yourHis} "+BodyWritingsZone.getZoneVisibleName(zone)+".",
			domSay = domReaction(SexReaction.AfterDrawingOnBody, 100),
			subSay = subReaction(SexReaction.AfterDrawingOnBody, 50),
			}
	
func getDomActions():
	var actions = []

	return actions

func doDomAction(_id, _actionInfo):
	return null

func getSubResistChance():
	var defaultChance = 30.0
	if(getSub().hasBoundArms()):
		defaultChance *= 0.5
	if(getSub().hasBlockedHands()):
		defaultChance *= 0.5
	if(getSub().isBlindfolded()):
		defaultChance *= 0.5
	if(getSexType() in [SexType.SlutwallSex, SexType.StocksSex]):
		defaultChance *= 0.5
	return defaultChance

func getSubActions():
	var actions = []
	if(!getSub().hasBoundArms()):
		actions.append({
				"id": "resist",
				"score": subInfo.getResistScore() * 2.0,
				"name": "Whack marker away",
				"desc": "Resist against the marker",
				"chance": getSubResistChance(),
			})
	return actions

func doSubAction(_id, _actionInfo):
	if(_id == "resist"):
		if(RNG.chance(getSubResistChance())):
			endActivity()
			domInfo.addAnger(0.2)
			return {text = "{sub.You} managed to whack the marker out of {dom.yourHis} hands!",subSay=subReaction(SexReaction.ActivelyResisting, 50)}
		
		return {text = "{sub.You} {sub.youVerb('try', 'tries')} to whack the marker out of {dom.yourHis} hands but {sub.youVerb('fail')}.",
		subSay=subReaction(SexReaction.Resisting, 50)}
