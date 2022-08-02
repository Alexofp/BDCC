extends LustAction

func _init():
	id = "CockStrokeMore"
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
	return "Stroke more"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Jerk yourself off"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	#_lustState.startActivity(LustActivity.StrokingCock)

	var pc:Player = _lustState.getCharacter()
	
	var text = ""
	if(RNG.chance(50)):
		text += "A muffled moan escapes from your lips as you eagerly slide your {pc.masc} fingers along the length of your {pc.cock}."
		text += "\n\n"
	else:
		text += "Feeling horny, you’re giving the tip of your {pc.cock} a rub before focusing on stroking yourself closer to your climax."
		text += "\n\n"
	
	if(RNG.chance(50) && _lustState.isInBattle()):
		text += "You offer the enemy a good view of your cock as you jerk off. You smirk, hoping that they like the show."
		text += "\n\n"
	
	if(RNG.chance(10) && pc.hasEffect(StatusEffect.CoveredInCum)):
		text += "So much cum on your body.. You catch some with your fingers and use it as lube, don’t wanna waste the good stuff."
		text += "\n\n"
	
	if(RNG.chance(50) && pc.getLust() >= 50):
		text += "You feel that you’re not that far, your cock is so throbbing and twitching a lot, each time you stroke your shaft a drop of precum appears at the tip and slides down your fingers."
		text += "\n\n"
	
	if(RNG.chance(20) && pc.hasVagina()):
		text += "As you tease your cock, your slit is getting more needy and wet, you feel it dripping juices as you focus on your other set of bits. You can’t hide the moans."
		text += "\n\n"

	return {
		text = text,
		lust = 5,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.2,
		InterestTopic.MasculineBody : 0.2,
		InterestTopic.AndroBody : 0.2,
		InterestTopic.HasVaginaAndCock : 0.2,
		InterestTopic.BigCock : 1.0,
		InterestTopic.AverageCock : 1.0,
		InterestTopic.SmallCock : 1.0,
		InterestTopic.HasCockOnly : 0.2,
		InterestTopic.CoveredInCum : 0.1,
		InterestTopic.CoveredInLotsOfCum : 0.1,
		InterestTopic.FullyNaked : 0.2,
		InterestTopic.ExposedCock : 0.6,
		InterestTopic.ExposedPanties : 0.1,
		InterestTopic.BDSMRestraints : 0.3,
		InterestTopic.Pregnant: 0.4,
	}

func getPriority():
	return 5

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 2]]
	return []
