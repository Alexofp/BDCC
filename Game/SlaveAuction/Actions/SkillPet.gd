extends AuctionAction

func _init():
	id = "SkillPet"

func getActionType():
	return AuctionActionType.Mind

func getName() -> String:
	return "Pet skill"

func getButtonDesc() -> String:
	return "Tell the bidders about the slave’s extensive training as a Pet.\n\n[b]Might[/b] reveal 1 personality preference of each bidder."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	sayPresenter(RNG.pick([
		"{slave.He} has been trained to perfection as a pet. And you know what means - {slave.he} {slave.isAre} obedient, loyal, and eager to serve.",
		"Looking for a devoted pet who knows how to follow commands without question? This is the one. Obedient, loyal, and eager to serve.",
		"From fetching to kneeling, {slave.he} has been trained to respond to your every need like a loyal animal.",
		"Trained as a pet, {slave.he} will follow you everywhere, ready to serve at a moment’s notice. Always obedient, always loyal.",
		"This pet knows {slave.his} place at your feet. Ready to obey, eager to please.",
		"Perfectly conditioned to be a loyal pet, this one will never question your commands.",
	]))
	
	_auction.unlockRandomTraitOfTypeEachBidderWithChance(AuctionTraitType.Personality, mightChance())

func getTraits() -> Dictionary:
	return {
		"SkillPet": 1.0,
	}

func getPositiveReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	return RNG.pick([
		'A loyal pet? I could use that in my household.',
		'Training like that is rare.',
		'Already trained? Saves me the trouble.',
		'Obedience and loyalty. I’m interested.',
		'A perfect pet? That\'s rare',
		'That’s exactly what I’m looking for.',
	])

func getNegativeReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	return RNG.pick([
		'I don\'t need an animal, I need a slave.',
		'I\'m not looking for pets.',
		'You\'re selling an animal? Ugh.',
		'I don\'t like pets, they are so messy.',
		'I\'d rather not.',
		'I hate pets because they keep scratching furniture.',
	])
	
