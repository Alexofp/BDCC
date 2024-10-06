extends AuctionAction

func _init():
	id = "BodyBreasts"

func getActionType():
	return AuctionActionType.Body

func getName() -> String:
	return "Breast size"

func getButtonDesc() -> String:
	return "Highlight the slave's breasts.\n\n[b]Might[/b] reveal 1 mind preference of each bidder."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	if(_slaveTraits.has("BreastsSmall") && _slaveTraits["BreastsSmall"] > 0.0):
		if(!_char.hasNonFlatBreasts()):
			sayPresenter(RNG.pick([
				"Oh yeah, I want you all to admire this perfectly flat chest - toned and strong, a canvas of pure potential!",
				"Take a look at {slave.his} chest. Some prefer curves, but others appreciate the clean, firm lines of a flat, sculpted front.",
				"Take a look at those {slave.breasts}. Not everyone wants softness. For those who prefer raw muscle and definition, this slave is perfection.",
				"For ownsers who like a more athletic look, this slave's chest is as flat and firm as they come.",
			]))
		else:
			sayPresenter(RNG.pick([
				"I want you all to take a good look at these small, perky breasts. Perfectly formed and oh-so-sensitive.",
				"Some of you prefer a more subtle, delicate chest, and this slave delivers in spades with these petite beauties.",
				"Aren't these {slave.breasts} just perfect. Tight little orbs that fit right in the palm of your hand",
				"Some say bigger is better, but for those with refined tastes, these {slave.breasts} are a rare, delicate treat.",
				"Look at {slave.his} chest. Petite and soft, these are the breasts of someone who knows how to please without overwhelming. Subtle, yet unforgettable.",
				"Look at {slave.his} chest. For those who crave precision and finesse, these small, pert breasts will be exactly what you're after.",
			]))
	if(_slaveTraits.has("BreastsAverage") && _slaveTraits["BreastsAverage"] > 0.0):
		sayPresenter(RNG.pick([
			"Take a look at these perfect breasts. Full, supple, and made to be touched.",
			"Take a look at {slave.his} chest. Not too small, not too big - {slave.his} breasts are just the right size for any taste. The perfect handful.",
			"I want you all to look where I'm looking. These soft, rounded breasts are ideal for any scenario. Not overwhelming, but certainly impossible to ignore.",
			"Tits! If you're looking for balance, these are exactly what you need. Perfectly average, but oh-so-enticing.",
			"Look at {slave.his} beaties. With breasts like these, you get the best of both worlds. Full enough to tease, but not so large as to be a burden.",
			"Well-rounded and supple, {slave.his} {slave.breasts} will satisfy your every touch. They’re made for attention.",
		]))
	if(_slaveTraits.has("BreastsHuge") && _slaveTraits["BreastsHuge"] > 0.0):
		sayPresenter(RNG.pick([
			"These massive, heavy breasts are something you won’t forget. Overflowing and begging for attention.",
			"For those of you who like a lot to handle, these huge, luscious breasts will be your dream come true!",
			"Look at {slave.his} {slave.breasts}. Full, heavy, and impossible to ignore!",
			"Look at {slave.his} {slave.breasts}. These massive beauties are everything you’re looking for.",
			"See {slave.his} {slave.breasts}? Huge, soft, and overflowing. Perfect for anyone who can handle a lot.",
			"Take a moment to admire the sheer size and weight of {slave.his} {slave.breasts} - luxury at its finest.",
		]))
	
	_auction.unlockRandomTraitOfTypeEachBidderWithChance(AuctionTraitType.Mind, mightChance())

func getTraits() -> Dictionary:
	return {
		"BreastsSmall": 1.0,
		"BreastsAverage": 1.0,
		"BreastsHuge": 1.0,
	}

func getPositiveReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	if(_slaveTraits.has("BreastsSmall") && _slaveTraits["BreastsSmall"] > 0.0):
		if(!_char.hasNonFlatBreasts()):
			return RNG.pick([
				'Flat and toned, just the way I like it.',
				'A firm, flat chest? Yes please.',
				'So elegant.',
				'So lean.',
				'Exactly what I’m looking for.',
				'Muscular and flat.',
				'That flat chest is ideal for what I need.',
			])
		else:
			return RNG.pick([
				'I prefer small breasts, they are so much more cute.',
				'Perky and petite? I’ll take that over huge tits any day.',
				'Small and perky. Just the way I like them.',
				'Size doesn’t matter when they look this perfect.',
				'Lean and beautiful.',
				'Those small, tight breasts? Perfect.',
			])
	if(_slaveTraits.has("BreastsAverage") && _slaveTraits["BreastsAverage"] > 0.0):
		return RNG.pick([
			'Now that’s what I like to see.',
			'Perfect!',
			'These are ideal.',
			'Huh. Yeah. They’re just right, not too much, not too little.',
			'Perfect breasts.',
			'Those are some good-looking tits.',
			'Yes!',
		])
	if(_slaveTraits.has("BreastsHuge") && _slaveTraits["BreastsHuge"] > 0.0):
		return RNG.pick([
			'Give me, give me!',
			'Oh, that\'s my weakness.',
			'Perfect for my tastes. I love a lot to handle!',
			'Those massive beauties? Yes!',
			'Finally, something with size.',
			'The bigger, the better.',
		])
	
	return .getPositiveReaction(_char, _slaveTraits)
