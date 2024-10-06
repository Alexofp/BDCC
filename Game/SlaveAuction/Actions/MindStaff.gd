extends AuctionAction

func _init():
	id = "MindStaff"

func getActionType():
	return AuctionActionType.Mind

func getName() -> String:
	return "Ex-Staff"

func getButtonDesc() -> String:
	return "Explain how this slave was previously one of the staff members.\n\n[b]Might[/b] reveal 1 personality preference of each bidder."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	var whoName:String = "staff"
	if(_char.isGuard()):
		whoName = "guard"
	if(_char.isNurse()):
		whoName = "nurse"
	if(_char.isEngineer()):
		whoName = "engineer"
	
	sayPresenter(RNG.pick([
		"This fine cutie was once part of the prison staff of an AlphaCorp prison. A trusted "+whoName+" who knows the ins and outs of this place. And now you get to keep {slave.him} as your toy!",
		"Ever wondered what it’s like to break someone who used to hold the keys? Well, here’s your chance. This slave was previously a "+whoName+" on an AlphaCorp prison!",
		"{slave.He} once gave orders, but now {slave.he} only obeys. This is an ex-"+whoName+" of an AlphaCorp prison! Turning the tables, don’t you think?",
		"From being a "+whoName+" on an AlphaCorp prison to a slave. From overseeing discipline to learning it firsthand, this one has made quite the transformation!",
		"Once a proud AlphaCorp prison "+whoName+", now ready to serve in a much different way. Can you believe it? The power shift is undeniable!",
		"This is an ex-"+whoName+" of an AlphaCorp prison! You could own someone who used to think they were in control. They thought they were untouchable. Not anymore!",
	]))
	
	_auction.unlockRandomTraitOfTypeEachBidderWithChance(AuctionTraitType.Personality, mightChance())

func getTraits() -> Dictionary:
	return {
		"MindStaff": 1.0,
	}

func getPositiveReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	return RNG.pick([
		'I’ll pay extra!',
		'That’s unique.',
		'Oh, the irony.',
		'That’s an irresistible twist.',
		'Owning someone with that background is.. satisfying.',
		'I love even just the idea.',
	])

func getNegativeReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	return RNG.pick([
		'I don\'t need problems with AlphaCorp.',
		'No thanks, that is too much.',
		'I think this can quickly become a problem.',
		'AlphaCorp slave? Ehh.',
		'I\'d rather not.',
	])
	
