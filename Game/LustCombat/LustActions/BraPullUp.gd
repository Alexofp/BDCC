extends LustAction

func _init():
	id = "BraPullUp"
	
func shouldShow(_lustState: LustCombatState, _args):
	if(_lustState.isInventorySlotBlocked(InventorySlot.UnderwearTop)):
		return false
	var pc: Player = _lustState.getCharacter()
	if(pc.hasBlockedHands()):
		return false
	var itemState: BraState = _args["itemState"]
	if(itemState.isBraPulledUp() || itemState.isRemoved()):
		return false
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	var itemState: BraState = _args["itemState"]
	return "Pull "+itemState.casualName+" up"

func getVisibleDescription(_lustState: LustCombatState, _args):
	#var itemState: BraState = _args["itemState"]
	return "Expose your tits completely"

func doAction(_lustState: LustCombatState, _args):
	var _item:ItemBase = getItem(_lustState, _args)
	
	var itemState: BraState = _args["itemState"]
	itemState.pullBraUp()
	
	var pc:Player = _lustState.getCharacter()
	
	var text = ""
	if(_lustState.isInBattle() && pc.hasNonFlatBreasts()):
		text += "You make sure to get the opponents attention by cupping your {pc.breasts}, emphasizing their volume. Then you sink your fingers under the <casualName> and casually pull it up, making your lovely tits pop out from underneath it. You squeeze them together using your arms, giving a great look of your chest."
		text += "\n\n"
	elif(_lustState.isInBattle() && !pc.hasNonFlatBreasts()):
		text += "You make sure to get the opponents attention by putting your hands over your {pc.breasts}, covering them. Then you sink your finger under the <casualName> and casually pull it up, exposing your flat chest with nice little nipples."
		text += "\n\n"
	elif(!_lustState.isInBattle() && pc.hasNonFlatBreasts()):
		text += "You look around to make sure that there are no spying eyes before sinking your fingers under the <casualName> and sneakily pulling it up until the {pc.breasts} pop out from underneath it. So naughty, you cover the nips up and squeeze them together using your arms. The feel of them bouncing freely, fully exposed for anyone to see, makes you incredibly horny."
		text += "\n\n"
	elif(!_lustState.isInBattle() && !pc.hasNonFlatBreasts()):
		text += "You look around to make sure that there are no spying eyes before sinking your fingers under the <casualName> and sneakily pulling it up until your {pc.breasts} are totally exposed. You still hold the nips covered for a bit with your fingers before removing those too. So kinky, constant risk is making you incredibly horny."
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
