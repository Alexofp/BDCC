extends DialogueFiller

func _init():
	priority = 10

func getFormIDs() -> Array:
	return [
		"GuardCaughtOffLimits",
		"GuardCaughtOffLimitsFight",
		]

func canBeUsed(_id:String, _args:Dictionary) -> bool:
	var guard = getChar(_args, "guard")
	var personality:Personality = guard.getPersonality()
	var meanness = personality.getStat(PersonalityStat.Mean)
	var subby = personality.getStat(PersonalityStat.Subby)
	
	if(meanness < 0.5):
		return false
	if(subby > 0.2):
		return false
	
	return true

func getText(_id:String, _args:Dictionary):
	if(_id == "GuardCaughtOffLimits"):
		return [
			"What’s a filthy "+getMeanWord()+" like you doing sneaking around here?",
			"Look what we have here – a sneaky little "+getMeanWord()+" thinking she can go wherever she wants.",
			"You think you’re clever, "+getMeanWord()+"? This area’s off-limits to sluts like you.",
			"Another day, another "+getMeanWord()+" trying to step out of line.",
			"Did you lose your way, you dumb "+getMeanWord()+"? This is no place for a little bitch like you.",
			"What’s a little "+getMeanWord()+" like you doing in a place like this? Trying to get some attention?",
			"I see we have a nosy little "+getMeanWord()+" here, trying to see what she’s not supposed to.",
			"Did you think I wouldn’t catch you, you useless piece of trash?",
			"How stupid can you be? This area is off-limits, and you’re too dumb to know that?",
			"You’ve got to be the dumbest inmate here. Trespassing? Really?",
		]
	if(_id == "GuardCaughtOffLimitsFight"):
		return [
			"You’re in deep trouble now, you "+getMeanWord()+". I’m going to make you regret this.",
			"I’ve got a special punishment lined up for "+getMeanWordMult()+" like you who can’t follow simple rules.",
			"You should have crawled back to your cell while you could have.",
			"I’m sick of dealing with pests like you. Time to put you back in your place.",
			"You’re just a dumb prisoner who doesn’t know {inmate.his} place. I’ll teach you a lesson.",
			"You’re in for a world of pain, you stupid little "+getMeanWord()+".",
			"You’re not just lost, you’re a complete waste of space, and I’m here to correct that.",
		]

func getMeanWord():
	return RNG.pick([
		"slut",
		"cunt",
		"whore",
		"fucktoy",
		"bitch",
		"idiot",
	])

func getMeanWordMult():
	return RNG.pick([
		"sluts",
		"cunts",
		"whores",
		"fucktoys",
		"bitches",
		"idiots",
	])
