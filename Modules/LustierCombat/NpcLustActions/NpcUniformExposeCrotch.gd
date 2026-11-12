extends LustAction

func _init():
	id = "NpcUniformExposeCrotch"
	
func shouldShow(_lustState: LustCombatState, _args):
	if(_lustState.getCharacter() == GM.pc):
		return false
	if(_lustState.isInventorySlotBlocked(InventorySlot.Body)):
		return false
		
	var itemState: ShirtAndShortsState = _args["itemState"]
	if(itemState.areShortsPulledDown()):
		return false
	
	var character = _lustState.getCharacter()
	if(character.hasBoundArms() || character.hasBlockedHands()):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	#var itemState: ShirtAndShortsState = _args["itemState"]
#	var character = _lustState.getCharacter()
#	if(character.hasBoundArms()):
#		return [false, "You can't do that with bound arms"]
#	if(character.hasBlockedHands()):
#		return [false, "You can't do that with blocked hands"]
	if(_lustState.getCharacter() == GM.pc):
		return .canDo(_lustState, _args)
	else:
		var _fudge = .canDo(_lustState, _args)
		if(typeof(_fudge) == TYPE_ARRAY):
			return _fudge[0]
		else:
			return _fudge

func getVisibleName(_lustState: LustCombatState, _args):
	return "NpcUniformExposeCrotch"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "You should not see this"

func doAction(_lustState: LustCombatState, _args):
	var character:BaseCharacter = _lustState.getCharacter()
	var _item:ItemBase = character.getInventory().getFirstItemThatCoversBodypart(BodypartSlot.Body)
	
	var itemState:ShirtAndShortsState = _item.getItemState()
	itemState.pullDownShorts()
	
	var text = ""
	if(!character.isBodypartCovered(BodypartSlot.Anus)):
		text += "{<npc>.name} teases the waist of {<npc>.their} shorts, then pulls them down with a sexy shimmy, revealing {<npc>.their} obvious arousal! "
#		text += "\n\n"
		
		if(character.hasPenis()):
			text += "{<npc>.nameS} {<npc>.cock} is fully exposed, pulsing with the promise of a powerful pounding. "
#			text += "\n\n"
		
		if(character.hasVagina()):
			text += "{<npc>.nameS} pretty pussy shines with liquid lust, a snug and inviting hole presented to {pc.name}! "
#			text += "\n\n"
			
			
	else:
		text += "{<npc>.name} grips {<npc>.their} shorts and tugs the waistband over one hip, then the other. Soon, {<npc>.heShe} exposes {<npc>.their} underwear. "
#		text += "\n\n"
	
	if(character.hasEffect(StatusEffect.CoveredInCum)):
		text += "Pulling down the shorts reveals how messy {<npc>.name} is, {<npc>.heShe} {<npc>.isAre} sticky and dripping! "
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
	return 1 # SET THIS BACK TO 1 AFTER TESTING

func isTease():
	return true

func getExperience(_lustState: LustCombatState, _args):
	return null # npc skill experience is not tracked

func getVisibility():
	return -10 # to avoid triggering visibility checks. as that mechanic is for the player
