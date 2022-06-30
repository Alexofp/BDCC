extends LustAction

func _init():
	id = "AnalRubProstate"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(!_lustState.isDoingActivity(LustActivity.ProddingAnal)):
		return false
	var pc:Player = _lustState.getCharacter()
	if(!pc.hasBodypart(BodypartSlot.Anus) || pc.isBodypartCovered(BodypartSlot.Anus)):
		return false
	if(!pc.hasBodypart(BodypartSlot.Penis)):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	var pc:Player = _lustState.getCharacter()
	if(pc.hasBoundArms()):
		return [false, "You can't do that with bound arms"]
	#if(pc.hasBlockedHands()):
	#	return [false, "You can't do that with blocked hands"]
	
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Rub prostate"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Focus on your p-spot"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(3)

	var pc:Player = _lustState.getCharacter()
	
	var text = ""
	if(RNG.chance(50)):
		text += "A passionate moan slides past your lips as you curl your finger inside your butt enough to start pounding at the prostate. Your {pc.cock} reacts each time by throbbing and leaking some transparent fluid down onto the floor."
		text += "\n\n"
	else:
		text += "You shift the fingers in such a way that allows you to rub your prostate each time you thrust them inside. It feels so good, your {pc.cock} is leaking precum almost non-stop while you do that."
		text += "\n\n"
	
	if(RNG.chance(50) && _lustState.isInBattle()):
		text += "You make sure to give your enemy the best view of your {pc.thick} rear and your dripping cock as you pleasure yourself through the ass."
		text += "\n\n"
	
	if(RNG.chance(30) && pc.hasEffect(StatusEffect.HasCumInsideAnus)):
		text += "Your digits get coated with cum of your previous lovers, it acts great as a lube, allowing you to thrust your fingers in and out with greater force."
		text += "\n\n"
	
	if(RNG.chance(30) && pc.getLust() >= 50):
		text += "Wow, your cock throbs and pulsates a lot, showing that you’re on the right track of reaching your orgasm with anal stimulation."
		text += "\n\n"

	return {
		text = text,
		lust = 5,
	}

func getLustTopics():
	return {
		InterestTopic.ThickButt : 0.2,
		InterestTopic.AverageButt : 0.2,
		InterestTopic.SlimButt : 0.2,
		InterestTopic.StuffedAss : 0.5,
		InterestTopic.StuffedPussyOrAss : 0.2,
		InterestTopic.FullyNaked : 0.4,
		InterestTopic.ExposedPussy : 0.3,
		InterestTopic.ExposedAnus : 0.8,
		InterestTopic.ExposedCock : 0.5,
		InterestTopic.BigCock : 0.4,
		InterestTopic.AverageCock : 0.4,
		InterestTopic.SmallCock : 0.4,
		InterestTopic.LooseAnus : 0.8,
		InterestTopic.TightAnus : 0.8,
		InterestTopic.TallyMarks : 0.1,
		InterestTopic.Bodywritings : 0.1,
		InterestTopic.ButtPlugs : 0.4,
		InterestTopic.VaginalPlugs : 0.2,
	}

func getPriority():
	return 5

func skillNeeded():
	return 3

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 2]]
	return []
