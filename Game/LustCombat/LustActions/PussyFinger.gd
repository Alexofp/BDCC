extends LustAction

func _init():
	id = "PussyFinger"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(!_lustState.isDoingActivity(LustActivity.SpreadingPussy)):
		return false
	var pc:Player = _lustState.getCharacter()
	if(!pc.hasBodypart(BodypartSlot.Vagina) || pc.isBodypartCovered(BodypartSlot.Vagina)):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Finger pussy"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Pleasure yourself"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	#_lustState.startActivity(LustActivity.StrokingCock)

	var pc:Player = _lustState.getCharacter()
	
	var text = ""
	if(RNG.chance(50)):
		text += "You slide a digit in and out of your {pc.pussyStretch} pussy, coating it in your juices while doing so. It feels good, you let out a noise of pleasure and keep finger-fucking yourself for anyone who might been lucky to see."
		text += "\n\n"
	else:
		text += "You thrust a few fingers in and out your {pc.pussyStretch} slit, shoving them nice and deep, pounding at the G-spot. Your juices make it easy for your digits to slide inside and fuck your needy pussy."
		text += "\n\n"
	
	if(RNG.chance(30) && pc.hasEffect(StatusEffect.HasCumInsideVagina)):
		text += "As you finger yourself towards the orgasm, cum leaks out of your cunt and mixes with your girly fluids, so messy."
		text += "\n\n"
	
	if(RNG.chance(50) && _lustState.isInBattle()):
		text += "You make sure to show off how much pleasure this brings you to make your opponent jealous."
		text += "\n\n"
	
	if(RNG.chance(30) && pc.hasPenis()):
		text += "Your {pc.cock} is throbbing and leaking pre as you pleasure your other set of bits."
		text += "\n\n"
	
	if(RNG.chance(50) && pc.getLust() >= 50):
		text += "You feel really close, your drippy cunt squirts with your juices, soft inner walls clench around your fingers as you push yourself further."
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
		InterestTopic.HasVaginaOnly : 0.4,
		InterestTopic.HasVaginaAndCock : 0.4,
		InterestTopic.NoCock : 0.5,
		InterestTopic.StuffedPussy : 0.8,
		InterestTopic.StuffedPussyOrAss : 0.4,
		InterestTopic.FullyNaked : 0.7,
		InterestTopic.ExposedPussy : 0.7,
		InterestTopic.ExposedAnus : 0.3,
		InterestTopic.ExposedCock : 0.4,
		InterestTopic.ExposedPanties : 0.4,
		InterestTopic.LoosePussy : 0.7,
		InterestTopic.TightPussy : 0.7,
		InterestTopic.TallyMarks : 0.3,
		InterestTopic.Bodywritings : 0.3,
		InterestTopic.BDSMRestraints : 0.3,
		InterestTopic.VaginalPlugs : 0.1,
		InterestTopic.Pregnant: 0.4,
	}

func getPriority():
	return 5

func skillNeeded():
	return 3

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 2]]
	return []
