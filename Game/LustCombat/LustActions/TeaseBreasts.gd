extends LustAction

func _init():
	id = "TeaseBreasts"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(_lustState.isDoingActivity(LustActivity.GropingChest)):
		return false
	var pc:Player = _lustState.getCharacter()
	if(!pc.hasBodypart(BodypartSlot.Breasts) || !pc.isBodypartCovered(BodypartSlot.Breasts)):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Tease breasts"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Tease your breasts through the clothing"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(3)

	return {
		text = "{attacker.name} is teasing {attacker.his} breasts!",
		lust = 3,
	}

func getLustTopics():
	return {
		InterestTopic.BigBreasts : 1.0,
		InterestTopic.SmallBreasts : 1.0,
		InterestTopic.MediumBreasts : 1.0,
		InterestTopic.NoBreasts : 1.0,
		InterestTopic.LactatingBreasts : 0.3,
		InterestTopic.CoveredInCum : 0.3,
		InterestTopic.CoveredInLotsOfCum : 0.2,
		InterestTopic.FullyNaked : 0.4,
		InterestTopic.ExposedPussy : 0.2,
		InterestTopic.ExposedBreasts : 0.4,
		InterestTopic.ExposedCock : 0.2,
		InterestTopic.ExposedPanties : 0.1,
		InterestTopic.ExposedBra : 0.5,
		InterestTopic.TallyMarks : 0.3,
		InterestTopic.Bodywritings : 0.5,
		InterestTopic.BDSMRestraints : 0.2,
	}

func getPriority():
	return 4

func isTease():
	return true
