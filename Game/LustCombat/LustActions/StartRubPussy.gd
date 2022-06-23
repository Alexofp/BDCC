extends LustAction

func _init():
	id = "StartRubPussy"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(_lustState.isDoingActivity(LustActivity.SpreadingPussy)):
		return false
	
	if(!_lustState.canStartNewActivity(LustActivity.RubbingPussy)):
		return false
	var pc:Player = _lustState.getCharacter()
	if(!pc.hasBodypart(BodypartSlot.Vagina) || pc.isBodypartCovered(BodypartSlot.Vagina)):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Rub pussy"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Focus on your pussy"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	_lustState.startActivity(LustActivity.RubbingPussy)

	return {
		text = "{attacker.name} began groping {attacker.his} pussy!",
		lust = 1,
	}

func getLustTopics():
	return {
		InterestTopic.ButtPlugs : 0.2,
		InterestTopic.VaginalPlugs : 0.2,
		InterestTopic.ExposedPussy : 1.0,
		InterestTopic.ExposedAnus : 1.0,
		InterestTopic.StuffedPussy : 0.5,
		InterestTopic.StuffedAss : 0.5,
	}
