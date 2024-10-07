extends AuctionAction

func _init():
	id = "SkillSubmissive"

func getActionType():
	return AuctionActionType.Mind

func getName() -> String:
	return "Sub skill"

func getButtonDesc() -> String:
	return "Tell the bidders about the slave’s extensive training as a Submissive.\n\n[b]Might[/b] reveal 1 personality preference of each bidder."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	sayPresenter(RNG.pick([
		"This one’s been trained in the art of submission. Every command will be followed without hesitation. And that's exactly what you want from a good slave.",
		"Looking for a slave who already knows how to kneel? This submissive is well-trained and eager to please.",
		"Submission is this one’s specialty. Perfect for those who enjoy having complete control. Having complete control is incredibly fun, trust me.",
		"A true submissive, trained to perfection. {slave.He} will never disobey or question your authority. And that's exactly what you want from a good slave.",
		"With training like this, there’s no need to worry about discipline. {slave.He} already knows how to submit.",
		"Nothing more satisfying than a slave who lives to serve. And this submissive has been trained to do just that. To serve you!",
	]))
	
	_auction.unlockRandomTraitOfTypeEachBidderWithChance(AuctionTraitType.Personality, mightChance())

func getTraits() -> Dictionary:
	return {
		"SkillSubmissive": 1.0,
	}

func getPositiveReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	return RNG.pick([
		'I like a well-trained subby thing.',
		'Already knows how to submit? Saves me a lot of time.',
		'A well-trained submissive? Neat.',
		'I like ones that are trained to obey without hesitation.',
		'A trained submissive is always useful.',
		'Sounds nice.',
	])

func getNegativeReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	return RNG.pick([
		'I don\'t need a sub.',
		'I\'m not looking for submissives.',
		'You\'re selling a sub? Ugh.',
		'I don\'t like subs, zero spark in them usually.',
		'I\'d rather not.',
		'Any slave is a sub by default. Whatever.',
	])
	
