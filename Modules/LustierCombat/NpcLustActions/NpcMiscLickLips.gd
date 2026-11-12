extends LustAction

func _init():
	id = "NpcMiscLickLips"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(_lustState.getCharacter() == GM.pc):
		return false
	var character = _lustState.getCharacter()
	if(character.isGagged()):
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
	return "NpcMiscLickLips"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "You should not see this"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(3)
	var character = _lustState.getCharacter()
	
	var text = ""
	if(RNG.chance(50)):
		text += "{<npc>.name} sticks out {<npc>.their} tongue in a taunt that feels more silly than sexy, only to follow up with a slow, deliberate lick of {<npc>.their} lips that signals {<npc>.their} impure intentions. "
#		text += "\n\n"
	else:
		text += "{<npc>.name} glances aside and bites {<npc>.their} lower lip, then blows a kiss to {pc.name} that is anything but chaste. "
#		text += "\n\n"
	
#	if(RNG.chance(70) && character.hasEffect(StatusEffect.HasCumInsideMouth)):
#		text += "Some cum is dripping down from your lip. It’s quite obvious to anyone who sees you that you did oral sex not that long ago. "
#		text += "\n\n"
#
#	if(RNG.chance(50) && character.hasEffect(StatusEffect.CoveredInCum)):
#		text += "Your face is covered with someone’s fluids, you’re looking like quite a wet mess right now. When you stick out your tongue, you get a little taste of it. "
#		text += "\n\n"
#
#	if(RNG.chance(50) && character.isBlindfolded()):
#		text += "The fact that you’re blindfolded only makes your actions look more hot. "
#		text += "\n\n"

	return {
		text = text.replace("<npc>", character.getID()),
		lust = 1,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.1,
		InterestTopic.MasculineBody : 0.1,
		InterestTopic.AndroBody : 0.1,
		InterestTopic.ThickBody : 0.2,
		InterestTopic.SlimBody : 0.2,
		InterestTopic.AverageMassBody : 0.2,
		InterestTopic.StuffedThroat : 1.0,
		InterestTopic.CoveredInCum : 0.8,
		InterestTopic.CoveredInLotsOfCum : 0.6,
		InterestTopic.FullyNaked : 0.5,
		InterestTopic.ExposedPanties : 0.2,
		InterestTopic.ExposedBra : 0.2,
		InterestTopic.TallyMarks : 0.5,
		InterestTopic.Bodywritings : 0.5,
		InterestTopic.Gags : 0.5,
		InterestTopic.Blindfolds : 0.8,
		InterestTopic.BDSMRestraints : 0.3,
	}

func getPriority():
	return 0

func isTease():
	return true

func getExperience(_lustState: LustCombatState, _args):
	return null
	
func getVisibility():
	return -10 # to avoid triggering visibility checks. as that mechanic is for the player
