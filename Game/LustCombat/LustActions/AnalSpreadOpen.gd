extends LustAction

func _init():
	id = "AnalSpreadOpen"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(!_lustState.isDoingActivity(LustActivity.ProddingAnal)):
		return false
	var pc:Player = _lustState.getCharacter()
	if(!pc.hasBodypart(BodypartSlot.Anus) || pc.isBodypartCovered(BodypartSlot.Anus)):
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
	return "Spread butthole open"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Stretch open your anal ring"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(3)

	var pc:Player = _lustState.getCharacter()
	
	var text = ""
	if(RNG.chance(50)):
		text += "Feeling horny and needy, you spread your buttcheeks and then use two of your fingers to stretch your {pc.analStretch} butthole open as wide as it allows to. So lewd."
		text += "\n\n"
	else:
		text += "You pull your buttcheeks aside and use two digits to spread your fuckable tailhole open, letting out a soft noise in the process."
		text += "\n\n"
	
	if(RNG.chance(50) && _lustState.isInBattle()):
		text += "You provide such a great view of your fuckhole, there is no way your opponent’s attention wasn’t stolen by your lewd action."
		text += "\n\n"
	
	if(RNG.chance(30) && pc.hasEffect(StatusEffect.HasCumInsideAnus)):
		text += "Wow, as you hold your butt spread open, more and more jizz leaks out of it, messing up your thighs and dripping down to the floor."
		text += "\n\n"
	
	if(RNG.chance(30) && pc.getLust() >= 50):
		text += "You are so horny that you start to sway your hips and moan just from the thought of somebody using your tailhole."
		text += "\n\n"

	return {
		text = text,
		lust = 2,
	}

func getLustTopics():
	return {
		InterestTopic.ThickButt : 0.3,
		InterestTopic.AverageButt : 0.3,
		InterestTopic.SlimButt : 0.3,
		InterestTopic.StuffedAss : 1.0,
		InterestTopic.StuffedPussyOrAss : 0.5,
		InterestTopic.FullyNaked : 0.4,
		InterestTopic.ExposedPussy : 0.3,
		InterestTopic.ExposedAnus : 0.8,
		InterestTopic.ExposedCock : 0.3,
		InterestTopic.LooseAnus : 1.0,
		InterestTopic.TightAnus : 1.0,
		InterestTopic.TallyMarks : 0.1,
		InterestTopic.Bodywritings : 0.1,
		InterestTopic.ButtPlugs : 0.2,
	}

func getPriority():
	return 5

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 2]]
	return []
