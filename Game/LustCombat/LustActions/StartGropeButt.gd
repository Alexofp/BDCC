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
	return "Grope butt"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Begin groping your rear"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	_lustState.startActivity(LustActivity.GropingButt)

	var pc:Player = _lustState.getCharacter()
	
	var text = ""
	if(RNG.chance(50)):
		text += "You shift one of your hands down to your {pc.thick} butt and get a good grasp on it. Yeah, you have a good ass, the palm of your hand slides along the surface and explores it."
		text += "\n\n"
	else:
		text += "You put your free hand on your rear and give it a little rub. Your {pc.thick} ass is on display."
		text += "\n\n"

	if(RNG.chance(50) && pc.hasEffect(StatusEffect.HasCumInsideAnus)):
		text += "Some cum leaks out of your tailhole, a sign of your previous sex."
		text += "\n\n"

	return {
		text = text,
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

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 2]]
	return []
