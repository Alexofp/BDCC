extends Reference
class_name SexVoice

var character: WeakRef

func setCharacter(newchar):
	character = weakref(newchar)
	
func getCharacter():
	if(character == null):
		return character
	return character.get_ref()
	

	
func getDomReaction(_reactionID, _sexEngine, _domInfo, _subInfo):
	var possible = []
	var domIsAngry = _domInfo.isAngry()
	var domIsMean = _domInfo.personalityScore({PersonalityStat.Mean:1.0})>0.4
	var domIsVeryMean = _domInfo.personalityScore({PersonalityStat.Mean:1.0})>0.7
	
	match(_reactionID):
		SexReaction.OrderToUndress:
			if(domIsAngry || domIsVeryMean):
				possible.append_array([
					"Your <ITEM>, take that shit off.",
					"Take your <ITEM> off, "+RNG.pick(["slut", "whore", "fucktoy", "bitch"])+".",
					"Don't make me break you, take your stupid <ITEM> off.",
				])
			else:
				possible.append_array([
					"You don't need your <ITEM>. Undress for me.",
					"I think you don't need your <ITEM>. Be a good toy and undress.",
					"Take your <ITEM> off for me.",
				])
		SexReaction.ForceUndress:
			if(domIsAngry || domIsVeryMean):
				possible.append_array([
					"Don't you dare resist, you little "+RNG.pick(["slut", "whore", "fucktoy", "bitch"]),
					"You don't need that shit.",
					"Don't whine about it, no one will save you.",
				])
			else:
				possible.append_array([
					"Let me take that off.",
					"You don't need that with me.",
					"That's only getting in the way.",
					"Let me see what's under.",
				])
		
		SexReaction.AboutToBeatUp:
			if(domIsMean):
				possible.append_array([
					"Bitch, you fucking asked for it.",
					"You're not gonna get away unscarred, you stupid "+RNG.pick(["slut", "whore", "fucktoy", "bitch"]),
					"Stop fucking resisting, you "+RNG.pick(["slut", "whore", "stupid fucktoy", "bitch"]),
					"You brought this upon yourself, you "+RNG.pick(["slut", "whore", "fucktoy", "bitch"]),
				])
			else:
				possible.append_array([
					"I'm getting really mad with you.",
					"I'm usually not that mean. But you are fucking annoying.",
					"You made me do this.",
					"You brought this upon yourself",
				])

		SexReaction.BeatingUp:
			if(domIsMean):
				possible.append_array([
					"Stupid. Fucking. Bitch.",
					"You fucking whore",
					"I'm gonna break you if I have to.",
					"It's your fault!",
					"Stupid painslut.",
				])
			else:
				possible.append_array([
					"Stop resisting already!",
					"Stop making me mad!",
					"Quit struggling on me.",
					"Just let it fucking happen.",
					"You are making this worse for yourself.",
				])
		
		SexReaction.AboutToDrawOnBody:
			if(!domIsAngry && !domIsMean):
				possible.append_array([
					"Check this out",
					"Gonna leave you a memento",
					"Hope you are into bodywritings",
					"Stay still while I do this",
					"I wanna draw something on you",
				])
			else:
				possible.append_array([
					"Don't fucking move, bitch",
					"Don't you dare move",
					"Stay still, slut",
					"About to brand you",
					"Stay still while I brand you, whore",
					"Gonna brand you like the little prison's whore that you are.",
				])
		SexReaction.AfterDrawingOnBody:
			possible.append_array([
				"There we go",
				"A present from me",
				"Now everyone can see who you are",
				"Enjoy that",
				"Don't hide this one",
				"Want another one?",
				"How many will fit I wonder",
				"This is real art",
			])
		SexReaction.AboutToPenetratePussy:
			if(!_domInfo.isAngry()):
				possible.append_array([
					"Gonna fuck that slit",
					"Hope you're ready to get fucked",
					"Gonna fuck you nice and slow",
					"Hope you're wet already",
					"Let's have some fun",
					"I wanna fuck your "+RNG.pick(["pussy", "slit", "pussy slit"]),
				])
			else:
				possible.append_array([
					"Stupid slut, I'm gonna fuck you rough",
					"Bitches like you need to be pounded rough",
					"I know you love being fucked, whore",
					"Gonna fuck you rough",
					"I'm gonna fuck your "+RNG.pick(["pussy", "slit", "pussy slit"]),
				])
		SexReaction.AboutToPenetrateAnal:
			if(!_domInfo.isAngry()):
				possible.append_array([
					"Gonna fuck that "+RNG.pick(["ass", "butt"]),
					"Hope you're ready to get your "+RNG.pick(["butt", "ass"])+" fucked",
					"Hope you're excited to be buttfucked",
					"Let's have some fun",
					"I wanna fuck your "+RNG.pick(["ass", "butt"]),
				])
			else:
				possible.append_array([
					"Stupid slut, I'm gonna fuck your ass rough",
					"Bitches like you need to be pounded rough",
					"I know you love being fucked, whore",
					"Gonna fuck you rough",
					"I'm gonna fuck your "+RNG.pick(["ass", "butt"]),
				])
			
	if(possible.size() > 0):
		return RNG.pick(possible)

