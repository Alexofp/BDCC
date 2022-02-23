extends Character

func _init():
	id = "risha"
	
func _getName():
	return "Risha"

func getGender():
	return Character.Gender.Androgynous
	
func getPronounGender():
	return Character.Gender.Female
	
func getSmallDescription() -> String:
	return "A very tall lynx with cyan fur. Usually wears her bulky guard armor. Her feline face features a huge amount of piercings"

func getSpecies():
	return ["feline"]

func _getAttacks():
	return ["aitaunthumiliate", "stunbatonStrongAttack", "biteattack", "simplekickattack", "shoveattack", "trygetupattack"]

func reactTease():
	return 0.4

func reactGrope():
	if(lust < 50):
		return 0
	
	return 0.6

func reactSelfHumiliation(_topic):
	if(remembersTopic(_topic)):
		return 0.3
	
	if(_topic == Attack.LustTopic.selfUseMe):
		doRememberTopic(_topic)
		
		if(getLust() >= 20):
			return 1.2
		return 0.6
	
	return 0

func reactHumiliation(_topic):
	if(getLust() >= 50):
		return 3
	
	if(remembersTopic(_topic)):
		return 0
	
	if(_topic == Attack.LustTopic.humYouSlut):
		doRememberTopic(_topic)
		return -0.4
	
	return 0

func getFightIntro(_battleName):
	return getName() + " eyes you out and licks her lips.\n\n"+formatSay("You're an easy prey for me. Why don't you just undress and we can have some fun instead~")+"\n\nRisha then gets into a combat stance and gestures you to come closer. Her heavy armor doesn't seem to inpact her mobility one bit, her hand holds the stun baton very tightly\n\nSeems the first move is yours"

func getFightState(_battleName):
	if(getPain() > getLust()):
		var mypain = getPain()
		
		if(mypain >= 70):
			return getName() + " constantly grunts from pain. "+heShe()+" can barely stand at this point, all "+hisHer()+" bruises are really wearing "+himHer()+" down.\n" + formatSay("GHh.. Fuck it really hurts")
		if(mypain >= 50):
			return getName() + " looks pretty beat up and "+hisHer()+" face shows it but "+heShe()+" is still standing strong.\n" + formatSay("I'm not losing to some inmate, you're done for!")
		if(mypain >= 25):
			return getName() + " has a bruise there and there but "+heShe()+" clearly won't give up the fight any time soon.\n" + formatSay("Is that the best you got? Weak")
	else:
		var mylust = getLust()
		
		if(mylust >= 70):
			return getName() + " keeps moaning to "+himselfHerself()+" and can't hide the arousal anymore, "+heShe()+" blatantly gropes and rubs "+hisHer()+" body in front of you.\n" + formatSay("Fuck you're hot")
		if(mylust >= 50):
			return getName() + " breathes warmly, "+hisHer()+" blush starts to shine through, "+ heShe()+" is lusty and "+hisHer()+" eyes show it.\n" + formatSay("Stop it, you whore, I wanna fight you")
		if(mylust >= 25):
			return getName() + " looks alright but you notice some desire in "+hisHer()+" eyes.\n" + formatSay("What a slut you are")
		
	return getName() + " looks completely fine, no visible bruises or signs of lust."
