extends LustAction

func _init():
	id = "BraShakeOff"
	
func shouldShow(_lustState: LustCombatState, _args):
	if(_lustState.isInventorySlotBlocked(InventorySlot.UnderwearTop)):
		return false
	var pc: Player = _lustState.getCharacter()
	if(!pc.hasBlockedHands()):
		return false
	var itemState: BraState = _args["itemState"]
	if(itemState.isRemoved()):
		return false
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	var itemState: BraState = _args["itemState"]
	return "Shake "+itemState.casualName+" off"

func getVisibleDescription(_lustState: LustCombatState, _args):
	#var itemState: BraState = _args["itemState"]
	return "Since you can’t reach with your hands, you have to shake it off"

func doAction(_lustState: LustCombatState, _args):
	var _item:ItemBase = getItem(_lustState, _args)
	
	var itemState: BraState = _args["itemState"]
	itemState.remove()
	
	var pc:Player = _lustState.getCharacter()
	
	var text = ""
	if(_lustState.isInBattle() && pc.hasNonFlatBreasts()):
		text += "You act quick and use your time to try and shake off your <casualName>. The opponent seems to be quite intrigued by what you are trying to do. Your {pc.breasts} sway in the air and playfully bounce until finally escaping from under the fabric. You pant softly after such an arousing act, your nips felt quite some friction while you were shaking your chest."
		text += "\n\n"
	elif(_lustState.isInBattle() && !pc.hasNonFlatBreasts()):
		text += "You act quick and use your time to try and shake off your <casualName>. The opponent seems to be quite intrigued by what you are trying to do. It is quite a struggle but in the end you manage to make the cloth slip up enough to uncover your {pc.breasts}. You pant softly after such an arousing act, your nips felt quite some friction while you were shaking your chest."
		text += "\n\n"
	elif(!_lustState.isInBattle() && pc.hasNonFlatBreasts()):
		text += "You look around to make sure that there are no obvious spying eyes before proceeding to shake off your <casualName>, struggling quite a bit with it. Your {pc.breasts} sway in the air and playfully bounce until finally escaping from under the fabric. You pant softly after such an arousing act, your nips felt quite some friction while you were shaking your chest."
		text += "\n\n"
	elif(!_lustState.isInBattle() && !pc.hasNonFlatBreasts()):
		text += "You look around to make sure that there are no obvious spying eyes before proceeding to shake off your <casualName>, struggling quite a bit with it. In the end you manage to make the cloth slip up enough to uncover your {pc.breasts}. You pant softly after such an arousing act, your nips felt quite some friction while you were shaking your chest."
		text += "\n\n"
	
	if(RNG.chance(40) && pc.canBeMilked()):
		text += "Your breasts seem to have quite some weight to them, you can spot a few drops of {pc.milk} streaming down them. They are itching to be milked."
		text += "\n\n"
	
	if(RNG.chance(30) && pc.hasBodywritings()):
		text += "While undressing yourself, you expose more of your body writings for anyone to see, kinky."
		text += "\n\n"
		
	if(RNG.chance(20) && pc.hasEffect(StatusEffect.CoveredInCum)):
		text += "Cum is dripping from your {pc.breasts} as you stand still even, it’s obvious at a glance that you had quite some fun with others."
		text += "\n\n"
	
	return {
		text = text.replace("<casualName>", itemState.casualName)
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
	return -3

func isTease():
	return true

func skillNeeded():
	return 1

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 1]]
	return []
