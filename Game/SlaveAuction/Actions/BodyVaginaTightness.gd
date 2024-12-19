extends AuctionAction

func _init():
	id = "BodyVaginaTightness"

func getActionType():
	return AuctionActionType.Body

func getName() -> String:
	return "Pussy tightness"

func getButtonDesc() -> String:
	return "Highlight the slave's pussy.\n\n[b]Might[/b] reveal 1 mind preference of each bidder."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	if(_slaveTraits.has("VaginaTight") && _slaveTraits["VaginaTight"] > 0.0):
		sayPresenter(RNG.pick([
			"Now, I know you all have been eyeing that perfect body, but let me draw your attention to {slave.his} crotch! See this little pussy? It’s tight as a vice, untouched by too much wear. Trust me, you won’t find one like it.",
			"If you’re looking for a pussy that’ll make you work for it, you’re staring right at it. This slave’s incredibly tight down there, I promise, the experience is unforgettable.",
			"Take a good look, but you’ll have to trust me on the tightness - legs closed or not, this one’s untouched by heavy use. You’ll get a grip you won’t want to let go of.",
			"Some of you may like a challenge, and this one delivers. {slave.His} tight pussy will feel like you’re breaking new ground, every time.",
			"You can practically see how tight {slave.his} pussy is, can’t you? Trust me, once you’re in, you won’t want to pull out.",
			"This one’s as tight as they come, a rare find in the auction house. You’ll never find such a pristine little pussy anywhere else!",
		]))
	if(_slaveTraits.has("VaginaLoose") && _slaveTraits["VaginaLoose"] > 0.0):
		sayPresenter(RNG.pick([
			"Let me get your attention down to {slave.his} crotch. This pussy has seen some real action. It’s stretchy, well-used, and experienced in handling whatever you throw at it!",
			"Now, you want a slave who knows exactly what they’re doing? Because {slave.his} pussy’s been stretched to perfection - no matter the size, it’s ready for more. Open, welcoming, and eager.",
			"By the way, with this one? No need to hold back. You can go as deep and rough as you like, and that stretchy pussy will just keep begging for more.",
			"Don’t let the closed legs fool you - trust me, this slave’s pussy has taken plenty of attention. Loose, but still so responsive and tight in the right moments, you’ll be impressed with how well it handles you.",
			"Experienced, well-stretched, and very accommodating. This pussy won’t shy away from anything. You won’t have to worry about being too rough or too big.",
			"If you like a pussy that’s seen some serious use, you’ve found the perfect slave. Stretchy, open, and always ready for the next round.",
		]))
	
	_auction.unlockRandomTraitOfTypeEachBidderWithChance(AuctionTraitType.Mind, mightChance())

func getTraits() -> Dictionary:
	return {
		"VaginaTight": 1.0,
		"VaginaLoose": 1.0,
	}

func getPositiveReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	if(_slaveTraits.has("VaginaTight") && _slaveTraits["VaginaTight"] > 0.0):
		return RNG.pick([
			'A tight one, huh? That’s what I like to hear.',
			'Perfect, I’ve been wanting something fresh like that.',
			'Tight? That’s enough to get my interest.',
			'Sounds like the ideal pussy for me.',
			'Oh yeah, I will enjoy stretching {slave.her} out.',
			'The things I can do to such a pussy..',
		])
	if(_slaveTraits.has("VaginaLoose") && _slaveTraits["VaginaLoose"] > 0.0):
		return RNG.pick([
			'Now that’s what I like to see.',
			'Perfect!',
			'Well-used and no complaints - that’s exactly what I need.',
			'Loose cunt, huh? That’s perfect for my plans.',
			'This one’s going to get a lot of use!',
		])
	
	return .getPositiveReaction(_char, _slaveTraits)

func getNegativeReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	if(_slaveTraits.has("VaginaTight") && _slaveTraits["VaginaTight"] > 0.0):
		return RNG.pick([
			'Tight? No thanks. Sounds like too much work for too little reward.',
			'Not really what I’m after.',
			'Tight ones are overrated.',
			'Meh, sounds like more of a chore than fun.',
			'I’m not interested in something that’s going to resist me the whole time.',
			'Tight is nice, but I’m looking for something more... accommodating..',
			'What\'s the point if {slave.he} can\'t even take a whole horsecock inside?',
		])
	if(_slaveTraits.has("VaginaLoose") && _slaveTraits["VaginaLoose"] > 0.0):
		return RNG.pick([
			'Loose cunt? Ugh. That’s not what I’m looking for in a slave.',
			'I’ll pass on this one.',
			'Loose pussy? No.',
			'Doesn’t sound like {slave.he} has any grip left. Not my thing.',
			'A pussy that’s seen so much action? Nah, I’m out.',
		])
	
	return .getNegativeReaction(_char, _slaveTraits)
