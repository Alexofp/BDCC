extends LustAction

func _init():
	id = "NpcAnalSpreadOpen"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(_lustState.getCharacter() == GM.pc):
		return false
	var character = _lustState.getCharacter()
	if(!character.hasBodypart(BodypartSlot.Anus) || character.isBodypartCovered(BodypartSlot.Anus)):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	var character = _lustState.getCharacter()
	if(character.hasBoundArms()):
		return false
	#if(character.hasBlockedHands()):
	#	return [false, "You can't do that with blocked hands"]
	if(_lustState.getCharacter() == GM.pc):
		return .canDo(_lustState, _args)
	else:
		var _fudge = .canDo(_lustState, _args)
		if(typeof(_fudge) == TYPE_ARRAY):
			return _fudge[0]
		else:
			return _fudge


func getVisibleName(_lustState: LustCombatState, _args):
	return "NpcAnalSpreadOpen"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "You should not see this"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(3)

	var character = _lustState.getCharacter()
	
	var text = ""
	if(RNG.chance(50)):
		text += "{<npc>.name} steps back out of reach for a moment, then grips {<npc>.his} {<npc>_thick}, enticing {<npc>.butt} before presenting it. Now {pc.name} has a perfect view of their {<npc>.analStretch} asshole! "
#		text += "\n\n"
	else:
		text += "{<npc>.name} deftly turns around and poses, arching {<npc>.his} back just enough to fully expose {<npc>.his} {<npc>.asshole} in a highly tempting manner! "
#		text += "\n\n"
	
#	if(RNG.chance(50) && _lustState.isInBattle()):
#		text += "You provide such a great view of your fuckhole, there is no way your opponent’s attention wasn’t stolen by your lewd action. "
#		text += "\n\n"
#
#	if(RNG.chance(30) && character.hasEffect(StatusEffect.HasCumInsideAnus)):
#		text += "Wow, as you hold your butt spread open, more and more jizz leaks out of it, messing up your thighs and dripping down to the floor. "
#		text += "\n\n"
#
#	if(RNG.chance(30) && character.getLust() >= 50):
#		text += "You are so horny that you start to sway your hips and moan just from the thought of somebody using your tailhole. "
#		text += "\n\n"

	return {
		text = text.replace("<npc>", character.getID()),
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
	return 1

func isTease():
	return true

func getExperience(_lustState: LustCombatState, _args):
	return null # npc skill experience is not tracked

func getVisibility():
	return -10 # to avoid triggering visibility checks. as that mechanic is for the player
