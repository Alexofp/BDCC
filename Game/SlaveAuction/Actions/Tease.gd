extends AuctionAction

func _init():
	id = "Tease"

func getActionType():
	return AuctionActionType.Ungrouped

func getName() -> String:
	return "Tease bidders"

func getButtonDesc() -> String:
	return "Tease the bidders and see their reactions.\n\nRepetable action. [b]Will[/b] reveal 1 random preference of each bidder that is always relevant to the slave."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	saynn(RNG.pick([
		"{presenter.You} {presenter.youVerb('step')} closer to the slave, {presenter.yourHis} fingers trailing lightly over the exposed skin, a teasing smirk spreading across {presenter.yourHis} lips.",
		"{presenter.You} {presenter.youVerb('walk')} around the slave, {presenter.yourHis} hands lingering just a little too long as {presenter.youHe} {presenter.youVerb('eye')} the bidders with a sultry glance.",
		"{presenter.You} {presenter.youVerb('bend')} down, {presenter.yourHis} breath tickling the slave’s ear. {presenter.YouHe} {presenter.youAre} whispering just loud enough for the crowd to hear.",
		"{presenter.You} {presenter.youVerb('run')} {presenter.yourHis} fingers up the slave’s body, pausing at key spots, sending a wave of tension through the air.",
		"{presenter.You} {presenter.youVerb('twirl')} playfully, {presenter.yourHis} hips swaying as {presenter.youHe} turn back to face the bidders with a mischievous grin.",
		"{presenter.You} {presenter.youVerb('run')} {presenter.yourHis} hand along the chain holding the slave, tugging it gently for effect as {presenter.youHe} {presenter.youVerb('make')} direct eye contact with the bidders.",
		"{presenter.You} {presenter.youVerb('lean')} against the slave, {presenter.yourHis} breath hot against the exposed skin, sending shivers through the captive's body.",
		"{presenter.You} {presenter.youVerb('tease')} the slave’s body and restraints, {presenter.yourHis} fingers playing with the chains while {presenter.youHe} {presenter.youVerb('eye')} the crowd with a light laugh.",
		"{presenter.You} {presenter.youVerb('step')} in front of the slave, blocking the view, and winking playfully at the bidders.",
		"{presenter.You} {presenter.youVerb('place')} a single finger on the slave’s lips before turning to the crowd, {presenter.yourHis} voice low and inviting.",
	]))
	
	sayPresenter(RNG.pick([
		"Come now, I see some of you are already intrigued. But let's be honest, I know exactly what you're craving. Care to share a little more with me? You wouldn't want to miss your chance, would you?",
		"Such a rare find, right? I can see some of you are already biting your lips. Don't be shy, tell me what really catches your eye here.. Is it the way this cutie trembles? Or maybe.. something else?",
		"Oh, this one’s sensitive.. Look at how {slave.heShe} reacts with just the slightest touch. But I bet you have something very specific in mind, don’t you? Come on, let me in on your little secret..",
		"Now, now.. I can feel the heat from here. What gets you going? Is it the body? The attitude? Or do you like them a little more.. resistant? Let me know, and maybe I can give you exactly what you want.",
		"Quite the specimen, isn’t {slave.he}? I wonder what catches your eye first.. the way {slave.heShe} stands, or something more? No rush, we’ll get to see everything soon enough.",
		"Looks like some of you are enjoying the view already. Hard not to, really.. Each one brings something a little different to the table, don’t they? You’ll know when the moment’s right.",
		"Such sensitivity.. Even the slightest touch makes {slave.himHer} react. Always fascinating to see what stirs interest, isn’t it? Everyone has their preferences..",
		"Every detail matters with a find like this. Some things stand out right away, don’t they? Others.. take a closer look to really appreciate. I’m sure you’ll know exactly what draws you in.",
		"Quite the atmosphere in the room tonight. I can see a few of you are already interested. It’s always fun to see who spots those little things that make all the difference.",
		"Chains, cuffs.. it’s all about presentation, isn’t it? Everyone sees something different when they look at a slave like this. I’m curious which details catch your attention first.",
		"Some of you seem intrigued already.. It’s always interesting to see what draws the eye first. Maybe it’s the posture, or something subtler. No need to rush, there’s plenty to appreciate.",
		"A lovely specimen, don’t you think? Some things stand out right away, but I think you’ll find there’s more to notice as we continue. Patience always rewards the observant.",
		"It’s always fascinating to see what catches your attention first. Everyone’s drawn to something different, after all. Take your time..",
	]))
	
	_auction.unlockRandomRelevantTraitEachBidder()

func getTraits() -> Dictionary:
	return {
	}

func getPassiveDesireGain() -> float:
	return 0.1

func canOnlyUseOnce() -> bool:
	return false
