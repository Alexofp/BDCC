extends LustAction

func _init():
	id = "BreastsRubNipples"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(!_lustState.isDoingActivity(LustActivity.GropingChest)):
		return false
	var pc:Player = _lustState.getCharacter()
	if(!pc.hasBodypart(BodypartSlot.Breasts) || pc.isBodypartCovered(BodypartSlot.Breasts)):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	var pc:Player = _lustState.getCharacter()
	if(pc.hasBoundArms()):
		return [false, "You can't do that with bound arms"]
	if(pc.hasBlockedHands()):
		return [false, "You can't do that with blocked hands"]
	
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Rub nipples"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Focus on your nipples"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(3)

	return {
		text = "{attacker.name} is rubbing {attacker.his} nipple!",
		lust = 3,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.1,
		InterestTopic.MasculineBody : 0.1,
		InterestTopic.AndroBody : 0.1,
		InterestTopic.ThickBody : 0.1,
		InterestTopic.SlimBody : 0.1,
		InterestTopic.AverageMassBody : 0.1,
		InterestTopic.BigBreasts : 0.9,
		InterestTopic.SmallBreasts : 0.9,
		InterestTopic.MediumBreasts : 0.9,
		InterestTopic.NoBreasts : 0.9,
		InterestTopic.LactatingBreasts : 0.1,
		InterestTopic.CoveredInCum : 0.2,
		InterestTopic.CoveredInLotsOfCum : 0.1,
		InterestTopic.FullyNaked : 0.5,
		InterestTopic.ExposedBreasts : 0.4,
		InterestTopic.ExposedBra : 0.4,
		InterestTopic.Bodywritings : 0.2,
		InterestTopic.BDSMRestraints : 0.2,
	}

func getPriority():
	return 5
