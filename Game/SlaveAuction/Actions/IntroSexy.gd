extends "res://Game/SlaveAuction/Actions/IntroNormal.gd"

func _init():
	id = "IntroSexy"

func getName() -> String:
	return "Sexy introduction"

func getButtonDesc() -> String:
	return "Start the auction while acting very seductive.\n\nReveals 2 body-related preferences from each bidder and makes them eager to bid early."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	saynn("The room darkens, the curtains open, and {presenter.name} steps into the spotlight with a sultry smile. {presenter.She} runs a hand down the length of the slave’s body, ensuring all eyes are on {slave.his} as {presenter.you} {presenter.youVerb('speak')} in a slow, alluring voice.")
	
	sayPresenter("Welcome to the Blacktail Market! I see you're all ready for something special tonight. Allow me to introduce you to this treat - a fine specimen that will fulfill your wildest fantasies. But remember, only the highest bidder will claim {slave.him}.")
	
	saynn("The bidders shift in their seats, their gazes fixed on the slave. Tension rises in the room, and you can feel the excitement already building.")
	
	saynn("During that, you try to pick out which areas of the slave the bidders are the most attracted to.")

	for _i in range(2):
		_auction.unlockRandomTraitOfTypeEachBidder(AuctionTraitType.Body)

func getPassiveDesireGain() -> float:
	return 1.0
