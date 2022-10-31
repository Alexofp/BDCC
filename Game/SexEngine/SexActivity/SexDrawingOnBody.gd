extends SexActivityBase

func _init():
	id = "SexDrawingOnBody"

func getGoals():
	return {
	}

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return 0.1

func getCategory():
	return []

func getDomTags():
	return [SexActivityTag.HandsUsed]

func getSubTags():
	return []

func startActivity(_args):
	state = ""
	
	return {
		text = "{dom.You} {dom.youVerb('pull')} out a [b]black marker[/b].",
	}

func processTurn():
	if(state == ""):
		state = "drawsoon"
		return null
	if(state == "drawsoon"):
		state = "abouttodraw"
		return {text="{dom.You} {dom.youVerb('move')} the marker close to {sub.yourHis} body."}
	if(state == "abouttodraw"):
		endActivity()
		
		var zone = BodyWritingsZone.getRandomZone()
		var writingID = BodyWritings.getRandomWritingIDForZone(zone)
		getSub().addBodywriting(zone, writingID)
		return {text="{dom.You} drew '"+str(BodyWritings.getWritingText(writingID))+"' on {sub.yourHis} "+BodyWritingsZone.getZoneVisibleName(zone)+"."}
	
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
				"score": getSubHatingItScore(),
				"name": "Whack marker away",
				"desc": "Resist against the marker",
			})
	return actions

func doSubAction(_id, _actionInfo):
	if(_id == "resist"):
		if(RNG.chance(30)):
			endActivity()
			makeDomAngry(0.2)
			return {text = "{sub.You} managed to whack the marker out of {dom.yourHis} hands!"}
		
		return {text = "{sub.You} {sub.youVerb('try', 'tries')} to whack the marker out of {dom.yourHis} hands but {sub.youVerb('fail'}.",}
