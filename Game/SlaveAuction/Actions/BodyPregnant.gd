extends AuctionAction

func _init():
	id = "BodyPregnant"

func getActionType():
	return AuctionActionType.Body

func getName() -> String:
	return "Pregnancy"

func getButtonDesc() -> String:
	return "Highlight the slave's pregnant belly.\n\n[b]Might[/b] reveal 1 mind preference of each bidder."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	sayPresenter(RNG.pick([
		"Take a good look, bidders - this one isn’t just a slave. {slave.He} is carrying new life within {slave.him}! Perfect for those who appreciate the beauty of pregnancy.",
		"You won’t find many like {slave.him} on the market. {slave.HeShe} carries not just the weight of a slave’s duties, but also the future.",
		"See that belly? It didn't came from overeating, {slave.he} {slave.isAre} pregnant! There is so much potential for unique pleasures.",
		"There’s something special about a pregnant slave, don’t you think? The round belly, the way {slave.he} cradles life inside - it’s a rare and precious experience.",
		"{slave.He} will make a beautiful addition to any collection. Pregnant, full of life, and still eager to serve. It’s a combination you don’t want to miss.",
		"You’ll be buying more than a slave - you’re investing in the future with this one. Pregnancy only adds to {slave.his} appeal.",
	]))
	
	_auction.unlockRandomTraitOfTypeEachBidderWithChance(AuctionTraitType.Mind, mightChance())

func getTraits() -> Dictionary:
	return {
		"Pregnant": 2.0,
	}

func getPositiveReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	return RNG.pick([
		'That’s a rarity!',
		'A pregnant slave? I can’t resist.',
		'There’s something so appealing about that belly.',
		'A rare treat indeed.',
		'I’ve been looking for a pregnant slave for a while.',
		'Pregnant slaves are hard to find.',
	])

func getNegativeReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	return RNG.pick([
		'Pregnant? I’m not interested in dealing with that hassle.',
		'No thanks, too much responsibility.',
		'Pregnancy makes things complicated. I need a slave that can serve, not someone who needs special care.',
		'That belly\'s a turn-off for me. I’m not here to buy someone who\'s already carrying life.',
		'Pregnant? I\'m not gonna babysit someone else\'s children.',
	])
	
