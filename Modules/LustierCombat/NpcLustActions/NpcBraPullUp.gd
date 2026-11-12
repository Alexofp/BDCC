extends LustAction

func _init():
	id = "NpcBraPullUp"
	
func shouldShow(_lustState: LustCombatState, _args):
	
	if(_lustState.getCharacter() == GM.pc):
		return false
	if(_lustState.isInventorySlotBlocked(InventorySlot.UnderwearTop)):
		return false
	var character = _lustState.getCharacter()
	if(character.hasBlockedHands()):
		return false
	var itemState: BraState = _args["itemState"]
	if(itemState.isBraPulledUp() || itemState.isRemoved()):
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
	return "NpcBraPullUp"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "You should not see this"

func doAction(_lustState: LustCombatState, _args):
	var character:BaseCharacter = _lustState.getCharacter()
	var _item:ItemBase = character.getInventory().getFirstItemThatCoversBodypart(BodypartSlot.Breasts)
	
	var itemState:BraState = _item.getItemState()
	itemState.pullBraUp()
	
	
	var text = ""
	if(character.hasNonFlatBreasts()):
		text += "{<npc>.name} suddenly clutches at {<npc>.their} chest, as if injured, but it was merely a trick as {<npc>.heShe} grips and slips {<npc>.their} <casualName> out of the way, emphasizing {<npc>.their} lovely {<npc>.breasts} and giving them a sensual jiggle! "
#		text += "\n\n"
	elif(!character.hasNonFlatBreasts()):
		text += "{<npc>.name} fondles {<npc>.their} petite mounds, then quickly decides to go further by smoothly pulling {<npc>.their} <casualName> up! There's not much of a bounce, but {<npc>.their} nipples are hard and the view is still extremely hot! "
#		text += "\n\n"
		
#	if(RNG.chance(40) && character.canBeMilked()):
#		text += "Your breasts seem to have quite some weight to them, you can spot a few drops of {pc.milk} streaming down them. They are itching to be milked. "
#		text += "\n\n"
#
#	if(RNG.chance(30) && character.hasBodywritings()):
#		text += "While undressing yourself, you expose more of your body writings for anyone to see, kinky. "
#		text += "\n\n"
#
#	if(RNG.chance(20) && character.hasEffect(StatusEffect.CoveredInCum)):
#		text += "Cum is dripping from your {pc.breasts} as you stand still even, it’s obvious at a glance that you had quite some fun with others. "
#		text += "\n\n"
	
	return {
		text = text.replace("<casualName>", itemState.casualName).replace("<npc>", character.getID())
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
