extends LustAction

func _init():
	id = "TeaseCock"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(_lustState.isDoingActivity(LustActivity.StrokingCock)):
		return false
	var pc:Player = _lustState.getCharacter()
	if(!pc.hasBodypart(BodypartSlot.Penis) || !pc.isBodypartCovered(BodypartSlot.Penis)):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Tease cock"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Tease your cock through the clothing"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(3)
	var pc:Player = _lustState.getCharacter()
	
	var cantCum = false
	
	var text = ""
	if(pc.isWearingChastityCage()):
		cantCum = true
		if(RNG.chance(50)):
			text += "You move your hand down to your crotch and give your {pc.cock} a little rub through the clothing. Your digits find the spot that feels the best and focus on it. Damn cage makes it impossible to stroke."
			text += "\n\n"
		else:
			text += "You get a feel for your covered up {pc.cock} and stroke your cage slightly through the clothing. Too bad that barely provides any stimulation. Still, after teasing yourself you find your member leaking some pre."
			text += "\n\n"
	else:
		if(RNG.chance(50)):
			text += "You move your hand down to your crotch and give your {pc.cock} a little rub through the clothing. Your digits find the sensitive tip and focus on it, making your clothes bulge out more in the process."
			text += "\n\n"
		else:
			text += "You get a feel for your covered up {pc.cock} and stroke it slightly through the clothing. The outline of your shaft becomes bigger as you tease yourself more, it’s already leaking some pre."
			text += "\n\n"
	
	if(RNG.chance(50) && _lustState.isInBattle()):
		text += "You offer the enemy a good view of your bulge as you rub yourself. You smirk, hoping that they like the show."
		text += "\n\n"
	
	if(RNG.chance(20) && pc.hasEffect(StatusEffect.CoveredInCum)):
		text += "So much cum on your body.. You catch some with your fingers and use it as lube, don’t wanna waste the good stuff."
		text += "\n\n"
	
	if(RNG.chance(30) && pc.getLust() >= 50):
		text += "Your cock is so drippy, you feel it twitching slightly as it leaks more and more pre, leaving dark spots on your clothing."
		text += "\n\n"
	
	if(RNG.chance(20) && pc.hasVagina()):
		text += "As you tease your cock, your slit is getting more needy and wet, you feel how cloth is digging into it as you rub your crotch. You can’t hide the moans."
		text += "\n\n"
	
	if(RNG.chance(50)):
		if(pc.isWearingChastityCage()):
			text += RNG.pick([
				"[say=pc]Huff.. Stupid cage..[/say]",
				"[say=pc]Fuck, I wanna stroke my cock so much..[/say]",
				"[say=pc]Anyone can see me doing this..[/say]",
				"[say=pc]Oh fuck..[/say]",
			])
		else:
			text += RNG.pick([
				"[say=pc]Fuck yeah..[/say]",
				"[say=pc]Fuck, stroking my cock feels so good..[/say]",
				"[say=pc]Anyone can see me doing this..[/say]",
				"[say=pc]Oh fuck..[/say]",
			])
		text += "\n\n"
		if(_lustState.isInPublic() && !_lustState.isInBattle()):
			text += "You hope no one heard that.. You try to keep your mouth shut."
			text += "\n\n"

	return {
		text = text,
		lust = 1,
		cantCum = cantCum,
	}

func getLustTopics():
	return {
		InterestTopic.HasVaginaAndCock : 0.2,
		InterestTopic.BigCock : 1.0,
		InterestTopic.AverageCock : 1.0,
		InterestTopic.SmallCock : 1.0,
		InterestTopic.NoCock : 1.0,
		InterestTopic.HasCockOnly : 0.2,
		InterestTopic.FullyNaked : 0.4,
		InterestTopic.ExposedCock : 0.4,
		InterestTopic.ExposedPanties : 0.4,
		InterestTopic.BDSMRestraints : 0.2,
	}

func getPriority():
	return 4

func isTease():
	return true

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 1]]
	return []
