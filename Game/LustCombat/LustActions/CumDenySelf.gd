extends LustAction

func _init():
	id = "CumDenySelf"
	isOrgasmAction = true
	
func shouldShow(_lustState: LustCombatState, _args):
	return true

func canDo(_lustState: LustCombatState, _args):
	var pc: Player = _lustState.getCharacter()
	if(pc.getStamina() <= 0):
		return [false, "You don't have enough will to stop now.."]
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Deny self"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Go against your will and use 20 stamina to deny yourself the orgasm."

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	#_lustState.startActivity(LustActivity.StrokingCock)
	var pc: Player = _lustState.getCharacter()
	pc.addStamina(-20)
	pc.addLust( -int(float(pc.getLust()) / 2) )

	return {
		text = "{attacker.name} denied {attacker.himself} the orgasm..",
		came = true,
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
	return 0
