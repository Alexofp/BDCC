extends LustAction

func _init():
	id = "BreastsSelfFeed"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	#if(!_lustState.isInBattle()):
	#	return false
	#if(!_lustState.isDoingActivity(LustActivity.GropingChest)):
	#	return false
	var pc:Player = _lustState.getCharacter()
	if(!pc.hasBodypart(BodypartSlot.Breasts)):# || pc.isBodypartCovered(BodypartSlot.Breasts)):
		return false
	if(!pc.hasPerk(Perk.MilkSelfFeed)):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	var pc:Player = _lustState.getCharacter()
	#if(!pc.hasPerk(Perk.MilkSquirt)):
	#	return [false, "Requires a \"Battle Cow\" perk"]
	
	if(pc.hasBoundArms()):
		return [false, "You can't do that with bound arms"]
	if(pc.hasBlockedHands()):
		return [false, "You can't do that with blocked hands"]
	if(!pc.canBeMilked()):
		return [false, "You need to be lactating to do this"]
	
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Self-feed milk"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Squeeze your breasts and catch some of the milk into your mouth, relieving pain depending on the amount"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(3)
	
	var pc:Player = _lustState.getCharacter()
	pc.stimulateLactation()
	#pc.milk(0.2)
	
	var extraMessages = []
	var fluids:Fluids = pc.getBodypart(BodypartSlot.Breasts).getFluids()
	var fluidByAmount = fluids.getFluidAmountByType()
	for fluidID in fluidByAmount:
		var fluidObject:FluidBase = GlobalRegistry.getFluid(fluidID)
		if(fluidObject == null):
			continue
		
		var resultMessage = fluidObject.onSwallow(pc, fluidByAmount[fluidID] * 0.4)
		if(resultMessage != null && resultMessage != ""):
			extraMessages.append(resultMessage)
	
	fluids.transferTo(pc.getBodypart(BodypartSlot.Head), 0.4, 100.0)
	
	var text = ""
	if(pc.hasBigBreasts()):
		text += "You quickly reach your hands to your {pc.breasts} and squeeze them very tight while guiding the nipples towards your mouth. Your tits are big enough for you to reach towards one of the nips with your lips and latch onto it."
		text += "\n\n"
		
		text += "After enough stimulation, your nipples suddenly shoot a strong stream of {pc.milk} that is aimed directly into your mouth. You let out a moan while tasting your own product."
		text += "\n\n"
		
		#pc.addStamina(50)
	else:
		text += "You quickly reach your hands to your {pc.breasts} and squeeze them very tight while guiding the nipples towards your mouth. Your tits aren't big enough for you to reach them with your lips so you just knead them harder and open your mouth."
		text += "\n\n"
	
		text += "After enough stimulation, your nipples suddenly shoot a strong stream of {pc.milk} that is aimed directly into your mouth. You let out a moan while tasting your own product."
		text += "\n\n"
		
		#pc.addStamina(50)

	text += Util.join(extraMessages, " ")+"\n\n"

	return {
		text = text,
		lust = 3,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.1,
		InterestTopic.MasculineBody : 0.1,
		InterestTopic.AndroBody : 0.1,
		InterestTopic.ThickBody : 0.1,
		InterestTopic.SlimBody : 0.1,
		InterestTopic.AverageMassBody : 0.1,
		InterestTopic.BigBreasts : 0.7,
		InterestTopic.SmallBreasts : 0.7,
		InterestTopic.MediumBreasts : 0.7,
		InterestTopic.NoBreasts : 0.7,
		InterestTopic.LactatingBreasts : 1.0,
		InterestTopic.CoveredInCum : 0.2,
		InterestTopic.CoveredInLotsOfCum : 0.1,
		InterestTopic.FullyNaked : 0.5,
		InterestTopic.ExposedBreasts : 0.5,
		InterestTopic.ExposedBra : 0.5,
		InterestTopic.Bodywritings : 0.2,
		InterestTopic.BDSMRestraints : 0.2,
	}

func getPriority():
	return 5

func skillNeeded():
	return 2

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Milking, 10]]
	return []
