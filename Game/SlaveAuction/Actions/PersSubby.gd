extends AuctionAction

func _init():
	id = "PersSubby"

func getActionType():
	return AuctionActionType.Personality

func getName() -> String:
	return "Subby/Dominant"

func getButtonDesc() -> String:
	return "Tell the bidders about the slave's submissiveness.\n\n[b]Might[/b] reveal 1 fetish preference of each bidder."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	if(_slaveTraits.has("PersSubby") && _slaveTraits["PersSubby"] > 0.0):
		sayPresenter(RNG.pick([
			"You will be surprised by how well {slave.he} bends to commands. A perfect submissive, always ready to obey.",
			"{slave.He} thrives under control. There's nothing {slave.heShe} loves more than being put in {slave.hisHer} place. A perfect submissive.",
			"This one is built for submission. Give {slave.himHer} an order, and you'll see just how fast {slave.heShe} obeys.",
			"{slave.He} craves structure and discipline. Keep {slave.himHer} in line, and {slave.heShe}'ll be your perfect servant.",
			"{slave.HeShe} lives to be controlled. The more power you take, the happier {slave.heShe} becomes.",
			"There's nothing but obedience in {slave.his} heart. Give {slave.himHer} the order, and watch {slave.himHer} submit.",
		]))
	if(_slaveTraits.has("PersDominant") && _slaveTraits["PersDominant"] > 0.0):
		sayPresenter(RNG.pick([
			"{slave.He} isn’t one to be commanded. {slave.heShe} thrives on control and power. But that might be exactly what you want.",
			"For those of you seeking a leader among slaves, {slave.he} {slave.isAre} the one to dominate the rest.",
			"{slave.HeShe} knows exactly what {slave.heShe} wants and isn't afraid to take it. Did you know that dominant slaves are incredibly rare?",
			"This one won’t bend easily. {slave.he} enjoys being in charge, and you'll feel that strength. Not for everyone.. but breaking dominant slaves is just so much fun.",
			"Power flows through {slave.hisHer} veins. Give {slave.himHer} a chance, and {slave.heShe} will test you. Show {slave.him} who's boss!",
			"{slave.name} may be a slave, but deep down, {slave.heShe}'s the one that craves control over others. And that's the perfect thing to tease {slave.him} with.",
		]))
	
	_auction.unlockRandomTraitOfTypeEachBidderWithChance(AuctionTraitType.Fetish, mightChance())

func getTraits() -> Dictionary:
	return {
		"PersSubby": 1.0,
		"PersDominant": 1.0,
	}
