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

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	return {
		text = "LOVES GETTING FUCKED",
		slaveReaction = getSlaveReaction(_char),
		traits = getTraits(),
		desire = getPassiveDesireGain(),
		instantDesire = getPassiveInstantDesireGain(),
	}

func getPositiveReaction(_char:BaseCharacter) -> String:
	return "NICE, I COULD USE A BREEDING BITCH."

func getNegativeReaction(_char:BaseCharacter) -> String:
	return "I'M NOT REALLY LOOKING FOR THAT."

func getSlaveReaction(_char:BaseCharacter) -> String:
	return "{slave.name} blushes deeply."

func getTraits() -> Dictionary:
	return {
		"FetishSexBottom": 1.0,
	}

func getPassiveDesireGain() -> float:
	return 0.2

func getPassiveInstantDesireGain() -> float:
	return 0.0
