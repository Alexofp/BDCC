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
	return "Cup your balls"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	#_lustState.startActivity(LustActivity.StrokingCock)

	return {
		text = "{attacker.name} is cupping {attacker.his} balls!",
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
	}

func getPriority():
	return 5

func skillNeeded():
	return 3
