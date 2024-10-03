extends Reference
class_name AuctionAction

var id:String = "error"
var savedTexts:Array = []

func getName() -> String:
	return "SEX (BOTTOM)"

func getButtonName() -> String:
	return getName()

func getButtonDesc() -> String:
	return "FILL ME"

func getActionType():
	return AuctionActionType.Fetish

func saynn(theText:String):
	savedTexts.append(theText)

func sayPresenter(theText:String):
	saynn("[say=presenter]"+theText+"[/say]")

func saySlave(theText:String):
	saynn("[say=slave]"+theText+"[/say]")

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	return {
		text = "LOVES GETTING FUCKED",
		slaveReaction = getSlaveReaction(_char, _auction.getSlaveReactionType()),
		traits = getTraits(),
		desire = getPassiveDesireGain(),
		instantDesire = getPassiveInstantDesireGain(),
	}

func onActFinal(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	savedTexts.clear()
	var theResult = onAct(_char, _auction, _slaveTraits)
	if(theResult == null):
		theResult = {}
	
	if(savedTexts.size() > 0):
		theResult["text"] = Util.join(savedTexts, "\n\n")
	savedTexts.clear()
	return theResult

func getPositiveReaction(_char:BaseCharacter) -> String:
	return "NICE, I COULD USE A BREEDING BITCH."

func getNegativeReaction(_char:BaseCharacter) -> String:
	return "I'M NOT REALLY LOOKING FOR THAT."

func getSlaveReaction(_char:BaseCharacter, _reactionType) -> String:
	return "{slave.name} blushes deeply."

func getTraits() -> Dictionary:
	return {
		"FetishSexBottom": 1.0,
	}

func getPassiveDesireGain() -> float:
	return 0.2

func getPassiveInstantDesireGain() -> float:
	return 0.0
