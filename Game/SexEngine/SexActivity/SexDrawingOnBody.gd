extends SexActivityBase

func _init():
	id = "SexDrawingOnBody"
	
	activityName = "Draw on body"
	activityDesc = "Write something humiliating on them!"
	activityCategory = ["Humiliate"]

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

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return [SexActivityTag.HandsUsed]
	return []

func startActivity(_args):
	affectSub(getSubInfo().fetishScore({Fetish.Bodywritings: 1.0}, -0.25), 0.01, -0.2, -0.02)
	addText("{dom.You} {dom.youVerb('pull')} out a [b]black marker[/b].")
	talk(DOM_0, SUB_0, SexReaction.AboutToDrawOnBody)
	if(RNG.chance(20)):
		talk(SUB_0, DOM_0, SexReaction.AboutToDrawOnBody)

func init_processTurn():
	state = "drawsoon"

func drawsoon_processTurn():
	state = "abouttodraw"
	affectSub(getSubInfo().fetishScore({Fetish.Bodywritings: 1.0}, -0.25), 0.01, -0.2, -0.02)
	addText("{dom.You} {dom.youVerb('move')} the marker close to {sub.yourHis} body.")

func abouttodraw_processTurn():
	endActivity()
	
	affectSub(getSubInfo().fetishScore({Fetish.Bodywritings: 1.0}, -0.25), 0.01, -0.2, -0.02)
	
	var zone:int = BodyWritingsZone.getRandomZone()
	if(getSexType() == SexType.SlutwallSex):
		zone = BodyWritingsZone.getRandomZoneLowerPart()
	
	var writingID:String = BodyWritings.getRandomWritingIDForZone(zone)
	getSub().addBodywriting(zone, writingID)
	sendSexEvent(SexEvent.BodyWritingAdded, DOM_0, SUB_0, {zone=zone,writingID=writingID})
	
	addText("{dom.You} drew [b]'"+str(BodyWritings.getWritingText(writingID))+"'[/b] on {sub.yourHis} "+BodyWritingsZone.getZoneVisibleName(zone)+".")
	talk(DOM_0, SUB_0, SexReaction.AfterDrawingOnBody)
	if(RNG.chance(50)):
		talk(SUB_0, DOM_0, SexReaction.AfterDrawingOnBody)
	
func getSubResistChance() -> float:
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

func getActions(_indx:int):
	if(_indx == SUB_0):
		if(!getSub().hasBoundArms()):
			addAction("resist", getResistScore(SUB_0) * 2.0, "Whack marker away", "Resist against the marker", {A_CHANCE: getSubResistChance()})

func doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "resist"):
		if(RNG.chance(getSubResistChance())):
			endActivity()
			getDomInfo().addAnger(0.2)
			addText("{sub.You} managed to whack the marker out of {dom.yourHis} hands!")
			if(RNG.chance(50)):
				talk(SUB_0, DOM_0, SexReaction.ActivelyResisting)
			return
		
		addText("{sub.You} {sub.youVerb('try', 'tries')} to whack the marker out of {dom.yourHis} hands but {sub.youVerb('fail')}.")
		if(RNG.chance(50)):
			talk(SUB_0, DOM_0, SexReaction.Resisting)
		return