func getSubReaction(_reactionID, _sexEngine, _domInfo, _subInfo):
	var _sub = _subInfo.getChar()
	var _dom = _domInfo.getChar()
	var subInHeat = _sub.isInHeat()
	var subIsMean = _subInfo.personalityScore({PersonalityStat.Mean: 1.0}) > 0.4
	var subIsSubby = _subInfo.personalityScore({PersonalityStat.Subby: 1.0}) > 0.2
	var subIsResisting = _subInfo.isResisting()
	var subIsScared = _subInfo.isScared()
	var subIsVisiblyPregnant = _sub.isVisiblyPregnant()
	var subCanGetPregnantVaginal = _sub.hasVagina() && _sub.getFertility()>0.1 && !subIsVisiblyPregnant
	var domWearingACondom = (_dom.getWornCondom() != null)
	var possible = []
	
	match(_reactionID):
		SexReaction.AboutToDrawOnBody:
			if(subIsResisting):
				possible.append_array([
					"What? No!",
					"Put it away!",
					"Why did you pull that out?",
					"Don't do it",
					"Hey! No!",
				])
		SexReaction.AfterDrawingOnBody:
			if(subIsResisting):
				possible.append_array([
					"Don't you dare.. fuck",
					"No! Fuck..",
					"I didn't ask for that..",
					"Why did you do that?!",
					"That's too humiliating..",
				])
				
		SexReaction.WarnAboutToCum:
			possible.append_array([
				"I'm very close..",
				"I'm gonna cum soon..",
				"About to cum..",
				"I really wanna cum..",
			])
			if(subIsSubby):
				possible.append_array([
					"Please let me cum, I really want to..",
					"I wanna cum so much.. Please!",
					"I'm about to cum, I need it!",
				])
		SexReaction.Teasing:
			if(subIsResisting):
				possible.append_array([
					"You just gonna stop now?",
					"Gonna give up now?",
					"You saw some resistance and decided to stop?",
					"Some resistance is enough to stop you?",
				])
				if(subIsMean):
					possible.append_array([
						"If you dare to touch me, I swear!",
						"Don't try to touch me, you bitch.",
						"See this? It's not yours!",
						"Fap to this and get the fuck out.",
						"Are you fucking done already?",
					])
			else:
				possible.append_array([
					"Do you like this?",
					"Let's do something..",
				])
				if(subInHeat):
					possible.append_array([
						"Can you feel that I'm in heat?..",
						"Damn heat.. Wanna do something about it?..",
						"I'm in heat..",
						"Heat makes me feel so needy..",
						"Damn heat..",
						"Don't make me beg, I can't endure this heat..",
						"Huff.. stupid heat..",
						"You just gonna watch me while I'm in heat?.."
					])
				if(subIsMean):
					possible.append_array([
						"We're just gonna stare at each other?",
						"Do something already!",
						"C'mon, I don't have all day!",
						"You're such a bitch.",
						"Don't be so fucking rude and do something.",
						"I'm waiting!",
						"Look at you. Pathetic!",
					])
				if(subIsSubby):
					possible.append_array([
						"What are you gonna do to me..",
						"What should I do..",
						"We can do something..",
						"Do you like this?..",
						"You can do more than just stare..",
						"You gonna..?",
						"Do I look good..?",
					])
		SexReaction.Apologizing:
			if(subIsResisting):
				possible.append_array([
					"Quit it and I won't resist!",
					"Stop it! I don't want this! Please!",
				])
			elif(subIsScared):
				possible.append_array([
					"I'm not resisting! Please!",
					"I will do anything! Please stop..",
					"I'm sorry! I'm very sorry!",
					"I'm scared.. Please stop..",
					"Enough!.. Please..",
				])
			else:
				possible.append_array([
					"I'm sorry, okay?",
					"Calm down, I'm sorry.",
					"You don't have to do this. I'm sorry.",
					"You don't have to do this..",
					"I'm sorry for what I did.",
				])
				if(subIsMean):
					possible.append_array([
						"I'm sorry. Calm down, bitch.",
						"Will you calm the fuck down already?",
						"Relax for fuck's sake. I'm sorry.",
						"I said I'm sorry!",
					])
				if(subIsSubby):
					possible.append_array([
						"I'm very-very sorry..",
						"I'm extremely sorry..",
						"It's my fault, I'm sorry..",
						"What I did was wrong, sorry..",
					])
		SexReaction.ResistingRestraints:
			possible.append_array([
				"Nghh..",
				"Uhh..",
				"Ff-fh..",
				"Hh-h..",
				"Mgh-h..",
			])
		SexReaction.ActivelyResisting:
			if(subIsMean):
				possible.append_array([
					"Fuck off! I don't want you!",
					"Let me go, you "+RNG.pick(["fucker", "bitch"])+"!",
					"Let me fucking go already!",
					"Go fuck yourself!",
					"I will break you fingers!",
					"I will mess you up if you don't stop!",
				])
			else:
				possible.append_array([
					"Don't touch me!",
					"Get away from me!",
					"I don't wanna do this!",
					"Don't make me do this!",
					"I don't want any of this!",
					"Stop it already, I wanna leave!",
				])
		SexReaction.Resisting:
			if(subIsMean):
				possible.append_array([
					"Fuck off with this shit!",
					"FUCK OFF!",
					"Go fuck yourself!",
					"I will break you if you do this!",
					"You stupid "+RNG.pick(["fucker", "bitch"])+", what are you doing?!",
					"I don't want this, fuck off!",
					"Stop it, go screw yourself!",
				])
			else:
				possible.append_array([
					"Don't do this, please!",
					"I don't want this!",
					"I don't like this!",
					"Don't touch me!",
					"Stop it, please!",
					"This is not funny, stop it!",
					"I don't wanna do this!",
				])
		SexReaction.BeggingToPullOutVaginal:
			if(subCanGetPregnantVaginal):
				if(!domWearingACondom):
					if(subInHeat):
						possible.append_array([
							"I'm in heat, I can get pregnant! Please pull out!",
							"I'm in heat, don't cum inside. Please!",
							"Not inside.. not when I'm in heat..",
							"Please pull out, I don't wanna get pregnant.. I'm in heat..",
							"My body really wants it.. but please.. don't breed me..",
						])
					possible.append_array([
						"I don't wanna get pregnant, please pull out..",
						"Don't cum inside or I might get pregnant..",
						"Please pull out, I really don't wanna become pregnant..",
						"If you cum inside you might make me pregnant.. please don't..",
						"Remember not to cum inside, please.. Don't make me pregnant.",
						"Please pull out.. I might get pregnant if I don't..",
					])
				else:
					if(subInHeat):
						possible.append_array([
							"The condom might break.. you should play it safe and pull out.. I'm in heat..",
							"Please don't test the condom and just pull out.. I'm in heat and don't wanna get pregnant..",
							"Please pull out.. The condom might break.. And I'm in heat..",
						])
					possible.append_array([
						"I don't wanna get pregnant if the condom breaks, please pull out..",
						"Don't cum inside.. the condom might break.. I don't wanna get pregnant..",
						"Remember not to cum inside, please.. If the condom breaks I will become pregnant..",
						"Please pull out.. I might get pregnant if the condom breaks..",
					])
			else:
				if(!domWearingACondom):
					possible.append_array([
						"Please pull out..",
						"Don't cum inside, please..",
						"Please don't cum inside my pussy..",
					])
				else:
					possible.append_array([
						"The condom might break.. Please pull out..",
						"Don't cum inside, please.. What if the condom breaks..",
						"The condom might break.. Please don't cum inside my pussy..",
					])
		SexReaction.BeggingToPullOutAnal:
			if(!domWearingACondom):
				possible.append_array([
					"Please pull out..",
					"Don't cum inside, please..",
					"Please don't cum inside my "+RNG.pick(["ass", "butt"])+"..",
				])
			else:
				possible.append_array([
					"The condom might break.. Please pull out..",
					"Don't cum inside, please.. What if the condom breaks..",
					"The condom might break.. Please don't cum inside my "+RNG.pick(["ass", "butt"])+"..",
				])
		
	if(possible.size() > 0):
		return RNG.pick(possible)
		
