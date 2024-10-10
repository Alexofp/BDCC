extends "res://Game/SlaveAuction/Actions/IntroNormal.gd"

func _init():
	id = "IntroYFocused"

func getActionType():
	return AuctionActionType.Intro

func getName() -> String:
	return "Focused introduction"

func getButtonDesc() -> String:
	return "Focus on one of the bidders.\n\nThis action will reveal 75% of all preferences of a single random bidder."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	saynn("The curtains part slowly, revealing {presenter.name} standing confidently on a raised platform, a knowing smile playing on {presenter.hisHer} lips.")

	sayPresenter("Welcome, esteemed guests, to the Blacktail Market! I know many of you are here looking for something.. specific.")

	saynn("{presenter.hisHer} eyes flick to one particular bidder.. The connection is unmistakable, a constant eye contact is causing the others fade into the background.")

	sayPresenter("Allow me to introduce our most specially crafted product, someone who I believe will catch your particular interest.")

	saynn("The spotlight sharpens, focusing almost entirely on the slave. {slave.heShe} stands tall, every inch of {slave.hisHer} body exposed to the critical gaze of the selected bidder.")

	saynn("{presenter.name} locks eyes with the special bidder once more, as though sharing a secret. The air grows tense, anticipation thickening the atmosphere as the chosen bidder’s attention hones in on the slave, curiosity piqued.")

	saynn("The other bidders glance at each other but remain quiet, observing, while the main bidder leans forward, eyes narrowing. You make sure to note down everything of interest that you have noticed.")
	
	_auction.unlockPercentageOfTraitsRandomBidder(0.75, 1.0)

func getPassiveDesireGain() -> float:
	return 0.0
