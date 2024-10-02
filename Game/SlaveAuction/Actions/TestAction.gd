extends AuctionAction

func _init():
	id = "TestAction"

func getName() -> String:
	return "SEX (BOTTOM)"

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	return {
		text = "She’s got a mouth that knows how to serve in every way!",
	}

func getPositiveReaction(_char:BaseCharacter) -> String:
	return "NICE, I COULD USE A BREEDING BITCH."

func getNegativeReaction(_char:BaseCharacter) -> String:
	return "I'M NOT REALLY LOOKING FOR THAT."
