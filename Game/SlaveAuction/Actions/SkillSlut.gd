extends AuctionAction

func _init():
	id = "SkillSlut"

func getActionType():
	return AuctionActionType.Mind

func getName() -> String:
	return "Slut skill"

func getButtonDesc() -> String:
	return "Tell the bidders about the slave’s extensive training as a Slut.\n\n[b]Might[/b] reveal 1 personality preference of each bidder."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	sayPresenter(RNG.pick([
		"This one is no stranger to the pleasures of the flesh. {slave.He} {slave.isAre} a well-trained slut, ready to satisfy all your desires!",
		"With proper training, {slave.he} has mastered the art of pleasure. A true slut in every sense of the word.",
		"Those hips? Those lips? They’ve been trained to please. And trust me, {slave.he} knows exactly how to please others.",
		"This slave was trained to perfection. Every moan, every touch, carefully honed. This slut will serve you well in every intimate way.",
		"Looking for a slave who’s been trained to pleasure? You’re looking at the perfect candidate. {slave.He} knows exactly how to please others.",
		"Looking for a good whore? Only the finest training went into creating a slut of this caliber. {slave.He} {slave.isAre} a true expert in every art of seduction.",
	]))
	
	_auction.unlockRandomTraitOfTypeEachBidderWithChance(AuctionTraitType.Personality, mightChance())

func getTraits() -> Dictionary:
	return {
		"SkillSlut": 1.0,
	}

func getPositiveReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	return RNG.pick([
		'I like a well-trained whore.',
		'Seems like a good investment.',
		'With skills like that, this one will earn back the investment quickly.',
		'Perfectly trained to please? Yes please.',
		'Training sluts is so annoying. So this is worth it.',
		'Sounds like a perfect addition to my collection of fucktoys.',
	])

func getNegativeReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	return RNG.pick([
		'I don\'t need a whore.',
		'I\'m not looking for sluts.',
		'You\'re selling a whore? Ugh.',
		'I don\'t like total whores.',
		'I\'d rather not.',
		'I can buy whores off of streets for dirt-cheap.',
	])
	
