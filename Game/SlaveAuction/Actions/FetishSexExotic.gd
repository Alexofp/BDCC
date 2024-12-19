extends AuctionAction

func _init():
	id = "FetishSexExotic"

func getButtonDesc() -> String:
	return "Tell the bidder's about the slave's exotic fetishes like feetplay and rimming.\n\n[b]Might[/b] reveal 1 personality preference of each bidder."

func getActionType():
	return AuctionActionType.Fetish

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	sayPresenter(RNG.pick([
		"For those with refined tastes, this fucktoy offers something far beyond the ordinary.",
		"This one is a real gem for those of you who crave something a little.. unconventional.. in their bed.",
		"{slave.He} has a passion for the unusual. Trust me, you’ll never be bored with what {slave.he} can do in bed.",
		"Exotic fetishes, extreme pleasures, this slave will meet desires you didn’t even know you had.",
		"From feetplay to rimming, {slave.he} is ready to explore every corner of your fantasies.",
		"This one’s got a taste for the more.. experimental. If you want a sextoy with unique kinks, this is the one.",
	]))
	
	_auction.unlockRandomTraitOfTypeEachBidderWithChance(AuctionTraitType.Personality, mightChance())

func getTraits() -> Dictionary:
	return {
		"FetishSexExotic": 1.0,
	}
