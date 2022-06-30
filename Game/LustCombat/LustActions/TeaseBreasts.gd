extends LustAction

func _init():
	id = "TeaseBreasts"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(_lustState.isDoingActivity(LustActivity.GropingChest)):
		return false
	var pc:Player = _lustState.getCharacter()
	if(!pc.hasBodypart(BodypartSlot.Breasts) || !pc.isBodypartCovered(BodypartSlot.Breasts)):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Tease breasts"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Rub and squeeze your breasts through the clothing"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(3)
	var pc:Player = _lustState.getCharacter()
	
	var text = ""
	if(RNG.chance(50)):
		text += "Feeling lusty, you grab your covered {pc.breasts} in your hands and gently squeeze them, letting the finger sink into the cloth. You let out a subtle noise of pleasure as you find your hard nips to be poking out and rubbing against your palms through the clothing. So arousing."
		text += "\n\n"
	else:
		text += "You run your hands along your {pc.masc} sides and cup your {pc.breasts}. While massaging your tits, you feel your nipples rubbing against the fabric that covers them, it’s so arousing. You let out some quiet moans and keep rubbing your covered up breasts."
		text += "\n\n"

	if(RNG.chance(30) && _lustState.isInBattle()):
		text += "You try to be turned slightly away from the enemy, just so your teasing has a bigger effect, they don’t have to see you kneading your tits, your noises alone would make anyone horny."
		text += "\n\n"
		
	if(RNG.chance(50) && pc.hasEffect(StatusEffect.CoveredInCum)):
		text += "You are covered in cum, including your tits, it feels so good to knead them while little drops of cum slide down your fingers."
		text += "\n\n"
	
	if(pc.hasVagina() && pc.getLust() >= 50):
		text += "Teasing your breasts makes you so wet down there, your pussy is leaking with so much female juices.. You don’t stop, you can’t help but to let out a quiet moan."
		text += "\n\n"
	
	if(RNG.chance(30) && pc.canBeMilked()):
		text += "You spot a few dark spots appearing on your clothing, your {pc.breasts} are lactating! You find your nips and press on them a little more, squeezing out more {pc.milk} and making the damp spots bigger."
		text += "\n\n"
	
	if(RNG.chance(50)):
		text += RNG.pick([
			"[say=pc]Feels so good..[/say]",
			"[say=pc]Fuck yes, I want more..[/say]",
			"[say=pc]My tits, anyone can see me touching myself.. so hot[/say]",
			"[say=pc]Oh fuck..[/say]",
		])
		text += "\n\n"
		
		if(_lustState.isInPublic() && !_lustState.isInBattle()):
			text += "You hope no one heard that.. You try to keep your mouth shut but it feels so good.."
			text += "\n\n"

	return {
		text = text,
		lust = 1,
	}

func getLustTopics():
	return {
		InterestTopic.BigBreasts : 1.0,
		InterestTopic.SmallBreasts : 1.0,
		InterestTopic.MediumBreasts : 1.0,
		InterestTopic.NoBreasts : 1.0,
		InterestTopic.LactatingBreasts : 0.3,
		InterestTopic.CoveredInCum : 0.3,
		InterestTopic.CoveredInLotsOfCum : 0.2,
		InterestTopic.FullyNaked : 0.4,
		InterestTopic.ExposedPussy : 0.2,
		InterestTopic.ExposedBreasts : 0.4,
		InterestTopic.ExposedCock : 0.2,
		InterestTopic.ExposedPanties : 0.1,
		InterestTopic.ExposedBra : 0.5,
		InterestTopic.TallyMarks : 0.3,
		InterestTopic.Bodywritings : 0.5,
		InterestTopic.BDSMRestraints : 0.2,
	}

func getPriority():
	return 4

func isTease():
	return true

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 1]]
	return []
