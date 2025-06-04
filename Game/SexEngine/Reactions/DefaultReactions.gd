extends SexReactionHandler

func _init():
	chanceByReaction = {
		SexReaction.AboutToPenetratePussy: 100.0,
		SexReaction.AboutToPenetrateAnal: 100.0,
	}

func getLines(_reaction:int, _role:int):
	match(_reaction):
		SexReaction.AboutToPenetratePussy:
			if(_role == ROLE_MAIN):
				if(!isAngry()):
					addLines([
						"Gonna fuck that slit.",
						"Hope you're ready to get fucked.",
						"Gonna fuck you nice and slow.",
						"Hope you're wet already.",
						"Let's have some fun.",
						"I wanna fuck your "+RNG.pick(["pussy", "slit", "pussy slit"])+".",
						"Are you ready for this?",
						"I can't wait to feel you around me.",
						"I'm going to make you mine.",
						"Just relax and let me take control.",
						"I want to feel you climax around me.",
						"I'm going to make you mine, body and soul.",
					])
				else:
					addLines([
						"Stupid slut, I'm gonna fuck you rough.",
						"Bitches like you need to be pounded rough.",
						"I know you love being fucked, whore.",
						"Gonna fuck you rough.",
						"I'm gonna fuck your "+RNG.pick(["pussy", "slit", "pussy slit"])+".",
						"You should have thought twice before crossing me.",
						"You're mine now. And I'm going to enjoy every second of it.",
						"My turn to have some fun.",
					])
			if(_role == ROLE_TARGET):
				#addLines([
				#	"I WILL BE PENETRATED!",
				#])
				pass
		SexReaction.AboutToPenetrateAnal:
			if(_role == ROLE_MAIN):
				if(!isAngry()):
					addLines([
						"Gonna fuck that "+RNG.pick(["ass", "butt"]),
						"Hope you're ready to get your "+RNG.pick(["butt", "ass"])+" fucked",
						"Hope you're excited to be buttfucked",
						"Let's have some fun",
						"I wanna fuck your "+RNG.pick(["ass", "butt"]),
						"Are you ready for this?",
						"I can't wait to feel you around me.",
						"I'm going to make you mine.",
						"Just relax and let me take control.",
						"I want to feel you climax around me.",
						"I'm going to make you mine, body and soul.",
					])
				else:
					addLines([
						"Stupid slut, I'm gonna fuck your ass rough",
						"Bitches like you need to be pounded rough",
						"I know you love being fucked, whore",
						"Gonna fuck you rough",
						"I'm gonna fuck your "+RNG.pick(["ass", "butt"]),
						"You should have thought twice before crossing me.",
						"You're mine now. And I'm going to enjoy every second of it.",
						"My turn to have some fun.",
					])
			if(_role == ROLE_TARGET):
				#addLines([
				#	"I WILL BE PENETRATED!",
				#])
				pass
