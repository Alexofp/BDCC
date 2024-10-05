extends AuctionAction

func _init():
	id = "FetishExhibitionism"

func getButtonDesc() -> String:
	return "Reveal the slave’s love of being naked.\n\n[b]Might[/b] reveal 1 personality preference of each bidder."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	sayPresenter(RNG.pick([
		"This one right here? Absolutely loves being on display. The more eyes on {slave.him}, the more {slave.he} craves it. Perfect for public performances.",
		"Exhibitionism runs deep in {slave.him}. Strip {slave.him} down, put {slave.him} in front of an audience, and {slave.he} won’t shy away - {slave.he} will beg for more.",
		"You’ll never have to worry about this one feeling ashamed. {slave.He} thrives on being watched, showing off that body, and getting all the attention.",
		"Stage lights, a crowd of onlookers - this slave lives for it. {slave.His} body responds to every gaze, soaking it all in.",
		"This one’s made for showing off {slave.his} {slave.masc} body! Put {slave.him} on display, and {slave.he} will perform better than you could ever imagine.",
		"No shame, no fear - just pure excitement from being seen. {slave.He} was born to be an exhibitionist.",
	]))
	
	_auction.unlockRandomTraitOfTypeEachBidderWithChance(AuctionTraitType.Personality, mightChance())

func getPositiveReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	return RNG.pick([
		"A performer, huh? I’m always up for a good show!",
		"I want {slave.him} on my stage.",
		"Public display is my favorite kink.",
		"Perfect for entertaining guests.",
		"I’ve got plans for this one.",
	])

func getTraits() -> Dictionary:
	return {
		"FetishExhibitionism": 1.0,
	}
