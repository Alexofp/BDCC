extends LustAction

func _init():
	id = "MiscSwayHips"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Sway hips"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Do a little dance with your hips"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(3)

	return {
		text = "{attacker.name} is swaying {attacker.his} {attacker.masc} hips!",
		lust = 1,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 1.0,
		InterestTopic.MasculineBody : 1.0,
		InterestTopic.AndroBody : 1.0,
		InterestTopic.ThickBody : 0.8,
		InterestTopic.SlimBody : 0.8,
		InterestTopic.AverageMassBody : 0.8,
		InterestTopic.CoveredInCum : 0.7,
		InterestTopic.CoveredInLotsOfCum : 0.5,
		InterestTopic.FullyNaked : 0.7,
		InterestTopic.ExposedPussy : 0.4,
		InterestTopic.ExposedAnus : 0.4,
		InterestTopic.ExposedBreasts : 0.4,
		InterestTopic.ExposedCock : 0.4,
		InterestTopic.ExposedPanties : 0.4,
		InterestTopic.ExposedBra : 0.4,
		InterestTopic.TallyMarks : 0.8,
		InterestTopic.Bodywritings : 0.8,
		InterestTopic.Gags : 0.3,
		InterestTopic.Blindfolds : 0.3,
		InterestTopic.BDSMRestraints : 0.4,
		InterestTopic.ButtPlugs : 0.5,
		InterestTopic.VaginalPlugs : 0.5,
	}

func getPriority():
	return 4

func isTease():
	return true
