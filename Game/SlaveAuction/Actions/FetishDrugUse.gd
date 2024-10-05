extends AuctionAction

func _init():
	id = "FetishDrugUse"

func getButtonDesc() -> String:
	return "Mention the slave's love of certain substances.\n\n[b]Might[/b] reveal 1 personality preference of each bidder."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	sayPresenter(RNG.pick([
		"This slave has quite the habit - always looking for the next high. Drugs? {slave.he} can’t live without them.",
		"Drugs are {slave.his} weakness, and that makes {slave.him} easy to control. Keep {slave.him} supplied, and {slave.he} will obey like no other.",
		"Addicted and eager, {slave.he} won’t say no to any substance you offer. Drugs are {slave.his} true master.",
		"Hooked on every substance imaginable, this one is practically begging for the next high. Keep {slave.him} supplied, and {slave.he} will do anything.",
	]))
	
	_auction.unlockRandomTraitOfTypeEachBidderWithChance(AuctionTraitType.Personality, mightChance())

func getPositiveReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	return RNG.pick([
		"Could be fun to play with.",
		"Perfect. I’ll get this one addicted to my favorite drug.",
		"This one will be crawling for the next hit.",
		"A junkie slave means easy control.",
		"I can see the potential here.",
	])

func getNegativeReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	return RNG.pick([
		"You're trying to sell us a drug junkie? Really?",
		"A junkie slave? Ugh.",
		"I like my slaves low rather than high.",
	])

func getTraits() -> Dictionary:
	return {
		"FetishDrugUse": 1.0,
	}
