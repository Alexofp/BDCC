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
	
	match(_reactionID):
		SexReaction.OrderToUndress:
			if(_domInfo.isAngry() || _domInfo.personalityScore({PersonalityStat.Mean:1.0})>0.7):
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
			if(_domInfo.isAngry() || _domInfo.personalityScore({PersonalityStat.Mean:1.0})>0.7):
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
			if(_domInfo.personalityScore({PersonalityStat.Mean:1.0})>0.5):
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
					"Let me see what's under.",
					"You brought this upon yourself",
				])

		SexReaction.BeatingUp:
			if(_domInfo.personalityScore({PersonalityStat.Mean:1.0})>0.5):
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
			if(!_domInfo.isAngry()):
				possible.append_array([
					"Check this out",
					"Gonna leave you a memento",
					"Do you like bodywritings? Hope so~",
					"Now stay still",
				])
			else:
				possible.append_array([
					"Don't fucking move, bitch",
					"Don't you dare move",
					"Stay still, slut",
					"About to brand you",
				])
		SexReaction.AfterDrawingOnBody:
			possible.append_array([
				"There we go",
				"A present from me",
				"Now everyone can see who you are",
				"Enjoy",
			])
		SexReaction.AboutToPenetratePussy:
			if(!_domInfo.isAngry()):
				possible.append_array([
					"Gonna fuck that slit",
					"Hope you're ready to get fucked",
					"Gonna fuck nice and slow",
					"Hope you're wet already",
				])
			else:
				possible.append_array([
					"Stupid slut, I'm gonna fuck you rough",
					"Bitches like you need to be pounded rough",
					"I know you love being fucked, whore",
					"Gonna fuck you rough",
				])
			
	if(possible.size() > 0):
		return RNG.pick(possible)

func getSubReaction(_reactionID, _sexEngine, _domInfo, _subInfo):
	var possible = []
	
	match(_reactionID):
		SexReaction.AboutToDrawOnBody:
			if(!_subInfo.isResisting()):
				possible.append_array([
					"Oh, what are you gonna do?",
					"I like this already",
					"Gonna draw on me? Kinky",
					"Yes, I like art!",
				])
			else:
				possible.append_array([
					"What? No!",
					"Put it away!",
					"Why did you pull that out?",
					"Don't do it",
					"Hey! No!",
				])
		SexReaction.AfterDrawingOnBody:
			if(!_subInfo.isResisting()):
				possible.append_array([
					"Oh wow, I like it",
					"Yes~. I love when people draw on me",
					"That is so degrading~",
					"That is so humiliating~",
				])
			else:
				possible.append_array([
					"Don't you dare.. fuck",
					"That's humiliating..",
					"That's degrading..",
					"I didn't want that",
					"Why did you do that?",
				])
		SexReaction.AboutToPenetratePussy:
			if(!_subInfo.isResisting()):
				possible.append_array([
					"Can't wait for you to fuck me~",
					"Please fuck me already~",
					"Oh yeah, now we're talking",
					"Gonna fuck me? Good~",
				])
			else:
				possible.append_array([
					"Hey, no!",
					"What are you doing, no!",
					"I don't want this, please!",
					"Hey! Don't touch my pussy",
					"Stop, please, I don't like this",
				])
				
		SexReaction.WarnAboutToCum:
			possible.append_array([
				"I'm very close..",
				"I'm gonna cum soon..",
				"About to cum..",
				"I really wanna cum..",
			])
			if(!_subInfo.personalityScore({PersonalityStat.Subby: 1.0})>0.2):
				possible.append_array([
					"Please let me cum, I really want to..",
					"I wanna cum so much.. Please!",
					"I'm about to cum, I need it!",
				])
			
	if(possible.size() > 0):
		return RNG.pick(possible)
		
func domReactToSubBodypart(_bodypart, _sexEngine, _domInfo, _subInfo):
	if(_bodypart is BodypartVagina):
		return "That's a nice pussy"
	if(_bodypart is BodypartPenis):
		return "Nice cock"

func domReactionWhenUndressing(_bodypart, _sexEngine, _domInfo, _subInfo):
	if(_bodypart is BodypartPenis):
		return "Like it?"
	
