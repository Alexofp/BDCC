extends AuctionAction

func _init():
	id = "BodyThickness"

func getActionType():
	return AuctionActionType.Body

func getName() -> String:
	return "Thickness"

func getButtonDesc() -> String:
	return "Point out the slave's curves.\n\n[b]Might[/b] reveal 1 mind preference of each bidder."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	if(_slaveTraits.has("BodySlim") && _slaveTraits["BodySlim"] > 0.0):
		sayPresenter(RNG.pick([
			"Admire the elegance here! Slender, toned, and perfectly made for every need.",
			"Lean and graceful, this one’s body is a work of art. Every move is refined and enticing.",
			"This slim figure is built for endurance. Perfect for those who prefer their toys lithe and flexible.",
			"Not too much, not too little - just the right amount of slimness to please the eye and your needs.",
			"A delicate build, but don’t let that fool you - {slave.he} can handle anything you throw {slave.his} way.",
			"Sleek and slender, {slave.his}'s body is all about grace, offering a refined, subtle allure.",
		]))
	if(_slaveTraits.has("BodyAverage") && _slaveTraits["BodyAverage"] > 0.0):
		sayPresenter(RNG.pick([
			"Not too thick, not too thin - this slave has the perfect balance for any taste.",
			"Here we have the ideal body build, ready to meet your every expectation.",
			"Nothing too extreme here - just a perfectly balanced body, made to please.",
			"Classic, average, and perfect for anything you have in mind - this slave has simply the perfect body.",
			"{slave.He} {slave.isAre} the definition of well-proportioned, offering the best of both worlds.",
			"Look, an all-around perfect form, this one is ready for anything you desire.",
		]))
	if(_slaveTraits.has("BodyThick") && _slaveTraits["BodyThick"] > 0.0):
		sayPresenter(RNG.pick([
			"Now this one’s built to be enjoyed — a body with all the right curves in all the right places.",
			"Full, thick, and ready for anything, {slave.he} offers more than enough to keep you satisfied.",
			"{slave.He} has a body that demands attention, thick and perfect for indulgence.",
			"Love something to hold onto? {slave.He} has the curves that will leave you wanting more.",
			"Thick thighs, full hips - {slave.he} was made to be enjoyed by those with appetites for more.",
			"This one has a lot to offer, both to the eye and the touch. For those who like their toys thick, {slave.he} {slave.isAre} perfect.",
		]))
	
	_auction.unlockRandomTraitOfTypeEachBidderWithChance(AuctionTraitType.Mind, mightChance())

func getTraits() -> Dictionary:
	return {
		"BodySlim": 1.0,
		"BodyAverage": 1.0,
		"BodyThick": 1.0,
	}

func getPositiveReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	if(_slaveTraits.has("BodySlim") && _slaveTraits["BodySlim"] > 0.0):
		return RNG.pick([
			'Love a slender frame.',
			'Perfectly sleek.',
			'So elegant.',
			'Just my type!',
			'Lean and beautiful.',
			'These proportions are perfect.',
			'I like this, perfect proportions.',
		])
	if(_slaveTraits.has("BodyAverage") && _slaveTraits["BodyAverage"] > 0.0):
		return RNG.pick([
			'I like this, perfect proportions.',
			'These proportions are perfect.',
			'Just right.',
			'Classic beauty.',
			'Well-proportioned.',
			'I’m into that.',
			'Just my type!',
		])
	if(_slaveTraits.has("BodyThick") && _slaveTraits["BodyThick"] > 0.0):
		return RNG.pick([
			'Now that’s what I like.',
			'Thick and gorgeous.',
			'All the curves!',
			'Deliciously full.',
			'Perfectly plush.',
			'So thick, I love it.',
		])
	
	return .getPositiveReaction(_char, _slaveTraits)
