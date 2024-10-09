extends "res://Game/SlaveAuction/Actions/IntroNormal.gd"

func _init():
	id = "IntroYFocused"

func getActionType():
	return AuctionActionType.Intro

func getName() -> String:
	return "Focused introduction"

func getButtonDesc() -> String:
	return "Focus on one of the bidders.\n\nThis action will reveal 75% of all preferences of a single bidder."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	
	sayPresenter("Good evening, ladies and gentlemen. Welcome to Blacktail Market! Tonight, I present to you a unique and rare offering.")
	
	saynn("The spotlight highlights {slave.name} who is standing on {slave.his} {slave.toes}.")
	
	saynn("The bidders lean forward, curious but composed. You hear their quiet chatter and try to pick out anything useful.")

	_auction.unlockPercentageOfTraitsRandomBidder(0.75, 1.0)

