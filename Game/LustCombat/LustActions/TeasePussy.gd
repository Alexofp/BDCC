extends LustAction

func _init():
	id = "TeasePussy"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(_lustState.isDoingActivity(LustActivity.SpreadingPussy)):
		return false
	var pc:Player = _lustState.getCharacter()
	if(!pc.hasBodypart(BodypartSlot.Vagina) || !pc.isBodypartCovered(BodypartSlot.Vagina)):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Tease pussy"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Give your kitty some love through the clothing"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(3)
	var pc:Player = _lustState.getCharacter()
	
	var text = ""
	if(RNG.chance(50)):
		text += "Your hand slides down to your covered up crotch and hovers there. You feel that behind all the cloth there are some needy pussy lips and a cute clit. Your fingers outline your slit and then gently rub the sensitive spot, causing you to let out a pleasurable moan."
		text += "\n\n"
	else:
		text += "You sneak your hand down to your slit. You trace around the pussy and then find the little clit with your finger. You begin rubbing it through all the cloth, teasing yourself and making little pleasure noises."
		text += "\n\n"
		
	if(RNG.chance(30) && _lustState.isInBattle()):
		text += "You smirk at the enemy as you continue to tease your slit. You’re making it clear that if they want this they gotta work for it."
		text += "\n\n"
		
	if(RNG.chance(50) && pc.hasEffect(StatusEffect.HasCumInsideVagina)):
		text += "As you continue to rub your slit through the clothing, some fluids leak out. Fluids from your previous lovers, they leave dark spots on the cloth and slide down your {pc.masc} thighs. You’re such a mess~."
		text += "\n\n"
		
	if(RNG.chance(20) && pc.hasEffect(StatusEffect.CoveredInCum)):
		text += "So much cum on your body.. You catch some with your fingers and rub it into your crotch, can’t let so much good stuff go to waste."
		text += "\n\n"
	
	if(RNG.chance(30) && pc.getLust() >= 50):
		text += "Your pussy is so wet and drippy, you feel like you can cum just by teasing yourself.. You push on your clothing and make it dig deeper between the sensitive folds."
		text += "\n\n"
		
	if(RNG.chance(20) && pc.hasPenis()):
		text += "As you tease your cunt, your {pc.cock} is only getting harder and leaking more precum, creating another damp spot on the cloth."
		text += "\n\n"
	
	if(RNG.chance(50)):
		text += RNG.pick([
			"[say=pc]Yes, my pussy feels so good..[/say]",
			"[say=pc]Fuck, I wanna finger myself so hard..[/say]",
			"[say=pc]Anyone can see me rubbing my needy cunt..[/say]",
			"[say=pc]Oh fuck..[/say]",
		])
		text += "\n\n"
		
		if(_lustState.isInPublic() && !_lustState.isInBattle()):
			text += "You hope no one heard that.. You try to keep your mouth shut but it feels so good.."
			text += "\n\n"
		
	return {
		text = text,
		lust = 1,
	}

func getLustTopics():
	return {
		InterestTopic.HasVaginaOnly : 0.8,
		InterestTopic.HasVaginaAndCock : 0.8,
		InterestTopic.StuffedPussy : 0.7,
		InterestTopic.StuffedPussyOrAss : 0.4,
		InterestTopic.CoveredInCum : 0.4,
		InterestTopic.CoveredInLotsOfCum : 0.2,
		InterestTopic.FullyNaked : 0.3,
		InterestTopic.ExposedPussy : 0.6,
		InterestTopic.ExposedBreasts : 0.3,
		InterestTopic.ExposedCock : 0.3,
		InterestTopic.ExposedPanties : 0.7,
		InterestTopic.ExposedBra : 0.5,
		InterestTopic.LoosePussy : 0.3,
		InterestTopic.TightPussy : 0.3,
		InterestTopic.VaginalPlugs : 0.7,
	}

func getPriority():
	return 4

func isTease():
	return true

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 1]]
	return []
