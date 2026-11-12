extends LustAction

func _init():
	id = "NpcUniformShakeShortsOff"
	
func shouldShow(_lustState: LustCombatState, _args):
	if(_lustState.getCharacter() == GM.pc):
		return false
	if(_lustState.isInventorySlotBlocked(InventorySlot.Body)):
		return false
	
	var itemState: ShirtAndShortsState = _args["itemState"]
	if(itemState.areShortsPulledDown()):
		return false
		
	var character = _lustState.getCharacter()
	if(!character.hasBlockedHands() && !character.hasBoundArms()):
		return false
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "NpcUniformShakeShortsOff"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "You should not see this"

func doAction(_lustState: LustCombatState, _args):
	var character:BaseCharacter = _lustState.getCharacter()
	var _item:ItemBase = character.getInventory().getFirstItemThatCoversBodypart(BodypartSlot.Body)
	
	var itemState:ShirtAndShortsState = _item.getItemState()
	itemState.pullDownShorts()

	
	var text = ""
	if(!character.isBodypartCovered(BodypartSlot.Anus)):
		text += "{<npc>.name} wiggles {<npc>.their} hips, trying to remove {<npc>.their} shorts.  It takes a moment but soon {<npc>.heShe} has exposed what's underneath. "
#		text += "\n\n"
		
		if(character.hasPenis()):
			text += "{<npc>.nameS} {<npc>.cock} is fully exposed, pulsing with the promise of a powerful pounding! "
#			text += "\n\n"
		
		if(character.hasVagina()):
			text += "{<npc>.nameS} pretty pussy shines with liquid lust, a snug and inviting hole presented to {pc.name}! "
#			text += "\n\n"
			
			
	else:
		text += "{<npc>.name} struggles and shakes until {<npc>.their} underwear is fully exposed, {<npc>.their} shorts are discarded on the floor. "
#		text += "\n\n"
	
	if(character.hasEffect(StatusEffect.CoveredInCum)):
		text += "Pulling down the shorts reveals how messy {<npc>.name} is, {<npc>.heShe} {<npc>.isAre} stick and dripping! "
#		text += "\n\n"
	
	if(!character.isBodypartCovered(BodypartSlot.Anus) && (character.hasEffect(StatusEffect.HasCumInsideVagina) || character.hasEffect(StatusEffect.HasCumInsideAnus))):
		text += "A thick droplet of cum rolls down {<npc>.their} thigh, anyone can tell how busy {<npc>.name} must have been. "
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
