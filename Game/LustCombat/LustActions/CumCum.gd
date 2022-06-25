extends LustAction

func _init():
	id = "CumCum"
	isOrgasmAction = true
	
func shouldShow(_lustState: LustCombatState, _args):
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Cum"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Embrace the orgasm.. If you are in a fight, you will lose and succumb to your enemy"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	#_lustState.startActivity(LustActivity.StrokingCock)
	var pc: Player = _lustState.getCharacter()
	pc.orgasmFrom(pc.getID())

	return {
		text = "{attacker.name} came hard!",
		came = true,
		lostBattle = true,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.2,
		InterestTopic.MasculineBody : 0.2,
		InterestTopic.AndroBody : 0.2,
		InterestTopic.BigCock : 0.2,
		InterestTopic.AverageCock : 0.2,
		InterestTopic.SmallCock : 0.2,
		InterestTopic.HasVaginaOnly : 0.4,
		InterestTopic.HasCockOnly : 0.2,
		InterestTopic.HasVaginaAndCock : 0.4,
		InterestTopic.StuffedPussy : 0.2,
		InterestTopic.CoveredInCum : 0.2,
		InterestTopic.CoveredInLotsOfCum : 0.2,
	}

func getPriority():
	return 1
