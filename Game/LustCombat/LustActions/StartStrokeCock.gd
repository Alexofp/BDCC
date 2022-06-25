extends LustAction

func _init():
	id = "StartStrokeCock"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	
	if(!_lustState.canStartNewActivity(LustActivity.StrokingCock)):
		return false
	var pc:Player = _lustState.getCharacter()
	if(!pc.hasBodypart(BodypartSlot.Penis) || pc.isBodypartCovered(BodypartSlot.Penis)):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Stroke cock"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Focus on your cock"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	_lustState.startActivity(LustActivity.StrokingCock)

	return {
		text = "{attacker.name} began stroking {attacker.his} {pc.cock}!",
		lust = 1,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.2,
		InterestTopic.MasculineBody : 0.2,
		InterestTopic.AndroBody : 0.2,
		InterestTopic.ThickButt : 0.1,
		InterestTopic.AverageButt : 0.1,
		InterestTopic.SlimButt : 0.1,
		InterestTopic.NoVagina : 0.1,
		InterestTopic.HasVaginaAndCock : 0.1,
		InterestTopic.BigCock : 0.2,
		InterestTopic.AverageCock : 0.2,
		InterestTopic.SmallCock : 0.2,
		InterestTopic.HasCockOnly : 0.1,
		InterestTopic.CoveredInCum : 0.1,
		InterestTopic.CoveredInLotsOfCum : 0.1,
		InterestTopic.FullyNaked : 0.1,
		InterestTopic.ExposedBreasts : 0.1,
		InterestTopic.ExposedCock : 0.2,
		InterestTopic.ExposedPanties : 0.2,
		InterestTopic.ExposedBra : 0.1,
		InterestTopic.BDSMRestraints : 0.1,
	}

func isTease():
	return true
