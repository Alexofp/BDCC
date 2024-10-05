extends AuctionAction

func _init():
	id = "FetishSexTop"

func getButtonDesc() -> String:
	return "Tell the bidder's about the slave's topping skills.\n\n[b]Might[/b] reveal 1 personality preference of each bidder."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	sayPresenter(RNG.pick([
		"Got a taste for a dominant one? This slave loves to take control in the most delicious ways. Trust me, {slave.he} {slave.isAre} great at fucking!",
		"Want a toy that will leave you exhausted? This one will leave you begging for more.",
		"A predator in the sheets, this one lives for the hunt, eager to make {slave.his} owners cum in the most explosive ways.",
		"This slave thrives on topping, and trust me, {slave.he} knows exactly how to make others surrender to pleasure.",
	]))
	
	_auction.unlockRandomTraitOfTypeEachBidderWithChance(AuctionTraitType.Personality, mightChance())

func getTraits() -> Dictionary:
	return {
		"FetishSexTop": 1.0,
	}

func getPositiveReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	return RNG.pick([
		'They’ll be fun to work with.',
		'Just what I need.',
		'Strong and assertive.',
		'A perfect top!',
		'They’ll do just fine.',
	])
