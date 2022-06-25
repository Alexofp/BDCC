extends LustAction

func _init():
	id = "StartSpreadPussy"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(!_lustState.canStartNewActivity(LustActivity.SpreadingPussy)):
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
	return "Spread your pussy lips"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	_lustState.startActivity(LustActivity.SpreadingPussy)

	return {
		text = "{attacker.name} spreads {attacker.his} pussy lips!",
		lust = 1,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.3,
		InterestTopic.MasculineBody : 0.3,
		InterestTopic.AndroBody : 0.3,
		InterestTopic.ThickButt : 0.1,
		InterestTopic.AverageButt : 0.1,
		InterestTopic.SlimButt : 0.1,
		InterestTopic.StuffedPussy : 0.3,
		InterestTopic.CoveredInCum : 0.2,
		InterestTopic.CoveredInLotsOfCum : 0.2,
		InterestTopic.FullyNaked : 0.2,
		InterestTopic.ExposedPussy : 0.4,
		InterestTopic.ExposedCock : 0.3,
		InterestTopic.HasVaginaAndCock : 0.2,
		InterestTopic.NoCock : 0.2,
		InterestTopic.ExposedPanties : 0.3,
		InterestTopic.LoosePussy : 0.2,
		InterestTopic.TightPussy : 0.2,
		InterestTopic.BDSMRestraints : 0.1,
		InterestTopic.VaginalPlugs : 0.1,
	}

func isTease():
	return true
