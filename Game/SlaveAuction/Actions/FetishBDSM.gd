extends AuctionAction

func _init():
	id = "FetishBDSM"

func getButtonDesc() -> String:
	return "Tell the bidders about the slave's love of being bound in ropes and cuffs.\n\n[b]Might[/b] reveal 1 personality preference of each bidder."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	sayPresenter(RNG.pick([
		"{slave.HeShe} craves the feeling of being restrained. Ropes, cuffs, chains, you name it. Tie {slave.him} up and watch {slave.him} squirm, it's so fun!",
		"If you want a slave that thrives in submission, look no further. Binding {slave.him} is as natural as breathing for {slave.him}. The more restrained, the better.",
		"Cuffs clinking, ropes tightening.. this slave loves the tension and helplessness of being completely at your mercy!",
		"Tie {slave.him} down, cuff {slave.him} up, and you’ll witness pure bliss. The more immobile {slave.he} is, the deeper the obedience goes.",
		"{slave.HeShe} doesn’t just tolerate being bound - {slave.heShe} needs it. Restraints are more than just tools against {slave.him}, they're a gateway to total surrender.",
		"Whether it's silk ropes or heavy chains, the tighter the better for this one. Restraints unlock {slave.his} true nature.",
	]))
	
	_auction.unlockRandomTraitOfTypeEachBidderWithChance(AuctionTraitType.Personality, mightChance())

func getPositiveReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	return RNG.pick([
		'A slave who knows {slave.his} place in cuffs? Nice.',
		'I can already imagine {slave.him} tied up in my playroom.',
		'Perfect, I’ve been looking for someone who craves restraint like that. Consider me interested!',
		'I love slaves who can take the bindings!',
		'I could use a restraint slut.',
		'Restraints and slaves go together like cats and tuna.',
	])

func getTraits() -> Dictionary:
	return {
		"FetishBDSM": 1.0,
	}
