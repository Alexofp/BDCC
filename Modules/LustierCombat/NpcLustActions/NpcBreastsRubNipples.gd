extends LustAction

func _init():
	id = "NpcBreastsRubNipples"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(_lustState.getCharacter() == GM.pc):
		return false
	var character = _lustState.getCharacter()
	if(!character.hasBodypart(BodypartSlot.Breasts) || character.isBodypartCovered(BodypartSlot.Breasts)):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	var character = _lustState.getCharacter()
	if(character.hasBoundArms()):
		return false
	if(character.hasBlockedHands()):
		return false
	if(_lustState.getCharacter() == GM.pc):
		return .canDo(_lustState, _args)
	else:
		var _fudge = .canDo(_lustState, _args)
		if(typeof(_fudge) == TYPE_ARRAY):
			return _fudge[0]
		else:
			return _fudge

func getVisibleName(_lustState: LustCombatState, _args):
	return "NpcBreastsRubNipples"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "You should not see this"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(3)

	var character = _lustState.getCharacter()
	
	
	var text = ""
	if(RNG.chance(50)):
		text += "{<npc>.name} gives {<npc>.their} hard nipples a teasing flick, then doubles down and straight up fondles {<npc>.their} {<npc>.breasts}. The air fills with sexy moans, clearly not faked but still calculated to get a reaction out of {pc.name}! "
#		text += "\n\n"
	else:
		text += "{<npc>.name} covers {<npc>.their} chest, as if suddenly ashamed, but instead {<npc>.heShe} {<npc>.isAre} touching and teasing {<npc>.their} stiff nipples! {pc.name} watches the lusty display, distracted by {<npc>.nameS} boldness! "
#		text += "\n\n"
	
#	if(RNG.chance(30) && character.hasEffect(StatusEffect.CoveredInCum)):
#		text += "Your body is so messy, the view of you playing with your nips while someone’s cum is dripping from them is so lewd. "
#		text += "\n\n"
#
#	if(RNG.chance(50) && _lustState.isInBattle()):
#		text += "The opponent is watching you and you hope you’re offering a good show for them. "
#		text += "\n\n"
#
#	if(RNG.chance(30) && character.hasVagina()):
#		text += "Having your nips rubbed makes your cute {pc.pussyStretch} pussy get wet with even more pussy juices. "
#		text += "\n\n"
#
#	if(RNG.chance(20) && !character.canBeMilked()):
#		text += "You are not lactating but you feel like you can get used to these kinds of sensations, it feels so good to have your nips stimulated like this. "
#		text += "\n\n"
#
#	if(character.stimulateLactation()):
#		text += "[b]Your {pc.breasts} leak with some {pc.milk}, you began lactating![/b]"
#		text += "\n\n"

	return {
		text = text.replace("<npc>", character.getID()),
		lust = 3,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.1,
		InterestTopic.MasculineBody : 0.1,
		InterestTopic.AndroBody : 0.1,
		InterestTopic.ThickBody : 0.1,
		InterestTopic.SlimBody : 0.1,
		InterestTopic.AverageMassBody : 0.1,
		InterestTopic.BigBreasts : 0.9,
		InterestTopic.SmallBreasts : 0.9,
		InterestTopic.MediumBreasts : 0.9,
		InterestTopic.NoBreasts : 0.9,
		InterestTopic.LactatingBreasts : 0.1,
		InterestTopic.CoveredInCum : 0.2,
		InterestTopic.CoveredInLotsOfCum : 0.1,
		InterestTopic.FullyNaked : 0.5,
		InterestTopic.ExposedBreasts : 0.4,
		InterestTopic.ExposedBra : 0.4,
		InterestTopic.Bodywritings : 0.2,
		InterestTopic.BDSMRestraints : 0.2,
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
