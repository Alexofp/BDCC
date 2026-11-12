extends LustAction

func _init():
	id = "NpcUniformExposeChest"
	
func shouldShow(_lustState: LustCombatState, _args):
	if(_lustState.getCharacter() == GM.pc):
		return false
	if(_lustState.isInventorySlotBlocked(InventorySlot.Body)):
		return false
		
	var itemState: ShirtAndShortsState = _args["itemState"]
	if(itemState.isShirtOpened()):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	#var itemState: ShirtAndShortsState = _args["itemState"]
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
	return "NpcUniformExposeChest"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "You should not see this"

func doAction(_lustState: LustCombatState, _args):
	var character:BaseCharacter = _lustState.getCharacter()
	var _item:ItemBase = character.getInventory().getFirstItemThatCoversBodypart(BodypartSlot.Body)
	
	var itemState:ShirtAndShortsState = _item.getItemState()
	itemState.openShirt()
	
	
	var text = ""
	if(!character.isBodypartCovered(BodypartSlot.Breasts)):
		text += "{<npc>.name} swiftly tugs at {<npc>.their} uniform shirt. After a moment, {<npc>.heShe} turns to {pc.name} and spreads {<npc>.their} arms wide, revealing {<npc>.their} {<npc>.breastsSize} chest! "
#		text += "\n\n"
		
		if(RNG.chance(50) && character.hasNonFlatBreasts()):
			text += RNG.pick([
				"[say=<npc>]I see you looking, {pc.name}.. Makes me so horny~[/say]",
				"[say=<npc>]Look if you want, to, {pc.name}.. I don't mind.[/say]",
			])
#			text += "\n\n"
	else:
		text += "{<npc>.name} fiddles with the buttons of {<npc>.their} shirt, eager to flash {<npc>.their} {<npc>.masc} curves and chest! "
#		text += "\n\n"

#	if(character.hasEffect(StatusEffect.CoveredInCum)):
#		text += "Opening the shirt up reveals how much cum you also have underneath it on your {pc.breasts}, you’re so messy~"
#		text += "\n\n"
#
#	if(RNG.chance(50) && character.isVisiblyPregnant()):
#		text += "Your belly is looking quite pregnant, with no shirt it’s even more obvious that you’re carrying someone’s litter! "
#		text += "\n\n"
#
#	if(_lustState.isInBattle()):
#		text += "The enemy seems to be watching your hands carefully. And you’re ready to make a show for them. "
#		text += "\n\n"
	
	return {
		text = text.replace("<npc>", character.getID()),
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.1,
		InterestTopic.MasculineBody : 0.1,
		InterestTopic.AndroBody : 0.1,
		InterestTopic.ThickBody : 0.1,
		InterestTopic.SlimBody : 0.1,
		InterestTopic.AverageMassBody : 0.1,
		InterestTopic.BigBreasts : 0.4,
		InterestTopic.SmallBreasts : 0.4,
		InterestTopic.MediumBreasts : 0.4,
		InterestTopic.NoBreasts : 0.4,
		InterestTopic.LactatingBreasts : 0.1,
		InterestTopic.CoveredInCum : 0.1,
		InterestTopic.CoveredInLotsOfCum : 0.1,
		InterestTopic.FullyNaked : 0.1,
		InterestTopic.ExposedBreasts : 0.1,
		InterestTopic.ExposedBra : 0.1,
		InterestTopic.Bodywritings : 0.1,
		InterestTopic.BDSMRestraints : 0.1,
	}

func getPriority():
	return 1

func isTease():
	return true

func getExperience(_lustState: LustCombatState, _args):
	return null # npc skill experience is not tracked

func getVisibility():
	return -10 # to avoid triggering visibility checks. as that mechanic is for the player
