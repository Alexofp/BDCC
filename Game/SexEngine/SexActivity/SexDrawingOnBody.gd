extends SexActivityBase

var customWritingID:String = ""
var customWritingZone:int = -1
var isPermanent:bool = false

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

func getStartActions(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(!_domInfo.getChar().isPlayer()):
		.getStartActions(_sexEngine, _domInfo, _subInfo)
		return
	
	var permanentMarkerAmount:int = _domInfo.getChar().getInventory().getAmountOf("PermanentMarker")
	
	var writingsRandomList:Array = BodyWritings.getRandomWritingIDAmount(5)
	for writingID in writingsRandomList:
		var writingText:String = BodyWritings.getWritingText(writingID)
		var randomZoneForWriting:int = BodyWritings.getRandomZoneForWritingID(writingID)
		var randomZoneName:String = BodyWritingsZone.getZoneVisibleName(randomZoneForWriting)
		
		addStartAction([writingID, randomZoneForWriting, false], writingText, "Write '"+writingText+"' on the sub's "+randomZoneName, 0.0, {
			A_CATEGORY: ["Humiliate", "Draw on body"],
		})
		if(permanentMarkerAmount > 0):
			addStartAction([writingID, randomZoneForWriting, true], writingText, "(You have "+str(permanentMarkerAmount)+" permanent marker"+("s" if permanentMarkerAmount != 1 else "")+")\n"+"Write '"+writingText+"' on the sub's "+randomZoneName, 0.0, {
				A_CATEGORY: ["Humiliate", "Draw (Permanent marker)"],
			})
	
func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return [SexActivityTag.HandsUsed]
	return []

func startActivity(_args):
	if(_args is Array && _args.size() >= 2):
		customWritingID = _args[0]
		customWritingZone = _args[1]
		isPermanent = _args[2] if _args.size() > 2 else false
	if(!getDom().isPlayer()):
		var permanentChance:float = 0.0
		permanentChance += fetish(DOM_0, Fetish.Bodywritings)*5.0
		permanentChance += personality(DOM_0, PersonalityStat.Mean)*2.0
		permanentChance -= personality(DOM_0, PersonalityStat.Subby)*2.0
		var theAffection:float = GM.main.RS.getAffection(getDomID(), getSubID())
		permanentChance -= theAffection * 3.0
		permanentChance = clamp(permanentChance, 0.0, 3.0)
		isPermanent = RNG.chance(permanentChance)
		
	
	affectSub(getSubInfo().fetishScore({Fetish.Bodywritings: 1.0}, -0.25), 0.01, -0.2, -0.02)
	addText("{dom.You} {dom.youVerb('pull')} out a "+(" [b]black PERMANENT marker[/b]" if isPermanent else "[b]black marker[/b]")+".")
	react(SexReaction.AboutToDrawOnBody, [100.0, 50.0])

func init_processTurn():
	state = "drawsoon"

func drawsoon_processTurn():
	state = "abouttodraw"
	affectSub(getSubInfo().fetishScore({Fetish.Bodywritings: 1.0}, -0.25), 0.01, -0.2, -0.02)
	addText("{dom.You} {dom.youVerb('move')} the"+(" [b]PERMANENT[/b]" if isPermanent else "")+" marker close to {sub.yourHis} body.")

func abouttodraw_processTurn():
	endActivity()
	
	affectSub(getSubInfo().fetishScore({Fetish.Bodywritings: 1.0}, -0.25), 0.01, -0.2, -0.02)
	
	var zone:int = BodyWritingsZone.getRandomZone()
	if(getSexType() == SexType.SlutwallSex):
		zone = BodyWritingsZone.getRandomZoneLowerPart()
	if(customWritingZone >= 0):
		zone = customWritingZone
	
	if(getDom().isPlayer() && isPermanent):
		getDom().getInventory().removeXOfOrDestroy("PermanentMarker", 1)
	var writingID:String = BodyWritings.getRandomWritingIDForZone(zone) if customWritingID == "" else customWritingID
	getSub().addBodywriting(zone, writingID, isPermanent)
	sendSexEvent(SexEvent.BodyWritingAdded, DOM_0, SUB_0, {zone=zone,writingID=writingID,isPermanent=isPermanent})
	
	addText("{dom.You} drew [b]'"+str(BodyWritings.getWritingText(writingID))+"'[/b] on {sub.yourHis} "+BodyWritingsZone.getZoneVisibleName(zone)+(" with a [b]PERMANENT[/b] marker" if isPermanent else "")+".")
	react(SexReaction.AfterDrawingOnBody, [100.0, 50.0])
	var writingsAmount:int = getSub().getBodywritingsCount()
	fetishAffect(SUB_0, Fetish.Bodywritings, 1.0 + sqrt(writingsAmount))
	fetishAffect(DOM_0, Fetish.Bodywritings, 1.0 + sqrt(writingsAmount)*0.5)
	
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
			reactSub(SexReaction.ActivelyResisting, [50])
			fetishUp(SUB_0, Fetish.Bodywritings, -10.0)
			return
		
		addText("{sub.You} {sub.youVerb('try', 'tries')} to whack the marker out of {dom.yourHis} hands but {sub.youVerb('fail')}.")
		reactSub(SexReaction.Resisting, [50])
		fetishUp(SUB_0, Fetish.Bodywritings, -15.0)
		return

func saveData():
	var data = .saveData()
	
	data["customWritingID"] = customWritingID
	data["customWritingZone"] = customWritingZone
	data["isPermanent"] = isPermanent

	return data
	
func loadData(data):
	.loadData(data)
	
	customWritingID = SAVE.loadVar(data, "customWritingID", "")
	customWritingZone = SAVE.loadVar(data, "customWritingZone", -1)
	isPermanent = SAVE.loadVar(data, "isPermanent", false)
