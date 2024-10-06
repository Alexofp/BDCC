extends AuctionAction

func _init():
	id = "BodyPenis"

func getActionType():
	return AuctionActionType.Body

func getName() -> String:
	return "Penis length"

func getButtonDesc() -> String:
	return "Highlight the slave's penis.\n\n[b]Might[/b] reveal 1 mind preference of each bidder."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	if(_slaveTraits.has("PenisSmall") && _slaveTraits["PenisSmall"] > 0.0):
		sayPresenter(RNG.pick([
			"Take a look at {slave.his} cute little thing between {slave.his} legs. Not much to work with, but perfect for those of you who prefer a slave with a little bit of shame.",
			"This one comes with a modest package, but don’t underestimate the entertainment value. After all, it’s not always about size - sometimes it’s about how little they have to offer.",
			"Look at {slave.his} dick! Small, yes, but it makes for a more submissive experience, doesn’t it? Who doesn’t enjoy seeing a slave embarrassed by what little they’re packing?",
			"For those of you who enjoy a slave that knows their place - this tiny cock will make sure they never forget it.",
			"You won’t find much between {slave.his} legs.. that {slave.penis} is honestly pathetic.. but that just means there’s plenty of room for {slave.him} to focus on other things!",
			"A small cock can be quite the advantage, especially if you want a slave that’s easy to humiliate and control. Just imagine the blush on their face every time you remind them!",
		]))
	if(_slaveTraits.has("PenisAverage") && _slaveTraits["PenisAverage"] > 0.0):
		sayPresenter(RNG.pick([
			"This one’s packing a nice, average-sized cock. Not too big, not too small - just the right size to get the job done!",
			"An nice average cock for a versatile experience. Whether you want them topping or bottoming, {slave.he} will perform quite well.",
			"Look at that {slave.penis}. There’s nothing special here in terms of size, but that just means they’re reliable in any role you put them in!",
			"Look at that juicy cock, isn't it just perfect? Nothing special.. but sometimes you don't need special. Sometimes you just need a good juicy cock!",
		]))
	if(_slaveTraits.has("PenisLong") && _slaveTraits["PenisLong"] > 0.0):
		sayPresenter(RNG.pick([
			"Now here’s something that’ll grab your attention - this slave is packing. Long and thick, ready for action at any time!",
			"Check this out! With a cock this size, this slave is built to please. It’s the kind of tool you don’t often find in the market, folks.",
			"Look at {slave.his} cock! Impressive, isn’t it? This long cock is perfect for those of you who want a slave that can pleasure even the most demanding of owners.",
			"Look between {slave.his} legs. A cock like this is more than just a weapon - it’s an asset. Long, thick, and ready to serve your every desire.",
			"This slave’s cock is big enough to satisfy even the most demanding bidder. A real prize for those who want more than just average.",
			"Look between {slave.his} legs. You don’t come across a cock like this every day. It’s long, it’s thick, and it’s ready for action. This alone deserves to get some high bids!",
		]))
	
	_auction.unlockRandomTraitOfTypeEachBidderWithChance(AuctionTraitType.Mind, mightChance())

func getTraits() -> Dictionary:
	return {
		"PenisSmall": 1.0,
		"PenisAverage": 1.0,
		"PenisLong": 1.0,
	}

func getPositiveReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	if(_slaveTraits.has("PenisSmall") && _slaveTraits["PenisSmall"] > 0.0):
		return RNG.pick([
			'Perfect for humiliating.',
			'That size means total submission.',
			'I love a slave that’s embarrassed by their size. Makes them more obedient.',
			'Tiny cocks are perfect for making a slave focus on other ways to please.',
			'That’ll keep them humble. A small cock means easy control.',
			'There’s a lot of potential with a tiny cock like that - perfect for some extra humiliation.',
		])
	if(_slaveTraits.has("PenisAverage") && _slaveTraits["PenisAverage"] > 0.0):
		return RNG.pick([
			'Now that’s what I like to see.',
			'Perfect!',
			'That is a pretty good cock.',
			'Just what I’ve been looking for.',
			'Perfect cock.',
			'Great cock, all around.',
			'Yes!',
		])
	if(_slaveTraits.has("PenisLong") && _slaveTraits["PenisLong"] > 0.0):
		return RNG.pick([
			'Impressive size.',
			'Wow. Just wow.',
			'Big cocks like that are hard to find!',
			'I’ve been looking for a slave with a cock like that for a while.',
			'A cock like that is worth the investment.',
			'The bigger, the better.',
		])
	
	return .getPositiveReaction(_char, _slaveTraits)

func getNegativeReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	if(_slaveTraits.has("PenisSmall") && _slaveTraits["PenisSmall"] > 0.0):
		return RNG.pick([
			'A tiny cock? What am I supposed to do with that?',
			'Too small for my tastes. I need something more impressive.',
			'No thanks, I didn\'t come here for some pathetic little thing.',
			'Useless to me.',
			'Humiliating, sure, but that size is just disappointing.',
			'I was hoping for more..',
		])
	if(_slaveTraits.has("PenisAverage") && _slaveTraits["PenisAverage"] > 0.0):
		return RNG.pick([
			'Nothing special here. If I wanted \'average\', I’d stay home.',
			'I expected more.',
			'Boring.',
			'I was hoping for something a little more... exciting.',
			'Forgettable.',
		])
	if(_slaveTraits.has("PenisLong") && _slaveTraits["PenisLong"] > 0.0):
		return RNG.pick([
			'Too big.',
			'All that size is wasted if they can’t use it right.',
			'I prefer something more modest. That’s just excessive.',
			'Long? Yeah, but that doesn’t mean they know what to do with it.',
			'Too much cock isn’t always a good thing.',
			'Looks impressive, but that’s not what I need in a slave.',
		])
	
	return .getNegativeReaction(_char, _slaveTraits)
