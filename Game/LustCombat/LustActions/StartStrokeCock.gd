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
		InterestTopic.ButtPlugs : 0.2,
		InterestTopic.VaginalPlugs : 0.2,
		InterestTopic.ExposedPussy : 1.0,
		InterestTopic.ExposedAnus : 1.0,
		InterestTopic.StuffedPussy : 0.5,
		InterestTopic.StuffedAss : 0.5,
	}
