extends LustAction

func _init():
	id = "BreastsPinchNipples"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(!_lustState.isInBattle()):
		return false
	#if(!_lustState.isDoingActivity(LustActivity.GropingChest)):
	#	return false
	var pc:Player = _lustState.getCharacter()
	if(!pc.hasBodypart(BodypartSlot.Breasts)):# || pc.isBodypartCovered(BodypartSlot.Breasts)):
		return false
	if(!pc.hasPerk(Perk.MilkSquirt)):
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
	return "Pinch nipples"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Pinch your nipples with great force, forcing them to squirt milk and blind the enemy. Can be done through clothing with weaker effect."

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(3)

	var pc:Player = _lustState.getCharacter()
	pc.stimulateLactation()
	pc.milk(0.3)
	
	var text = ""
	if(pc.isBodypartCovered(BodypartSlot.Breasts)):
		text += "You quickly reach your hands to your {pc.breasts} and squeeze them very tight while pinching your nipples through all the cloth. It’s arousing, you’re barely standing on your feet as you knead your breasts and let out some passionate moans."
		text += "\n\n"
		
		text += "After enough stimulation, your nipples suddenly shoot a strong stream of {pc.milk} that goes through the clothing and is aimed directly at your opponent."
		text += "\n\n"
		
		var enemy:BaseCharacter = _lustState.getEnemyCharacter()
		if(enemy != null):
			enemy.addEffect(StatusEffect.Blindness, [2])
	else:
		text += "You quickly reach your hands to your {pc.breasts} and squeeze them very tight while pinching your exposed nipples. It’s arousing, you’re barely standing on your feet as you knead your breasts and let out some passionate moans."
		text += "\n\n"
	
		text += "After enough stimulation, your nipples suddenly shoot a strong stream of {pc.milk} that is aimed directly at your opponent."
		text += "\n\n"
		
		var enemy:BaseCharacter = _lustState.getEnemyCharacter()
		if(enemy != null):
			enemy.addEffect(StatusEffect.Blindness, [3])

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
		return [[Skill.Milking, 5]]
	return []
