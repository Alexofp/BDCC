extends LustAction

func _init():
	id = "TeasePussy"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(_lustState.isDoingActivity(LustActivity.SpreadingPussy)):
		return false
	var pc:Player = _lustState.getCharacter()
	if(!pc.hasBodypart(BodypartSlot.Vagina) || !pc.isBodypartCovered(BodypartSlot.Vagina)):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Tease pussy"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Tease your pussy through the clothing"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(3)

	return {
		text = "{attacker.name} is teasing {attacker.his} pussy!",
		lust = 1,
	}

func getLustTopics():
	return {
		InterestTopic.HasVaginaOnly : 0.8,
		InterestTopic.HasVaginaAndCock : 0.8,
		InterestTopic.StuffedPussy : 0.7,
		InterestTopic.StuffedPussyOrAss : 0.4,
		InterestTopic.CoveredInCum : 0.4,
		InterestTopic.CoveredInLotsOfCum : 0.2,
		InterestTopic.FullyNaked : 0.3,
		InterestTopic.ExposedPussy : 0.6,
		InterestTopic.ExposedBreasts : 0.3,
		InterestTopic.ExposedCock : 0.3,
		InterestTopic.ExposedPanties : 0.7,
		InterestTopic.ExposedBra : 0.5,
		InterestTopic.LoosePussy : 0.3,
		InterestTopic.TightPussy : 0.3,
		InterestTopic.VaginalPlugs : 0.7,
	}

func getPriority():
	return 4

func isTease():
	return true