func domReactToSubBodypart(_bodypart, _sexEngine, _domInfo, _subInfo):
	var _dom = _domInfo.getChar()
	
	var possible = []
	if(_bodypart is BodypartVagina):
		possible.append_array([
			"That's a nice pussy",
			"Mmm..",
		])
	if(_bodypart is BodypartPenis):
		return "Nice cock"
	
	if(possible.size() > 0):
		return RNG.pick(possible)

func domReactionWhenUndressing(_bodypart, _sexEngine, _domInfo, _subInfo):
	var possible = []
	
	var domIsAngry = _domInfo.isAngry()
	var domIsMean = _domInfo.personalityScore({PersonalityStat.Mean:1.0})>0.4
	#var domIsVeryMean = _domInfo.personalityScore({PersonalityStat.Mean:1.0})>0.7
	
	if(_bodypart is BodypartPenis && RNG.chance(30)):
		if(domIsAngry || domIsMean):
			possible.append_array([
				"See my dick? Wanna worship it like a good slut?",
				"I'm gonna make you fall in love with my "+RNG.pick(["dick", "cock"])+", bitch",
				"Drooling already, slut?",
				"There we go, here is my cock",
			])
		else:
			possible.append_array([
				"Like what you see? That's my "+RNG.pick(["dick", "cock"]),
				"Like my "+RNG.pick(["dick", "cock"])+"?",
				"There we go",
				"Check my "+RNG.pick(["dick", "cock"])+" out",
			])
	
	if(possible.size() > 0):
		return RNG.pick(possible)
