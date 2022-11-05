extends Reference
class_name SexVoice

var character: WeakRef

func setCharacter(newchar):
	character = weakref(newchar)
	
func getCharacter():
	if(character == null):
		return character
	return character.get_ref()
	

	
func getDomReaction(_reactionID, _sexEngine, _domInfo, _subInfo, _likesScore = 0.0):
	var possible = []
	
	match(_reactionID):
		SexReaction.AboutToDrawOnBody:
			possible.append_array([
				"Check this out",
				"Gonna leave you a memento",
				"Do you like bodywritings? Hope so~",
				"Now stay still",
			])
			if(_domInfo.isAngry()):
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
			possible.append_array([
				"Gonna fuck that slit",
				"Hope you're ready to get fucked",
				"Gonna fuck nice and slow",
				"Hope you're wet already",
			])
			if(_domInfo.isAngry()):
				possible.append_array([
					"Stupid slut, I'm gonna fuck you rough",
					"Bitches like you need to be pounded rough",
					"I know you love being fucked, whore",
					"Gonna fuck you rough",
				])
			
	if(possible.size() > 0):
		return RNG.pick(possible)

func getSubReaction(_reactionID, _sexEngine, _domInfo, _subInfo, _likesScore = 0.0):
	var possible = []
	
	match(_reactionID):
		SexReaction.AboutToDrawOnBody:
			if(_likesScore > 0):
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
			if(_likesScore > 0):
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
			if(_likesScore > 0):
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
	
