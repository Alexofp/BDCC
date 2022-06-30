extends LustAction

func _init():
	id = "ButtBendAndSpread"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(!_lustState.isDoingActivity(LustActivity.GropingButt)):
		return false
	#var pc:Player = _lustState.getCharacter()
	#if(!pc.hasBodypart(BodypartSlot.Vagina) || pc.isBodypartCovered(BodypartSlot.Vagina)):
	#	return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Bend and spread butt"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Bend forward and spread your ass"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	#_lustState.startActivity(LustActivity.StrokingCock)

	var pc:Player = _lustState.getCharacter()
	
	var text = ""
	if(!pc.isBodypartCovered(BodypartSlot.Anus)):
		text += "You can’t hide your excitement, you turn around and bend your body forward, taking your time, holding your legs together until the moment your tailhole and other privates become visible! Then you spread your legs and use your arms to spread open your butt, showing off everything."
		text += "\n\n"
	else:
		text += "You can’t hide your excitement, you turn around and bend your body forward, taking your time to show off your curves. Then you spread your legs and use your arms to spread open your butt. Lewd."
		text += "\n\n"
	
	if(RNG.chance(50) && pc.hasBodypart(BodypartSlot.Vagina) && !pc.isBodypartCovered(BodypartSlot.Vagina)):
		text += "Your pussy is out on display, it looks spread open too, very inviting."
		text += "\n\n"
	
	if(RNG.chance(50) && pc.hasBodypart(BodypartSlot.Penis) && !pc.isBodypartCovered(BodypartSlot.Penis)):
		text += "Your {pc.cock} is hanging between your legs, looking very erect."
		text += "\n\n"
		
	if(RNG.chance(60) && pc.hasEffect(StatusEffect.CoveredInCum)):
		text += "The cum that’s all over your body slowly drips down from you."
		text += "\n\n"
	
	if(RNG.chance(50) && pc.isFullyNaked()):
		text += "So bold, there is absolutely no clothing on you. And you don’t mind, you enjoy the attention that others might have for you and your private spots, so nice."
		text += "\n\n"
	
	if(RNG.chance(40) && (pc.hasEffect(StatusEffect.HasCumInsideVagina) || pc.hasEffect(StatusEffect.HasCumInsideAnus))):
		text += "And wow, someone’s cum is leaking out of your used hole and dripping down your thighs, creating such a mess. It looks so hot though, anyone who sees you would think that you’re a natural cum slut."
		text += "\n\n"
	
	if(RNG.chance(50) && pc.hasEffect(StatusEffect.HasTallyMarks)):
		text += "As you swing around, people that see you might spot that you have some black vertical lines drawn on your body, each one is a mark of somebody using you."
		text += "\n\n"
	
	if(RNG.chance(50) && pc.hasEffect(StatusEffect.HasBodyWritings)):
		text += "Someone left writings on your body and right now anyone can see them clearly."
		text += "\n\n"

	return {
		text = text,
		lust = 1,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.2,
		InterestTopic.MasculineBody : 0.2,
		InterestTopic.AndroBody : 0.2,
		InterestTopic.ThickButt : 0.6,
		InterestTopic.AverageButt : 0.6,
		InterestTopic.SlimButt : 0.6,
		InterestTopic.NoVagina : 0.3,
		InterestTopic.HasVaginaOnly : 0.1,
		InterestTopic.HasVaginaAndCock : 0.3,
		InterestTopic.BigCock : 0.2,
		InterestTopic.AverageCock : 0.2,
		InterestTopic.SmallCock : 0.2,
		InterestTopic.NoCock : 0.2,
		InterestTopic.HasCockOnly : 0.1,
		InterestTopic.StuffedPussy : 0.4,
		InterestTopic.StuffedAss : 0.4,
		InterestTopic.StuffedPussyOrAss : 0.2,
		InterestTopic.CoveredInCum : 0.4,
		InterestTopic.CoveredInLotsOfCum : 0.2,
		InterestTopic.FullyNaked : 0.3,
		InterestTopic.ExposedPussy : 0.3,
		InterestTopic.ExposedAnus : 0.3,
		InterestTopic.ExposedCock : 0.3,
		InterestTopic.ExposedPanties : 0.3,
		InterestTopic.LooseAnus : 0.6,
		InterestTopic.LoosePussy : 0.6,
		InterestTopic.TightAnus : 0.6,
		InterestTopic.TightPussy : 0.6,
		InterestTopic.TallyMarks : 0.2,
		InterestTopic.Bodywritings : 0.2,
		InterestTopic.BDSMRestraints : 0.5,
		InterestTopic.ButtPlugs : 0.5,
		InterestTopic.VaginalPlugs : 0.5,
	}

func getPriority():
	return 5

func skillNeeded():
	return 3

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 1]]
	return []
