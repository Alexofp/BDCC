extends LustAction

func _init():
	id = "StartProdAnal"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(!_lustState.canStartNewActivity(LustActivity.ProddingAnal)):
		return false
	var pc:Player = _lustState.getCharacter()
	if(!pc.hasBodypart(BodypartSlot.Anus) || pc.isBodypartCovered(BodypartSlot.Anus)):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Prod anal"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Start prodding at your anal ring"

func doAction(_lustState: LustCombatState, _args):
	_lustState.startActivity(LustActivity.ProddingAnal)

	#var pc:Player = _lustState.getCharacter()
	
	var text = ""
	if(RNG.chance(50)):
		text += "You move your free hand down to your butt and spread the buttcheeks open with two fingers while using the third one to poke at your {pc.analStretch} ring. Quickly lubing the finger with your saliva helps it to slide inside with ease."
		text += "\n\n"
	else:
		text += "You produce a cute little noise as two of your digits prod at your {pc.analStretch} anal ring before eventually sinking inside."
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
		InterestTopic.ThickButt : 0.2,
		InterestTopic.AverageButt : 0.2,
		InterestTopic.SlimButt : 0.2,
		InterestTopic.StuffedAss : 0.3,
		InterestTopic.CoveredInCum : 0.2,
		InterestTopic.CoveredInLotsOfCum : 0.2,
		InterestTopic.FullyNaked : 0.2,
		InterestTopic.ExposedAnus : 0.4,
		InterestTopic.ExposedPanties : 0.3,
		InterestTopic.LooseAnus : 0.3,
		InterestTopic.TightAnus : 0.3,
	}

func isTease():
	return true

func skillNeeded():
	return 2

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 2]]
	return []
