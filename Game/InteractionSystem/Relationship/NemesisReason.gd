extends Object
class_name NemesisReason

const Generic = 0
const Fight = 1
const Impregnation = 2
const Scammed = 3
const EnslavementAttmept = 4
const AwfulSex = 5
const PunishedSex = 6
const PunishedStocks = 7
const PunishedSlutwall = 8
const EscapedSlavery = 9
const ForcedUnconscious = 10
const Wounded = 11

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
	elif(_reason == PunishedSex):
		return RNG.pick([
			"You thought you could fuck me and get away with it?",
			"Thinking that I'm a subby bitch that can be fucked was your biggest mistake.",
			"You thought that I'm some dirty slut? You're wrong.",
		])
	elif(_reason == PunishedStocks):
		return RNG.pick([
			"You thought you could lock me into the stocks and get away with it?",
			"You're dumb if you think that I would forget how you locked me up in those stocks.",
			"I still remember when you locked me into stocks. That was your last mistake.",
		])
	elif(_reason == PunishedSlutwall):
		return RNG.pick([
			"You thought you could lock me up like some kind of whore in that wall and get away with it?",
			"You're dumb if you think that I would forget how you locked me up in the slutwall.",
			"I still remember when you locked me into the slutwall. That was your last mistake.",
		])
	elif(_reason == EscapedSlavery):
		return RNG.pick([
			"You thought you could keep me as your slave forever? You're so dumb.",
			"I'm not your slave, your hear me? I will make you remember.",
			"I will never be your slave ever again. You fucked up hard.",
		])
	elif(_reason == ForcedUnconscious):
		return RNG.pick([
			"You thought you could abuse me and get away with it?",
			"You thought I wouldn't be able to remember it if you'd made me black out? I remember.",
			"You abused me. And I didn't forgive you for that.",
		])
	elif(_reason == Wounded):
		return RNG.pick([
			"You thought you could abuse me and get away with it?",
			"You thought that breaking my ribs would make me scared of you? It only made me angrier.",
			"You abused me. And I didn't forgive you for that.",
		])
	
	#generic
	return RNG.pick([
		"You are such a loser.",
		"I hate you. Really.",
		"I'm gonna make you regret messing with me.",
		"You're gonna pay.",
	])
