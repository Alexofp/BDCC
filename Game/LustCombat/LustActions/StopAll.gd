extends LustAction

func _init():
	id = "StopAll"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(!_lustState.canStopActivities()):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Stop actions"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Stop groping yourself and free your hands"

func doAction(_lustState: LustCombatState, _args):
	_lustState.stopActivities()

	return {
		text = "{attacker.name} stopped touching {attacker.himself}!"
	}

func getLustTopics():
	return {
	}

func getPriority():
	return -5
