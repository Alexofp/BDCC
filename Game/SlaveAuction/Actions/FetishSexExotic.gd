extends AuctionAction

func _init():
	id = "FetishSexExotic"

func getActionType():
	return AuctionActionType.Fetish

func getName() -> String:
	return "SEX (EXOTIC)"

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	return {
		text = "LOVES WEIRD FUCKING",
	}

func getTraits() -> Dictionary:
	return {
		"FetishSexExotic": 1.0,
	}

func getPositiveReaction(_char:BaseCharacter) -> String:
	return "INTERESTING FOR SURE."
