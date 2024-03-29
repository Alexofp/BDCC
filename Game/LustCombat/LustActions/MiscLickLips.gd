extends LustAction

func _init():
	id = "MiscLickLips"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	var pc: Player = _lustState.getCharacter()
	if(pc.isGagged()):
		return false
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Lick lips"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Show off your tongue and mouth"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(3)
	var pc:Player = _lustState.getCharacter()
	
	var text = ""
	if(RNG.chance(50)):
		text += "You part your lips and let your tongue peek out. You drag it full circle around your mouth and then smooch the air."
		text += "\n\n"
	else:
		text += "You teasingly bite your lower lip and shift your gaze to the side, putting on a cute lewd expression."
		text += "\n\n"
	
	if(RNG.chance(70) && pc.hasEffect(StatusEffect.HasCumInsideMouth)):
		text += "Some cum is dripping down from your lip. It’s quite obvious to anyone who sees you that you did oral sex not that long ago."
		text += "\n\n"
	
	if(RNG.chance(50) && pc.hasEffect(StatusEffect.CoveredInCum)):
		text += "Your face is covered with someone’s fluids, you’re looking like quite a wet mess right now. When you stick out your tongue, you get a little taste of it."
		text += "\n\n"
	
	if(RNG.chance(50) && pc.isBlindfolded()):
		text += "The fact that you’re blindfolded only makes your actions look more hot."
		text += "\n\n"

	if(_lustState.isInBattle() && pc.hasPerk(Perk.NakedStunningLips) && RNG.chance(10 + sqrt(pc.getStat(Stat.Sexiness)))):
		var enemy:BaseCharacter = _lustState.getEnemyCharacter()
		if(enemy != null && enemy.getLustLevel() >= 0.3):
			enemy.addEffect(StatusEffect.Stunned, [1])
			text += "[b]Enemy is stunned by your lips![/b]"
			text += "\n\n"

	return {
		text = text,
		lust = 1,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.1,
		InterestTopic.MasculineBody : 0.1,
		InterestTopic.AndroBody : 0.1,
		InterestTopic.ThickBody : 0.2,
		InterestTopic.SlimBody : 0.2,
		InterestTopic.AverageMassBody : 0.2,
		InterestTopic.StuffedThroat : 1.0,
		InterestTopic.CoveredInCum : 0.8,
		InterestTopic.CoveredInLotsOfCum : 0.6,
		InterestTopic.FullyNaked : 0.5,
		InterestTopic.ExposedPanties : 0.2,
		InterestTopic.ExposedBra : 0.2,
		InterestTopic.TallyMarks : 0.5,
		InterestTopic.Bodywritings : 0.5,
		InterestTopic.Gags : 0.5,
		InterestTopic.Blindfolds : 0.8,
		InterestTopic.BDSMRestraints : 0.3,
	}

func getPriority():
	return 4

func isTease():
	return true

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 1]]
	return []
