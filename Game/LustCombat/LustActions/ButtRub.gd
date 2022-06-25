extends LustAction

func _init():
	id = "ButtRub"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(!_lustState.isDoingActivity(LustActivity.GropingButt)):
		return false
	#var pc:Player = _lustState.getCharacter()
	#if(!pc.hasBodypart(BodypartSlot.Vagina) || pc.isBodypartCovered(BodypartSlot.Vagina)):
	#	return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Rub butt"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Rub your butt!"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	#_lustState.startActivity(LustActivity.StrokingCock)

	return {
		text = "{attacker.name} rubs {attacker.his} butt!",
		lust = 2,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.2,
		InterestTopic.MasculineBody : 0.2,
		InterestTopic.AndroBody : 0.2,
		InterestTopic.ThickButt : 1.0,
		InterestTopic.AverageButt : 1.0,
		InterestTopic.SlimButt : 1.0,
		InterestTopic.StuffedPussy : 0.2,
		InterestTopic.StuffedAss : 0.2,
		InterestTopic.StuffedPussyOrAss : 0.1,
		InterestTopic.CoveredInCum : 0.3,
		InterestTopic.CoveredInLotsOfCum : 0.2,
		InterestTopic.FullyNaked : 0.3,
		InterestTopic.ExposedPussy : 0.3,
		InterestTopic.ExposedAnus : 0.3,
		InterestTopic.ExposedCock : 0.3,
		InterestTopic.ExposedPanties : 0.3,
		InterestTopic.LooseAnus : 0.2,
		InterestTopic.LoosePussy : 0.2,
		InterestTopic.TightAnus : 0.2,
		InterestTopic.TightPussy : 0.2,
		InterestTopic.TallyMarks : 0.3,
		InterestTopic.Bodywritings : 0.3,
		InterestTopic.BDSMRestraints : 0.4,
		InterestTopic.ButtPlugs : 0.2,
		InterestTopic.VaginalPlugs : 0.2,
	}

func getPriority():
	return 5
