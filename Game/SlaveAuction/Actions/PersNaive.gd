extends AuctionAction

func _init():
	id = "PersNaive"

func getActionType():
	return AuctionActionType.Personality

func getName() -> String:
	return "Naive/Perceptive"

func getButtonDesc() -> String:
	return "Tell the bidders about the slave's naive/perceptive personality.\n\n[b]Might[/b] reveal 1 fetish preference of each bidder."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	if(_slaveTraits.has("PersNaive") && _slaveTraits["PersNaive"] > 0.0):
		sayPresenter(RNG.pick([
			"{slave.He} {slave.isAre} as innocent as they come. Completely naive and unknowing about the ways of the world. Sounds fun, doesn't it?",
			"This one is so sweetly unaware of what’s coming. Imagine the fun you’ll have teaching {slave.himHer}.",
			"Pure, untouched by the cruelties of the world.. {slave.he} still believes in kindness. Sounds fun, doesn't it?",
			"{slave.His} naive nature makes {slave.himHer} so easy to mold. With the right touch, you could shape {slave.himHer} however you like.",
			"This one barely understands what's happening. A blank canvas, waiting for a master's guidance.",
			"Naive and trusting - {slave.he} will follow any lead without question. A master’s dream, really.",
		]))
	if(_slaveTraits.has("PersPerceptive") && _slaveTraits["PersPerceptive"] > 0.0):
		sayPresenter(RNG.pick([
			"Don’t be fooled by {slave.his} chains.. This one is sharp, perceptive, and always watching.",
			"Smart and quick to catch on, {slave.he} will understand exactly what’s expected.. and {slave.he} will deliver.",
			"{slave.HeShe} {slave.isAre} not just a dumb slave - this one has a mind as sharp as a blade. Perfect for complex tasks.",
			"If you need a slave with brains, look no further. {slave.He} will figure things out faster than most.",
			"{slave.HeShe} sees everything. A perceptive mind like {slave.hisHer} can serve well in many ways.",
			"Quick-witted and perceptive. {slave.He} will make your life easier with {slave.hisHer} intelligence.",
		]))
	
	_auction.unlockRandomTraitOfTypeEachBidderWithChance(AuctionTraitType.Fetish, mightChance())

func getTraits() -> Dictionary:
	return {
		"PersNaive": 1.0,
		"PersPerceptive": 1.0,
	}
