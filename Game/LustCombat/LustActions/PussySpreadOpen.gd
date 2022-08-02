extends LustAction

func _init():
	id = "PussySpreadOpen"
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
	return "Spread pussy"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Part your sensitive folds to show off how needy you are"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	#_lustState.startActivity(LustActivity.StrokingCock)

	var pc:Player = _lustState.getCharacter()
	
	var text = ""
	if(RNG.chance(50)):
		text += "Feeling incredibly lusty, you put two fingers onto your folds and spread them open. There is a visible line of transparent fluids connecting them as you hold your pussy spread for anyone who might be lucky to see it."
		text += "\n\n"
	else:
		text += "You use two digits to spread your needy pussy open, giving an incredible view of your pussy with strings of juices stretching down lower the longer you hold your fingers like that."
		text += "\n\n"
	
	if(RNG.chance(50) && _lustState.isInBattle()):
		text += "You provide such a great view of your fuckhole, there is no way your opponent’s attention wasn’t stolen by your lewd action."
		text += "\n\n"
	
	if(RNG.chance(60) && pc.hasEffect(StatusEffect.HasCumInsideVagina)):
		text += "Wow, as you hold your slit spread open, more and more jizz leaks out of it, messing up your thighs and dripping down to the floor."
		text += "\n\n"
	
	if(RNG.chance(50) && pc.getLust() >= 50):
		text += "You are so horny that you move your digits down to your pussy entering directly and stretch that one instead. Your digits slip due to the amount of juices there but you manage to provide a great view of your inner walls being all drippy and even show off the fuckable cervix."
		text += "\n\n"

	return {
		text = text,
		lust = 2,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.1,
		InterestTopic.MasculineBody : 0.1,
		InterestTopic.AndroBody : 0.1,
		InterestTopic.HasVaginaOnly : 0.5,
		InterestTopic.HasVaginaAndCock : 0.3,
		InterestTopic.NoCock : 0.6,
		InterestTopic.StuffedPussy : 1.0,
		InterestTopic.StuffedPussyOrAss : 0.5,
		InterestTopic.FullyNaked : 0.5,
		InterestTopic.ExposedPussy : 0.5,
		InterestTopic.ExposedAnus : 0.2,
		InterestTopic.ExposedCock : 0.1,
		InterestTopic.ExposedPanties : 0.3,
		InterestTopic.LoosePussy : 0.7,
		InterestTopic.TightPussy : 0.7,
		InterestTopic.TallyMarks : 0.2,
		InterestTopic.Bodywritings : 0.2,
		InterestTopic.BDSMRestraints : 0.3,
		InterestTopic.VaginalPlugs : 0.4,
		InterestTopic.Pregnant: 0.4,
	}

func getPriority():
	return 5

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 2]]
	return []
