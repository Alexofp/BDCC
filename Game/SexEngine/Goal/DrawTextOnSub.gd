extends SexGoalBase

func _init():
	id = SexGoal.DrawTextOnSub

func getVisibleName():
	return "Draw on body (Text)"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_domInfo.getChar().hasBoundArms() || _domInfo.getChar().hasBlockedHands()):
		return false
	return true

func getTags(_indx:int) -> Array:
	return [SexActivityTag.HandsUsed]

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 0.3,
	}

func getGoalDefaultWeight():
	return 0.0

#func doFastSex(_sexEngine, _domInfo, _subInfo, _data):
#	var sub = _subInfo.getChar()
#
#	var zone:int = BodyWritingsZone.getRandomZone()
#	if(_sexEngine.getSexTypeID() == SexType.SlutwallSex):
#		zone = BodyWritingsZone.getRandomZoneLowerPart()
#
#	var writingID:String = BodyWritings.getRandomWritingIDForZone(zone)
#	var isPermanent:bool = false
#	sub.addBodywriting(zone, writingID, isPermanent)
#	sendSexEvent(_sexEngine, SexEvent.BodyWritingAdded, _domInfo, _subInfo, {zone=zone,writingID=writingID,isPermanent=false})

func canBegFor() -> bool:
	return true

func getBegName() -> String:
	return "Write on my body"

func getBegCategory() -> Array:
	return BegCategoryExotic

func getBegDesc() -> String:
	return "Beg the dom to write on your body!"

func getBegMessage(_sexEngine, _domInfo, _subInfo) -> String:
	return "{sub.You} {sub.youVerb('beg')} {dom.you} to write on {sub.yourHis} body."

func getBegDialogue(_sexEngine, _domInfo, _subInfo) -> String:
	return RNG.pick([
		"I want to be your drawing canvas.. Please..",
		"I need you to write all over me.. Please?",
		"Please.. Write some nice things all over my body..",
		"Please.. Write something naughty on my body..",
		"Would you leave me some bodywritings as a gift?",
		"Would you pick up a marker and describe me for everyone to see..",
	])

func getBegDomFetishes() -> Dictionary:
	return {
		Fetish.Bodywritings: 1.0,
	}
