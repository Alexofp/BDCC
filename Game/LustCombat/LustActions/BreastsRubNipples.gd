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
	return "Give your buttons a massage"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(3)

	var pc:Player = _lustState.getCharacter()
	
	var text = ""
	if(RNG.chance(50)):
		text += "The desire is too much, your digits press against your sensitive nips and softly caress them while using the whole palm to cup your {pc.breasts}. The sensations are great, you let out a quiet moan while your nips harden from the stimulation."
		text += "\n\n"
	else:
		text += "Your fingertips land on your perky nipples and give them a little rub. These spots are so sensitive, instinctively you squeeze your {pc.breasts} a little harder and knead your nips while moaning for anyone to hear."
		text += "\n\n"
	
	if(RNG.chance(30) && pc.hasEffect(StatusEffect.CoveredInCum)):
		text += "Your body is so messy, the view of you playing with your nips while someone’s cum is dripping from them is so lewd."
		text += "\n\n"
	
	if(RNG.chance(50) && _lustState.isInBattle()):
		text += "The opponent is watching you and you hope you’re offering a good show for them."
		text += "\n\n"
	
	if(RNG.chance(30) && pc.hasVagina()):
		text += "Having your nips rubbed makes your cute {pc.pussyStretch} pussy get wet with even more pussy juices."
		text += "\n\n"
	
	if(RNG.chance(20) && !pc.canBeMilked()):
		text += "You are not lactating but you feel like you can get used to these kinds of sensations, it feels so good to have your nips stimulated like this."
		text += "\n\n"

	if(pc.stimulateLactation()):
		text += "[b]Your {pc.breasts} leak with some {pc.milk}, you began lactating![/b]"
		text += "\n\n"

	return {
		text = text,
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
		InterestTopic.Pregnant: 0.2,
	}

func getPriority():
	return 5

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 2]]
	return []
