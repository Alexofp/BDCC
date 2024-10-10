extends "res://Game/SlaveAuction/Actions/IntroNormal.gd"

func _init():
	id = "IntroPlayful"

func getName() -> String:
	return "Playful introduction"

func getButtonDesc() -> String:
	return "Start the auction while acting very playful.\n\nReveals 3 random preferences of each bidder that are [b]always[/b] relevant to the slave. But the non-serious tone makes the bidders less likely to bid."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	saynn("The curtains part with a soft swish, revealing {presenter.name}, who steps forward with a cheeky grin, clearly enjoying the spotlight.")
	
	sayPresenter("Well, well, well, look who we have tonight, here at the Blacktail Market! I hope you're all ready for a little fun, because things are about to get interesting.")
	
	saynn("{presenter.YouHe} {presenter.youVerb('give')} a playful wink, gesturing to the slave standing nearby. The spotlight follows the gesture, casting a soft glow on {slave.him} as {slave.he} squints and shifts nervously.")
	
	sayPresenter("Meet this little toy, someone who has just the right mix of charm, skill, and.. well, let’s just say, you’ll have fun figuring out the rest. Plug-And-Play, you know how it works!")
	
	saynn("A few chuckles rise from the crowd, though not all the bidders seem to be swayed by the casual tone. Some lean back, while others seem intrigued, their eyes flicking between {presenter.name} and the slave. You make sure to follow their reactions and note everything down.")
	
	for _i in range(3):
		_auction.unlockRandomRelevantTraitEachBidder()

func getPassiveDesireGain() -> float:
	return -0.5
