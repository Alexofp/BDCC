extends "res://Game/SlaveAuction/Actions/IntroNormal.gd"

func _init():
	id = "IntroPlayful"

func getName() -> String:
	return "Playful introduction"

func getButtonDesc() -> String:
	return "Start the auction while acting very playful.\n\nReveals 2 random preferences of each bidder that are [b]always[/b] relevant to the slave."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	saynn("The room darkens, and {presenter.name} steps into the spotlight with a sultry smile. {presenter.She} runs a hand down the length of the slave’s body, ensuring all eyes are on {slave.his} as {presenter.you} {presenter.youVerb('speak')} in a slow, alluring voice.")
	
	sayPresenter("I see you're all ready for something special tonight. Allow me to introduce you to this treat - a fine specimen that will fulfill your wildest fantasies. But remember, only the highest bidder will claim {slave.him}.")
	
	saynn("The bidders shift in their seats, their gazes fixed on the slave. Tension rises in the room, and you can feel the excitement already building.")
	
	saynn("You try to pick out which areas of the slave the bidders are the most attracted to.")

	for _i in range(2):
		_auction.unlockRandomRelevantTraitEachBidder()

func getPassiveDesireGain() -> float:
	return 0.2
