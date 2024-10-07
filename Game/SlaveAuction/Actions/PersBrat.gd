extends AuctionAction

func _init():
	id = "PersBrat"

func getActionType():
	return AuctionActionType.Personality

func getName() -> String:
	return "Bratty"

func getButtonDesc() -> String:
	return "Tell the bidders about the slave's bratty nature.\n\n[b]Might[/b] reveal 1 fetish preference of each bidder."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	sayPresenter(RNG.pick([
		"{slave.He} {slave.isAre} the kind that pushes boundaries. A real brat, full of teasing and playful rebellion.",
		"{slave.He} {slave.isAre} a brat so {slave.he} won't make it easy for you. But the fun's in the challenge, isn't it?",
		"{slave.He} {slave.isAre} such a brat. With {slave.himHer}, you’ll have a game of defiance and submission. It’s all about teasing control.",
		"{slave.He} {slave.isAre} a playful brat with just enough attitude to keep you on your toes. But the right hand can tame {slave.himHer}.",
		"Who doesn’t love a little resistance? {slave.He} knows exactly how to push the right buttons to make you punish {slave.him}. A true brat.",
		"Obedient under all the wrong conditions, but always with a twinkle in {slave.hisHer} eye. You’ll enjoy the chase with {slave.himHer}.",
	]))
	
	_auction.unlockRandomTraitOfTypeEachBidderWithChance(AuctionTraitType.Fetish, mightChance())

func getTraits() -> Dictionary:
	return {
		"PersBrat": 1.0,
	}
