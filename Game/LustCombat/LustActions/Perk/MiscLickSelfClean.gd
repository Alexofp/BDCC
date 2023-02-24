extends LustAction

func _init():
	id = "MiscLickSelfClean"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	#if(!_lustState.isDoingActivity(LustActivity.GropingChest)):
	#	return false
	var pc:Player = _lustState.getCharacter()
	if(!pc.hasPerk(Perk.CumSwallower)):
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
	if(!pc.hasEffect(StatusEffect.CoveredInCum)):
		return [false, "You need to be covered in something to do this"]
	
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Lick self clean"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Use your tongue to clean yourself. Swallowing different fluids will provide different effects."

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(3)

	var pc:Player = _lustState.getCharacter()
	
	var extraMessages = []
	var fluids:Fluids = pc.getFluids()
	var fluidByAmount = fluids.getFluidAmountByType()
	for fluidID in fluidByAmount:
		var fluidObject:FluidBase = GlobalRegistry.getFluid(fluidID)
		if(fluidObject == null):
			continue
		
		var resultMessage = fluidObject.onSwallow(pc, fluidByAmount[fluidID])
		if(resultMessage != null && resultMessage != ""):
			extraMessages.append(resultMessage)
	
	fluids.transferTo(pc.getBodypart(BodypartSlot.Head), 1.0)
	pc.removeEffect(StatusEffect.Bleeding)
	
	var text = ""
	if(RNG.chance(50)):
		text += "You stick your tongue out and begin dragging it along the curves of your {pc.masc} body that you can reach. Then you gather the rest of the mess onto your fingers and lick them clean."
		text += "\n\n"
	else:
		text += "You begin to gather the fluids off your body onto your tongue and then enjoy swallowing all of it. You suck on all of your digits to make sure they are clean."
		text += "\n\n"
	
	if(RNG.chance(50) && _lustState.isInBattle()):
		text += "You make sure to show off how much you enjoy licking fluids off yourself while keeping an eye contact with your enemy."
		text += "\n\n"

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
		InterestTopic.CoveredInCum : 1.0,
		InterestTopic.CoveredInLotsOfCum : 0.5,
		InterestTopic.FullyNaked : 0.5,
		InterestTopic.ExposedBreasts : 0.5,
		InterestTopic.ExposedCock : 0.5,
		InterestTopic.ExposedPussy : 0.5,
		InterestTopic.ExposedBra : 0.1,
		InterestTopic.ExposedPanties : 0.1,
		InterestTopic.Bodywritings : 0.2,
		InterestTopic.BDSMRestraints : 0.2,
	}

func getPriority():
	return 5

func skillNeeded():
	return 2

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 1]]
	return []
