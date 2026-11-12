extends LustAction

func _init():
	id = "NpcPantiesMoveAside"
	
func shouldShow(_lustState: LustCombatState, _args):
	if(_lustState.getCharacter() == GM.pc):
		return false
	if(_lustState.isInventorySlotBlocked(InventorySlot.UnderwearBottom)):
		return false
	var character = _lustState.getCharacter()
	if(character.hasBlockedHands()):
		return false
	var itemState: PantiesState = _args["itemState"]
	if(itemState.arePantiesShiftedAside() || itemState.isRemoved()):
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
	return "NpcPantiesMoveAside"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "You should not see this"

func doAction(_lustState: LustCombatState, _args):
	var character:BaseCharacter = _lustState.getCharacter()
	var _item:ItemBase = character.getInventory().getFirstItemThatCoversBodypart(BodypartSlot.Anus)
	
	var itemState:PantiesState = _item.getItemState()
	itemState.shiftPantiesAside()
	
	var text = ""
	if(true):
		text += "{<npc>.name} tugs aside {<npc>.their} panties, revealing {<npc>.their} obvious arousal! "
#		text += "\n\n"
		
	if(character.hasPenis()):
		text += "{<npc>.nameS} {<npc>.cock} is fully exposed, pulsing with the promise of a powerful pounding. "
#		text += "\n\n"
	
	if(character.hasVagina()):
		text += "{<npc>.nameS} pretty pussy shines with liquid lust, a snug and inviting hole presented to {pc.name}! "
#		text += "\n\n"
		
	if(RNG.chance(50) && (character.hasEffect(StatusEffect.HasCumInsideVagina) || character.hasEffect(StatusEffect.HasCumInsideAnus))):
		text += "A thick droplet of cum rolls down {<npc>.their} thigh, anyone can tell how busy {<npc>.name} must have been. "
#		text += "\n\n"
		
#	if(RNG.chance(70) && character.getLust() >= 50 && character.hasVagina()):
#		text += "Wow, your pussy is very much drenched with your juices, all the horny thoughts in your head only make you drip more. "
#		text += "\n\n"
	
	if(RNG.chance(50) && character.hasVagina() && character.hasEffect(StatusEffect.InHeat)):
		text += "Their arousal is so strong, you can practically smell it. "
#		text += "\n\n"
		
	if(RNG.chance(30) && character.hasVagina()):
		text += RNG.pick([
			"[say=<npc>]Take a good long look, {pc.name}. I'm wet and ready for you...[/say]",
			"[say=<npc>]So messy...[/say]",
			"[say=<npc>]Mmmm, so freeing~[/say]",
		])
#		text += "\n\n"
	
	return {
		text = text.replace("<npc>", character.getID()),
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.2,
		InterestTopic.MasculineBody : 0.2,
		InterestTopic.AndroBody : 0.2,
		InterestTopic.ThickButt : 0.2,
		InterestTopic.AverageButt : 0.2,
		InterestTopic.SlimButt : 0.2,
		InterestTopic.NoVagina : 0.5,
		InterestTopic.HasVaginaOnly : 0.5,
		InterestTopic.HasVaginaAndCock : 0.2,
		InterestTopic.BigCock : 0.5,
		InterestTopic.AverageCock : 0.5,
		InterestTopic.SmallCock : 0.5,
		InterestTopic.NoCock : 0.5,
		InterestTopic.HasCockOnly : 0.2,
		InterestTopic.StuffedPussy : 0.4,
		InterestTopic.StuffedAss : 0.4,
		InterestTopic.StuffedPussyOrAss : 0.2,
		InterestTopic.FullyNaked : 0.2,
		InterestTopic.ExposedPussy : 0.4,
		InterestTopic.ExposedAnus : 0.4,
		InterestTopic.ExposedCock : 0.4,
		InterestTopic.ExposedPanties : 0.3,
		InterestTopic.LooseAnus : 0.1,
		InterestTopic.LoosePussy : 0.1,
		InterestTopic.TightAnus : 0.1,
		InterestTopic.TightPussy : 0.1,
		InterestTopic.ButtPlugs : 0.2,
		InterestTopic.VaginalPlugs : 0.2,
	}

func getPriority():
	return 1

func isTease():
	return true

func getExperience(_lustState: LustCombatState, _args):
	return null # npc skill experience is not tracked

func getVisibility():
	return -10 # to avoid triggering visibility checks. as that mechanic is for the player
