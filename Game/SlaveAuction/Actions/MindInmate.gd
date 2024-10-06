extends AuctionAction

func _init():
	id = "MindInmate"

func getActionType():
	return AuctionActionType.Mind

func getName() -> String:
	return "Ex-Inmate"

func getButtonDesc() -> String:
	return "Explain how this slave was previously one of the inmates.\n\n[b]Might[/b] reveal 1 personality preference of each bidder."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	sayPresenter(RNG.pick([
		"This one’s been an inmate of one of the AlphaCorp prisons, tucked away deep. Toughened, but now completely broken down!",
		"Once a prisoner of an AlphaCorp prison, now a prized possession. How many bidders can claim that?",
		"Fresh from the prison cells of an AlphaCorp prison, this inmate has seen it all, and now is ready to serve.",
		"This one spent years behind bars of an AlphaCorp prison, and now {slave.he} is ready to serve on the other side.",
		"An AlphaCorp ex-inmate who has already been trained to submit, perfect for those looking for a truly experienced slave.",
		"Captured, punished, and now owned. This AlphaCorp ex-inmate will obey any command you give.",
	]))
	
	_auction.unlockRandomTraitOfTypeEachBidderWithChance(AuctionTraitType.Personality, mightChance())

func getTraits() -> Dictionary:
	return {
		"MindInmate": 1.0,
	}

func getPositiveReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	return RNG.pick([
		'An inmate, huh? Bet they know a thing or two about taking punishment.',
		'Breaking someone already broken by prison... poetic.',
		'Sounds like someone who already knows how to follow orders.',
		'Could be a good long-term investment.',
		'Owning someone with that background is.. satisfying.',
		'I love even just the idea.',
	])

func getNegativeReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	return RNG.pick([
		'I don\'t need problems with AlphaCorp.',
		'No thanks, that is too much.',
		'I think this can quickly become a problem.',
		'AlphaCorp slave? Ehh.',
		'I\'d rather not.',
		'That collar is permanent, isn\'t it? Huge red flag.',
	])
	
