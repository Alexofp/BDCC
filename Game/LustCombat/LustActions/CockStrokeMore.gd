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
	return "Stroke cock"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Stroke cock more"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	#_lustState.startActivity(LustActivity.StrokingCock)

	return {
		text = "{attacker.name} is stroking {attacker.his} {pc.cock}!",
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
	}

func getPriority():
	return 5
