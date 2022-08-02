extends LustAction

func _init():
	id = "CockCupBalls"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(!_lustState.isDoingActivity(LustActivity.StrokingCock)):
		return false
	var pc:Player = _lustState.getCharacter()
	if(!pc.hasBodypart(BodypartSlot.Penis) || pc.isBodypartCovered(BodypartSlot.Penis)):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Cup balls"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Give your testicles some love"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	#_lustState.startActivity(LustActivity.StrokingCock)

	var pc:Player = _lustState.getCharacter()
	
	var text = ""
	if(RNG.chance(50)):
		text += "Focusing on your pleasure, you give your balls a gentle squeeze while still masturbating with the other hand. You produce a muffled noise of pleasure and keep massaging your balls while your {pc.cock} leaks more of your precum."
		text += "\n\n"
	else:
		text += "Your {pc.cock} trickles with precum while you wrap your fingers around the balls and give them a squeeze."
		text += "\n\n"
	
	if(RNG.chance(50) && _lustState.isInBattle()):
		text += "You make sure to show off your balls and how you’re fondling them to the opponent."
		text += "\n\n"
		
	if(RNG.chance(10) && pc.hasEffect(StatusEffect.CoveredInCum)):
		text += "You’re so messy, the cum of your previous lovers trickles down your body and drips from the tip of your cock."
		text += "\n\n"
	
	if(RNG.chance(50) && pc.getLust() >= 50):
		text += "You feel that you’re not that far, your cock is so throbbing and twitching a lot, each time you squeeze your nuts a drop of precum appears at the tip and slides down your fingers."
		text += "\n\n"
	
	if(RNG.chance(20) && pc.hasVagina()):
		text += "As you tease your cock, your slit is getting more needy and wet, you feel it dripping juices as you focus on your other set of bits. You can’t hide the moans."
		text += "\n\n"

	return {
		text = text,
		lust = 2,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.2,
		InterestTopic.MasculineBody : 0.2,
		InterestTopic.AndroBody : 0.2,
		InterestTopic.NoVagina : 0.3,
		InterestTopic.HasVaginaAndCock : 0.3,
		InterestTopic.BigCock : 0.7,
		InterestTopic.AverageCock : 0.7,
		InterestTopic.SmallCock : 0.7,
		InterestTopic.HasCockOnly : 0.4,
		InterestTopic.StuffedPussy : 0.2,
		InterestTopic.CoveredInCum : 0.2,
		InterestTopic.CoveredInLotsOfCum : 0.1,
		InterestTopic.FullyNaked : 0.4,
		InterestTopic.ExposedPussy : 0.2,
		InterestTopic.ExposedCock : 0.4,
		InterestTopic.ExposedPanties : 0.2,
		InterestTopic.BDSMRestraints : 0.2,
		InterestTopic.Pregnant: 0.2,
	}

func getPriority():
	return 5

func skillNeeded():
	return 3

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 2]]
	return []
