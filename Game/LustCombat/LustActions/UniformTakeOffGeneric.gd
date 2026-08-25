extends LustAction

func _init():
	id = "UniformTakeOffGeneric"
	
func shouldShow(_lustState: LustCombatState, _args):
	var itemState: SimpleRemoveState = _args["itemState"]
	var theSlot:String = itemState.checkedInvSlot
	if(!theSlot.empty() && _lustState.isInventorySlotBlocked(theSlot)):
		return false
		
	if(itemState.isRemoved()):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	#var itemState: ShirtAndShortsState = _args["itemState"]
#	var pc:Player = _lustState.getCharacter()
#	if(pc.hasBoundArms()):
#		return [false, "You can't do that with bound arms"]
#	if(pc.hasBlockedHands()):
#		return [false, "You can't do that with blocked hands"]
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	var itemState: SimpleRemoveState = _args["itemState"]
	return "Take "+itemState.casualName+" off"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Take it off fully!"

func doAction(_lustState: LustCombatState, _args):
	var _item:ItemBase = getItem(_lustState, _args)
	
	var itemState: SimpleRemoveState = _args["itemState"]
	if(itemState.doAppearanceUpdateOnRemove):
		itemState.remove()
	else:
		itemState.removeNoAppearanceUpdate()
	
	var pc:Player = _lustState.getCharacter()
	
	var text := "You take off your "+itemState.casualName+" completely! "

	if(pc.hasEffect(StatusEffect.CoveredInCum)):
		text += "Opening up reveals how messy you are~."
		text += "\n\n"
	
#	if(RNG.chance(50) && pc.isVisiblyPregnant()):
#		text += "Your belly is looking quite pregnant, with no shirt it’s even more obvious that you’re carrying someone’s litter!"
#		text += "\n\n"
	
	if(_lustState.isInBattle()):
		text += "The enemy seems to be watching your hands carefully. And you’re ready to make a show for them."
		text += "\n\n"
	
	return {
		text = text,
		anim = itemState.revealAnim,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.4,
		InterestTopic.MasculineBody : 0.4,
		InterestTopic.AndroBody : 0.4,
		InterestTopic.ThickBody : 0.4,
		InterestTopic.SlimBody : 0.4,
		InterestTopic.AverageMassBody : 0.4,
		InterestTopic.BigBreasts : 0.4,
		InterestTopic.SmallBreasts : 0.4,
		InterestTopic.MediumBreasts : 0.4,
		InterestTopic.NoBreasts : 0.4,
		InterestTopic.LactatingBreasts : 0.4,
		InterestTopic.CoveredInCum : 0.4,
		InterestTopic.CoveredInLotsOfCum : 0.4,
		InterestTopic.FullyNaked : 0.4,
		InterestTopic.ExposedBreasts : 0.4,
		InterestTopic.ExposedBra : 0.4,
		InterestTopic.Bodywritings : 0.4,
		InterestTopic.BDSMRestraints : 0.4,
	}

func getPriority():
	return -4

func isTease():
	return true

func skillNeeded():
	return 1

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 1]]
	return []
