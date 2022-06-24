extends LustAction

func _init():
	id = "MiscLickLicks"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	var pc: Player = _lustState.getCharacter()
	if(pc.isGagged()):
		return false
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Lick lips"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Lick your lips"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(3)

	return {
		text = "{attacker.name} licks {attacker.his} lips!",
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

func getPriority():
	return 4
