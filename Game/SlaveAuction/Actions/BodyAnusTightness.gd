extends AuctionAction

func _init():
	id = "BodyAnusTightness"

func getActionType():
	return AuctionActionType.Body

func getName() -> String:
	return "Anus tightness"

func getButtonDesc() -> String:
	return "Highlight the slave's ass.\n\n[b]Might[/b] reveal 1 mind preference of each bidder."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	if(_slaveTraits.has("AnusTight") && _slaveTraits["AnusTight"] > 0.0):
		sayPresenter(RNG.pick([
			"Now, I know you’ve all been eyeing that ass. Let me tell you, this slave has a tight little asshole just begging for a good stretch.",
			"Trust me when I say, this slave’s butthole hasn’t seen much action. Tight as a vice, and ready for whoever claims it!",
			"Take a look at this beauty’s ass. I can guarantee you, {slave.his} hole is untouched, tight as can be - just waiting for the right owner to break it in.",
			"This slave’s tailhole? A perfect little knot of tension, waiting for a good knot. Haven’t seen one this tight in a long time.",
			"You might not be able to see it from here, but take my word for it - {slave.his} asshole is tight. This slave’s going to squeeze around you like nothing else.",
			"This one’s ass? Barely used, barely stretched. Whoever gets {slave.himHer} is going to have the privilege of being the first to really open {slave.himHer} up.",
		]))
	if(_slaveTraits.has("AnusLoose") && _slaveTraits["AnusLoose"] > 0.0):
		sayPresenter(RNG.pick([
			"Now if you’re looking for an ass that’s already been worked over, you’re in luck. This slave’s asshole is loose, very loose. No need to be gentle!",
			"Take a good look at this ass. This slave’s butthole has seen plenty of action - it’s been stretched and used to the point where it can take anything you throw at it.",
			"You want a slave who can handle anything back there? This one’s got a loose hole that’s been trained for every size. No complaints, just pure satisfaction.",
			"If you’re into a well-worn tailhole, look no further. This one’s been stretched far and wide—perfect for those of you who like to play rough.",
			"This slave’s ass has been through it all. Loose, gaping, and ready to take whatever you’ve got. Trust me, {slave.he} will keep coming back for more.",
			"Let’s not beat around the bush - {slave.his} butthole is wide open and always ready for more. It’s seen a lot of use, and it’s more than prepared to serve you however you like.",
		]))
	
	_auction.unlockRandomTraitOfTypeEachBidderWithChance(AuctionTraitType.Mind, mightChance())

func getTraits() -> Dictionary:
	return {
		"AnusTight": 1.0,
		"AnusLoose": 1.0,
	}

func getPositiveReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	if(_slaveTraits.has("AnusTight") && _slaveTraits["AnusTight"] > 0.0):
		return RNG.pick([
			'A tight one, huh? That’s what I like to hear.',
			'Perfect, I’ve been wanting something fresh like that.',
			'Tight? That’s enough to get my interest.',
			'Sounds like the ideal ass for me.',
			'Oh yeah, I will enjoy stretching {slave.her} out.',
			'The things I can do to such a tailhole..',
		])
	if(_slaveTraits.has("AnusLoose") && _slaveTraits["AnusLoose"] > 0.0):
		return RNG.pick([
			'Now that’s what I like to see.',
			'Perfect!',
			'Well-used and no complaints - that’s exactly what I need.',
			'Loose tailhole, huh? That’s perfect for my plans.',
			'This one’s going to get a lot of use!',
		])
	
	return .getPositiveReaction(_char, _slaveTraits)

func getNegativeReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	if(_slaveTraits.has("AnusTight") && _slaveTraits["AnusTight"] > 0.0):
		return RNG.pick([
			'Tight? No thanks. Sounds like too much work for too little reward.',
			'Not really what I’m after.',
			'Tight ones are overrated.',
			'Meh, sounds like more of a chore than fun.',
			'I’m not interested in something that’s going to resist me the whole time.',
			'Tight is nice, but I’m looking for something more... accommodating..',
			'What\'s the point if {slave.he} can\'t even take a whole horsecock inside?',
		])
	if(_slaveTraits.has("AnusLoose") && _slaveTraits["AnusLoose"] > 0.0):
		return RNG.pick([
			'Loose asshole? Ugh. That’s not what I’m looking for in a slave.',
			'I’ll pass on this one.',
			'Loose asshole? No.',
			'Doesn’t sound like {slave.he} has any grip left. Not my thing.',
			'An asshole that’s seen so much action? Nah, I’m out.',
		])
	
	return .getNegativeReaction(_char, _slaveTraits)
