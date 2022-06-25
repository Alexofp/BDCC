extends LustAction

func _init():
	id = "TeaseCock"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(_lustState.isDoingActivity(LustActivity.StrokingCock)):
		return false
	var pc:Player = _lustState.getCharacter()
	if(!pc.hasBodypart(BodypartSlot.Penis) || !pc.isBodypartCovered(BodypartSlot.Penis)):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Tease cock"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Tease your cock through the clothing"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(3)

	return {
		text = "{attacker.name} is teasing {attacker.his} cock!",
		lust = 3,
	}

func getLustTopics():
	return {
		InterestTopic.HasVaginaAndCock : 0.2,
		InterestTopic.BigCock : 1.0,
		InterestTopic.AverageCock : 1.0,
		InterestTopic.SmallCock : 1.0,
		InterestTopic.NoCock : 1.0,
		InterestTopic.HasCockOnly : 0.2,
		InterestTopic.FullyNaked : 0.4,
		InterestTopic.ExposedCock : 0.4,
		InterestTopic.ExposedPanties : 0.4,
		InterestTopic.BDSMRestraints : 0.2,
	}

func getPriority():
	return 4

func isTease():
	return true
