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
	return "Spread pussy open"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Spread your pussy"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	#_lustState.startActivity(LustActivity.StrokingCock)

	return {
		text = "{attacker.name} is spreading {attacker.his} pussy!",
		lust = 3,
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
	}

func getPriority():
	return 5
