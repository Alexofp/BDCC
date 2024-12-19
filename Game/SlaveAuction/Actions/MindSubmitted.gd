extends AuctionAction

func _init():
	id = "MindSubmitted"

func getActionType():
	return AuctionActionType.Mind

func getName() -> String:
	return "Has submitted"

func getButtonDesc() -> String:
	return "Tell the bidders about the slave’s complete submission to the master.\n\n[b]Might[/b] reveal 1 personality preference of each bidder."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	sayPresenter(RNG.pick([
		"You know what's the best part is? This slave has submitted completely to {slave.his} master! No further breaking needed, {slave.he} will obey.",
		"You know what's the best part is? This slave has submitted completely. {slave.He} {slave.isAre} already devoted and loyal, this one knows {slave.his} place at your feet.",
		"Fully broken and loyal to the master. This slave has submitted completely, you won’t have to worry about disobedience with {slave.him}.",
		"This one’s been completely conditioned to submit to {slave.his} owner. No resistance, just obedience.",
		"Already trained, already submitted. This slave is perfect for those who don’t want to bother with breaking them in.",
	]))
	
	_auction.unlockRandomTraitOfTypeEachBidderWithChance(AuctionTraitType.Personality, mightChance())

func getTraits() -> Dictionary:
	return {
		"MindSubmitted": 1.0,
	}

func getPositiveReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	return RNG.pick([
		'Perfect, as it should be.',
		'Great, that\'s how every slave should be.',
		'Sounds like someone who already knows how to follow orders.',
		'Neat.',
		'Broken into submission. Perfect.',
		'I like that.',
	])

func getNegativeReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	return RNG.pick([
		'But breaking them is the most fun part.',
		'Aww, I like breaking slaves though.',
		'What if I wanted to break them myself?',
		'That\'s no fun.',
		'Ehh, that\'s meh.',
		'Making them submit is fun though.',
	])
	
