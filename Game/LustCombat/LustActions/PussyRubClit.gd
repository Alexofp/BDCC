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
	return "Focus on rubbing your clit"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	#_lustState.startActivity(LustActivity.StrokingCock)

	return {
		text = "{attacker.name} is rubbing {attacker.his} clit!",
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
	}

func getPriority():
	return 5
