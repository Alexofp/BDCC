extends LustAction

func _init():
	id = "StartGropeButt"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(!_lustState.canStartNewActivity(LustActivity.GropingButt)):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Grope ass"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Start groping your ass"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	_lustState.startActivity(LustActivity.GropingButt)

	return {
		text = "{attacker.name} began groping {attacker.his} ass!",
		lust = 1,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.3,
		InterestTopic.MasculineBody : 0.3,
		InterestTopic.AndroBody : 0.3,
		InterestTopic.ThickButt : 0.4,
		InterestTopic.AverageButt : 0.4,
		InterestTopic.SlimButt : 0.4,
		InterestTopic.StuffedAss : 0.2,
		InterestTopic.CoveredInCum : 0.2,
		InterestTopic.CoveredInLotsOfCum : 0.2,
		InterestTopic.FullyNaked : 0.2,
		InterestTopic.ExposedAnus : 0.1,
		InterestTopic.ExposedPanties : 0.2,
		InterestTopic.LooseAnus : 0.1,
		InterestTopic.TightAnus : 0.1,
	}

func isTease():
	return true

func skillNeeded():
	return 1
