extends LustAction

func _init():
	id = "ButtSpankSelf"
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
	return "Spank ass"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Spank your ass!"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	#_lustState.startActivity(LustActivity.StrokingCock)

	return {
		text = "{attacker.name} has spanked {attacker.his} ass!",
		lust = 1,
		pain = 3,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.4,
		InterestTopic.MasculineBody : 0.4,
		InterestTopic.AndroBody : 0.4,
		InterestTopic.ThickButt : 0.7,
		InterestTopic.AverageButt : 0.7,
		InterestTopic.SlimButt : 0.7,
		InterestTopic.FullyNaked : 0.8,
		InterestTopic.ExposedPussy : 0.8,
		InterestTopic.ExposedAnus : 0.8,
		InterestTopic.ExposedCock : 0.8,
		InterestTopic.ExposedPanties : 0.3,
		InterestTopic.LooseAnus : 0.1,
		InterestTopic.LoosePussy : 0.1,
		InterestTopic.TightAnus : 0.1,
		InterestTopic.TightPussy : 0.1,
		InterestTopic.TallyMarks : 0.3,
		InterestTopic.Bodywritings : 0.3,
		InterestTopic.BDSMRestraints : 0.4,
		InterestTopic.ButtPlugs : 0.1,
		InterestTopic.VaginalPlugs : 0.1,
	}

func getPriority():
	return 5

func skillNeeded():
	return 2
