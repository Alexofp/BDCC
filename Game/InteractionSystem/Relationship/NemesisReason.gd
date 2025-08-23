extends Object
class_name NemesisReason

const Generic = 0
const Fight = 1
const Impregnation = 2
const Scammed = 3
const EnslavementAttmept = 4
const AwfulSex = 5

static func getAmbushLine(_reason:int, _char:BaseCharacter) -> String:
	if(_reason == Fight):
		return RNG.pick([
			"I'm here for a rematch.",
			"You thought you could beat me up and get away with it?",
			"You thought I would just give up?",
			"I came for round two, asshole.",
			"You think you're tough? I doubt it.",
			"Last time was luck. This time, you're screwed.",
		])
	elif(_reason == Impregnation):
		return RNG.pick([
			"You knocked me up, fucker! You thought you could get away with it?",
			"I didn't ask to be bred. Bitch.",
			"You really thought you could breed me and get away with it?",
			"I didn't forgive you for breeding me.",
			"Hope you’re ready to pay for what you did with me.",
			"I'm not into this whole breeding thing. But you don't care, do you? I will make you.",
		])
	elif(_reason == Scammed):
		return RNG.pick([
			"I didn't forgive you for scamming me.",
			"You really thought you could scam me and get away with it?",
			"I'm gonna make you regret scamming me.",
			"You stole from me. You're gonna pay.",
		])
	elif(_reason == EnslavementAttmept):
		return RNG.pick([
			"You really thought you could make me your bitch? Nuh-uh.",
			"You really thought that I would just wait until you come make me your bitch? Fuck you.",
			"I was never gonna be your slave, get real.",
		])
	elif(_reason == AwfulSex):
		return RNG.pick([
			"You thought you could abuse me and get away with it?",
			"I still remember that sex that we had. It was fucking awful.",
			"You abused me. And I didn't forgive you for that.",
		])
	
	#generic
	return RNG.pick([
		"You are such a loser.",
		"I hate you. Really.",
		"I'm gonna make you regret messing with me.",
		"You're gonna pay.",
	])
