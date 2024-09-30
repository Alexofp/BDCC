extends AuctionAction

func _init():
	id = "TestAction2"

func getName() -> String:
	return "SEX (TOP)"

func onAct(_char:BaseCharacter, _auction):
	return {
		text = "TEST TEST MEOW TOP",
	}

func getTraits() -> Dictionary:
	return {
		"SexTop": 1.0,
	}
