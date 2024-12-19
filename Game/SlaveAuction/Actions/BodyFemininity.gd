extends AuctionAction

func _init():
	id = "BodyFemininity"

func getActionType():
	return AuctionActionType.Body

func getName() -> String:
	return "Femininity"

func getButtonDesc() -> String:
	return "Point out the slave's femininity/masculinity.\n\n[b]Might[/b] reveal 1 mind preference of each bidder."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	if(_slaveTraits.has("Masculine") && _slaveTraits["Masculine"] > 0.0):
		sayPresenter(RNG.pick([
			"Take a good look at this strong frame. Built for hard work and endurance, you won’t find a better asset anywhere.",
			"Broad shoulders, powerful arms, the kind of strength that speaks for itself. Imagine what {slave.he} can do for you.",
			"Solid and reliable - this one’s a prime example of masculine perfection, capable of handling any task you give {slave.him}.",
			"Muscle for days, perfect for labor or protection. You’re not just buying a slave, you’re buying power.",
			"Look at that chiseled physique! Raw strength and endurance packed into a body ready to serve.",
			"{slave.He} {slave.isAre} built like a beast, strong and commanding. Exactly what any discerning bidder needs in their collection.",
		]))
	if(_slaveTraits.has("Androgynous") && _slaveTraits["Androgynous"] > 0.0):
		sayPresenter(RNG.pick([
			"A rare find - this one walks the line between male and female, a blend of elegance and strength.",
			"Beautifully balanced, neither too soft nor too rough. The perfect combination of masculine and feminine traits.",
			"Versatile, alluring - this body offers the best of both worlds, ready to please in any way you desire.",
			"This one’s fluid form will keep you guessing, a unique addition to any bidder’s collection.",
			"Not quite one, not quite the other. A true enigma, adaptable and captivating in every way.",
			"Graceful yet strong, this one carries an aura of mystery that will keep you coming back for more.",
		]))
	if(_slaveTraits.has("Feminine") && _slaveTraits["Feminine"] > 0.0):
		sayPresenter(RNG.pick([
			"Delicate and soft, this one’s feminine beauty is undeniable - perfect for those with refined tastes.",
			"Look at those curves, the very embodiment of grace and allure, ready to captivate any master.",
			"Elegant curves, girly, and all too eager to please - this is the kind of slave you’ll never get enough of.",
			"A flawless example of femininity, this one’s beauty alone could start a bidding war.",
			"Gentle curves, soft skin, and an innocent face. You won’t find a more perfect feminine form.",
			"Sweet, delicate, and oh-so-girly. Perfect for those seeking a softer touch in their collection.",
		]))
	
	_auction.unlockRandomTraitOfTypeEachBidderWithChance(AuctionTraitType.Mind, mightChance())

func getTraits() -> Dictionary:
	return {
		"Masculine": 1.0,
		"Androgynous": 1.0,
		"Feminine": 1.0,
	}

func getPositiveReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	if(_slaveTraits.has("Masculine") && _slaveTraits["Masculine"] > 0.0):
		return RNG.pick([
			'Strong, I like that.',
			'Very powerful.',
			'Impressive physique.',
			'Perfection.',
			'Now we’re talking.',
		])
	if(_slaveTraits.has("Androgynous") && _slaveTraits["Androgynous"] > 0.0):
		return RNG.pick([
			'Perfection.',
			'Captivating.',
			'Interesting, for sure.',
		])
	if(_slaveTraits.has("Feminine") && _slaveTraits["Feminine"] > 0.0):
		return RNG.pick([
			'Beautiful and graceful.',
			'Just the right amount of girly!',
			'Just the softness I like.',
			'Gorgeous.',
			'A true beauty.',
		])
	
	return .getPositiveReaction(_char, _slaveTraits)
