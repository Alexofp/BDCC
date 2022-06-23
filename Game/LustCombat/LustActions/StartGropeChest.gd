extends LustAction

func _init():
	id = "StartGropeChest"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(!_lustState.canStartNewActivity(LustActivity.GropingChest)):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Grope tits"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Start groping your tits"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	_lustState.startActivity(LustActivity.GropingChest)

	return {
		text = "{attacker.name} began groping {attacker.his} tits!",
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
