extends LustAction

func _init():
	id = "NpcTeasePussy"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(_lustState.getCharacter() == GM.pc):
		return false
	if(_lustState.isDoingActivity(LustActivity.SpreadingPussy)):
		return false
	var character = _lustState.getCharacter()
	if(!character.hasBodypart(BodypartSlot.Vagina) || !character.isBodypartCovered(BodypartSlot.Vagina)):
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
	return "NpcTeasePussy"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "You should not see this"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(3)
	var character = _lustState.getCharacter()
	
	var text = ""
	if(RNG.chance(50)):
		text += "{<npc>.name} begins to hump the air, one hand pressing down to provide sweet friction against {<npc>.their} clit. The sway of {npc.their} {<npc>.thick} body teases {pc.name} with sensual sensation. "
#		text += "\n\n"
	else:
		text += "{<npc>.name} slides one hand down {<npc>.their} {<npc>.thick} stomach, coming to a rest above {<npc>.their} horny {<npc>.pussy}. {<npc>.name} moans and targets {<npc>.their} pleasure spots, hoping to distract {pc.name}. "
#		text += "\n\n"
		
		
#	if(RNG.chance(50) && character.hasEffect(StatusEffect.HasCumInsideVagina)):
#		text += "As you continue to rub your slit through the clothing, some fluids leak out. Fluids from your previous lovers, they leave dark spots on the cloth and slide down your {pc.masc} thighs. You’re such a mess~. "
#		text += "\n\n"
#
#	if(RNG.chance(20) && character.hasEffect(StatusEffect.CoveredInCum)):
#		text += "So much cum on your body.. You catch some with your fingers and rub it into your crotch, can’t let so much good stuff go to waste. "
#		text += "\n\n"
#
	if(RNG.chance(30) && character.getLust() >= 50):
		text += "{<npc>.nameS} crotch now has a dark spot, {pc.name} can only imagine how soaked {<npc>.their} needy fuckhole is getting! "
#		text += "\n\n"
#
#	if(RNG.chance(20) && character.hasPenis()):
#		text += "As you tease your cunt, your {pc.cock} is only getting harder and leaking more precum, creating another damp spot on the cloth. "
#		text += "\n\n"
	
	if(RNG.chance(50)):
		text += RNG.pick([
			"[say=<npc>]Oh, fuck yesss~[/say]",
			"[say=<npc>]Oh shit.. I'm so wet right now..[/say]",
			"[say=<npc>]Think you can handle this pussy, {pc.name?}[/say]",
			"[say=pc]Mmmmm..I need more..[/say]",
		])
#		text += "\n\n"
		
	return {
		text = text.replace("<npc>", character.getID()),
		lust = 1,
	}

func getLustTopics():
	return {
		InterestTopic.HasVaginaOnly : 0.8,
		InterestTopic.HasVaginaAndCock : 0.8,
		InterestTopic.StuffedPussy : 0.7,
		InterestTopic.StuffedPussyOrAss : 0.4,
		InterestTopic.CoveredInCum : 0.4,
		InterestTopic.CoveredInLotsOfCum : 0.2,
		InterestTopic.FullyNaked : 0.3,
		InterestTopic.ExposedPussy : 0.6,
		InterestTopic.ExposedBreasts : 0.3,
		InterestTopic.ExposedCock : 0.3,
		InterestTopic.ExposedPanties : 0.7,
		InterestTopic.ExposedBra : 0.5,
		InterestTopic.LoosePussy : 0.3,
		InterestTopic.TightPussy : 0.3,
		InterestTopic.VaginalPlugs : 0.7,
	}

func getPriority():
	return 0

func isTease():
	return true

func getExperience(_lustState: LustCombatState, _args):
	return null # npc skill experience is not tracked

func getVisibility():
	return -10 # to avoid triggering visibility checks. as that mechanic is for the player
