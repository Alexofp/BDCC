extends AuctionAction

func _init():
	id = "FetishSexBottom"

func getButtonDesc() -> String:
	return "Tell the bidders about the slave's love of getting fucked.\n\n[b]Might[/b] reveal 1 personality preference of each bidder."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	sayPresenter(RNG.pick([
		"{slave.He} got a mouth that knows how to serve in every way!",
		"Look at this one, eager for all kinds of attention. A perfect plaything for anyone who knows how to use {slave.him}.",
		"This fucktoy lives to be filled. Every hole is begging for your command.",
		"Want a pet who craves nothing but to be taken? Here’s one who will never say no.",
		"From the way {slave.he} moves, you can tell {slave.he} lives for pleasure. Your pleasure, not {slave.his}.",
		"{slave.He} needs to be claimed, and trust me, there’s nothing {slave.he} enjoys more than being bent over.",
		"Submissive and willing, this sextoy will make a perfect addition to any breeder's collection.",
	]))
	
	_auction.unlockRandomTraitOfTypeEachBidderWithChance(AuctionTraitType.Personality, mightChance())

func getPositiveReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	return RNG.pick([
		'Perfect for my tastes.',
		'Just the kind I need.',
		'Can’t wait to use {slave.him}.',
		'Ready for a good time.',
		'Ideal for my playroom.',
		'I will enjoy breeding {slave.him}.',
		'I will enjoy using {slave.him}.',
		'I will enjoy fucking {slave.him} raw.',
	])

func getTraits() -> Dictionary:
	return {
		"FetishSexBottom": 1.0,
	}
