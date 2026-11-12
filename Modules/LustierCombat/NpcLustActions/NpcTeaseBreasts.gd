extends LustAction

func _init():
	id = "NpcTeaseBreasts"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(_lustState.getCharacter() == GM.pc):
		return false
	if(_lustState.isDoingActivity(LustActivity.GropingChest)):
		return false
	var character = _lustState.getCharacter()
	if(!character.hasBodypart(BodypartSlot.Breasts) || !character.isBodypartCovered(BodypartSlot.Breasts)):
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
	return "NpcTeaseBreasts"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "You should not see this"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(3)
	var character = _lustState.getCharacter()
	
	var text = ""
	if(RNG.chance(50)):
		text += "{<npc>.name} grips {<npc>.their} chest and bounces {<npc>.their} {<npc>.breastsSize} {<npc>.breasts}, then gives them a squeeze and tease, trying to distract {pc.name}. "
#		text += "\n\n"
	else:
		text += "{<npc>.name} places {<npc>.their} hands on {<npc>.their} shoulders, then slides them down to gently and sensually cup {<npc>.hisHer} {<npc>.breastsSize} mounds. {<npc>.name} continues to caress {<npc>.their} chest while watching {pc.name} for a reaction. "
#		text += "\n\n"
#
#	if(RNG.chance(30) && _lustState.isInBattle()):
#		text += "You try to be turned slightly away from the enemy, just so your teasing has a bigger effect, they don’t have to see you kneading your tits, your noises alone would make anyone horny. "
#		text += "\n\n"
#
#	if(RNG.chance(50) && character.hasEffect(StatusEffect.CoveredInCum)):
#		text += "You are covered in cum, including your tits, it feels so good to knead them while little drops of cum slide down your fingers. "
#		text += "\n\n"
#
#	if(character.hasVagina() && character.getLust() >= 50):
#		text += "Teasing your breasts makes you so wet down there, your pussy is leaking with so much female juices.. You don’t stop, you can’t help but to let out a quiet moan. "
#		text += "\n\n"
#
#	if(RNG.chance(30) && character.canBeMilked()):
#		text += "You spot a few dark spots appearing on your clothing, your {pc.breasts} are lactating! You find your nips and press on them a little more, squeezing out more {pc.milk} and making the damp spots bigger. "
#		text += "\n\n"
	
	if(RNG.chance(50)):
		text += RNG.pick([
			"[say=<npc>]Do you like how {<npc>.breastsSize} they are?[/say]",
			"[say=<npc>]It's getting warm in here...should I free the titties?[/say]",
			"[say=<npc>]Mmmph, ahhhh, so soft..[/say]",
			"[say=<npc>]Oh fuck me..[/say]",
		])
#		text += "\n\n"
		
#		if(_lustState.isInPublic() && !_lustState.isInBattle()):
#			text += "You hope no one heard that.. You try to keep your mouth shut but it feels so good.. "
#			text += "\n\n"

	return {
		text = text.replace("<npc>", character.getID()),
		lust = 1,
	}

func getLustTopics():
	return {
		InterestTopic.BigBreasts : 1.0,
		InterestTopic.SmallBreasts : 1.0,
		InterestTopic.MediumBreasts : 1.0,
		InterestTopic.NoBreasts : 1.0,
		InterestTopic.LactatingBreasts : 0.3,
		InterestTopic.CoveredInCum : 0.3,
		InterestTopic.CoveredInLotsOfCum : 0.2,
		InterestTopic.FullyNaked : 0.4,
		InterestTopic.ExposedPussy : 0.2,
		InterestTopic.ExposedBreasts : 0.4,
		InterestTopic.ExposedCock : 0.2,
		InterestTopic.ExposedPanties : 0.1,
		InterestTopic.ExposedBra : 0.5,
		InterestTopic.TallyMarks : 0.3,
		InterestTopic.Bodywritings : 0.5,
		InterestTopic.BDSMRestraints : 0.2,
	}

func getPriority():
	return 0

func isTease():
	return true

func getExperience(_lustState: LustCombatState, _args):
	return null # npc skill experience is not tracked

func getVisibility():
	return -10 # to avoid triggering visibility checks. as that mechanic is for the player
