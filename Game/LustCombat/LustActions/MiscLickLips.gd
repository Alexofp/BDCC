extends LustAction

func _init():
	id = "MiscLickLips"
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
		InterestTopic.FeminineBody : 0.5,
		InterestTopic.MasculineBody : 0.5,
		InterestTopic.AndroBody : 0.5,
		InterestTopic.ThickBody : 0.5,
		InterestTopic.SlimBody : 0.5,
		InterestTopic.AverageMassBody : 0.5,
		InterestTopic.StuffedThroat : 1.0,
		InterestTopic.CoveredInCum : 0.7,
		InterestTopic.CoveredInLotsOfCum : 0.5,
		InterestTopic.FullyNaked : 0.5,
		InterestTopic.ExposedPussy : 0.2,
		InterestTopic.ExposedAnus : 0.2,
		InterestTopic.ExposedBreasts : 0.2,
		InterestTopic.ExposedCock : 0.2,
		InterestTopic.ExposedPanties : 0.2,
		InterestTopic.ExposedBra : 0.2,
		InterestTopic.TallyMarks : 0.5,
		InterestTopic.Bodywritings : 0.5,
		InterestTopic.Gags : 0.5,
		InterestTopic.Blindfolds : 0.8,
		InterestTopic.BDSMRestraints : 0.3,
	}

func getPriority():
	return 4

func isTease():
	return true
