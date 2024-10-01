extends AuctionAction

func _init():
	id = "Femininity"

func getActionType():
	return AuctionActionType.Body

func getName() -> String:
	return "Femininity"

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	var theText:String = "Error?"
	if(_slaveTraits.has("Masculine") && _slaveTraits["Masculine"] > 0.0):
		theText = "SLAVE IS SUPER MASCULINE"
	if(_slaveTraits.has("Androgynous") && _slaveTraits["Androgynous"] > 0.0):
		theText = "SLAVE IS ANDROGYNOUS"
	if(_slaveTraits.has("Feminine") && _slaveTraits["Feminine"] > 0.0):
		theText = "SLAVE IS VERY GIRLY"
	
	return {
		text = theText,
	}

func getTraits() -> Dictionary:
	return {
		"Masculine": 1.0,
		"Androgynous": 1.0,
		"Feminine": 1.0,
	}

func getPositiveReaction(_char:BaseCharacter) -> String:
	return "INTERESTING FOR SURE."
