extends AuctionAction

func _init():
	id = "PersBrave"

func getActionType():
	return AuctionActionType.Personality

func getName() -> String:
	return "Brave"

func getButtonDesc() -> String:
	return "Tell the bidders about the slave's bravery.\n\n[b]Might[/b] reveal 1 fetish preference of each bidder."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	sayPresenter(RNG.pick([
		"{slave.He} stands tall, even in chains. Bravery like {slave.hisHer} is rare in a slave.",
		"This one’s got courage, even in the face of submission. That kind of bravery makes for a strong servant.",
		"{slave.HeShe} won’t back down from a challenge. Brave slaves like {slave.him} will endure anything for their master.",
		"Bravery is a rare quality in slaves. {slave.He} will hold {slave.hisHer} head high, no matter the situation.",
		"If you’re looking for someone strong-willed yet obedient, {slave.his} bravery makes {slave.himHer} an excellent choice.",
		"Even in submission, {slave.he} shows no fear. That courage will serve you well.",
	]))
	
	_auction.unlockRandomTraitOfTypeEachBidderWithChance(AuctionTraitType.Fetish, mightChance())

func getTraits() -> Dictionary:
	return {
		"PersBrave": 1.0,
	}
