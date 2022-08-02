extends LustAction

func _init():
	id = "PussyRubClit"
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
	return "Rub clit"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Give your sensitive bean some love"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	#_lustState.startActivity(LustActivity.StrokingCock)

	var pc:Player = _lustState.getCharacter()
	
	var text = ""
	if(RNG.chance(50)):
		text += "Your finger switches focus to your cute clit and rubs it in a smooth circular motion. It makes your neglected pussy folds get wet with even more fluids. The desire fills your mind."
		text += "\n\n"
	else:
		text += "You quickly rub your nub from side to side, producing a cute moan as your pussy juices drip down your {pc.masc} thighs."
		text += "\n\n"
	
	if(RNG.chance(50) && _lustState.isInBattle()):
		text += "You make sure to show off how much pleasure teasing your clit brings you to hopefully drive your opponent desperate."
		text += "\n\n"
	
	if(RNG.chance(30) && pc.hasEffect(StatusEffect.HasCumInsideVagina)):
		text += "As you play with your pussy, old cum leaks out of your used fuckhole, creating a mess."
		text += "\n\n"
	
	if(RNG.chance(30) && pc.hasPenis()):
		text += "Your {pc.cock} is throbbing and leaking pre as you pleasure your other set of bits."
		text += "\n\n"
	
	if(RNG.chance(50) && pc.getLust() >= 50):
		text += "You feel really close, your drippy cunt visibly pulsates and squirts with your juices."
		text += "\n\n"

	return {
		text = text,
		lust = 5,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.3,
		InterestTopic.MasculineBody : 0.3,
		InterestTopic.AndroBody : 0.3,
		InterestTopic.HasVaginaOnly : 0.4,
		InterestTopic.HasVaginaAndCock : 0.4,
		InterestTopic.NoCock : 0.5,
		InterestTopic.StuffedPussy : 0.4,
		InterestTopic.StuffedPussyOrAss : 0.2,
		InterestTopic.FullyNaked : 0.8,
		InterestTopic.ExposedPussy : 1.0,
		InterestTopic.ExposedAnus : 0.3,
		InterestTopic.ExposedCock : 0.4,
		InterestTopic.ExposedPanties : 0.5,
		InterestTopic.LoosePussy : 0.2,
		InterestTopic.TightPussy : 0.2,
		InterestTopic.TallyMarks : 0.3,
		InterestTopic.Bodywritings : 0.3,
		InterestTopic.BDSMRestraints : 0.3,
		InterestTopic.VaginalPlugs : 0.6,
		InterestTopic.Pregnant: 0.4,
	}

func getPriority():
	return 5

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 2]]
	return []
