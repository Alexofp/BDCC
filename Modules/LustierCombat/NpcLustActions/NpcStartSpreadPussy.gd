extends LustAction

func _init():
	id = "NpcStartSpreadPussy"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(_lustState.getCharacter() == GM.pc):
		return false
	if(!_lustState.canStartNewActivity(LustActivity.SpreadingPussy)):
		return false
	var character = _lustState.getCharacter()
	if(!character.hasBodypart(BodypartSlot.Vagina) || character.isBodypartCovered(BodypartSlot.Vagina)):
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
	return "NpcStartSpreadPussy"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "You should not see this"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	_lustState.startActivity(LustActivity.SpreadingPussy)

	var character = _lustState.getCharacter()
	
	var text = ""
	if(RNG.chance(50)):
		text += "{<npc>.name} slips {<npc>.hisHer} hand between {<npc>.name} thighs, giving some love to {<npc>.their} needy {<npc>.pussy}. It isn't long before {<npc>.heShe} starts to blush and gasp! "
#		text += "\n\n"
	else:
		text += "{<npc>.name} allows one hand to drift down to {<npc>.hisHer} rock-hard clit, the sexy noises of {<npc>.himHer} pleasuring {<npc>.their} button soon fill the air! "
#		text += "\n\n"

	return {
		text = text.replace("<npc>", character.getID()),
		lust = 1,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.3,
		InterestTopic.MasculineBody : 0.3,
		InterestTopic.AndroBody : 0.3,
		InterestTopic.ThickButt : 0.1,
		InterestTopic.AverageButt : 0.1,
		InterestTopic.SlimButt : 0.1,
		InterestTopic.StuffedPussy : 0.3,
		InterestTopic.CoveredInCum : 0.2,
		InterestTopic.CoveredInLotsOfCum : 0.2,
		InterestTopic.FullyNaked : 0.2,
		InterestTopic.ExposedPussy : 0.4,
		InterestTopic.ExposedCock : 0.3,
		InterestTopic.HasVaginaAndCock : 0.2,
		InterestTopic.NoCock : 0.2,
		InterestTopic.ExposedPanties : 0.3,
		InterestTopic.LoosePussy : 0.2,
		InterestTopic.TightPussy : 0.2,
		InterestTopic.BDSMRestraints : 0.1,
		InterestTopic.VaginalPlugs : 0.1,
		InterestTopic.Pregnant: 0.2,
	}

func getPriority():
	return 1

func isTease():
	return true

func getExperience(_lustState: LustCombatState, _args):
	return null # npc skill experience is not tracked

func getVisibility():
	return -10 # to avoid triggering visibility checks. as that mechanic is for the player
