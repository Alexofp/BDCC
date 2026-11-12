extends LustAction

func _init():
	id = "NpcTeaseCock"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(_lustState.getCharacter() == GM.pc):
		return false
	if(_lustState.isDoingActivity(LustActivity.StrokingCock)):
		return false
	var character = _lustState.getCharacter()
	if(!character.hasBodypart(BodypartSlot.Penis) || !character.isBodypartCovered(BodypartSlot.Penis)):
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
	return "NpcTeaseCock"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "You should not see this"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(3)
	var character = _lustState.getCharacter()
	
	var cantCum = false
	
	var text = ""
	if(character.isWearingChastityCage()):
		cantCum = true
		if(RNG.chance(50)):
			text += "{<npc>.name} makes a sad noise as {<npc>.heShe} tries to desperately tease {<npc>.their} {<npc>.cock} through {<npc>.their} cage. It's almost pathetic, but that just makes it hotter to watch. "
#			text += "\n\n"
		else:
			text += "{<npc>.name} tries to rub at {<npc>.their} groin, but {pc.name} can tell there is a cage under the clothing. {<npc>.name} makes a cute noise of frustration. "
#			text += "\n\n"
	else:
		if(RNG.chance(50)):
			text += "{<npc>.name} thrusts {<npc>.hisHer} {<npc>.masc} hips out and paws at {<npc>.their} noticeable bulge, grinding against the air in an appealing way. "
#			text += "\n\n"
		else:
			text += "{<npc>.name} proudly spreads {<npc>.their} legs and gives {pc.name} a sexy show as {<npc>.heShe} slowly strokes {<npc>.hisHer} covered-up cock. "
#			text += "\n\n"
	
#	if(RNG.chance(50) && _lustState.isInBattle()):
#		text += "You offer the enemy a good view of your bulge as you rub yourself. You smirk, hoping that they like the show. "
#		text += "\n\n"
#
#	if(RNG.chance(20) && character.hasEffect(StatusEffect.CoveredInCum)):
#		text += "So much cum on your body.. You catch some with your fingers and use it as lube, don’t wanna waste the good stuff. "
#		text += "\n\n"
#
#	if(RNG.chance(30) && character.getLust() >= 50):
#		text += "Your cock is so drippy, you feel it twitching slightly as it leaks more and more pre, leaving dark spots on your clothing. "
#		text += "\n\n"
#
#	if(RNG.chance(20) && character.hasVagina()):
#		text += "As you tease your cock, your slit is getting more needy and wet, you feel how cloth is digging into it as you rub your crotch. You can’t hide the moans. "
#		text += "\n\n"
	
	if(RNG.chance(50)):
		if(character.isWearingChastityCage()):
			text += RNG.pick([
				"[say=<npc>]Huff.. Stupid cage..[/say]",
				"[say=<npc>]Fuck, can't even get hard..[/say]",
				"[say=<npc>]This damn cage.. need to remove it..[/say]",
				"[say=<npc>]Dammit..[/say]",
			])
		else:
			text += RNG.pick([
				"[say=<npc>]Hell yeah, you wanna see?[/say]",
				"[say=<npc>]Mmmm, so good..[/say]",
				"[say=<npc>]Get ready, {pc.name}.. this is going inside you..[/say]",
				"[say=<npc>]You better prepare your holes..[/say]",
			])
#		text += "\n\n"
#		if(_lustState.isInPublic() && !_lustState.isInBattle()):
#			text += "You hope no one heard that.. You try to keep your mouth shut. "
#			text += "\n\n"

	return {
		text = text.replace("<npc>", character.getID()),
		lust = 1,
		cantCum = cantCum,
	}

func getLustTopics():
	return {
		InterestTopic.HasVaginaAndCock : 0.2,
		InterestTopic.BigCock : 1.0,
		InterestTopic.AverageCock : 1.0,
		InterestTopic.SmallCock : 1.0,
		InterestTopic.NoCock : 1.0,
		InterestTopic.HasCockOnly : 0.2,
		InterestTopic.FullyNaked : 0.4,
		InterestTopic.ExposedCock : 0.4,
		InterestTopic.ExposedPanties : 0.4,
		InterestTopic.BDSMRestraints : 0.2,
	}

func getPriority():
	return 0

func isTease():
	return true

func getExperience(_lustState: LustCombatState, _args):
	return null
	
func getVisibility():
	return -10 # to avoid triggering visibility checks. as that mechanic is for the player

