extends LustAction

func _init():
	id = "NpcStartStrokeCock"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(_lustState.getCharacter() == GM.pc):
		return false
	if(!_lustState.canStartNewActivity(LustActivity.StrokingCock)):
		return false
	var character = _lustState.getCharacter()
	if(!character.hasBodypart(BodypartSlot.Penis) || character.isBodypartCovered(BodypartSlot.Penis)):
		return false
	if(character.isWearingChastityCage()):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	if(_lustState.getCharacter() == GM.pc):
		return .canDo(_lustState, _args)
	else:
		var _fudge = .canDo(_lustState, _args)
		if(typeof(_fudge) == TYPE_ARRAY):
			return _fudge[0]
		else:
			return _fudge

func getVisibleName(_lustState: LustCombatState, _args):
	return "NpcStartStrokeCock"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "You should not see this"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	_lustState.startActivity(LustActivity.StrokingCock)

	var character = _lustState.getCharacter()
	
	var text = ""
	if(RNG.chance(50)):
		text += "{<npc>.name} grasps {<npc>.their} {<npc>.penisSizeStr} {<npc>.penisShort}, giving it a quick stroke before teasing the drop of precum at its tip with {<npc>.their} thumb. "
#		text += "\n\n"
	else:
		text += "{<npc>.name} grips {<npc>.their} stiff rod, teasing {<npc>.their} {<npc>.penisDesc} {<npc>.penis} with obvious intent to penetrate {pc.name}! "
#		text += "\n\n"

	return {
		text = text.replace("<npc>", character.getID()),
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

func getPriority():
	return 1

func isTease():
	return true

func getExperience(_lustState: LustCombatState, _args):
	return null # npc skill experience is not tracked

func getVisibility():
	return -10 # to avoid triggering visibility checks. as that mechanic is for the player
