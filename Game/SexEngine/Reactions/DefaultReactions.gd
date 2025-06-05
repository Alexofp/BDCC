extends SexReactionHandler

func _init():
	handles = {
		SexReaction.AboutToPenetratePussy: {REACT_CHANCE: 100},
		SexReaction.AboutToPenetrateAnal: {REACT_CHANCE: 100},
		SexReaction.DomBreastfeedPraise: {REACT_CHANCE: 100},
	}

func getLines(_reaction:int, _role:int, _args:Array):
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
				if(isAngry()):
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

		SexReaction.AboutToPenetrateAnal:
			if(_role == ROLE_MAIN):
				if(!isAngry()):
					addLines([
						"Gonna fuck that "+RNG.pick(["ass", "butt"])+".",
						"Hope you're ready to get your "+RNG.pick(["butt", "ass"])+" fucked.",
						"Hope you're excited to be buttfucked.",
						"Let's have some fun.",
						"I wanna fuck your "+RNG.pick(["ass", "butt"])+".",
						"Are you ready for this?",
						"I can't wait to feel you around me.",
						"I'm going to make you mine.",
						"Just relax and let me take control.",
						"I want to feel you climax around me.",
						"I'm going to make you mine, body and soul.",
					])
				if(isAngry()):
					addLines([
						"Stupid slut, I'm gonna fuck your ass rough.",
						"Bitches like you need to be pounded rough.",
						"I know you love being fucked, whore.",
						"Gonna fuck you rough.",
						"I'm gonna fuck your "+RNG.pick(["ass", "butt"])+".",
						"You should have thought twice before crossing me.",
						"You're mine now. And I'm going to enjoy every second of it.",
						"My turn to have some fun.",
					])

		SexReaction.DomBreastfeedPraise:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					addLines([
						"Good slut.",
						"Good whore. Keep at it.",
						"You're doing good, little slut.",
						"You're less pathetic than I thought, whore.",
					])
				if(isAngry() && getChar().canBeMilked() && getChar().hasBigBreasts()):
					addLines([
						"Good.. Suck on those big milky tits..",
						"Good whore.. You like my huge udders, don't you?",
					])
				if(isAngry() && getChar().canBeMilked() && getChar().hasSmallBreasts()):
					addLines([
						"Good whore. Sucking on my small tits so eagerly.",
						"Good bitch. Keep suckling on my flat chest.",
					])
				if(!isAngry()):
					addLines([
						"Good.. keep at it, cutie..",
						"You're doing great, sweetheart.",
						"Good {sub.girl}..",
						"You're so cute.. keep going..",
						"Show me how you can suckle..",
						"Very nice.. So nice..",
						"Ah.. you're doing great..",
						"Such a cutie.. I'm proud..",
					])
				if(!isAngry() && getChar().canBeMilked() && getChar().hasBigBreasts()):
					addLines([
						"Suckle on my big breasts.. Yeah, like that..",
						"My breasts are heavy with milk.. Keep going.. You're doing great..",
						"You're making me proud.. Suckling on my giant breasts like that..",
						"You like the milk? Keep going.. There is plenty in my big breasts..",
					])
				if(!isAngry() && getChar().canBeMilked() && getChar().hasSmallBreasts()):
					addLines([
						"I don't have much milk.. But you're doing great..",
						"Wow.. Keep sucking on my small tits..",
					])

