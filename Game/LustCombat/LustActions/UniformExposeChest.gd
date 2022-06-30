extends LustAction

func _init():
	id = "UniformExposeChest"
	
func shouldShow(_lustState: LustCombatState, _args):
	if(_lustState.isInventorySlotBlocked(InventorySlot.Body)):
		return false
		
	var itemState: ShirtAndShortsState = _args["itemState"]
	if(itemState.isShirtOpened()):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	#var itemState: ShirtAndShortsState = _args["itemState"]
	var pc:Player = _lustState.getCharacter()
	if(pc.hasBoundArms()):
		return [false, "You can't do that with bound arms"]
	if(pc.hasBlockedHands()):
		return [false, "You can't do that with blocked hands"]
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Expose tits"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Open up your shirt and expose what’s behind it"

func doAction(_lustState: LustCombatState, _args):
	var _item:ItemBase = getItem(_lustState, _args)
	
	var itemState: ShirtAndShortsState = _args["itemState"]
	itemState.openShirt()
	
	var pc:Player = _lustState.getCharacter()
	
	var text = ""
	if(!pc.isBodypartCovered(BodypartSlot.Breasts)):
		text += "You grab onto your uniform’s shirt and begin to sneakily unbutton it, enjoying yourself as your chest is slowly getting exposed. You feel your hard nips brushing against the fabric as you do it. Eventually you reach the bottom and then move the cloth to the sides, exposing your {pc.breasts} completely!"
		text += "\n\n"
		
		if(RNG.chance(50) && pc.hasNonFlatBreasts()):
			text += RNG.pick([
				"[say=pc]Oh fuck, my tits are exposed. Anyone can see them if they look at me, makes me so horny~[/say]",
				"[say=pc]Showing off my tits feels so good, I should do it more often~.[/say]",
				"[say=pc]So liberating~. Can’t wait to rub my perky nips.[/say]",
			])
			text += "\n\n"
	else:
		text += "You grab onto your uniform’s shirt and begin to sneakily unbutton it, enjoying yourself as your chest is slowly getting more exposed. You feel your hard nips brushing against the fabric as you do it. Eventually you reach the bottom and then move the cloth to the sides, exposing what's underneath."
		text += "\n\n"

	if(pc.hasEffect(StatusEffect.CoveredInCum)):
		text += "Opening the shirt up reveals how much cum you also have underneath it on your {pc.breasts}, you’re so messy~"
		text += "\n\n"
	
	if(RNG.chance(50) && pc.isVisiblyPregnant()):
		text += "Your belly is looking quite pregnant, with no shirt it’s even more obvious that you’re carrying someone’s litter!"
		text += "\n\n"
	
	if(_lustState.isInBattle()):
		text += "The enemy seems to be watching your hands carefully. And you’re ready to make a show for them."
		text += "\n\n"
	
	return {
		text = text
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
	return -4

func isTease():
	return true

func skillNeeded():
	return 1

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 1]]
	return []
