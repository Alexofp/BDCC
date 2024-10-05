extends AuctionAction

func _init():
	id = "FetishMilking"

func getButtonDesc() -> String:
	return "Tell the bidders about the slave's eagerness for being milked.\n\n[b]Might[/b] reveal 1 personality preference of each bidder."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	if(_char.hasNonFlatBreasts() && _char.hasPenis()):
		sayPresenter(RNG.pick([
			"Now this one, {slave.heShe} has a particular fondness for being milked. Whether it’s those {slave.breasts} or the seed from {slave.his} {slave.penis}, {slave.he} loves every second of it.",
			"Whether it’s milking those swollen breasts or drawing out every last drop from {slave.his} {slave.penis}, this one’s body aches to be drained!",
			"{slave.His} whole purpose? To be milked dry. Whether it’s {slave.his} seed or milk, {slave.he} needs that sensation!",
			"This one is a double delight, ladies and gentlemen. Why? Well, let’s just say you’ll never run out of fresh seed and milk. {slave.He} loves being milked!",
			"This one's a double treat. Not only does {slave.heShe} live for being drained, but {slave.he} craves it from every part of {slave.his} body. Whether it’s milk from those full breasts or seed from that cock, {slave.he} needs to be milked dry.",
			"We’ve got a special one here! Both milking those heavy breasts and pumping that cock drive {slave.him} wild. {slave.HeShe} lives for the sensation of being emptied completely, over and over.",
			"This slave’s desires are simple - total emptiness. Squeeze those {slave.breasts} for every drop of {slave.milk}, pump {slave.his} {slave.penis} for every ounce of seed, and {slave.he} will thank you for it.",
		]))
	elif(_char.hasPenis()):
		sayPresenter(RNG.pick([
			"If you’ve got a taste for seed milking, this slave’s enthusiasm will not disappoint. {slave.He} thrives under the pump, eager for that release. Will you give it to {slave.him}?",
			"{slave.HeShe} craves being milked dry, again and again! Pump {slave.him} until {slave.he} can’t give any more, and watch {slave.his} body beg for the next round.",
			"If you’re looking for a slave who loves the sensation of being drained, you’ve found {slave.him}. Milking {slave.his} {slave.penis} is {slave.his} greatest desire - empty {slave.him} completely, and you’ll have a willing servant.",
			"Don’t let that {slave.penis} go to waste. {slave.He} thrives on the release, the sensation of being drained until {slave.he} can’t give anymore. Keep pumping, and {slave.he}’ll keep giving.",
			"You won’t have to coax this one. {slave.He} lives to be milked, {slave.his} {slave.penis} twitching and aching for the release that only you can provide. Every drop is a reward.",
			"Here’s a slave who finds pleasure in being emptied. The more you take, the more {slave.he} craves. Wring {slave.him} dry, and {slave.he}’ll be right back, eager for more.",
		]))
	else:
		sayPresenter(RNG.pick([
			"Ever wanted a slave who’s just begging to be milked? This one gets off on the act itself, no encouragement needed!",
			"Now this one, {slave.heShe} has a particular fondness for being milked. {slave.He} loves every second of it!",
			"{slave.His} whole purpose? To be milked dry! {slave.He} needs that sensation! But will you give it to {slave.him}?",
			"This one lives for the feeling of being milked. {slave.HisHer} {slave.breasts} are full, and they ache for release. Squeeze them dry, and {slave.he} won’t be able to stop moaning for more.",
			"If you’ve ever wanted a slave who needs to be milked, look no further. These {slave.breasts} aren’t just for show - they’re meant to be drained, and {slave.he} loves every second of it.",
			"You won’t find a more eager participant. Every pull, every squeeze, {slave.he} lives for it. Fill those hands with {slave.his} {slave.breasts}, and watch {slave.him} melt into submission.",
		]))
	
	_auction.unlockRandomTraitOfTypeEachBidderWithChance(AuctionTraitType.Personality, mightChance())

func getPositiveReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	return RNG.pick([
		"A true milking slave? My machines will love this one!",
		"This could be fun.",
		"I’ve got plenty of use for {slave.him}.",
		"Perfect for my set-up. Milking is an art.",
		"Sounds like exactly what I need for my farm.",
	])

func getTraits() -> Dictionary:
	return {
		"FetishMilking": 1.0,
	}
