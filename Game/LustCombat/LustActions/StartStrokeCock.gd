extends LustAction

func _init():
	id = "StartStrokeCock"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	
	if(!_lustState.canStartNewActivity(LustActivity.StrokingCock)):
		return false
	var pc:Player = _lustState.getCharacter()
	if(!pc.hasBodypart(BodypartSlot.Penis) || pc.isBodypartCovered(BodypartSlot.Penis)):
		return false
	if(pc.isWearingChastityCage()):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Stroke cock"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Begin stroking your shaft"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	_lustState.startActivity(LustActivity.StrokingCock)

	#var pc:Player = _lustState.getCharacter()
	
	var text = ""
	if(RNG.chance(50)):
		text += "You wrap your digits around your {pc.cock} and begin sliding your hand back and forth at a steady pace, stroking yourself off!"
		text += "\n\n"
	else:
		text += "You get a grasp on your {pc.cock} and give its tip a good rub with your digits, catching some precum that you then spread over the shaft as you stroke yourself!"
		text += "\n\n"

	return {
		text = text,
		lust = 1,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.2,
		InterestTopic.MasculineBody : 0.2,
		InterestTopic.AndroBody : 0.2,
		InterestTopic.ThickButt : 0.1,
		InterestTopic.AverageButt : 0.1,
		InterestTopic.SlimButt : 0.1,
		InterestTopic.NoVagina : 0.1,
		InterestTopic.HasVaginaAndCock : 0.1,
		InterestTopic.BigCock : 0.2,
		InterestTopic.AverageCock : 0.2,
		InterestTopic.SmallCock : 0.2,
		InterestTopic.HasCockOnly : 0.1,
		InterestTopic.CoveredInCum : 0.1,
		InterestTopic.CoveredInLotsOfCum : 0.1,
		InterestTopic.FullyNaked : 0.1,
		InterestTopic.ExposedBreasts : 0.1,
		InterestTopic.ExposedCock : 0.2,
		InterestTopic.ExposedPanties : 0.2,
		InterestTopic.ExposedBra : 0.1,
		InterestTopic.BDSMRestraints : 0.1,
		InterestTopic.Pregnant: 0.1,
	}

func isTease():
	return true

func skillNeeded():
	return 2

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 2]]
	return []
