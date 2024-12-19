extends AuctionAction

func _init():
	id = "PersMean"

func getActionType():
	return AuctionActionType.Personality

func getName() -> String:
	return "Mean/Kind"

func getButtonDesc() -> String:
	return "Tell the bidders about the slave's mean/kind personality.\n\n[b]Might[/b] reveal 1 fetish preference of each bidder."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	if(_slaveTraits.has("PersMean") && _slaveTraits["PersMean"] > 0.0):
		sayPresenter(RNG.pick([
			"{slave.He} has a sharp tongue and a mean attitude to match. But with the right hand, that cruelty can be harnessed and used for your entertainment.",
			"If you’re looking for a challenge, {slave.he} will push you to your limits with {slave.hisHer} mean spirit.",
			"Mean-spirited and rebellious. This one won’t bow without a fight.. but that's half the fun, isn't it?",
			"Want a slave with some bite? {slave.He} won’t shy away from showing you {slave.hisHer} teeth and claws. A little challenge is always fun.",
			"Taming {slave.his} mean personality will take work, but the reward will be oh-so-sweet when you succeed.",
			"{slave.HeShe} may seem vicious now, but break {slave.himHer} down, and you’ll have something truly special. It will be fun, trust me.",
		]))
	if(_slaveTraits.has("PersKind") && _slaveTraits["PersKind"] > 0.0):
		sayPresenter(RNG.pick([
			"{slave.He} has a heart of gold. Kind, gentle, and eager to please, {slave.heShe} will make a wonderful companion.",
			"You won’t find a more obedient or gentle spirit than {slave.him}. Always eager to help and make life easier.",
			"This slave doesn’t need harsh orders. {slave.HeShe} will willingly serve with kindness in {slave.hisHer} eyes.",
			"{slave.His} soft nature will win your heart. A perfect match for anyone who values loyalty and compassion.",
			"With {slave.himHer}, you’ll get more than just obedience.. you’ll have a slave who genuinely cares for {slave.hisHer} master.",
			"A kind heart and a gentle touch. {slave.He} will make a wonderful addition to your household.",
		]))
	
	_auction.unlockRandomTraitOfTypeEachBidderWithChance(AuctionTraitType.Fetish, mightChance())

func getTraits() -> Dictionary:
	return {
		"PersMean": 1.0,
		"PersKind": 1.0,
	}
