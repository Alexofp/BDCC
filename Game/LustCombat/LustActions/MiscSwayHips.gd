extends LustAction

func _init():
	id = "MiscSwayHips"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Sway hips"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Do a little lewd dance and show off your curves"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(3)

	var pc:Player = _lustState.getCharacter()
	
	var text = ""
	if(RNG.chance(50)):
		text += "You spread your legs to the width of your shoulders and proceed to sway your {pc.masc} rear to the sides and also up and down, causing your thighs and buttcheeks to follow the movements with small delay. You let your {pc.thick} body do this hypnotic dance for a while."
		text += "\n\n"
	else:
		text += "You put some extra swing into your hip motions as you do a little sensual dance on the spot. No rush, just slow and sexy movements, you sway your {pc.thick} {pc.masc} hips to the sides while showing off all your curves."
		text += "\n\n"
		
	if(RNG.chance(60) && pc.hasEffect(StatusEffect.CoveredInCum)):
		text += "The cum that’s all over your body slowly drips down from you. As you move around and sway your hips, you leave a messy trail behind. And you don’t mind it, you welcome the sticky messiness."
		text += "\n\n"
	
	if(RNG.chance(50) && pc.isFullyNaked()):
		text += "So bold, there is absolutely no clothing on you. And you don’t mind, you enjoy the attention that others might have for you and your private spots, it’s very liberating."
		text += "\n\n"
	
	if(RNG.chance(40) && pc.hasBodypart(BodypartSlot.Breasts) && !pc.isBodypartCovered(BodypartSlot.Breasts)):
		text += "Your {pc.breasts} are exposed to anyone to see. Hard perky nips follow the body and brush against the air as you shake your butt."
		text += "\n\n"
	
	if(RNG.chance(40) && pc.hasBodypart(BodypartSlot.Penis) && !pc.isBodypartCovered(BodypartSlot.Penis)):
		text += "Your rock-hard {pc.cock} is out and dripping pre, balls swaying in the air."
		text += "\n\n"
		
	if(RNG.chance(40) && pc.hasBodypart(BodypartSlot.Vagina) && !pc.isBodypartCovered(BodypartSlot.Vagina)):
		text += "You’re not hiding your pussy slit, you teasingly show the sensitive drippy folds as you turn around and rub your legs together."
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

	if(_lustState.isInBattle() && pc.hasPerk(Perk.NakedMagicHips) && RNG.chance(20 + sqrt(pc.getStat(Stat.Vitality)))):
		var enemy:BaseCharacter = _lustState.getEnemyCharacter()
		if(enemy != null):
			enemy.addEffect(StatusEffect.Weakness, [2])
			text += "[b]Enemy is weakened by your hips![/b]"
			text += "\n\n"
	
	if(_lustState.isInBattle() && pc.hasPerk(Perk.HypnosisHypnoticAllure) && pc.hasEffect(StatusEffect.Suggestible)):
		var stacks = HypnokinkUtil.getSuggestibleStacks(pc)
		if(RNG.chance(stacks)):
			var enemy:BaseCharacter = _lustState.getEnemyCharacter()
			if(enemy != null):
				enemy.addEffect(StatusEffect.Suggestible, [RNG.randi_range(5,15)])
				text += "[b]Enemy is mesmerized by your hips![/b]"
				text += "\n\n"

	return {
		text = text,
		lust = 1,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 1.0,
		InterestTopic.MasculineBody : 1.0,
		InterestTopic.AndroBody : 1.0,
		InterestTopic.ThickBody : 0.8,
		InterestTopic.SlimBody : 0.8,
		InterestTopic.AverageMassBody : 0.8,
		InterestTopic.CoveredInCum : 0.7,
		InterestTopic.CoveredInLotsOfCum : 0.5,
		InterestTopic.FullyNaked : 0.7,
		InterestTopic.ExposedPussy : 0.4,
		InterestTopic.ExposedAnus : 0.4,
		InterestTopic.ExposedBreasts : 0.4,
		InterestTopic.ExposedCock : 0.4,
		InterestTopic.ExposedPanties : 0.4,
		InterestTopic.ExposedBra : 0.4,
		InterestTopic.TallyMarks : 0.8,
		InterestTopic.Bodywritings : 0.8,
		InterestTopic.Gags : 0.3,
		InterestTopic.Blindfolds : 0.3,
		InterestTopic.BDSMRestraints : 0.4,
		InterestTopic.ButtPlugs : 0.5,
		InterestTopic.VaginalPlugs : 0.5,
		InterestTopic.Pregnant: 1.0,
	}

func getPriority():
	return 4

func isTease():
	return true

func getExperience(_lustState: LustCombatState, _args):
	var arr = []
	var pc:Player = _lustState.getCharacter()
	
	if(pc.hasPerk(Perk.HypnosisHypnoticAllure)):
		arr += [[Skill.Hypnosis, 1]]
		
	if(_lustState.isInPublic()):
		arr += [[Skill.Exhibitionism, 1]]
		
	return arr
