extends Reference
class_name AuctionAction

var id:String = "error"

func getName() -> String:
	return "SEX (BOTTOM)"

func getButtonName() -> String:
	return getName()

func getButtonDesc() -> String:
	return "FILL ME"

func getActionType():
	return AuctionActionType.Fetish

func onAct(_char:BaseCharacter, _auction):
	return {
		text = "TEST TEST MEOW",
		traits = getTraits(),
		desire = getPassiveDesireGain(),
		instantDesire = getPassiveInstantDesireGain(),
	}

func getTraits() -> Dictionary:
	return {
		"SexBottom": 1.0,
	}

func getPassiveDesireGain() -> float:
	return 0.2

func getPassiveInstantDesireGain() -> float:
	return 0.0
