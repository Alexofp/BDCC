extends AuctionAction

func _init():
	id = "Thickness"

func getActionType():
	return AuctionActionType.Body

func getName() -> String:
	return "Thickness"

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	var theText:String = "Error?"
	if(_slaveTraits.has("BodySlim") && _slaveTraits["BodySlim"] > 0.0):
		theText = "SLAVE IS VERY SLIM"
	if(_slaveTraits.has("BodyAverage") && _slaveTraits["BodyAverage"] > 0.0):
		theText = "SLAVE IS PERFECTLY AVERAGE"
	if(_slaveTraits.has("BodyThick") && _slaveTraits["BodyThick"] > 0.0):
		theText = "SLAVE IS THICC AF"
	
	return {
		text = theText,
	}

func getTraits() -> Dictionary:
	return {
		"BodySlim": 1.0,
		"BodyAverage": 1.0,
		"BodyThick": 1.0,
	}

func getPositiveReaction(_char:BaseCharacter) -> String:
	return "INTERESTING FOR SURE."
