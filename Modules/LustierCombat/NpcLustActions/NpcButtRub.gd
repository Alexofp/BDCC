extends LustAction

func _init():
	id = "NpcButtRub"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(_lustState.getCharacter() == GM.pc):
		return false
	var character = _lustState.getCharacter()
	if(!character.hasBodypart(BodypartSlot.Anus) || !character.isBodypartCovered(BodypartSlot.Anus)):
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
	return "NpcButtRub"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "You should not see this"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	#_lustState.startActivity(LustActivity.StrokingCock)

	var character = _lustState.getCharacter()
	
	var text = ""
	if(RNG.chance(50)):
		text += "{<npc>.name} gives a lecherous look and shakes {<npc>.their} {<npc>.thick} butt, sneaking in a quick squeeze before focusing on the fight again. "
#		text += "\n\n"
	else:
		text += "There is a small pause as {pc.yourHis} opponent considers their next move. {<npc>.name} takes the opportunity to fondle {<npc>.their} own ass, making sure {pc.name} can see it. "
#		text += "\n\n"
	
#	if(RNG.chance(50) && _lustState.isInBattle()):
#		text += "You present your butt to your opponent, maybe your curves will make it harder to focus. "
#		text += "\n\n"
#
#	if(RNG.chance(50) && character.getLust() >= 50):
#		text += "You let out some passionate moans as you rub your rear more and more, you’re almost desperate for some stimulation. "
#		text += "\n\n"

	return {
		text = text.replace("<npc>", character.getID()),
		lust = 2,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.2,
		InterestTopic.MasculineBody : 0.2,
		InterestTopic.AndroBody : 0.2,
		InterestTopic.ThickButt : 1.0,
		InterestTopic.AverageButt : 1.0,
		InterestTopic.SlimButt : 1.0,
		InterestTopic.StuffedPussy : 0.2,
		InterestTopic.StuffedAss : 0.2,
		InterestTopic.StuffedPussyOrAss : 0.1,
		InterestTopic.CoveredInCum : 0.3,
		InterestTopic.CoveredInLotsOfCum : 0.2,
		InterestTopic.FullyNaked : 0.3,
		InterestTopic.ExposedPussy : 0.3,
		InterestTopic.ExposedAnus : 0.3,
		InterestTopic.ExposedCock : 0.3,
		InterestTopic.ExposedPanties : 0.3,
		InterestTopic.LooseAnus : 0.2,
		InterestTopic.LoosePussy : 0.2,
		InterestTopic.TightAnus : 0.2,
		InterestTopic.TightPussy : 0.2,
		InterestTopic.TallyMarks : 0.3,
		InterestTopic.Bodywritings : 0.3,
		InterestTopic.BDSMRestraints : 0.4,
		InterestTopic.ButtPlugs : 0.2,
		InterestTopic.VaginalPlugs : 0.2,
	}

func getPriority():
	return 0

func isTease():
	return true

func getExperience(_lustState: LustCombatState, _args):
	return null # npc skill experience is not tracked

func getVisibility():
	return -10 # to avoid triggering visibility checks. as that mechanic is for the player
