extends LustAction

func _init():
	id = "BreastsSqueeze"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(!_lustState.isDoingActivity(LustActivity.GropingChest)):
		return false
	var pc:Player = _lustState.getCharacter()
	if(!pc.hasBodypart(BodypartSlot.Breasts) || pc.isBodypartCovered(BodypartSlot.Breasts)):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	var pc:Player = _lustState.getCharacter()
	if(pc.hasBoundArms()):
		return [false, "You can't do that with bound arms"]
	#if(pc.hasBlockedHands()):
	#	return [false, "You can't do that with blocked hands"]
	
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Squeeze breasts"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Give your tits a good squeeze"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(3)

	var pc:Player = _lustState.getCharacter()
	
	var text = ""
	if(RNG.chance(50)):
		text += "Feeling very turned on, you sink your fingers deeper into your {pc.breasts} before proceeding to eagerly grope and squeeze them. Hard nipples press against your palms as you knead your chest and produce quiet moans."
		text += "\n\n"
	else:
		text += "You get a better grasp on your {pc.breasts} and passionately massage them, pressing your digits harder into your soft flesh and brushing over the nips with your palms. It feels so good, you let out some quiet moans and keep fondling your chest."
		text += "\n\n"
	
	if(RNG.chance(30) && _lustState.isInBattle()):
		text += "You make sure to show off your nice tits to your opponent, groping them harder to let the enemy know what they are missing out on."
		text += "\n\n"
	
	if(RNG.chance(50) && pc.hasEffect(StatusEffect.CoveredInCum)):
		text += "You are covered in cum, including your tits, it feels so good to knead them while little drops of cum slide down your fingers."
		text += "\n\n"
	
	if(RNG.chance(50) && pc.hasVagina() && pc.getLust() >= 50):
		text += "Teasing your breasts makes you so wet down there, your pussy is leaking with so much female juices.. You don’t stop and let out another quiet moan."
		text += "\n\n"
	
	if(RNG.chance(40) && pc.canBeMilked()):
		text += "Your breasts seem to have quite some weight to them. As you grope yourself, you spot a few drops of {pc.milk} streaming down your tits. They are so itching to be milked properly."
		text += "\n\n"

	if(pc.stimulateLactation()):
		text += "[b]Your {pc.breasts} leak with some {pc.milk}, you began lactating![/b]"
		text += "\n\n"

	return {
		text = text,
		lust = 2,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.1,
		InterestTopic.MasculineBody : 0.1,
		InterestTopic.AndroBody : 0.1,
		InterestTopic.ThickBody : 0.2,
		InterestTopic.SlimBody : 0.2,
		InterestTopic.AverageMassBody : 0.2,
		InterestTopic.BigBreasts : 0.8,
		InterestTopic.SmallBreasts : 0.8,
		InterestTopic.MediumBreasts : 0.8,
		InterestTopic.NoBreasts : 0.8,
		InterestTopic.LactatingBreasts : 0.3,
		InterestTopic.CoveredInCum : 0.2,
		InterestTopic.CoveredInLotsOfCum : 0.1,
		InterestTopic.FullyNaked : 0.5,
		InterestTopic.ExposedBreasts : 0.5,
		InterestTopic.ExposedBra : 0.4,
		InterestTopic.Bodywritings : 0.2,
		InterestTopic.BDSMRestraints : 0.2,
		InterestTopic.Pregnant: 0.2,
	}

func getPriority():
	return 5

func skillNeeded():
	return 2

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 2]]
	return []
