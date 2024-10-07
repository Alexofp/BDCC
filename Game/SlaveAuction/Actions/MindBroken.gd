extends AuctionAction

func _init():
	id = "MindBroken"

func getActionType():
	return AuctionActionType.Mind

func getName() -> String:
	return "Mind-broken"

func getButtonDesc() -> String:
	return "Point out the slave's broken mind.. Might cause a big reaction, positive or negative.\n\n[b]Might[/b] reveal 1 personality preference of each bidder."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	sayPresenter(RNG.pick([
		"Oh yeah, by the way.. this one has been completely broken. No thoughts, no resistance, just pure obedience.",
		"Oh yeah, by the way.. {slave.He} {slave.isAre} mindbroken and ready to follow any command without question. This one has no will left to resist.",
		"This slave’s mind is gone. {slave.He} {slave.isAre} yours to mold however you see fit, without hesitation. A blank canvas!",
		"Oh yeah, by the way.. {slave.he} {slave.is} nothing but a blank slate. But that's good. This mindbroken slave will follow your every whim without question.",
		"Oh yeah, by the way.. {slave.He} {slave.isAre} completely obedient, completely mindbroken. This one won’t resist anything you ask.",
		"Oh yeah, by the way.. this one has been completely broken. A perfect doll, no thoughts, just action. Every command will be followed without question.",
	]))
	
	_auction.unlockRandomTraitOfTypeEachBidderWithChance(AuctionTraitType.Personality, mightChance())

func getTraits() -> Dictionary:
	return {
		"MindBroken": 3.0,
	}

func getPositiveReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	return RNG.pick([
		"I like me a blank slate.",
		"Saves me time.",
		"Dolls are fun.",
		"I could use a good fuckdoll.",
		"Sounds like the perfect obedient doll.",
		"Means I don't have to wipe their mind myself."
	])

func getNegativeReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	return RNG.pick([
		"Are you serious? That's awful.",
		"Are you selling us a broken slave? Wow..",
		"What the fuck am I gonna do with a doll.",
		"I need personality, I don't need a fucking doll.",
		"Yeah, I hate that.",
	])
	
func getPassiveDesireGain() -> float:
	return -0.5
